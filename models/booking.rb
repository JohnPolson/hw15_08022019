require_relative( '../db/sql_runner' )
require_relative('lesson')
require_relative('member')


class Booking

  attr_reader( :lesson_id, :member_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @lesson_id = options['lesson_id'].to_i
    @member_id = options['member_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (
      lesson_id,
      member_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@lesson_id, @member_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |booking| Booking.new( booking ) }
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Booking.new( results.first )
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def lesson()
    sql = "SELECT * FROM lessons
    WHERE id = $1"
    values = [@lesson_id]
    results = SqlRunner.run( sql, values )
    return Lesson.new( results.first )
  end

end
