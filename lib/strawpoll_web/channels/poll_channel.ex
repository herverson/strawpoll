defmodule StrawpollWeb.PollChannel do
  use StrawpollWeb, :channel

  def join("poll:" <> _poll_id, _payload, socket) do
    {:ok, socket}
  end
end
