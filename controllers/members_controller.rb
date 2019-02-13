require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require( 'pry-byebug' )
require_relative( '../models/member.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/lesson.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/new' do
  @members = Member.all
  erb(:"members/new")
end

post '/members' do
  member = Booking.new(params)
  member.save
  redirect to("/members")
end

post '/members/:id/delete' do
  Member.delete(params[:id])
  redirect to("/members")
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
