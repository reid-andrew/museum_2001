require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/exhibit'

class ExhibitTest < Minitest::Test

  def setup
    @exhibit = Exhibit.new
  end

  def test_it_exists
    assert_instance_of Exhibit, @exhibit
  end


end
