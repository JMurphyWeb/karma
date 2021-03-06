defmodule Engine.Email do
  use Bamboo.Phoenix, view: Engine.EmailView

  alias Engine.{RedisCli, Controllers.Helpers, Repo, User, Project}
  alias Engine.Router.Helpers, as: R_Helpers

  def send_text_email(recipient, subject, url, template, assigns \\ []) do
    new_email()
    |> to(recipient) # also needs to be a validated email
    |> from(System.get_env("ADMIN_EMAIL"))
    |> subject(subject)
    |> put_text_layout({Engine.LayoutView, "email.text"})
    |> render("#{template}.text", [url: url] ++ assigns)
  end

  def send_html_email(recipient, subject, url, template, assigns \\ []) do
    recipient
    |> send_text_email(subject, url, template, assigns)
    |> put_html_layout({Engine.LayoutView, "email.html"})
    |> render("#{template}.html", [url: url] ++ assigns)
  end

  def send_verification_email(user) do
    rand_string = Helpers.gen_rand_string(30)
    RedisCli.query(["SET", rand_string, user.email])
    url = "#{Helpers.get_base_url()}/verification/#{rand_string}"
    subject = "e n g i n e - verify your email"
    send_html_email(user.email, subject, url, "verify", [first_name: user.first_name, last_name: user.last_name, email: user.email])
  end


  def send_reset_password_email(user, url) do
    rand_string = Helpers.gen_rand_string(30)
    RedisCli.query(["SET", rand_string, user.email])
    RedisCli.expire(rand_string, 60*5)
    url = url <> "?hash=#{rand_string}"
    send_html_email(user.email, "e n g i n e - reset your password", url, "password_reset", [first_name: user.first_name, last_name: user.last_name, email: user.email])
  end

  def send_new_offer_email(conn, offer, project) do
    {template, url, subject} = case offer.user_id do
      nil ->
        hash_string = Helpers.gen_rand_string(30)
        RedisCli.query(["SET", hash_string, offer.target_email])
        RedisCli.query(["PERSIST", hash_string])
        url = Helpers.get_base_url() <> R_Helpers.user_path(conn, :new, te: hash_string)
        {"new_offer_unregistered", url, "e n g i n e - create account to join \'#{project.codename}\'"} # user is not yet registered
      _ ->
        url = Helpers.get_base_url() <> R_Helpers.project_offer_path(conn, :show, offer.project_id, offer)
        {"new_offer_registered", url, "e n g i n e - invitation to join \'#{project.codename}\'"}
    end
    user_id = offer.user_id || -1
    user =
      case Repo.get(User, user_id) do
        nil -> %{first_name: nil, last_name: nil, full_name: offer.recipient_fullname}
        user -> Map.from_struct(user) |> Map.put(:full_name, "#{user.first_name} #{user.last_name}")
      end
    send_html_email(offer.target_email, subject, url, template, [codename: project.codename, first_name: user.first_name, last_name: user.last_name, full_name: user.full_name, email: offer.target_email])
  end

  def send_updated_offer_email(conn, offer, project) do
    url = Helpers.get_base_url() <> R_Helpers.project_offer_path(conn, :show, offer.project_id, offer)
    user_id = offer.user_id || -1
    user =
      case Repo.get(User, user_id) do
        nil -> %{first_name: nil, last_name: nil, mobile: nil}
        user -> user
      end
    template = "updated_offer"
    subject = "e n g i n e - revised offer from \'#{project.codename}\'"
    send_html_email(offer.target_email,
      subject,
      url,
      template,
      [
        first_name: user.first_name,
        last_name: user.last_name,
        codename: project.codename,
        email: offer.target_email
      ]
    )
  end

  def send_offer_response_pm(conn, offer, project, contractor) do
    status =
      case offer.accepted do
        true -> "accepted"
        false -> "rejected"
      end
    template = "offer_response_pm"
    url = Helpers.get_base_url() <> R_Helpers.project_offer_path(conn, :show, offer.project_id, offer)
    subject = "e n g i n e - #{contractor.first_name} #{contractor.last_name} has #{status} your offer"
    send_html_email(project.user.email, subject, url, template, [offer_status: status, name_contractor: "#{contractor.first_name} #{contractor.last_name}", codename: project.codename, first_name: project.user.first_name, last_name: project.user.last_name, email: project.user.email])
  end

  def send_offer_accepted_contractor(conn, offer, user) do
    project = Repo.get(Project, offer.project_id)
    template = "offer_accepted_contractor"
    url = Helpers.get_base_url() <> R_Helpers.project_offer_path(conn, :show, offer.project_id, offer)
    subject = "e n g i n e - you have joined \'#{project.codename}\'"
    send_html_email(offer.target_email, subject, url, template, [first_name: user.first_name, last_name: user.last_name, codename: offer.project.codename, email: offer.target_email])
  end
end
