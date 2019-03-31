class FoodsController < ApplicationController

    before_action :authorize_request, only: :destroy
    before_action :set_food, only: [:show, :update, :destroy]

    # GET /foods
    def index
        @foods = Food.all
        render json: @foods, include: ['recipes.recipe_details.unit','recipes.recipe_details.material','categories'], status: :ok
    end

    # POST /foods
    def create
        @food = Food.create!(food_params)
        render json: @food, status: :created
    end

    # GET /foods/:id
    def show
        render json: @food, status: :ok
    end

    # PUT /foods/:id
    def update
        @food.update(food_params)
        head :no_content
    end

    # DELETE /foods/:id
    def destroy
        @food.destroy
        head :no_content
    end

    private

    def food_params
        # whitelist params
        params.permit(:name, :image, category_ids: [])
    end

    def set_food
        @food = Food.find(params[:id])
    end
end
