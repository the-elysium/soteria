class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_one :key_pair

  # auto-confirm withouting send out email 
  def confirmed_at
    Time.now.utc
  end
end
