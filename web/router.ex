defmodule Engine.Router do
  use Engine.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Engine.Auth, repo: Engine.Repo
  end

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  scope "/", Engine do
    pipe_through :browser # Use the default browser stack
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/terms", InfoController, :terms
    get "/privacy", InfoController, :privacy
    get "/verification/:hash", VerificationController, :verify
    get "/verification/verify/:hash", VerificationController, :verify_again
    get "/verification/resend/:hash", VerificationController, :resend
    resources "/password", PasswordController, only: [:new, :create, :edit, :update]
    get "/", DashboardController, :index
  end

  # authed routes
  scope "/", Engine do
    pipe_through [:browser, :authenticate]
    # get "/admin-dashboard", AdminDashboardController, :index
    post "/startpack/:id", StartpackController, :update
    post "/startpack/:id/delete-file", StartpackController, :delete_uploaded_files
    resources "/startpack", StartpackController, except: [:new, :create, :delete]
    # post "/projects/:project_id/offers/:offer_id/send_offer", OfferController, :send_offer
    resources "/projects", ProjectController do
      resources "/custom_fields", CustomFieldController, only: [:create, :delete]
      resources "/documents", DocumentController do
        get "/signees/new", SigneeController, :add
        post "/signees/new", SigneeController, :add_signee
        delete "/signees", SigneeController, :clear_signees
      end
      resources "/signees", SigneeController, only: [:create, :delete]
      post "/offers/:offer_id/send_offer", OfferController, :send_offer
      resources "/offers", OfferController do
        # project_offer_altered_document_path(conn, project, offer)
        # /projects/:project_id/offers/:offer_id/altered_documents/sign

        get "/custom_fields/add", CustomFieldController, :add
        post "/custom_fields/:id/save", CustomFieldController, :save
        post "/custom_fields/:id/revise", CustomFieldController, :revise
        get "/altered_documents/sign", AlteredDocumentController, :sign
      end
      put "/offers/:id/response", OfferController, :response
    end
  end

  # admin authed routes
  scope "/admin", Engine do
    pipe_through [:browser, :authenticate_admin]
    get "/dashboard", AdminDashboardController, :index
    get "/custom-fields", AdminDashboardController, :custom_fields
    get "/users", AdminDashboardController, :users
  end

  # Other scopes may use custom stacks.
  # scope "/api", Engine do
  #   pipe_through :api
  # end
end
