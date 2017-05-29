defmodule Dkvs.IssueCommentTest do
  use Dkvs.ModelCase

  alias Dkvs.IssueComment

  @valid_attrs %{description: "some content", resolved: true, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = IssueComment.changeset(%IssueComment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = IssueComment.changeset(%IssueComment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
