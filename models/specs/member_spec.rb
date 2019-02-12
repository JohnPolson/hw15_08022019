require('minitest/autorun')
require_relative('../member')

class TestMember < Minitest::Test

  def setup
    options = {"id" => 2,
              "first_name" => "Kevin",
              "last_name" => "Edwards",
              "age" => 27,
              "address" => "19 King Street",
              "email" => "kevin.edwards@gmail.com"
            }

    @member = Member.new(options)
  end

  def test_id()
    assert_equal(2, @member.id)
  end

  def test_first_name()
    assert_equal("Kevin", @member.first_name)
  end

  def test_last_name()
    assert_equal("Edwards", @member.last_name)
  end

  def test_age()
    assert_equal(27, @member.age)
  end

  def test_address()
    assert_equal("19 King Street", @member.address)
  end

  def test_email()
    assert_equal("kevin.edwards@gmail.com", @member.email)
  end

  def test_full_name()
    assert_equal("Kevin Edwards", @member.full_name)
  end
end
