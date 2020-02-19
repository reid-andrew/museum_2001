require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/museum'

class MuseumTest < Minitest::Test
  def setup
    @museum = Museum.new
  end

  def test_it_exists
    assert_instance_of Museum, @museum
  end
end
