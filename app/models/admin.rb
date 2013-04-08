class Admin < ActiveRecord::Base
  # Associations
  has_many :releases

  # Validations

  # Scopes

  # Extensions
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Callbacks

  # Attributes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
