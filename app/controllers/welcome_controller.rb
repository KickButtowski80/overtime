class WelcomeController < ApplicationController
  def index 
    if admin_types.include?(current_user.type)
    # @pending_approvals = Post.where(status: 'submitted')
    # or
     @pending_approvals = Post.submitted
     @recent_audit_items = AuditLog.last(10)
    else
        # by_start_date is custome scope for nasty sql 
     @pending_audit_confirmations = current_user.audit_logs.pending.by_start_date
    end
  end
end
