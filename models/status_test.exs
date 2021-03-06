defmodule Dkvs.StatusTest do
  use Dkvs.ModelCase

  alias Dkvs.Status

  @valid_attrs %{color: "some content", description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Status.changeset(%Status{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Status.changeset(%Status{}, @invalid_attrs)
    refute changeset.valid?
  end
end
