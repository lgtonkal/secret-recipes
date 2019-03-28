class RecipesController < ApplicationController

    #before_action :authorize_request, except: :create
    before_action :set_food
    before_action :set_food_recipe, only: [:show, :update, :destroy]

    # GET /foods/:food_id/recipes
    def index
        render json: @food.recipes, include: 'food', status: :ok
    end

    # GET /foods/:food_id/recipes/:id
    def show
        render json: @recipe, include: 'food', status: :ok
    end

    # POST /foods/:food_id/recipes
    def create
        @food.recipes.create!(recipe_params)
        render json: @food, status: :created
    end

    # PUT /foods/:food_id/recipes/:id
    def update
        @recipe.update(recipe_params)
        head :no_content
    end

    # DELETE /foods/:food_id/recipes/:id
    def destroy
        @recipe.destroy
        head :no_content
    end

    private

    def recipe_params
        params.permit(:description, :preparation_time, :cooking_time, :portion)
    end

    def set_food
        @food = Food.find(params[:food_id])
    end

    def set_food_recipe
        @recipe = @food.recipes.find_by!(id: params[:id]) if @food
    end

end
