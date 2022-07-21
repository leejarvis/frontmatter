defmodule Frontmatter.ListsTest do
  use Frontmatter.DataCase, async: true

  alias Frontmatter.{Accounts,Lists}
  alias Frontmatter.{Account,List}
  alias Frontmatter.Lists.Item

  setup context do
    {:ok, %Account{} = account} = Accounts.create_account(%{})
    context = Map.put(context, :account, account)

    context =
      if context[:list] do
        {:ok, list} = Lists.create_list(account, context[:list])
        Map.put(context, :list, list)
      else
        context
      end

    {:ok, context}
  end

  describe "create_list/2" do
    import Lists, only: [create_list: 2]

    test "with a new list name", %{account: account} do
      assert {:ok, %List{} = list} = create_list(account, %{name: "My list"})
      assert list.account_id == account.id
    end

    test "with a duplicate list name", %{account: account} do
      assert {:ok, %List{}} = create_list(account, %{name: "My list"})
      assert {:error, changeset} = create_list(account, %{name: "My list"})
      assert %{name: ["has already been taken"]} = errors_on(changeset)
    end
  end

  describe "create_item/2" do
    @tag list: %{name: "Groceries"}
    test "creating an item", %{list: list} do
      assert {:ok, %Item{title: "Milk"}} = Lists.create_item(list, %{title: "Milk"})
    end
  end
end
