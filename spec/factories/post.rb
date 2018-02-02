FactoryBot.define do 

    factory :post do
        date Date.today
        rationale "I am rationale"
        user
    end 
    
    factory :second_post, class: "Post" do 
        date Date.yesterday
        rationale "I am anotehr rationale content"
        user
    end
    
    factory :third_post, class: "Post" do 
        date Date.yesterday
        rationale "I am anotehr rationale content to be"
        user
    end
    
end