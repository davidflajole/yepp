defmodule Yepp.Repo do
  use Ecto.Repo,
    otp_app: :yepp,
    adapter: Ecto.Adapters.Postgres
end
