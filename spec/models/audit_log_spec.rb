# == Schema Information
#
# Table name: audit_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :integer          default(0)
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe AuditLog, type: :model do 
    before do 
        @audit_log = FactoryBot.create(:audit_log)
    end
    
    describe 'creation' do
        it 'can be properly created' do
            expect(@audit_log).to be_valid
        end
    end
    
    describe 'valiations' do
        it 'should be required to have a user association' do
            
            @audit_log['user_id'] = nil
            
            expect(@audit_log).to_not be_valid
            # byebug
        end 
    
        it 'should always have a status' do 
           @audit_log['status'] = nil            
            expect(@audit_log).to_not be_valid
        end
        
        it 'should be required to have start_date' do
            @audit_log['start_date'] = nil            
            expect(@audit_log).to_not be_valid
        end
        
        it 'should have a start date equla to 6 days prior' do
            new_audit_log = AuditLog.create(user_id: User.last.id)
            expect(new_audit_log.start_date).to eq(Date.today - 6.days)
        end   
    end
end
