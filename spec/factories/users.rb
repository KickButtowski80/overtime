# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryBot.define do
    sequence :email do |n|
        "test#{n}@example.com"
    end
    factory :user do 
        first_name "Jon"
        last_name "Snow"
        email {generate :email}
        password "asdfasdf"
        password_confirmation "asdfasdf"
        phone "4444444444"
    end
    
    factory :admin_user , class: "AdminUser" do 
        first_name "Admin"
        last_name "User"
        email {generate :email}
        password "asdfasdf"
        password_confirmation "asdfasdf"
        phone "4444444444"
    end
    
    factory :other_user , class: "User" do
        first_name "Non"
        last_name "Authorized"
        email {generate :email}
        password "asdfasdf"
        password_confirmation "asdfasdf" 
        phone "4444444444"
        
    end
end
