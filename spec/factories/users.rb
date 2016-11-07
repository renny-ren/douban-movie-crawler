require 'faker'

FactoryGirl.define do
  factory :user do
    username "1"
    password "1" 

    factory :new_user do
      username "123"
      password "123"
    end

    factory :invalid_user do
      username nil
      # username { Faker::Name.name }
    end

    factory :admin do
    	username "admin"
      password "admin"
    end
  end
end