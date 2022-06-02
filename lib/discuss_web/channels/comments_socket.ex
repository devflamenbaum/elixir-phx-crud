defmodule DiscussWeb.CommentsSocket do
  use Phoenix.Socket

  channel "comments:*", DiscussWeb.CommentsChannel

  @impl true
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  @impl true
  def id(_socket), do: nil
end
