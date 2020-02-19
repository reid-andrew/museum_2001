require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/museum'
require './lib/exhbits'

class MuseumTest < Minitest::Test
  def setup
    @museum = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  def test_it_exists
    assert_instance_of Museum, @museum
  end

  def test_it_has_attributes
    assert_equal  "Denver Museum of Nature and Science", @museum.name
    assert_equal [], @museum.exhibits
  end
end
