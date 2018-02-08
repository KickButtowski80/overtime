# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  date       :date
#  rationale  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  status     :integer          default(0)
#

class Post < ApplicationRecord
    enum status: {submitted: 0, approved: 1, rejected: 2}
    belongs_to :user, optional: true
    
    validates_presence_of :date, :rationale
    
    scope :posts_by, -> (user) { where(user_id: user.id)}
end
