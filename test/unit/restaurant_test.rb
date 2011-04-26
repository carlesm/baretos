require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  def test_notes 
        restaurant = Restaurant.new(:nom=>"Prova")
        restaurant.resenyas.build(:puntuacio=>0.5)
        restaurant.resenyas.build(:puntuacio=>0.5)

        assert restaurant.save
        assert_equal BigDecimal("0.5"), restaurant.mitja_punts
        assert restaurant.suspes?
    end
    
  test "the truth" do
    assert true
  end
end
