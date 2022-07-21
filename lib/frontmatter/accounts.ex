defmodule Frontmatter.Accounts do
  alias Frontmatter.Repo
  alias Frontmatter.{Account,Lists}
  alias Frontmatter.{Account,List}

  alias Ecto.{Multi,Changeset}

  @default_list_name "Reminders"

  def create_account(params) do
    list_name = Map.get(params, :default_list_name, @default_list_name)

    {:ok, %{account: account, list: list}} =
      Multi.new()
      |> Multi.insert(:account, %Account{})
      |> Multi.run(:list, fn _repo, %{account: account} ->
        Lists.create_list(account, %{name: list_name})
      end)
      |> Multi.run(:set_default_list, fn _repo, %{account: account, list: list} ->
        set_default_list(account, list)
      end)
      |> Repo.transaction()

    {:ok, %{account | lists: [list], default_list: list}}
  end

  def set_default_list(%Account{} = account, %List{} = list) do
    account
    |> Repo.preload(:default_list)
    |> Changeset.change(default_list: list)
    |> Repo.update()
  end
end
