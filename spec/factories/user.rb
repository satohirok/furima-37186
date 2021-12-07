FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name            { '田中' }
    fast_name           { '太郎' }
    kana_last         { 'タナカ' }
    kana_fast        { 'タロウ' }
    birthday                 { Faker::Date.between(from: '1930-01-01', to: '2020-08-31') }
  end
end