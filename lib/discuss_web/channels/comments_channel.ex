defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  alias Discuss.Repo
  alias Discuss.Models.Topic

  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    _topic = Repo.get(Topic, topic_id)
    {:ok, %{hey: "there"}, socket}
  end

  def handle_in(name, %{"content" => content}, socket) do
    {:reply, :ok, socket}
  end

end
