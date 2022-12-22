FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password { "g9" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {person.first.kanji}
    first_name {person.last.kanji}
    kana_last_name {person.last.katakana}
    kana_first_name {person.first.katakana}
    birthday {Faker::Date.backward}
  end
end