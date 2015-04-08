class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_articles

private

  def load_articles
    @blogz=Blog.order("created_at DESC").limit(3)
  end


end
