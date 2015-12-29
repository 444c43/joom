FactoryGirl.define do
  factory :post do
    title     "the title"
    body      "the body"
    published true

    factory :unpublished_post do
      published false
    end

  end
end
