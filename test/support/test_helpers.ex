defmodule Karma.TestHelpers do
  alias Karma.{Repo, User, Project, Offer, Startpack}

  @user_id 1

  def id() do
    %{user: @user_id}
  end

  def insert_user(attrs \\ %{}) do
    changes = Map.merge(
      %{first_name: "Joe",
        last_name: "Blogs",
        email: "test@test.com",
        password: "123456",
        terms_accepted: true,
        verified: true},
        attrs)

    %User{}
    |> User.registration_changeset(changes)
    |> Repo.insert!
  end

  def login_user(conn, user) do
    conn
    |> Plug.Conn.assign(:current_user, user)
  end

  def insert_project(user, attrs \\ %{}) do
    changes = Map.merge(default_project(), attrs)

    user
    |> Ecto.build_assoc(:projects, %{})
    |> Project.changeset(changes)
    |> Repo.insert!
  end

  def insert_startpack(attrs \\ %{}) do
    changes = Map.merge(default_startpack(), attrs)

    Startpack.changeset(%Startpack{}, changes)
    |> Repo.insert!
  end


  def insert_offer(project, attrs \\ %{}) do
    changes = Map.merge(default_offer(), attrs)

    project
    |> Ecto.build_assoc(:offers, %{})
    |> Offer.changeset(changes)
    |> Repo.insert!
  end

  def default_project (attrs \\ %{}) do
    default = %{active: true,
      additional_notes: "",
      budget: "big",
      codename: "Finickity Spicket",
      company_address_1: "22 Birchmore",
      company_address_2: "Mossy Nill",
      company_address_city: "London",
      company_address_postcode: "N7 4TB",
      company_address_country: "UK",
      company_name: "Varner",
      description: "A new film",
      duration: 12,
      holiday_rate: 0.1077,
      locations: "London, Paris",
      name: "Mission Impossible 10",
      operating_base_address_1: "22 Birchmore",
      operating_base_address_2: "Mossy Nill",
      operating_base_address_city: "London",
      operating_base_address_postcode: "N7 4TB",
      operating_base_address_country: "UK",
      start_date: %{"day" => 1, "month" => 1, "year" => 2018},
      studio_name: "Warner",
      type: "feature"
    }
    Map.merge(default, attrs)
  end

  def default_offer(attrs \\ %{}) do
    default = %{accepted: nil,
      active: true,
      additional_notes: "You will be allowed 3 days leave",
      box_rental_required?: true,
      box_rental_cap: "42000",
      box_rental_description: "n/a",
      box_rental_fee_per_week: "4200",
      box_rental_period: "from 10/01/19 for 3 weeks",
      contract_type: "PAYE",
      contractor_details_accepted: true,
      currency: "gbp",
      daily_or_weekly: "daily",
      department: "Accounts",
      equipment_rental_required?: true,
      equipment_rental_cap: "0",
      equipment_rental_description: "n/a",
      equipment_rental_fee_per_week: "0",
      equipment_rental_period: "n/a",
      fee_per_day_inc_holiday: "4200",
      job_title: "Cashier",
      other_deal_provisions: "n/a",
      seventh_day_fee_inc_holiday: "100",
      seventh_day_fee_exc_holiday: "100",
      seventh_day_fee_multiplier: "1.0",
      sixth_day_fee_inc_holiday: "100",
      sixth_day_fee_exc_holiday: "100",
      sixth_day_fee_multiplier: "1.0",
      start_date: %{day: 17, month: 4, year: 2019},
      target_email: "a_new_email@gmail.com",
      vehicle_allowance_per_week: "0",
      working_week: "5.5"
    }
    Map.merge(default, attrs)
  end

  def default_startpack(attrs \\ %{}) do
    default = %{
    passport_expiry_date: %{day: 17, month: 4, year: 2010},
    country_of_legal_nationality: "some content",
    mobile_tel: "some content",
    vehicle_colour: "some content",
    emergency_contact_name: "some content",
    emergency_contact_tel: "some content",
    bank_account_number: "some content",
    bank_sort_code: "some content",
    loan_out_company_address: "some content",
    agent_bank_name: "some content",
    gender: "some content",
    student_loan_not_repayed?: true,
    equipment_rental_value: 42,
    country_of_permanent_residence: "some content",
    primary_address_postcode: "some content",
    bank_name: "some content",
    bank_account_users_full_name: "some content",
    box_rental_url: "some content",
    agent_name: "some content",
    box_rental_value: 42,
    vat_number: "some content",
    vehicle_registration: "some content",
    agent_bank_account_iban: "some content",
    loan_out_company_cert_url: "some content",
    middle_names: "some content",
    agent_bank_account_swift_code: "some content",
    for_paye_only: "some content",
    agent_email_address: "some content",
    schedule_d_letter_url: "some content",
    p45_url: "some content",
    agent_bank_sort_code: "some content",
    vehicle_make: "some content",
    bank_address: "some content",
    national_insurance_number: "some content",
    passport_issuing_country: "some content",
    agent_bank_address: "some content",
    equipment_rental_url: "some content",
    agent_deal?: true,
    student_loan_repay_direct?: true,
    bank_swift_code: "some content",
    vehicle_model: "some content",
    primary_address_country: "some content",
    passport_full_name: "some content",
    agent_tel: "some content",
    vehicle_insurance_url: "some content",
    student_loan_finished_before_6_april?: true,
    agent_company: "some content",
    primary_address_2: "some content",
    loan_out_company_registration_number: "some content",
    loan_out_company_address: "some content",
    loan_out_company_cert_url: "some content",
    bank_name: "some content",
    bank_address: "some content",
    bank_account_users_full_name: "some content",
    bank_account_number: "some content",
    bank_sort_code: "some content",
    bank_iban: "some content",
    bank_swift_code: "some content",
    user_id: 1
    }
    Map.merge(default, attrs)
  end
end
