require('minitest/autorun')
require_relative('../lesson')

class TestLesson < Minitest::Test

  def setup
    options = {"id" => 1,
              "title" => "Spin",
              "instructor" => "Janice White",
              "capacity" => "25"}

    @lesson = Lesson.new(options)
  end

  def test_id()
    result = @lesson.id
    assert_equal(1, result)
  end

  def test_title()
    assert_equal("Spin", @lesson.title)
  end

  def test_instructor()
    assert_equal("Janice White", @lesson.instructor)
  end

  def test_capacity()
    assert_equal(25, @lesson.capacity)
  end

end
