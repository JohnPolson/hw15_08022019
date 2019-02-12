require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require( 'pry-byebug' )
require_relative( '../models/member.rb' )
require_relative( '../models/booking.rb' )
require_relative( '../models/lesson.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/:id' do
  @members = Member.find(params['id'].to_i)
  erb( :"members/show" )
end

get '/members/:id/edit' do
  @members = Member.find(params['id'].to_i)
  erb( :"members/edit" )
end

# binding.pry
# nil
