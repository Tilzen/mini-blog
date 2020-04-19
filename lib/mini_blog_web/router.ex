defmodule MiniBlogWeb.Router do
  use MiniBlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug MiniBlog.Plugs.Context
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: MiniBlogWeb.Schema, json_codec: Jason

    if Mix.env() == :dev do
      forward(
        "/graphql-dev",
        Absinthe.Plug.GraphiQL,
        schema: MiniBlogWeb.Schema,
        json_codec: Jason
      )
    end
  end
end
