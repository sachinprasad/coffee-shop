class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum user_role: { customer: 0, admin: 1 }
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :user_role, :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
