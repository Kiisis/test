defmodule Dkvs.TaskDescriptionLogControllerTest do
  use Dkvs.ConnCase

  alias Dkvs.TaskDescriptionLog
  @valid_attrs %{change_reason: "some content", description: "some content", full_description: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, task_description_log_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing task description logs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, task_description_log_path(conn, :new)
    assert html_response(conn, 200) =~ "New task description log"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, task_description_log_path(conn, :create), task_description_log: @valid_attrs
    assert redirected_to(conn) == task_description_log_path(conn, :index)
    assert Repo.get_by(TaskDescriptionLog, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, task_description_log_path(conn, :create), task_description_log: @invalid_attrs
    assert html_response(conn, 200) =~ "New task description log"
  end

  test "shows chosen resource", %{conn: conn} do
    task_description_log = Repo.insert! %TaskDescriptionLog{}
    conn = get conn, task_description_log_path(conn, :show, task_description_log)
    assert html_response(conn, 200) =~ "Show task description log"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, task_description_log_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    task_description_log = Repo.insert! %TaskDescriptionLog{}
    conn = get conn, task_description_log_path(conn, :edit, task_description_log)
    assert html_response(conn, 200) =~ "Edit task description log"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    task_description_log = Repo.insert! %TaskDescriptionLog{}
    conn = put conn, task_description_log_path(conn, :update, task_description_log), task_description_log: @valid_attrs
    assert redirected_to(conn) == task_description_log_path(conn, :show, task_description_log)
    assert Repo.get_by(TaskDescriptionLog, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    task_description_log = Repo.insert! %TaskDescriptionLog{}
    conn = put conn, task_description_log_path(conn, :update, task_description_log), task_description_log: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit task description log"
  end

  test "deletes chosen resource", %{conn: conn} do
    task_description_log = Repo.insert! %TaskDescriptionLog{}
    conn = delete conn, task_description_log_path(conn, :delete, task_description_log)
    assert redirected_to(conn) == task_description_log_path(conn, :index)
    refute Repo.get(TaskDescriptionLog, task_description_log.id)
  end
end
