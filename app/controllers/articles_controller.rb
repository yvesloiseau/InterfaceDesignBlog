class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # Load authorizaton rules for articles
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to articles_path, :alert => exception.message
    end

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.all
    if params[:q]
      search_term = params[:q]
      #@articles = Article.search(search_term)
      @articles = Article.search(search_term).paginate(page:
                                              params[:page], per_page: 2)
    else
      #@articles = Article.all
      #@articles = Article.all.paginate(page: params[:page], per_page: 4)
      @articles = Article.all.paginate(page:
                                      params[:page], per_page: 2)
    end

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @articleFirst = @article.comments.desc.first
    #@comments = @article.comments.order("created_at DESC")
    if signed_in? and current_user.admin?
        @comments = @article.comments.order("created_at DESC").paginate(page:
                                            params[:page], per_page: 1)
    else
        @comments = @article.comments.approved_comments.paginate(page:
                                                    params[:page], per_page: 1)
    end
    @comment = @article.comments.build
    @valid_comments = 0
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html do
          redirect_to @article, notice: 'Article was successfully created.'
        end
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json do
          render json: @article.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html do
          redirect_to @article, notice: 'Article was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json do
          render json: @article.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html do
        redirect_to articles_url, notice: 'Article was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:article_title,
                                    :article_text,
                                    :posted_by,
                                    :posted_date,
                                    :article_image,
                                    :article_video,
                                    :article_details)
  end

  def save_my_previous_url
    session[:my_previous_url] = URI(request.referer || '').path
    @back_url = session[:my_previous_url]
    session[:previous_url] = @back_url
  end
end
