class WelcomeController < ApplicationController
  def index
    @pending_approvals = Post.where(status: 'submitted')
    @recent_audit_items = AuditLog.last(10)
  end
end
