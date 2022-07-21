defmodule Frontmatter.Repo.Migrations.AddDefaultListIdToAccounts do
  use Ecto.Migration

  def change do
    alter table(:accounts) do
      add :default_list_id, references(:lists, on_delete: :nilify_all), null: true
    end
  end
end
