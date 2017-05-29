defmodule Dkvs.TaskTimeLogControllerTest do
  use Dkvs.ConnCase

  alias Dkvs.TaskTimeLog
  @valid_attrs %{description: "some content", logged_hours: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, task_time_log_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing task time logs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, task_time_log_path(conn, :new)
    assert html_response(conn, 200) =~ "New task time log"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, task_time_log_path(conn, :create), task_time_log: @valid_attrs
    assert redirected_to(conn) == task_time_log_path(conn, :index)
    assert Repo.get_by(TaskTimeLog, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, task_time_log_path(conn, :create), task_time_log: @invalid_attrs
    assert html_response(conn, 200) =~ "New task time log"
  end

  test "shows chosen resource", %{conn: conn} do
    task_time_log = Repo.insert! %TaskTimeLog{}
    conn = get conn, task_time_log_path(conn, :show, task_time_log)
    assert html_response(conn, 200) =~ "Show task time log"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, task_time_log_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    task_time_log = Repo.insert! %TaskTimeLog{}
    conn = get conn, task_time_log_path(conn, :edit, task_time_log)
    assert html_response(conn, 200) =~ "Edit task time log"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    task_time_log = Repo.insert! %TaskTimeLog{}
    conn = put conn, task_time_log_path(conn, :update, task_time_log), task_time_log: @valid_attrs
    assert redirected_to(conn) == task_time_log_path(conn, :show, task_time_log)
    assert Repo.get_by(TaskTimeLog, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    task_time_log = Repo.insert! %TaskTimeLog{}
    conn = put conn, task_time_log_path(conn, :update, task_time_log), task_time_log: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit task time log"
  end

  test "deletes chosen resource", %{conn: conn} do
    task_time_log = Repo.insert! %TaskTimeLog{}
    conn = delete conn, task_time_log_path(conn, :delete, task_time_log)
    assert redirected_to(conn) == task_time_log_path(conn, :index)
    refute Repo.get(TaskTimeLog, task_time_log.id)
  end
end
