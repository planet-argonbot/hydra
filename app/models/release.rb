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
  attr_accessible :branch, :environment, :username, :email_address, :deployed_at
  attr_accessor :email_address

  def self.group_by_month
    all.each_with_object(Hash.new(0)) do |r, h|
      h[r.month] += 1
    end
  end

  def month
    deployed_at.strftime('%B')
  end

  private
  def set_admin
    self.admin = Admin.where("email = ? or email_aliases like ?", self.email_address, "%#{self.email_address}%").first if self.email_address
  end
end
