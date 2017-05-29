defmodule Dkvs.AttachmentControllerTest do
  use Dkvs.ConnCase

  alias Dkvs.Attachment
  @valid_attrs %{file_name: "some content", title: "some content", uuid: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, attachment_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing attachments"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, attachment_path(conn, :new)
    assert html_response(conn, 200) =~ "New attachment"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, attachment_path(conn, :create), attachment: @valid_attrs
    assert redirected_to(conn) == attachment_path(conn, :index)
    assert Repo.get_by(Attachment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, attachment_path(conn, :create), attachment: @invalid_attrs
    assert html_response(conn, 200) =~ "New attachment"
  end

  test "shows chosen resource", %{conn: conn} do
    attachment = Repo.insert! %Attachment{}
    conn = get conn, attachment_path(conn, :show, attachment)
    assert html_response(conn, 200) =~ "Show attachment"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, attachment_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    attachment = Repo.insert! %Attachment{}
    conn = get conn, attachment_path(conn, :edit, attachment)
    assert html_response(conn, 200) =~ "Edit attachment"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    attachment = Repo.insert! %Attachment{}
    conn = put conn, attachment_path(conn, :update, attachment), attachment: @valid_attrs
    assert redirected_to(conn) == attachment_path(conn, :show, attachment)
    assert Repo.get_by(Attachment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    attachment = Repo.insert! %Attachment{}
    conn = put conn, attachment_path(conn, :update, attachment), attachment: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit attachment"
  end

  test "deletes chosen resource", %{conn: conn} do
    attachment = Repo.insert! %Attachment{}
    conn = delete conn, attachment_path(conn, :delete, attachment)
    assert redirected_to(conn) == attachment_path(conn, :index)
    refute Repo.get(Attachment, attachment.id)
  end
end
