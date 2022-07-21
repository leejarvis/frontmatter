defmodule Frontmatter.Lists do
  alias Frontmatter.Repo

  alias Frontmatter.{Account,List}

  def create_list(%Account{id: account_id}, attrs) do
    %List{account_id: account_id}
    |> List.new_list_changeset(attrs)
    |> Repo.insert()
  end
end
