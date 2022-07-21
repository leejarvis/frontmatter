defmodule Frontmatter.AccountsTest do
  use Frontmatter.DataCase, async: true

  alias Frontmatter.{Accounts,Account,List}

  describe "create_account/1" do
    import Accounts, only: [create_account: 1]

    test "with no default list name" do
      assert {:ok, %Account{} = account} = create_account(%{})
      assert [%List{name: "Reminders"} = list] = account.lists
      assert list == account.default_list
    end

    test "with a custom default list name" do
      assert {:ok, %Account{} = account} = create_account(%{default_list_name: "My List"})
      assert [%List{name: "My List"} = list] = account.lists
      assert list == account.default_list
    end
  end
end
