require('minitest/autorun')
require_relative('../booking')

class TestBooking < Minitest::Test

  def setup
    options = {"id" => 1,
              "lesson_id" => 2,
              "member_id" => 1
            }

    @booking = Booking.new(options)
  end

  def test_id
    assert_equal(1, @booking.id)
  end

  def test_lesson_id
    assert_equal(2, @booking.lesson_id)
  end

  def test_member_id
    assert_equal(1, @booking.member_id)
  end


end
