defmodule Engine.PasswordController do
  use Engine.Web, :controller

  alias Engine.{User, LayoutView, Controllers.Helpers}

  def new(conn, _params) do
    # render form allowing user to enter email address
    changeset = User.email_changeset(%User{})
    render conn, "new.html", layout: {LayoutView, "pre_login.html"}, changeset: changeset
  end

  def create(conn, %{"user" => password_params}) do
    # if they are there, send email, store in redis, expire
    email = password_params["email"]
    case user = Repo.get_by(User, email: email) do
      nil ->
        # if user not found, just let them know something not working
        conn
        |> put_flash(:error, "No user found with that email, check you have entered the one you signed up with")
        |> redirect(to: password_path(conn, :new))
      %User{} ->
        # if email is found, send reset email
        # need to hash the user id!
        url = Helpers.get_base_url() <> password_path(conn, :edit, user.id)
        Engine.Email.send_reset_password_email(user, url)
        |> Engine.Mailer.deliver_later()
        conn
        |> put_flash(:info, "A password reset email has been sent to #{user.email}, it will expire in 5 minutes")
        |> redirect(to: password_path(conn, :new))
    end
  end

  def edit(conn, %{"hash" => hash}) do
    # render form for create new password and confirm new password
    case get_email_from_hash(hash) do
      {:error, _} ->
        conn
        |> put_flash(:error, "That link has expired, please enter your email address to receive a new password reset email")
        |> redirect(to: password_path(conn, :new))
      {:ok, _email} ->
        changeset = User.new_password_changeset(%User{})
        render conn, "edit.html", layout: {LayoutView, "pre_login.html"}, changeset: changeset, hash: hash
    end
  end

  def update(conn, %{"user" => password_params, "hash" => hash}) do
    # if password valid, update user
    case get_email_from_hash(hash) do
      {:error, _} ->
        conn
        |> put_flash(:error, "That link has expired, please enter your email address to receive a new password reset email")
        |> redirect(to: password_path(conn, :new))
      {:ok, email} ->
        user = Repo.get_by(User, email: email)
        changeset = User.new_password_changeset(user, password_params)
        case Repo.update(changeset) do
          {:ok, user} ->
            conn
            |> Engine.Auth.login(user)
            |> put_flash(:info, "Password updated successfully")
            |> redirect(to: dashboard_path(conn, :index))
          {:error, changeset} ->
            render(conn, "edit.html", layout: {LayoutView, "pre_login.html"}, hash: hash, changeset: changeset)
        end
    end
  end
end
