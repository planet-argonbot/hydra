class Release < ActiveRecord::Base
  # Associations
  belongs_to :admin
  belongs_to :project, counter_cache: true

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
    self.admin = Admin.where("email = ?", self.email_address).first if self.email_address
  end
end
