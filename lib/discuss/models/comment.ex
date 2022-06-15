defmodule Discuss.Models.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:content, :user]}

  schema "comments" do
    field :content, :string
    belongs_to :topic, Discuss.Models.Topic
    belongs_to :user, Discuss.Models.User

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
