class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :except => [ :index, :show ]
   impressionist :actions=>[:show]

  # GET /blogs
  # GET /blogs.json
  def index
    if params[:tag].present?
      @blogs= Blog.tagged_with(params[:tag]).order("created_at DESC").page(params[:page]).per(12)
    else
      @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
    end
    @otherposts = Blog.all.shuffle.take(3)
    @randpic=Blog.all.shuffle.take(8)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :author, :content, :photo, :remote_photo_url, :tag_list)
    end

      private
    def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == "spartanstrengthandpower" && password == "STorm0608@#123"
    end
  end
end
