class DosesController < ApplicationController
  before_action :set_dose, only: :destroy
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.ingredient_id = Ingredient.where(id: params[:dose][:ingredient].to_i)[0]["id"]
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
