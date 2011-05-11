require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Film.new.valid?
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

