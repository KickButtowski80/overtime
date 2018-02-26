class WelcomeController < ApplicationController
  def index
    @pending_approvals = Post.where(status: 'submitted')
    @recent_audit_items = Post.where(status: 'approved')
  end
end
