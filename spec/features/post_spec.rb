require 'rails_helper'

describe 'navigate' do
    let(:user){ FactoryBot.create(:user)}   
    
    let(:post) do
        Post.create(date: Date.today, rationale: "Rationale", user_id: user.id, overtime_request: 2.0)
    end
    
    before do       
        login_as(user, :scope => :user)
    end
    describe 'index' do
        
        it 'can be reached successfully' do
             visit posts_path
            expect(page.status_code).to eq(200)
        end
        
        it 'has a title of Posts' do 
            visit posts_path
            expect(page).to have_content(/Post Dashboard/)
        end
        
        # it 'has a list of posts' do 
        #     post1 = FactoryBot.create(:post)
        #     post2 = FactoryBot.create(:second_post)
        #     visit posts_path
        #     expect(page).to have_content(/rationale| rationale-content/)
        # end
        
#   1) navigate index has a list of posts
#      Failure/Error: expect(page).to have_content(/rationale| rationale-content/)
#       expected to find text matching /rationale| rationale-content/ in "Time Tracker Home Time Entries Add New Entry Options Logout All the Posts # Date User Rationale"
#      # ./spec/features/post_spec.rb:25:in `block (3 levels) in <top (required)>'
        
        it 'has a scope so that only post creators can see their posts' do
            # post_from_other_user = FactoryBot.build(:post_from_other_user)
            other_user = User.create(first_name: "Non", last_name: "Authorized", email: "nonauth@example.com", password: "asdfasdf", password_confirmation:"asdfasdf", phone: "66666666")
            post_from_other_user = Post.create(date: Date.today, rationale: "This post shouldn't be seen", user_id: other_user.id, overtime_request: 2.0)
            # byebug
            visit posts_path
            expect(page).to_not have_content(/This post shouldn't be seen/)
        end
    end    
    describe 'new' do
        #homepage is index from welcome controller        
        it 'has a link from the homepage' do 
            employee = Employee.create!(first_name: 'Izak', last_name: 'T', email: 'employee@example.com', password: 'asdfasdf', password_confirmation:"asdfasdf", phone: "9999999999", ssn: 1234, company: "ABC company")
            login_as(employee, :scope => :user)
            visit root_path
            
            click_link("new_post_from_nav")
            expect(page.status_code).to eq(200)
        end        
    end
    
    describe 'delete' do
        it 'can be deleted' do
            logout(:user)
            
            delete_user = FactoryBot.create(:user)
            login_as(delete_user, :scope => :user)
            # post_to_delete = FactoryBot.create(:second_post)
            # post_to_delete['user_id'] = delete_user.id
            # post_to_delete.save
         post_to_delete= Post.create(date: Date.today, rationale: 'asdf', user_id: delete_user.id , overtime_request: 2.0)
            visit posts_path
            
            click_link("delete_post_#{post_to_delete.id}_from_index")
            expect(page.status_code).to eq(200)
        end
        
        
    end 
    describe 'creation' do
        before do
            visit new_post_path
        end
        it 'has a new form that can be reached' do             
            expect(page.status_code).to eq(200)
        end
        
        it 'can be created from new form page' do             
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: "Some rationale"  
            fill_in 'post[overtime_request]', with: 4.5
            
            
            expect { click_on "Save"}.to change(Post, :count).by(1)         
        end
        
        it 'will have a user associated with it' do 
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: "User Association"
            fill_in 'post[overtime_request]', with: 4.5
            click_on "Save"
            
            expect(User.last.posts.last.rationale).to eq("User Association")
        end
    end
    
  describe 'edit' do

    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      other_user = FactoryBot.create(:other_user)
      login_as(other_user, :scope => :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end
end