require 'rails_helper'
RSpec.describe 'Posts', type: :request do
    describe 'DELETE /destroy' do

        let!(:post) { FactoryBot.create(:post) }

        before do
            delete "/api/v1/posts/#{post.id}"
        end

        it 'destroyed' do
            expect(response).to have_http_status(204)
        end
    end
end