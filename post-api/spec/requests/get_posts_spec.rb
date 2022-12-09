require 'rails_helper'
RSpec.describe 'Posts', type: :request do
    describe 'GET /index' do
        before do
            FactoryBot.create_list(:post, 10)
            get '/api/v1/posts'
        end

        it "Successfully shows all records" do
            expect(json.size).to eq(10)
        end
   end
end