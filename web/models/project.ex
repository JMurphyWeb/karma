defmodule Karma.Project do
  use Karma.Web, :model

  schema "projects" do
    field :type, :string
    field :budget, :string
    field :name, :string
    field :codename, :string
    field :description, :string
    field :start_date, Ecto.Date
    field :duration, :integer
    field :studio_name, :string
    field :company_name, :string
    field :company_address_1, :string
    field :company_address_2, :string
    field :company_address_city, :string
    field :company_address_postcode, :string
    field :company_address_country, :string
    field :operating_base_address_1, :string
    field :operating_base_address_2, :string
    field :operating_base_address_city, :string
    field :operating_base_address_postcode, :string
    field :operating_base_address_country, :string
    field :locations, :string
    field :holiday_rate, :float
    field :additional_notes, :string
    field :active, :boolean, default: true
    belongs_to :user, Karma.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :type,
      :budget,
      :name,
      :codename,
      :description,
      :start_date,
      :duration,
      :studio_name,
      :company_name,
      :company_address_1,
      :company_address_2,
      :company_address_city,
      :company_address_postcode,
      :company_address_country,
      :operating_base_address_1,
      :operating_base_address_2,
      :operating_base_address_city,
      :operating_base_address_postcode,
      :operating_base_address_country,
      :locations,
      :holiday_rate,
      :additional_notes,
      :active,
      :user_id])
    |> validate_required([
      :type,
      :budget,
      :name,
      :codename,
      :description,
      :start_date,
      :duration,
      :studio_name,
      :company_name,
      :company_address_1,
      :company_address_city,
      :company_address_postcode,
      :company_address_country,
      :operating_base_address_1,
      :operating_base_address_city,
      :operating_base_address_postcode,
      :operating_base_address_country,
      :holiday_rate,
      :active,
      :user_id])
  end


  # queries
  # get projects created by specified user
  def users_projects(query, user) do
    from p in query,
    where: p.user_id == ^user.id
  end
end
