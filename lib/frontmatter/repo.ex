defmodule Frontmatter.Repo do
  use Ecto.Repo,
    otp_app: :frontmatter,
    adapter: Ecto.Adapters.Postgres
end
