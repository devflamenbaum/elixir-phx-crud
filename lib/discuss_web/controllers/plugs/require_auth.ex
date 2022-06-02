defmodule DiscussWeb.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  alias DiscussWeb.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    check_user(conn)
  end

  defp check_user(%{assigns: %{user: nil}} = conn) do
    conn
    |> put_flash(:error, "You must be logged in.")
    |> redirect(to: Helpers.topic_path(conn, :index))
    |> halt()
  end

  defp check_user(%{assigns: %{user: _user}} = conn) do
    conn
  end
end
