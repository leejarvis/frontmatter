defmodule Frontmatter.Lists do
  alias Frontmatter.Repo

  alias Frontmatter.{Account,List}
  alias Frontmatter.Lists.Item

  def create_list(%Account{id: account_id}, attrs) do
    %List{account_id: account_id}
    |> List.new_list_changeset(attrs)
    |> Repo.insert()
  end

  def create_item(%List{} = list, item_params) do
    list
    |> Ecto.build_assoc(:items)
    |> Item.new_item_changeset(item_params)
    |> Repo.insert()
  end
end
