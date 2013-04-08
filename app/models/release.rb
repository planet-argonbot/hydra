class Release < ActiveRecord::Base
  # Associations
  belongs_to :admin
  belongs_to :project

  # Validations

  # Scopes

  # Extensions

  # Callbacks

  # Attributes
  attr_accessible :branch, :environment, :username
end
