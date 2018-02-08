FactoryBot.define do 

    factory :post do
        date Date.today
        rationale "rationale"
        user
    end 
    
    factory :second_post, class: "Post" do 
        date Date.yesterday
        rationale "rationale-content"
        user
    end
    
    factory :third_post, class: "Post" do 
        date Date.yesterday
        rationale "I am anotehr rationale content to be"
        user
    end
    
    factory :post_from_other_user, class: "Post" do
        date Date.yesterday
        rationale "This post shouldn't be seen"
        user created_at(:other_user)
        association :post, factory: :user
    end
end