defmodule Frontmatter.List do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frontmatter.List

  schema "lists" do
    field :name, :string
    belongs_to :account, Frontmatter.Account
    timestamps()
  end

  def new_list_changeset(%List{} = list, params) do
    list
    |> cast(params, [:name])
    |> validate_name()
  end

  def validate_name(changeset) do
    changeset
    |> validate_required([:name])
    |> validate_length(:name, min: 1, max: 100)
    |> unique_constraint([:account_id, :name], error_key: :name)
  end
end
