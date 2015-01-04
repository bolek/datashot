FactoryGirl.define do
  factory :snapshot, class: Datashot::Snapshot do
    name "my data snapshot"
    query "SELECT * FROM test_models;"
    result { { a: "abc", b: 2 }.to_json }
    last_ran_at Time.new
  end
end
