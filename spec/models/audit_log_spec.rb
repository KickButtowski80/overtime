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
  pending "add some examples to (or delete) #{__FILE__}"
end
