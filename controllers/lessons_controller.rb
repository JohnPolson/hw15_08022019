require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require( 'pry-byebug' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/booking.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/lessons' do
  @lessons = Lesson.all()
  erb ( :"lessons/index" )
end

get '/lessons/:id' do
  @lessons = Lesson.find(params['id'].to_i)
  erb( :"lessons/show" )
end

get '/lessons/:id/edit' do
  @lessons = Lesson.find(params['id'].to_i)
  erb( :"lessons/edit" )
end

# binding.pry
# nil
