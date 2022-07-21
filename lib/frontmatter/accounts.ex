defmodule Frontmatter.Accounts do
  alias Frontmatter.Repo
  alias Frontmatter.Account

  def create_account() do
    Repo.insert(%Account{})
  end
end
