FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { "test1234" }
    password_confirmation { password }
    last_name             { "山田" }
    first_name            { "太郎" }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.last.katakana }
    birthday              { Faker::Date.birthday }
  end
end