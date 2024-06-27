defmodule TaskManagerWeb.Router do
  use TaskManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug TaskManagerWeb.Plugs.Locale
  end

  pipeline :api_auth do
    plug :accepts, ["json"]
    plug TaskManagerWeb.Plugs.Locale
    plug Guardian.Plug.Pipeline,
      module: TaskManager.Guardian,
      error_handler: TaskManagerWeb.AuthErrorHandler

    plug TaskManagerWeb.Plugs.AuthenticatePlug
  end

  scope "/api", TaskManagerWeb do
    pipe_through :api

    post "/login", AccountsController, :authenticate
    post "/refresh", AccountsController, :revalidate
    post "/logout", AccountsController, :logout
  end

  scope "/api/user", TaskManagerWeb do
    pipe_through :api

    post "/register", UsersController, :register_user
    post "/forgot_password", UsersController, :recover_password
  end

  scope "/api/user", TaskManagerWeb do
    pipe_through :api_auth

    patch "/update_password", UsersController, :update_password
    patch "/update_email", UsersController, :update_email
  end

  scope "/api/task", TaskManagerWeb do
    pipe_through :api_auth

    post "/create", TasksController, :create
    put "/update", TasksController, :update
    delete "/delete", TasksController, :delete
    get "/get_task", TasksController, :get_task
    get "/get_user_tasks", TasksController, :get_user_tasks
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:task_manager, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: TaskManagerWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
