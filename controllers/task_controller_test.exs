defmodule Dkvs.TaskControllerTest do
  use Dkvs.ConnCase

  alias Dkvs.Task
  @valid_attrs %{active: true, deadline: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, description: "some content", full_description: "some content", priority: 42, task_logged_hours: 42, task_max_man_hours: 42, title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, task_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing tasks"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, task_path(conn, :new)
    assert html_response(conn, 200) =~ "New task"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, task_path(conn, :create), task: @valid_attrs
    assert redirected_to(conn) == task_path(conn, :index)
    assert Repo.get_by(Task, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, task_path(conn, :create), task: @invalid_attrs
    assert html_response(conn, 200) =~ "New task"
  end

  test "shows chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = get conn, task_path(conn, :show, task)
    assert html_response(conn, 200) =~ "Show task"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, task_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = get conn, task_path(conn, :edit, task)
    assert html_response(conn, 200) =~ "Edit task"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = put conn, task_path(conn, :update, task), task: @valid_attrs
    assert redirected_to(conn) == task_path(conn, :show, task)
    assert Repo.get_by(Task, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = put conn, task_path(conn, :update, task), task: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit task"
  end

  test "deletes chosen resource", %{conn: conn} do
    task = Repo.insert! %Task{}
    conn = delete conn, task_path(conn, :delete, task)
    assert redirected_to(conn) == task_path(conn, :index)
    refute Repo.get(Task, task.id)
  end
end
