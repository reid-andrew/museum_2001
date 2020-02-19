require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 0)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_attributes
    assert_equal  "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits
    assert_equal [], @dmns.patrons
  end

  def test_it_adds_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    expected = [@gems_and_minerals, @dead_sea_scrolls, @imax]

    assert_equal expected, @dmns.exhibits
  end

  def test_it_recommends_exhibits
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")
    @patron_3.add_interest("Dead Sea Scrolls")
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@imax)

    assert_equal [@dead_sea_scrolls, @gems_and_minerals], @dmns.recommend_exhibits(@patron_1)
    assert_equal [@imax], @dmns.recommend_exhibits(@patron_2)
  end

  def test_it_admits_patrons
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    expected = [@patron_1, @patron_2, @patron_3]

    assert_equal expected, @dmns.patrons
  end

  def test_it_returns_patrons_by_exhibit_interest
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    expected = {
      @gems_and_minerals => [@patron_1],
      @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
      @imax => []
    }
    assert_equal expected, @dmns.patrons_by_exhibit_interest
  end

  # def test_it_identifies_lottery_contestants
  #   @dmns.add_exhibit(@gems_and_minerals)
  #   @dmns.add_exhibit(@dead_sea_scrolls)
  #   @dmns.add_exhibit(@imax)
  #   @patron_1.add_interest("Gems and Minerals")
  #   @patron_1.add_interest("Dead Sea Scrolls")
  #   @patron_2.add_interest("Dead Sea Scrolls")
  #   @patron_3.add_interest("Dead Sea Scrolls")
  #   @dmns.admit(@patron_1)
  #   @dmns.admit(@patron_2)
  #   @dmns.admit(@patron_3)
  #
  #   expected = []
  #
  # end
end
