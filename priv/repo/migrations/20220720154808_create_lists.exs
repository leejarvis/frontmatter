defmodule Frontmatter.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :account_id, references(:accounts, on_delete: :delete_all), null: false
      add :name, :string, null: false
      timestamps()
    end

    create index(:lists, [:account_id, :name], unique: true)
  end
end
