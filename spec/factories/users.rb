FactoryBot.define do
  factory :user do
    full_name { "Alex Ventura" }
    email { "alex@me.com" }
    password { "password" }
    is_free { true }
  end
end
