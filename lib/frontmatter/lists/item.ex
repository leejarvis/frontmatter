defmodule Frontmatter.Lists.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frontmatter.Lists.Item

  schema "list_items" do
    field :title, :string
    belongs_to :list, Frontmatter.List
    timestamps()
  end

  def new_item_changeset(%Item{} = item, params) do
    item
    |> cast(params, [:title])
  end
end
