require_relative( '../db/sql_runner' )

class Lesson

  attr_reader( :title, :instructor, :capacity, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @instructor = options['instructor']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO lessons
    (
      title,
      instructor,
      capacity
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @instructor, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM lessons"
    results = SqlRunner.run( sql )
    return results.map { |lesson| Lesson.new( lesson ) }
  end

  def self.find( id )
    sql = "SELECT * FROM lessons
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Lesson.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM lessons"
    SqlRunner.run( sql )
  end

end