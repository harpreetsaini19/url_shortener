class Hit < ActiveRecord::Base
  belongs_to :shorty
  validates :shorty_id, :presence => true
end
