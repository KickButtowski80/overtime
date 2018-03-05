namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they have overtime or not overtime"
  task sms: :environment do
    # puts "I am a rake tasks :-}"
    
    # 1. Schedule to run at Sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip AdminUsers
    # 4. Send a message that has instructions and a link to log time
    # number: "555-555-3535" no accepetable
    # number: "5555553535       accepetable
    # No spaces or dashes
    # exactly 10 character
    # all character have to be a number
  end
  
  desc "Sends mail notification to managers (admin users) each day to inform of pending overitme requests"
  task manager_email: :environment do
    
    
    # 1. Iterate over the list of pending overtime requests
    # 2. Check to see if there are any requests
    # 3. Iterate over the list of admin users/ mangers
    # 4. Send the email to each admin user
    
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    
    if submitted_posts.count > 0 
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
        puts 'I am in the manager email'
      end
   end
 end
end
