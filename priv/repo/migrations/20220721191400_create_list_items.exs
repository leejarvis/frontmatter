defmodule Frontmatter.Repo.Migrations.CreateListItems do
  use Ecto.Migration

  def change do
    create table(:list_items) do
      add :title, :string
      add :list_id, references(:lists, on_delete: :delete_all)
      timestamps()
    end
  end
end
