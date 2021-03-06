defmodule Engine.MergerTest do
  use Engine.ConnCase
  alias Engine.Merger

  import Mock

  @data %{
    project_name: "Mission Impossible 12: The Fourth Reich Hits Back (3rd Edition)",
    user_passport_full_name: "jackjackjack jackjackjackjackjack",
    startpack_primary_address_1: "21 dependencies avenue,\nAilsbury Estate,\n3rd ward",
    startpack_primary_address_2: "London\nN2 5RT\nUnited Kingdom",
    user_email: "jmonies_is_not@somelonghotmail.com.uk"
  }

  test "get all data for merge" do
    contractor = insert_user(%{email: "contractor@gmail.com"})
    startpack = update_startpack(contractor, %{gender: "other"})
    project = insert_project(contractor)
    offer = insert_offer(project, %{user_id: contractor.id, target_email: contractor.email})
    data = Merger.get_data_for_merge(offer)

    # assert the data map holds the correct user, project, startpack, offer
    assert data.user.email == contractor.email
    assert data.project.name == project.name
    assert data.offer.contract_type == offer.contract_type
    assert data.startpack.gender == startpack.gender
  end

  test "format data with prefixed keys" do
    map = %{offer: %{contract_type: "PAYE"}, startpack: %{gender: "male"}}
    expected = %{"offer_contract_type" => "PAYE", "startpack_gender" => "male"}
    formatted = Merger.format(map)
    assert formatted == expected
  end



  test "get merged path" do
    result = Merger.get_merged_path("path.pdf", %{id: 1, user_id: 2}, %{id: 3})
    expected = "path-1-2-3.pdf"
    assert result == expected
  end

  test "merge document script success" do
    with_mock Engine.ScriptRunner, [run_merge_script: fn(_) -> {"destination.pdf", 0} end] do
      doc_path = System.cwd() <> "/test/fixtures/fillable.pdf"

      res = Merger.wrap_merge_script(Poison.encode!(@data), doc_path, "destination.pdf")
      assert {:ok, "destination.pdf"} = res
    end
  end

  test "merge document script - no file" do
    with_mock Engine.ScriptRunner, [run_merge_script: fn(_) -> {"some error", 1} end] do
      doc_path = System.cwd() <> "/x/no-file.pdf"
      error_res = Merger.wrap_merge_script(Poison.encode!(@data), doc_path, "destination.pdf")
      assert {:error, _} = error_res
    end
  end


  test "merge function error: S3 download" do
    with_mock Engine.S3, [download: fn(_, _) -> {:error, "some error"} end] do
      assert {:error, "There was an error retrieving the document"} =
        Merger.merge(%{}, %{url: "www.a_url.com"})
    end
  end

  test "merge function error: merge error" do
    pm = insert_user()
    project = insert_project(pm)
    contractor = insert_user(%{email: "contractor@gmail.com"})
    _startpack = update_startpack(contractor, default_startpack())
    offer = insert_offer(project, %{user_id: contractor.id})
    document = insert_document(project, %{name: offer.contract_type, url: "www.image_url.pdf"})

    with_mock Engine.S3, [download: fn(_, _) -> {:ok, "www.aws.someurl.pdf"} end] do
      with_mock Engine.ScriptRunner, [run_merge_script: fn(_) -> {"some error", 1} end] do
        assert {:error, "There was an error creating the document"} =
          Merger.merge(offer, document)
      end
    end
  end

  test "merge function error: S3 upload error" do
    pm = insert_user()
    project = insert_project(pm)
    contractor = insert_user(%{email: "contractor@gmail.com"})
    _startpack = update_startpack(contractor)
    offer = insert_offer(project, %{user_id: contractor.id}) |> Repo.preload(:project)
    document = insert_document(project, %{name: offer.contract_type, url: "www.image_url.pdf"})

    with_mocks([
      {Engine.S3, [],
       [download: fn(_, _) -> {:ok, "www.aws.someurl.pdf"} end,
        upload: fn(_) -> {:error, :_, :_} end]},
      {Engine.ScriptRunner, [],
       [run_merge_script: fn(_) -> {"destination.pdf", 0} end]}
    ]) do
      assert {:error, "There was an error saving the document"} = Merger.merge(offer, document)
    end
  end

  test "merge funciton: success" do
    pm = insert_user()
    project = insert_project(pm)
    contractor = insert_user(%{email: "contractor@gmail.com"})
    _startpack = update_startpack(contractor)
    offer = insert_offer(project, %{user_id: contractor.id}) |> Repo.preload(:project)
    document = insert_document(project, %{name: offer.contract_type, url: "www.image_url.pdf"})

    with_mocks([
      {Engine.S3, [],
       [download: fn(_, _) -> {:ok, "www.aws.someurl.pdf"} end,
        upload: fn(_) -> {:ok, :url, "www.aws.another.pdf"} end]},
      {Engine.ScriptRunner, [],
       [run_merge_script: fn(_) -> {"destination.pdf", 0} end]}
    ]) do
      assert {:ok, "www.aws.another.pdf"} = Merger.merge(offer, document)
    end
  end

  test "merge funciton: success no box or equipment" do
    pm = insert_user()
    project = insert_project(pm)
    contractor = insert_user(%{email: "contractor@gmail.com"})
    _startpack = update_startpack(contractor)
    offer =
      insert_offer(project, %{sixth_day_holiday_pay: 10.0, seventh_day_holiday_pay: 10.0, user_id: contractor.id, box_rental_required?: false, equipment_rental_required?: false})
      |> Repo.preload(:project)
    document = insert_document(project, %{name: offer.contract_type, url: "www.image_url.pdf"})

    with_mocks([
      {Engine.S3, [],
       [download: fn(_, _) -> {:ok, "www.aws.someurl.pdf"} end,
        upload: fn(_) -> {:ok, :url, "www.aws.another.pdf"} end]},
      {Engine.ScriptRunner, [],
       [run_merge_script: fn(_) -> {"destination.pdf", 0} end]}
    ]) do
      assert {:ok, "www.aws.another.pdf"} = Merger.merge(offer, document)
    end
  end

  test "merge funciton: use loan out company" do
    pm = insert_user()
    project = insert_project(pm)
    contractor = insert_user(%{email: "contractor@gmail.com"})
    _startpack = update_startpack(contractor, %{use_loan_out_company?: true})
    offer =
      insert_offer(project, %{sixth_day_holiday_pay: 10.0, seventh_day_holiday_pay: 10.0, user_id: contractor.id, box_rental_required?: false, equipment_rental_required?: false})
      |> Repo.preload(:project)
    document = insert_document(project, %{name: offer.contract_type, url: "www.image_url.pdf"})

    with_mocks([
      {Engine.S3, [],
       [download: fn(_, _) -> {:ok, "www.aws.someurl.pdf"} end,
        upload: fn(_) -> {:ok, :url, "www.aws.another.pdf"} end]},
      {Engine.ScriptRunner, [],
       [run_merge_script: fn(_) -> {"destination.pdf", 0} end]}
    ]) do
      assert {:ok, "www.aws.another.pdf"} = Merger.merge(offer, document)
    end
  end

  test "merge funciton: don't use agent" do
    pm = insert_user()
    project = insert_project(pm)
    contractor = insert_user(%{email: "contractor@gmail.com"})
    _startpack = update_startpack(contractor, %{agent_deal?: false})
    offer =
      insert_offer(project, %{sixth_day_holiday_pay: 10.0, seventh_day_holiday_pay: 10.0, user_id: contractor.id, box_rental_required?: false, equipment_rental_required?: false})
      |> Repo.preload(:project)
    document = insert_document(project, %{name: offer.contract_type, url: "www.image_url.pdf"})

    with_mocks([
      {Engine.S3, [],
       [download: fn(_, _) -> {:ok, "www.aws.someurl.pdf"} end,
        upload: fn(_) -> {:ok, :url, "www.aws.another.pdf"} end]},
      {Engine.ScriptRunner, [],
       [run_merge_script: fn(_) -> {"destination.pdf", 0} end]}
    ]) do
      assert {:ok, "www.aws.another.pdf"} = Merger.merge(offer, document)
    end
  end

  test "merge_multiple function: success" do
    pm = insert_user()
    project = insert_project(pm)
    contractor = insert_user(%{email: "contractor@gmail.com"})
    _startpack = update_startpack(contractor)
    offer =
      insert_offer(project, %{user_id: contractor.id, box_rental_required?: false, equipment_rental_required?: false})
      |> Repo.preload(:project)
    document_1 = insert_document(project, %{name: offer.contract_type, url: "www.image_url.pdf"})
    document_2 = insert_document(project, %{name: offer.contract_type, url: "www.image_url.pdf"})
    documents = [document_1, document_2]
    with_mocks([
      {Engine.S3, [],
       [download: fn(_, _) -> {:ok, "www.aws.someurl.pdf"} end,
        upload: fn(_) -> {:ok, :url, "www.aws.another.pdf"} end]},
      {Engine.ScriptRunner, [],
       [run_merge_script: fn(_) -> {"destination.pdf", 0} end]}
    ]) do
      assert {:ok, "Documents merged"} = Merger.merge_multiple(offer, documents)
    end
  end

  test "build custom field map" do
    custom_field_map = Merger.build_custom_field_map(%{}, [%{name: "testing", value: "testing"},%{name: "test_", value: "test"}])
    assert custom_field_map == %{test: "test", testing: "testing"}
  end
end
