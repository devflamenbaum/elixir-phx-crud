defmodule DiscussWeb.Plugs.SetUser do
  import Plug.Conn

  alias Discuss.Repo
  alias Discuss.Models.User

  def init(_params) do

  end

  def call(conn, _params) do
    user_id = get_user(conn)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end

  end

  defp get_user(conn) do
    conn
    |> get_session(:user_id)
  end

end
