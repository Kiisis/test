defmodule Dkvs.TaskUsersControllerTest do
  use Dkvs.ConnCase

  alias Dkvs.TaskUsers
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, task_users_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing task users"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, task_users_path(conn, :new)
    assert html_response(conn, 200) =~ "New task users"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, task_users_path(conn, :create), task_users: @valid_attrs
    assert redirected_to(conn) == task_users_path(conn, :index)
    assert Repo.get_by(TaskUsers, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, task_users_path(conn, :create), task_users: @invalid_attrs
    assert html_response(conn, 200) =~ "New task users"
  end

  test "shows chosen resource", %{conn: conn} do
    task_users = Repo.insert! %TaskUsers{}
    conn = get conn, task_users_path(conn, :show, task_users)
    assert html_response(conn, 200) =~ "Show task users"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, task_users_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    task_users = Repo.insert! %TaskUsers{}
    conn = get conn, task_users_path(conn, :edit, task_users)
    assert html_response(conn, 200) =~ "Edit task users"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    task_users = Repo.insert! %TaskUsers{}
    conn = put conn, task_users_path(conn, :update, task_users), task_users: @valid_attrs
    assert redirected_to(conn) == task_users_path(conn, :show, task_users)
    assert Repo.get_by(TaskUsers, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    task_users = Repo.insert! %TaskUsers{}
    conn = put conn, task_users_path(conn, :update, task_users), task_users: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit task users"
  end

  test "deletes chosen resource", %{conn: conn} do
    task_users = Repo.insert! %TaskUsers{}
    conn = delete conn, task_users_path(conn, :delete, task_users)
    assert redirected_to(conn) == task_users_path(conn, :index)
    refute Repo.get(TaskUsers, task_users.id)
  end
end
