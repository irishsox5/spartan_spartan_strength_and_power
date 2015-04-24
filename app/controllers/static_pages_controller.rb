class StaticPagesController < ApplicationController
  def home
    @galleries = Gallery.order("created_at DESC").limit(4)

  end

  def about

  end

  def faqs

  end

  def facilities

  end

end
