require 'rails_helper'
RSpec.describe 'Posts', type: :request do
    describe 'Post /create' do
        context 'With valid parameters' do
            let!(:my_post) { FactoryBot.create(:post) }
            before do
                post '/api/v1/posts', 
                params: { 
                            post: {
                                     title: my_post.title,
                                     content: my_post.content
                                  }
                        }
            end

            it "Returns post's title" do
                expect(json['title']).to eq(my_post.title)
            end

            it "Returns post's content" do
                expect(json['content']).to eq(my_post.content)
            end

            it "Created Successfully" do
                expect(response).to have_http_status(:created)
            end
        end

        context 'With Invalid parameters' do
            before do
                post '/api/v1/posts', 
                params: { 
                            post: {
                                     title: '',
                                     content: ''
                                  }
                        }
            end

            it 'Not valid required all parameters' do
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
        
    end
end