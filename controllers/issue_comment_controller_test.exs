defmodule Dkvs.IssueCommentControllerTest do
  use Dkvs.ConnCase

  alias Dkvs.IssueComment
  @valid_attrs %{description: "some content", resolved: true, title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, issue_comment_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing issue comments"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, issue_comment_path(conn, :new)
    assert html_response(conn, 200) =~ "New issue comment"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, issue_comment_path(conn, :create), issue_comment: @valid_attrs
    assert redirected_to(conn) == issue_comment_path(conn, :index)
    assert Repo.get_by(IssueComment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, issue_comment_path(conn, :create), issue_comment: @invalid_attrs
    assert html_response(conn, 200) =~ "New issue comment"
  end

  test "shows chosen resource", %{conn: conn} do
    issue_comment = Repo.insert! %IssueComment{}
    conn = get conn, issue_comment_path(conn, :show, issue_comment)
    assert html_response(conn, 200) =~ "Show issue comment"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, issue_comment_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    issue_comment = Repo.insert! %IssueComment{}
    conn = get conn, issue_comment_path(conn, :edit, issue_comment)
    assert html_response(conn, 200) =~ "Edit issue comment"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    issue_comment = Repo.insert! %IssueComment{}
    conn = put conn, issue_comment_path(conn, :update, issue_comment), issue_comment: @valid_attrs
    assert redirected_to(conn) == issue_comment_path(conn, :show, issue_comment)
    assert Repo.get_by(IssueComment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    issue_comment = Repo.insert! %IssueComment{}
    conn = put conn, issue_comment_path(conn, :update, issue_comment), issue_comment: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit issue comment"
  end

  test "deletes chosen resource", %{conn: conn} do
    issue_comment = Repo.insert! %IssueComment{}
    conn = delete conn, issue_comment_path(conn, :delete, issue_comment)
    assert redirected_to(conn) == issue_comment_path(conn, :index)
    refute Repo.get(IssueComment, issue_comment.id)
  end
end
