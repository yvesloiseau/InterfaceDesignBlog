class CommentsController < ApplicationController
  # Load authorizaton rules for comments
  load_and_authorize_resource

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    # Validations  (Need to add validations for individual fields on the profile)
    respond_to do |format|

      if @comment.save
        format.html { redirect_to article_path(@article), notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render 'articles/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    #@comment = params[:id]
    #@approved = params[:approved]
    #@comment.update(comment_approve_params)

#    respond_to do |format|
#      format.html { redirect_to :back, notice: 'Review was created successfully.' }
#    end
    respond_to do |format|
      if @comment.update(comment_approve_params)
        format.html { redirect_to article_path(@article), notice: 'Review was updated successfully.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render 'articles/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end

  def new
   @article = Article.find(params[:article_id])
   @comment = @article.comments.new(comment_params)
  end

	def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:posted_by, :article_comment, :user_email,
        :user_imageorvideo, :user_id, :approved)
    end

    def comment_approve_params
      params.require(:comment).permit(:approved)
    end

end
