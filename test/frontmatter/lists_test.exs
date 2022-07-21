defmodule Frontmatter.ListsTest do
  use Frontmatter.DataCase, async: true

  alias Frontmatter.{Accounts,Lists}
  alias Frontmatter.{Account,List}

  setup do
    {:ok, %Account{} = account} = Accounts.create_account(%{})
    {:ok, %{account: account}}
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
end
