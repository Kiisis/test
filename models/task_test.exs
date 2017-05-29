defmodule Dkvs.TaskTest do
  use Dkvs.ModelCase

  alias Dkvs.Task

  @valid_attrs %{active: true, deadline: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, description: "some content", full_description: "some content", priority: 42, task_logged_hours: 42, task_max_man_hours: 42, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
