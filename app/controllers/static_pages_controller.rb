class StaticPagesController < ApplicationController
  def home
    @blogged = Blog.order("created_at DESC").limit(4)
    @galleries= Gallery.order("created_at DESC").limit(3)

  end

  def about

  end

  def faqs

  end

  def facilities

  end

end
