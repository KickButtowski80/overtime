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

FactoryBot.define do
  factory :audit_log do
    user nil
    status 1
    start_date "2018-02-20"
    end_date "2018-02-20"
  end
end
