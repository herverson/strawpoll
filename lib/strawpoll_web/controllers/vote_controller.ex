defmodule StrawpollWeb.VoteController do
  use StrawpollWeb, :controller

  alias Strawpoll.Polls
  alias Strawpoll.Polls.Vote
  alias StrawpollWeb.Endpoint

  action_fallback StrawpollWeb.FallbackController

  def create(conn, %{"id" => id, "vote" => %{"option_id" => option_id}}) do
    option = Polls.get_option!(option_id)
    with {:ok, %Vote{} = vote} <- Polls.create_vote(option) do
      Endpoint.broadcast!("poll:" <> id, "new_vote", %{option_id: option.id})
      conn
      |> put_status(:created)
      |> render("show.json", vote: vote)
    end
  end
end
