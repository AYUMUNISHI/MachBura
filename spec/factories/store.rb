FactoryBot.define do
  factory :store do
    association :user
    transient do
      person {Gimei.name}
    end
    store                 {Faker::Name.initials(number: 5)}
    product_description   {Faker::Lorem.sentence}
    description           {Faker::Lorem.sentence}
    category_id           {2}
    cooking_name          {'卵焼き'}
    lunch_id              {2}
    dinner_id             {2}
    phone                 {'0265-22-2222'}
    prefecture_id         {2}
    city                  {'飯田市'}
    block                 {'中央通り3丁目'}
    building              {'1-1'}
    regular_day           {'月曜日'}

    after(:build) do |store|
      store.images.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end