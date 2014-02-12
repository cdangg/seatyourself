class CategoriesController < ApplicationController
  def new
  	@category = Category.new
  end

  def show
  	@category = Category.find(params[:id])
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to new_category_path, :notice => "Successfully created a category"
  	else
  		render :action => :create
  	end
  end

  private
  def category_params
  	params.require(:category).permit(:cuisine)
  end
end
