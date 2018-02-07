@user = User.create(email: "test@test.com", password: "asfdasdf", password_confirmation:"asfdasdf", first_name: "Jon", last_name: "Snow")
puts "1 user created!"
AdminUser.create!(email: "admin@test.com", password: "pazpaz22", password_confirmation:"pazpaz22", first_name: "Admin", last_name: "Name")
puts "1 admin user created!"
100.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id )   
end

puts "100 posts have been created"