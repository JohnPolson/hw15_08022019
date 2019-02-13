require_relative( '../db/sql_runner' )
require_relative('booking')
require_relative('lesson')

class Member

  attr_accessor( :first_name, :last_name, :age, :address, :email, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @address = options['address']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      age,
      address,
      email
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @address, @email]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.delete(id)
    sql = "DELETE FROM members WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

  def full_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def lessons
    sql = "SELECT l.* FROM lessons l INNER JOIN bookings b ON b.lesson_id = l.id WHERE b.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |lesson| Lesson.new(lesson) }
  end

end
