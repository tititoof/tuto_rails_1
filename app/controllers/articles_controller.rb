class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params.has_key?(:category_id)
      @articles = Category.find(params[:category_id]).articles
    else
      @articles = Article.all
    end
    respond_to do |format|
      format.html
      format.js { render 'shared/ajax_body.js' }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comment = @article.comments.new
    respond_to do |format|
      format.html
      format.js { render 'shared/ajax_body.js' }
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
    respond_to do |format|
      format.html
      format.js { render 'shared/ajax_body.js' }
    end
  end

  # GET /articles/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js { render 'shared/ajax_body.js' }
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article  = Article.new(article_params)
    @view     = 'index'

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
        format.js { render 'shared/ajax_body.js' }
      else
        @view = 'new'
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js { render 'shared/ajax_body.js' }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @view     = 'show'
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
        format.js { render 'shared/ajax_body.js' }
      else
        @view = 'edit'
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js { render 'shared/ajax_body.js' }
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
      params.require(:article).permit(:title, :body, :tag_list, :image, :category_id)
    end
end
