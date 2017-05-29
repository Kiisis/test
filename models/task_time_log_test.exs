defmodule Dkvs.TaskTimeLogTest do
  use Dkvs.ModelCase

  alias Dkvs.TaskTimeLog

  @valid_attrs %{description: "some content", logged_hours: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TaskTimeLog.changeset(%TaskTimeLog{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TaskTimeLog.changeset(%TaskTimeLog{}, @invalid_attrs)
    refute changeset.valid?
  end
end
