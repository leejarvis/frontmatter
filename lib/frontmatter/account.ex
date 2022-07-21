defmodule Frontmatter.Account do
  use Ecto.Schema

  schema "accounts" do
    has_many :lists, Frontmatter.List
    has_one :default_list, Frontmatter.List
    timestamps()
  end
end
