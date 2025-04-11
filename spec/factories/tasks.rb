FactoryBot.define do
  factory :task do
    title { "Buy avocados for tonight" }
    description { "I run out for avocados for tonights guacamole, 3 are required" }
    done { false }
  end
end
