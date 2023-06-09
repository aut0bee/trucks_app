defmodule TruckBrowserWeb.Router do
  use TruckBrowserWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {TruckBrowserWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", TruckBrowserWeb do
    pipe_through(:browser)

    live("/", TruckInfo)
  end

  # Other scopes may use custom stacks.
  # scope "/api", TruckBrowserWeb do
  #   pipe_through :api
  # end
end
