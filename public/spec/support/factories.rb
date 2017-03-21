FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'John'
    last_name 'Smith'
    username 'jsmith'
    password 'password'
    password_confirmation 'password'
  end

  factory :plant do
    name 'Dahlia'
    cycle 72
  end
end
