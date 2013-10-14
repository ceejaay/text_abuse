class TextsController < ApplicationController
  def index

  end

  def show
    @text = Text.find(params[:id])
  end

  def create
    @text = Text.new(params[:text])
    @text.save
    redirect_to @text
  end

  def new
    @text = Text.new
  end
  
end
