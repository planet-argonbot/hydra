class Project < ActiveRecord::Base
  # Associations

  # Delegates

  # Validations
  validates :name, presence: true

  # Scopes

  # Extensions
  include AASM

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
end
