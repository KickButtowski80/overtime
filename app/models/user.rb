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

class User < ApplicationRecord
  has_many :posts
  has_many :audit_logs
  
  has_many :hands_associations, class_name: 'Hand'
  has_many :hands, through: :hands_associations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_presence_of :first_name, :last_name, :phone
  
  PHONE_REGEX = /\A[0-9]*\Z/
  
  validates_format_of :phone, with: PHONE_REGEX
  
  validates :phone, length: { is: 10 }
  # it seems it adds such a feature to user table and we can user like Post.first.user.full_name 
  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
