class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pages
  has_many :matches

  enum role: [:guest, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :set_default_rate, :if => :new_record?

  def set_default_role
    self.role ||= :guest
  end

  def set_default_rate
    self.rate = 0
  end
end
