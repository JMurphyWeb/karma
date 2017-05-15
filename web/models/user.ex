defmodule Karma.User do
  use Karma.Web, :model
  alias Comeonin.Bcrypt

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :verified, :boolean
    field :terms_accepted, :boolean
    has_many :projects, Karma.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :first_name, :last_name, :password, :verified])
    |> validate_required([:email, :first_name, :last_name, :password])
    |> email_changeset(params)
    |> unique_constraint(:email)
  end

  def email_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
  end

  def email_verification_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:verified])
    |> validate_required([:verified])
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> changeset(params)
    |> terms_accepted(params)
    |> validate_password()
    |> put_password_hash()
  end


  defp terms_accepted(changeset, params) do
    message = "You must agree to the terms and conditions"
    changeset
    |> cast(params, [:terms_accepted])
    |> validate_required([:terms_accepted])
    |> validate_inclusion(:terms_accepted, [true], message: message)
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
