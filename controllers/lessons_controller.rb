require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require( 'pry-byebug' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/lessons' do
  @lessons = Lesson.all()
  erb ( :"lessons/index" )
end

get '/lessons/new' do
  @lessons = Lesson.all
  erb(:"lessons/new")
end

post '/lessons' do
  lesson = Lesson.new(params)
  lesson.save
  redirect to("/lessons")
end

post '/lessons/:id/delete' do
  Lesson.delete(params[:id])
  redirect to("/lessons")
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
