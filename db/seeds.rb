require_relative( "../models/lesson.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Booking.delete_all()
Lesson.delete_all()
Member.delete_all()

lesson1 = Lesson.new({
  "title" => "Spin",
  "instructor" => "Janice White",
  "capacity" => "25"
})

lesson2 = Lesson.new({
  "title" => "Interval",
  "instructor" => "Tom Davis",
  "capacity" => "20"
})

lesson3 = Lesson.new({
  "title" => "Yoga",
  "instructor" => "Belicia Torres",
  "capacity" => "25"
})

lesson4 = Lesson.new({
  "title" => "BJJ",
  "instructor" => "Helio Gracie",
  "capacity" => "20"
})

lesson1.save()
lesson2.save()
lesson3.save()
lesson4.save()



member1 = Member.new({
  "first_name" => "Jane",
  "last_name" => "Doe",
  "age" => 22,
  "address" => "9 High Street",
  "email" => "jane.doe@live.com",
})
member2 = Member.new({
  "first_name" => "Kevin",
  "last_name" => "Edwards",
  "age" => 27,
  "address" => "19 King Street",
  "email" => "kevin.edwards@gmail.com",
})
member3 = Member.new({
  "first_name" => "Linda",
  "last_name" => "Franks",
  "age" => 32,
  "address" => "29 Silver Street",
  "email" => "linda.franks@bt.co.uk",
})
member4 = Member.new({
  "first_name" => "Mark",
  "last_name" => "Green",
  "age" => 43,
  "address" => "39 Union Avenue",
  "email" => "mark.green@yahoo.co.uk",
})

member1.save()
member2.save()
member3.save()
member4.save()



booking1 = Booking.new({
  "member_id" => member1.id,
  "lesson_id" => lesson3.id
})
booking2 = Booking.new({
  "member_id" => member2.id,
  "lesson_id" => lesson4.id
})
booking3 = Booking.new({
  "member_id" => member3.id,
  "lesson_id" => lesson1.id
})
booking4 = Booking.new({
  "member_id" => member4.id,
  "lesson_id" => lesson2.id
})
booking5 = Booking.new({
  "member_id" => member1.id,
  "lesson_id" => lesson1.id
})
booking6 = Booking.new({
  "member_id" => member2.id,
  "lesson_id" => lesson2.id
})
booking7 = Booking.new({
  "member_id" => member3.id,
  "lesson_id" => lesson3.id
})
booking8 = Booking.new({
  "member_id" => member4.id,
  "lesson_id" => lesson4.id
})

booking1.save()
booking2.save()
booking3.save()
booking4.save()
booking5.save()
booking6.save()
booking7.save()
booking8.save()

# binding.pry
# nil
