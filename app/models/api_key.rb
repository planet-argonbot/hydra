class ApiKey < ActiveRecord::Base
  # Associations

  # Delegates

  # Validations
  validates :access_token, uniqueness: true

  # Scopes

  # Extensions
  include AASM

  # Callbacks
  before_create :generate_access_token

  # Attributes
  attr_accessible :access_token

  # States
  aasm do
    state :active, initial: true
    state :revoked

    event :revoke do
      transitions from: :active, to: :revoked
    end

    event :activate do
      transitions from: :revoked, to: :active
    end
  end

  def to_param
    self.access_token
  end

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
      end while self.class.exists?(access_token: access_token)
  end
end
