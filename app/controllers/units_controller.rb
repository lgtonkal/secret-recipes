class UnitsController < ApplicationController
    
    before_action :authorize_request, only: [:create, :update, :destroy]
    before_action :set_unit, only: [:show, :update, :destroy]

    # GET /units
    def index
        @units = Unit.all
        render json: @units, status: :ok
    end

    # POST /units
    def create
        @unit = Unit.create!(unit_params)
        render json: @unit, status: :created
    end

    # GET /units/:id
    def show
        render json: @unit, status: :ok
    end

    # PUT /units/:id
    def update
        @unit.update(unit_params)
        head :no_content
    end

    # DELETE /units/:id
    def destroy
        @unit.destroy
        head :no_content
    end

    private

    def unit_params
        # whitelist params
        params.permit(:name, :shortcode)
    end

    def set_unit
        @unit = Unit.find(params[:id])
    end
end
