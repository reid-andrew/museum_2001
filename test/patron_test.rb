require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/patron'

class PatronTest < Minitest::Test
  def setup
    @patron = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, @patron
  end

  def test_it_has_attributes
    assert_equal "Bob", @patron.name
    assert_equal 20, @patron.spending_money
    assert_equal [], @patron.interests
  end

  def test_it_adds_interests
    @patron.add_interest("Dead Sea Scrolls")
    @patron.add_interest("Gems and Minerals")
    expected = ["Dead Sea Scrolls", "Gems and Minerals"]

    assert_equal expected, @patron.interests
  end
end
