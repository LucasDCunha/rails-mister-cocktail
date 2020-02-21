class CocktailsController < ApplicationController
  before_action :set_cocktail, only: :show
  def index
    if params[:search].nil? || params[:search][:search] == ''
      @cocktails = Cocktail.all
    else
      @cocktails = Cocktail.where(name: params[:search][:search])
    end
  end

  def show
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
