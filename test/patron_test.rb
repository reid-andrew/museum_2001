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
  end
end
