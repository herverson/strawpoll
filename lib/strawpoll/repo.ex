defmodule Strawpoll.Repo do
  use Ecto.Repo,
    otp_app: :strawpoll,
    adapter: Ecto.Adapters.Postgres
end
