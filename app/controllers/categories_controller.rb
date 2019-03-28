class CategoriesController < ApplicationController

    #before_action :authorize_request, except: :create
    before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
    def index
        @categories = Category.all
        render json: @categories, status: :ok
    end

    # POST /categories
    def create
        @category = Category.create!(category_params)
        render json: @category, status: :created
    end

    # GET /categories/:id
    def show
        render json: @category, status: :ok
    end

    # PUT /categories/:id
    def update
        @category.update(category_params)
        head :no_content
    end

    # DELETE /categories/:id
    def destroy
        @category.destroy
        head :no_content
    end

    private

    def category_params
        # whitelist params
        params.permit(:name, :image)
    end

    def set_category
        @category = Category.find(params[:id])
    end

end
