class Release < ActiveRecord::Base
  # Associations
  belongs_to :admin
  belongs_to :project

  # Validations
  validates :project, :admin, presence: true

  # Scopes

  # Extensions

  # Callbacks
  before_validation :set_admin, on: :create

  # Attributes
  attr_accessible :branch, :environment, :username, :email_address
  attr_accessor :email_address

  private
  def set_admin
    self.admin = Admin.where("email = ?", self.email_address).first
  end
end
