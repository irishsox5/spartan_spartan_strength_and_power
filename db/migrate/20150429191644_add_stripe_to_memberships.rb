class AddStripeToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :stripe_customer_token, :string
  end
end
