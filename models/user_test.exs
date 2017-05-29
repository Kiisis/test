defmodule Dkvs.UserTest do
  use Dkvs.ModelCase

  alias Dkvs.User

  @valid_attrs %{email: "some content", last_login: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, name: "some content", password: "some content", status: true, surname: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
