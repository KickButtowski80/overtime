class WelcomeController < ApplicationController
  def index
    @pending_approvals = Post.where(status: 'submitted')
  end
end
