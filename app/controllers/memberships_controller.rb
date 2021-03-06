class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
    @program = Program.find(params[:program_id])
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    Stripe.api_key = ENV['stripe_api_key']

  # Amount in cents
  @amount = Program.find(params[:program_id]).price*100
  @program = Program.find(params[:program_id])

  if (Program.find(params[:program_id]).price*100) < 50000
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :description => @program.name,
      :card  => params[:stripeToken]
      )

      redirect_to :back
  else
    charge = Stripe::Charge.create(
    :amount => @amount, # amount in cents, again
    :currency => "usd",
    :source => params[:stripeToken],
    :description => @program.name
    )
    redirect_to :back
  end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_program_membership_path
end


  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:program_id,:stripe_card_token)
    end
end
