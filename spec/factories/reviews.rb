FactoryGirl.define do
  factory :review do
    score 1
    comment "MyText"
    book nil
    user nil
  end
end
