class PostPolicy < ApplicationPolicy
    
    def update?
        #record is a post in our case
        record.user_id == user.id  || admin_types.include?(user.type)
        
    end
    
end