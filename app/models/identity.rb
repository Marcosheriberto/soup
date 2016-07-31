class Identity < ActiveRecord::Base
  belongs_to :user, required: false

  validates :provider, :uid, presence: true
end
