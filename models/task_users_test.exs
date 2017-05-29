defmodule Dkvs.TaskUsersTest do
  use Dkvs.ModelCase

  alias Dkvs.TaskUsers

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TaskUsers.changeset(%TaskUsers{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TaskUsers.changeset(%TaskUsers{}, @invalid_attrs)
    refute changeset.valid?
  end
end
