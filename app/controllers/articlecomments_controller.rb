class ArticlecommentsController < ApplicationController
  before_action :set_articlecomment, only: [:show, :edit, :update, :destroy]
    @articles = Article.all
    @articlecomments = Articlecomment.all

  # GET /articlecomments
  # GET /articlecomments.json
	def index
	  @articlecomments = Articlecomment.all
  end

  # GET /articlecomments/1
  # GET /articlecomments/1.json
  def show
  end

  def new
  end

  # GET /articlecomments/new
  def new
    @articlecomment = Articlecomment.new
  end

  # GET /articlecomments/1/edit
  def edit
  end

  # POST /articlecomments
  # POST /articlecomments.json
  def create
    @articlecomment = Articlecomment.new(articlecomment_params)

    respond_to do |format|
      if @articlecomment.save
        format.html { redirect_to @articlecomment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @articlecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articlecomments/1
  # PATCH/PUT /articlecomments/1.json
  def update
    respond_to do |format|
      if @articlecomment.update(articlecomment_params)
        format.html { redirect_to @articlecomment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @articlecomment }
      else
        format.html { render :edit }
        format.json { render json: @articlecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articlecomments/1
  # DELETE /articlecomments/1.json
  def destroy
    @articlecomment.destroy
    respond_to do |format|
      format.html { redirect_to articlecomments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articlecomment
      @article = Article.find(params[:id])
      @articlecomment = Articlecomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articlecomment_params
      params.require(:articlecomment).permit(:article_id, :comment, :posted_by, :posted_date, :email_address)
    end

end