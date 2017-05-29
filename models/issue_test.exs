defmodule Dkvs.IssueTest do
  use Dkvs.ModelCase

  alias Dkvs.Issue

  @valid_attrs %{description: "some content", priority: 42, status: true, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Issue.changeset(%Issue{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Issue.changeset(%Issue{}, @invalid_attrs)
    refute changeset.valid?
  end
end
