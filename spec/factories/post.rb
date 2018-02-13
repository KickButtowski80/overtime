FactoryBot.define do 

    factory :post do
        date Date.today
        rationale "rationale"
        overtime_request 2.0
        user
    end 
    
    factory :second_post, class: "Post" do 
        date Date.yesterday
        rationale "rationale-content"
        overtime_request 0.5
        user
    end
    
    factory :third_post, class: "Post" do 
        date Date.yesterday
        rationale "I am anotehr rationale content to be"
        overtime_request 0.0
        user
    end
    
    factory :post_from_other_user, class: "Post" do
        date Date.yesterday
        rationale "This post shouldn't be seen"
        overtime_request 2.0
        user created_at(:other_user)
        association :post, factory: :user
    end
end