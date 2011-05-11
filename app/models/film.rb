class Film < ActiveRecord::Base
  # attr_accessible :name, :url, :description, :rating
  require 'open-uri'
  require 'net/http'
  
  before_validation :clean_url #private method
  validates_presence_of :name, :url, :description
  validates_numericality_of :rating, :greater_than => -1, :less_than => 6
  belongs_to :genre 
  has_many :comments, :dependent => :destroy
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  
  
  
  def scrape_price
    uri = URI.parse("http://#{self.url}")
    puts uri
    document = Nokogiri::HTML(open(uri))
    pounds = document.css('#pricePounds').text.scan(/\d+/)
    pence = document.css('#pricePence').text
    self.price = BigDecimal.new("#{pounds}.#{pence}")
    self.save!
  end
  
  handle_asynchronously :scrape_price #alias method. 
  
  private
  def clean_url
    self.url.gsub!('http://','') if self.url
  end
  
end

# == Schema Information
#
# Table name: films
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

