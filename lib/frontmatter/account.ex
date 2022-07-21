defmodule Frontmatter.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    has_many :lists, Frontmatter.List
    has_one :default_list, Frontmatter.List
    field :default_list_name, :string, virtual: true, default: "Reminders"
    timestamps()
  end

  def new_account_changeset(account, params) do
    account
    |> cast(params, [:default_list_name])
  end
end
