class AuditLogPolicy < ApplicationPolicy
 #record is a post in our case   
    def index?
        return true if  admin?         
    end
    
    def confirm?
        record.user_id == user.id || admin?
    end
    
    private        
        def admin?
            admin_types.include?(user.type)
        end     
end