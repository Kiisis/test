defmodule Dkvs.TaskDescriptionLogTest do
  use Dkvs.ModelCase

  alias Dkvs.TaskDescriptionLog

  @valid_attrs %{change_reason: "some content", description: "some content", full_description: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TaskDescriptionLog.changeset(%TaskDescriptionLog{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TaskDescriptionLog.changeset(%TaskDescriptionLog{}, @invalid_attrs)
    refute changeset.valid?
  end
end
