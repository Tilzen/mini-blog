defmodule MiniBlogWeb.Router do
  use MiniBlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MiniBlogWeb do
    pipe_through :api
  end
end
