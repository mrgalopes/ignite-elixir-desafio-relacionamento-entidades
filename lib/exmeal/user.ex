defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @derive {Jason.Encoder, only: [:cpf, :id, :email, :name]}
  @foreign_key_type :binary_id

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:cpf, :email, :name]

  schema "users" do
    field :cpf, :string
    field :name, :string
    field :email, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @required_params)
  end
end
