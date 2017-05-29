defmodule Dkvs.AttachmentTest do
  use Dkvs.ModelCase

  alias Dkvs.Attachment

  @valid_attrs %{file_name: "some content", title: "some content", uuid: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Attachment.changeset(%Attachment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Attachment.changeset(%Attachment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
