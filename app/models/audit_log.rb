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

class AuditLog < ApplicationRecord
  belongs_to :user 
  validates_presence_of :user_id, :status, :start_date
  
  after_initialize :set_defaults
  
  private 
  
      def set_defaults
        self.start_date ||= Date.today - 6.days            
      end
end
