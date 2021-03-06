class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :memberships

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

end
