class RecipeDetailsController < ApplicationController

    before_action :authorize_request, only: :destroy
    before_action :set_food
    before_action :set_food_recipe
    before_action :set_food_recipe_recipe_detail, only: [:show, :update, :destroy] 

    # GET /foods/:food_id/recipes/:recipe_id/recipe_details
    def index
        render json: @recipe.recipe_details, include: ['recipe', 'unit','material'], status: :ok
    end

    # GET /foods/:food_id/recipes/:recipe_id/recipe_details/:id
    def show
        render json: @recipe_detail, status: :ok
    end

    # POST /foods/:food_id/recipes/:recipe_id/recipe_details
    def create
        @recipe.recipe_details.create!(recipe_detail_params)
        render json: @recipe.recipe_details, status: :created
    end

    # PUT /foods/:food_id/recipes/:recipe_id/recipe_details/:id
    def update
        @recipe_detail.update(recipe_detail_params)
        head :no_content
    end

    # DELETE /foods/:food_id/recipes/:recipe_id/recipe_details/:id
    def destroy
        @recipe_detail.destroy
        head :no_content
    end

    private

    def recipe_detail_params
        params.permit(:quantity, :optional, :unit_id, :material_id)
    end

    def set_food
        @food = Food.find(params[:food_id])
    end

    def set_food_recipe
        @recipe = @food.recipes.find(params[:recipe_id]) if @food
    end

    def set_food_recipe_recipe_detail
        @recipe_detail = @recipe.recipe_details.find_by!(id: params[:id]) if @recipe
    end
end
