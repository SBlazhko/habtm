class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    redirect_to root_path if category = Category.create(name: params[:category][:name]) 
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
