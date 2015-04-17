# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store do
    sid 1
    sname "MyString"
    stype 1
    sdescript "MyText"
  end
end
