# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    bid 1
    bname "MyString"
    btype 1
    bdescript "MyText"
    bprice 1.5
    bpublication "2013-04-09"
  end
end
