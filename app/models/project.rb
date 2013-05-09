class Project < ActiveRecord::Base
  # Associations
  has_many :releases, dependent: :destroy

  # Delegates

  # Validations
  validates :name, presence: true

  # Scopes

  # Extensions
  include AASM
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Callbacks

  # Attributes
  attr_accessible :name

  # States
  aasm do
    state :active, initial: true
    state :archived

    event :archive do
      transitions from: :active, to: :archived
    end

    event :activate do
      transitions from: :archived, to: :active
    end
  end

  def to_param
    self.slug
  end
end
