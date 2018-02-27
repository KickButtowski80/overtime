class WelcomeController < ApplicationController
  def index 
    if admin_types.include?(current_user.type)
    # @pending_approvals = Post.where(status: 'submitted')
    # or
     @pending_approvals = Post.submitted
     @recent_audit_items = AuditLog.last(10)
    else
     #something else
    end
  end
end
