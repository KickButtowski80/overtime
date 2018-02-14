namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they have overtime or not overtime"
  task sms: :environment do
    puts "I am a rake tasks :-}"
    
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

end
