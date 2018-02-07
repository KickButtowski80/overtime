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

require 'rails_helper'

RSpec.describe Post, type: :model do
    describe "Creation" do
        before do
            @post = FactoryBot.create(:post)
        end
        it 'can be created' do
           expect(@post).to be_valid
        end
       
        it "cannot be created without date, and rationale" do
          @post.date = nil
          @post.rationale = nil
          expect(@post).to_not be_valid
        end
    end
end
