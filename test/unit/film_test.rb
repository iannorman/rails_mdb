require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Film.new.valid?
  end
end
