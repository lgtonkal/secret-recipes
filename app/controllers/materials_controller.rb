class MaterialsController < ApplicationController

    before_action :authorize_request, only: [:create, :update, :destroy]
    before_action :set_material, only: [:show, :update, :destroy]

    # GET /materials
    def index
        @materials = Material.all
        render json: @materials, status: :ok
    end

    # POST /materials
    def create
        @material = Material.create!(material_params)
        render json: @material, status: :created
    end

    # GET /materials/:id
    def show
        render json: @material, status: :ok
    end

    # PUT /materials/:id
    def update
        @material.update(material_params)
        head :no_content
    end

    # DELETE /materials/:id
    def destroy
        @material.destroy
        head :no_content
    end

    private

    def material_params
        # whitelist params
        params.permit(:name, :shortcode)
    end

    def set_material
        @material = Material.find(params[:id])
    end

end
