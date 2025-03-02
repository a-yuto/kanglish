class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  # POST /posts/:post_id/comments
  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to @post, notice: 'コメントが投稿されました。'
    else
      redirect_to @post, alert: 'コメントの投稿に失敗しました。'
    end
  end

  # GET /posts/:post_id/comments/:id/edit
  def edit
  end

  # PATCH/PUT /posts/:post_id/comments/:id
  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: 'コメントが更新されました。'
    else
      render :edit
    end
  end

  # DELETE /posts/:post_id/comments/:id
  def destroy
    @comment.destroy
    redirect_to @post, notice: 'コメントが削除されました。'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
