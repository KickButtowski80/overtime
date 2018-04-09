@employee = Employee.create(email: "test@test.com", password: "asfdasdf", password_confirmation:"asfdasdf", first_name: "Jon", last_name: "Snow", phone: "4244420591")
puts "1 employee created!"
@admin_employee = AdminUser.create!(email: "igaligal613@gmail.com", password: "asdfasdf", password_confirmation:"asdfasdf", first_name: "Admin", last_name: "Name", phone:"4244420591" )
puts "1 admin employee created!"
5.times do |post|
    Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @employee.id , overtime_request: 2.5)   
end

puts "5 posts have been created"


# 100.times do |audit_log|
#     AuditLog.create!(employee_id: @employee.id, status: 0, start_date: (Date.today -  6.days), end_date: Date.today)  
# end
# puts "100 audit logs have been created"

AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today -  6.days))  
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today -  13.days))  
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today -  20.days))  
puts '3 audit logs with different start date have been created'
Post.create!(date: Date.today-1, rationale: "I am admin post", user_id: @admin_employee.id, overtime_request: 5.5)

puts "1 post from admin employee created"