class TagsController < ApplicationController
  def index
    @tags = Tag.all
    respond_to do |format|
      format.html {render :index}
      format.js { render 'shared/ajax_body.js' }
    end
  end
  def show
    @tag = Tag.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render 'shared/ajax_body.js' }
    end
  end
end
