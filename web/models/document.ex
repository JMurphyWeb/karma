defmodule Karma.Document do
  use Karma.Web, :model

  schema "documents" do
    field :url, :string
    field :category, :string
    field :name, :string
    field :merged_url, :string
    belongs_to :project, Karma.Project
    belongs_to :offer, Karma.Offer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :category, :name])
    |> validate_required([:url, :category, :name])
  end

  # def merged_url_changeset(struct, params \\ %{}) do
  #   struct
  #   |> cast(params, [:merged_url])
  #   |> validate_required([:merged_url])
  # end


  def is_pdf?(file_params) do
    file_params.content_type == "application/pdf"
  end
end
