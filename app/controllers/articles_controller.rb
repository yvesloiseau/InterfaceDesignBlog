class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # Load authorizaton rules for articles
  load_and_authorize_resource

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.all
    if params[:q]
      search_term = params[:q]
      @articles = Article.search(search_term)
      #@articles = Article.search(search_term).paginate(page: params[:page], per_page: 4)
    else
      @articles = Article.all
      #@articles = Article.all.paginate(page: params[:page], per_page: 4)
    end

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @articleFirst = @article.comments.desc.first
    @comments = @article.comments.order("created_at DESC")
    @comment = @article.comments.build

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
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:article_title, :article_text, :posted_by, :posted_date, :article_image, :article_video, :article_details)
    end
end
