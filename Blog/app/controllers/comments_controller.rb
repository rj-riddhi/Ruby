class CommentsController < ApplicationController

    http_basic_authenticate_with name: "Radhika", password: 'radhika', only: :destroy
     
    def create
        @article = Article.find(params[:article_id])
        @comment =  @article.comments.create(comment_params_secure)
        if @comment.save
            redirect_to article_path(@article)
        # else
        #    render article_path(@article), status: :unprocessable_entity
        end
    end 

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to article_path(@article), status: :see_other
    end

    private
    def comment_params_secure
        params.require(:comment).permit(:commenter, :comment, :status)
    end
end
