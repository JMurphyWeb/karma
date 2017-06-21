defmodule Karma.SigneeControllerTest do
  use Karma.ConnCase

  alias Karma.{Signee, DocumentSignee}

  @valid_attrs %{name: "First Last", email: "test@email.com", role: "Tester"}
  @invalid_attrs %{name: "", email: "", role: ""}


  setup do
    user = insert_user() # This represents the user that created the project (PM)
    project = insert_project(user)
    offer = insert_offer(project)
    document = insert_document(project)
    conn = login_user(build_conn(), user)
    {:ok, conn: conn, user: user, project: project, offer: offer, document: document}
  end

  test "create new signee", %{conn: conn, project: project} do
    conn = post conn, project_signee_path(conn, :create, project), signee: @valid_attrs
    assert Phoenix.Controller.get_flash(conn, :info) == "First Last added as a signee to #{project.name}"
    assert redirected_to(conn, 302) == "/projects/#{project.id}"
    refute Repo.get_by(Signee, email: "test@email.com") == nil
  end

  test "create new signee fail", %{conn: conn, project: project} do
    conn = post conn, project_signee_path(conn, :create, project), signee: @invalid_attrs
    assert Phoenix.Controller.get_flash(conn, :error) =~ "Failed to add signee!"
    assert redirected_to(conn, 302) == "/projects/#{project.id}"
  end

  test "delete a signee", %{conn: conn, project: project} do
    signee = insert_signee(project)
    conn = delete conn, project_signee_path(conn, :delete, project, signee)
    assert Phoenix.Controller.get_flash(conn, :info) == "Signee deleted successfully."
    assert redirected_to(conn, 302) == "/projects/#{project.id}"
    assert Repo.get_by(Signee, email: signee.email) == nil
  end

  test "get add signees", %{conn: conn, project: project, document: document} do
    conn = get conn, project_document_signee_path(conn, :add, project, document)
    assert html_response(conn, 200) =~ "Add signees"
  end

  test "get add signees project does not exist", %{conn: conn, document: document} do
    conn = get conn, project_document_signee_path(conn, :add, -1, document)
    assert Phoenix.Controller.get_flash(conn, :error) == "Project doesn't exist"
    assert html_response(conn, 200) =~ "Page not found"
  end

  test "get add signees document does not exist", %{conn: conn, project: project} do
    conn = get conn, project_document_signee_path(conn, :add, project, -1)
    assert Phoenix.Controller.get_flash(conn, :error) == "Document doesn't exist"
    assert redirected_to(conn, 302) =~ "/projects/#{project.id}"
  end

  test "add signee to document", %{conn: conn, project: project, document: document} do
    signee = insert_signee(project)
    document_signee = %{document_id: document.id, signee_id: signee.id, order: 2}
    conn = post conn, project_document_signee_path(conn, :add_signee, project, document), document_signee: document_signee
    assert Phoenix.Controller.get_flash(conn, :info) == "Signee #{signee.name} added to document approval chain!"
    assert redirected_to(conn, 302) == "/projects/#{project.id}/documents/#{document.id}/signees/new"
    refute Repo.get_by(DocumentSignee, document_id: document.id, signee_id: signee.id) == nil
  end

  test "add signee to document invalid", %{conn: conn, project: project, document: document} do
    signee = insert_signee(project)
    document_signee = %{document_id: "", signee_id: "", order: ""}
    conn = post conn, project_document_signee_path(conn, :add_signee, project, document), document_signee: document_signee
    assert Phoenix.Controller.get_flash(conn, :error) == "You must select a signee"
    assert redirected_to(conn, 302) == "/projects/#{project.id}/documents/#{document.id}/signees/new"
    assert Repo.get_by(DocumentSignee, document_id: document.id, signee_id: signee.id) == nil
  end

  test "clear signees", %{conn: conn, project: project, document: document} do
    signee_1 = insert_signee(project)
    signee_2 = insert_signee(project)
    signee_3 = insert_signee(project)
    insert_document_signee(document, signee_1)
    insert_document_signee(document, signee_2)
    insert_document_signee(document, signee_3)
    conn = delete conn, project_document_signee_path(conn, :clear_signees, project, document)
    assert Phoenix.Controller.get_flash(conn, :info) == "3 Signees cleared successfully!"
    assert redirected_to(conn, 302) == "/projects/#{project.id}/documents/#{document.id}/signees/new"
  end
end
