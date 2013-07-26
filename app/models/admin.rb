class Admin < ActiveRecord::Base
  # Associations
  has_many :releases

  # Validations
  validates :first_name, :last_name, presence: true

  # Scopes

  # Extensions
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Callbacks
  before_validation :generate_random_password

  # Attributes
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  attr_accessor :save_context

  def name
    "#{self.first_name} #{self.last_name}"
  end

  protected
  def generate_random_password
    self.password = self.password_confirmation = SecureRandom.base64(13) if self.save_context == :ui
  end
end
