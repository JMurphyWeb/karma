defmodule Karma.User do
  use Karma.Web, :model
  alias Comeonin.Bcrypt

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :first_name, :last_name, :password])
    |> validate_required([:email, :first_name, :last_name, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> changeset(params)
    |> validate_password()
    |> put_password_hash()
  end

  defp validate_password(changeset) do
    changeset
    |> validate_length(:password, min: 6, max: 100)
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: given_pass}} ->
        put_change(changeset, :password_hash, Bcrypt.hashpwsalt(given_pass))
      _ ->
        changeset
    end
  end
end