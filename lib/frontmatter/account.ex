defmodule Frontmatter.Account do
  use Ecto.Schema

  schema "accounts" do
    has_many :lists, Frontmatter.List
    timestamps()
  end
end
