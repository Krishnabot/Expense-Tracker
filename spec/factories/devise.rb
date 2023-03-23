FactoryBot.define do
  factory :user do
    name { 'Example Test' }
    email { 'Example@test.comn' }
    password { '123456' }
    confirmed_at { Time.now }
  end
end
