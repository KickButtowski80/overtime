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

require 'rails_helper'

RSpec.describe User, type: :model do
  before do          
      @user = FactoryBot.create(:user)
  end
  describe "creation" do
      
      it "can be created" do 
          expect(@user).to be_valid
      end   
  end
  
  describe 'validations' do
      
      it "cannot be created without first_name " do
          @user.first_name = nil 
          expect(@user).to_not be_valid
      end
      
      it 'cannot be created without last_name' do
         @user.last_name = nil
         expect(@user).to_not be_valid
       end
       
       it 'cannot be created without phone' do
         @user.phone = nil
         expect(@user).to_not be_valid
       end
       
        it 'requires the phone attr to only contain integers' do
          @user.phone = 'mygreatstr'
          expect(@user).to_not be_valid
        end
       
       it 'requires the phone attr to only have 10 chars' do
           @user.phone = '01234567891'
           expect(@user).to_not be_valid
       end
       
       it 'requires the ssn attr' do
           @user.ssn = nil
           expect(@user).to_not be_valid
       end
       
       it 'requires a company' do 
           @user.company = nil
           expect(@user).to_not be_valid
        end
        
        
       it 'requires the ssn attr to only contain integers' do
          @user.ssn = 'mygreatstr'
          expect(@user).to_not be_valid
        end
       
       it 'requires the ssn attr to only have 10 chars' do
           @user.ssn = '12345'
           expect(@user).to_not be_valid
       end
  end
  
  describe "custome name methods" do
    it 'has a full name metho that combines first and last name' do
       expect(@user.full_name).to eq("SNOW, JON")      
    end
  end
  
  describe 'relationship between admins and employees' do
      it 'allows for admins to be associated with multiple employees' do
          employee1 = FactoryBot.create(:user)
          employee2 = FactoryBot.create(:user)
          
          admin = FactoryBot.create(:admin_user)
          Hand.create!(user_id: admin.id, hand_id: employee1.id)
          Hand.create!(user_id: admin.id, hand_id: employee2.id)
          
          expect(admin.hands.count).to eq(2)
      end
      
  end
end
