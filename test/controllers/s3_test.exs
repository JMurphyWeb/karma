defmodule Engine.S3Test do
  use Engine.ConnCase

  import Mock
  alias Engine.S3

  @bucket System.get_env("BUCKET_NAME")
  @image_params %{filename: "unique.png", path: "./maybe/mocked"}

  test "unique filename - contractor" do
    filename = "foxy.png"
    file = "passport"
    identifier = "JOHN_SMITH"
    unique = S3.get_unique_filename(filename, identifier, file)

    assert [first_name, last_name, file, _day, _month, _year, _time] = String.split(unique, "_")
    assert file == "Passport"
    assert first_name == "JOHN"
    assert last_name == "SMITH"
  end

  test "unique filename - project" do
    filename = "foxy.png"
    file = "paye"
    identifier = "SECRET_PROJECT"
    unique = S3.get_unique_filename(filename, identifier, file)

    assert [first_word, second_word, file, _day, _month, _year, _time] = String.split(unique, "_")
    assert file == "Paye"
    assert first_word == "SECRET"
    assert second_word == "PROJECT"
  end

  test "put_object failure function" do
    with_mock ExAws, [request!: fn(_) -> %{status_code: 500} end] do
      res = S3.put_object("unique.png", "binary")
      assert res == {:error, "error uploading to S3"}
    end
  end

  test "put_object success function" do
    with_mock ExAws, [request!: fn(_) -> %{status_code: 200} end] do
      res = S3.put_object("unique.png", "binary")
      assert res == {:ok, "https://#{@bucket}.s3.amazonaws.com/#{@bucket}/unique.png"}
    end
  end


  test "S3.upload_many with no file uploaded" do
    keys = [{"passport_image", "passport_url"}]
    res = S3.upload_many(%{}, keys, "PROJECT-NAME")
    assert res == %{}
  end

  test "S3.upload failure" do
    with_mock ExAws, [request!: fn(_) -> %{status_code: 200} end] do
      res = S3.upload({"passport_url", @image_params, "PROJECT-NAME", "filename"})
      assert {:error, "passport_url", "file could not be read"} == res
    end
  end

  test "S3.upload success" do
    url_key = "passport_url"
    with_mock ExAws, [request!: fn(_) -> %{status_code: 200} end] do
      with_mock File, [read: fn(_) -> {:ok, "image_binary"} end] do
        res = S3.upload({url_key, @image_params, "PROJECT-NAME", "filename"})
        assert {:ok, ^url_key, url} = res
        beginning = "https://#{@bucket}.s3.amazonaws.com/#{@bucket}/"

        assert String.starts_with?(url, beginning)
      end
    end
  end

  test "get_object success" do
    bucket = System.get_env("BUCKET_NAME")
    url = "https://#{bucket}.s3.amazonaws.com/#{bucket}/test.png"
    with_mock ExAws, [request!: fn(_) -> %{status_code: 200, body: <<37, 80>>, headers: []} end] do
      res = S3.get_object(url)
      assert res == {:ok, <<37, 80>>}
    end
  end

  test "get_object fail" do
    bucket = System.get_env("BUCKET_NAME")
    url = "https://#{bucket}.s3.amazonaws.com/#{bucket}/test_fail.png"
    with_mock ExAws, [request!: fn(_) -> %{status_code: 500} end] do
      res = S3.get_object(url)
      assert res == {:error, "error downloading from S3"}
    end
  end

  test "S3.get_many_objects" do
    bucket = System.get_env("BUCKET_NAME")
    url = "https://#{bucket}.s3.amazonaws.com/#{bucket}"
    urls = [url <> "something.pdf", url <> "else.pdf"]
    with_mock ExAws, [request!: fn(_) -> %{status_code: 200, body: <<37, 80>>, headers: []} end] do
      res = S3.get_many_objects(urls)
      assert res == [<<37, 80>>, <<37, 80>>]
    end
  end

  test "save_file_to_filepath success" do
    with_mock File, [write!: fn(_, _) -> :ok end] do
      destination_file_path = S3.save_file_to_filepath("test.pdf", "some file")
      assert destination_file_path == {:ok, "/test.pdf"}
    end
  end

  test "save_file_to_filepath error" do
    with_mock File, [write!: fn(_, _) -> :error end] do
      destination_file_path = S3.save_file_to_filepath("error.pdf", "error")
      assert destination_file_path == {:error, "error saving file"}
    end
  end

  test "download success" do
    bucket = System.get_env("BUCKET_NAME")
    url = "https://#{bucket}.s3.amazonaws.com/#{bucket}/download.png"
    with_mock ExAws, [request!: fn(_) -> %{status_code: 200, body: <<37, 80>>, headers: []} end] do
      with_mock File, [write!: fn(_, _) -> :ok end] do
        filepath = S3.download(url, "download.pdf")
        assert filepath == {:ok, "/download.pdf"}
      end
    end
  end

  test "download save file fail" do
    bucket = System.get_env("BUCKET_NAME")
    url = "https://#{bucket}.s3.amazonaws.com/#{bucket}/download.png"
    with_mock ExAws, [request!: fn(_) -> %{status_code: 200, body: <<37, 80>>, headers: []} end] do
      with_mock File, [write!: fn(_, _) -> :error end] do
        error = S3.download(url, "download.pdf")
        assert error == {:error, "error saving file"}
      end
    end
  end

  test "download S3 fail" do
    bucket = System.get_env("BUCKET_NAME")
    url = "https://#{bucket}.s3.amazonaws.com/#{bucket}/download.png"
    with_mock ExAws, [request!: fn(_) -> %{status_code: 500} end] do
      with_mock File, [write!: fn(_, _) -> :error end] do
        error = S3.download(url, "download.pdf")
        assert error == {:error, "error downloading from S3"}
      end
    end
  end
end
