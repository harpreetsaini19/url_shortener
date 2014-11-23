class Shorty < ActiveRecord::Base
  has_many :hits, dependent: :delete_all
  
  validates :shortened_url, :actual_url, :http_status, :presence => true
  validates_format_of :actual_url, :with => URI::regexp(%w(http https))
  validates_format_of :alias, :with => /\A[a-zA-Z0-9]*\z/, :message => "must contain only alphanumeric", :allow_blank => true
  validates_uniqueness_of :shortened_url, :case_sensitive => false
  validates_uniqueness_of :alias, :case_sensitive => false, :allow_blank => true
end
