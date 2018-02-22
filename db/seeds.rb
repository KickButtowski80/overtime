@user = User.create(email: "test@test.com", password: "asfdasdf", password_confirmation:"asfdasdf", first_name: "Jon", last_name: "Snow", phone: "4242515130")
puts "1 user created!"
@admin_user = AdminUser.create!(email: "admin@test.com", password: "pazpaz22", password_confirmation:"pazpaz22", first_name: "Admin", last_name: "Name", phone:"4242515130" )
puts "1 admin user created!"
100.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id , overtime_request: 2.5)   
end

puts "100 posts have been created"


100.times do |audit_log|
    AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today -  6.days))  
end
puts "100 audit logs have been created"
Post.create!(date: Date.today-1, rationale: "I am admin post", user_id: @admin_user.id, overtime_request: 5.5)

puts "1 post from admin user created"