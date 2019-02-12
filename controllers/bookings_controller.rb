require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require( 'pry-byebug' )
require_relative( '../models/booking.rb' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all
  erb ( :"bookings/index" )
end

get '/bookings/new' do
  @members = Member.all
  @lessons = Lesson.all
  erb(:"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to("/bookings")
end

post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect to("/bookings")
end

# get '/bookings/:id' do
#   Booking.find(params[:id])
#   erb( :"bookings/show" )
# end

# binding.pry
# nil
