# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :release do
    association :admin, factory: :admin
    association :project, factory: :project
    branch { Faker::Name.name }
    environment { %w(production staging development).sample }
  end
end
