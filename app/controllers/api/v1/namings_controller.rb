module Api::V1
  class NamingsController < ApplicationController
    before_action :set_naming, only: [:show, :update, :destroy]
    before_action :validate_params

    # GET /namings
    def index
      @name =  Naming.find_by(name: params[:name])
      if @name
        render json: @name.code
      end
    end

    # GET /namings/1
    def show

    end

    # POST /namings
    def create
      @naming = Naming.new(naming_params)

      if @naming.save
        render json: @naming, status: :created, location: @naming
      else
        render json: @naming.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /namings/1
    def update
      if @naming.update(naming_params)
        render json: @naming
      else
        render json: @naming.errors, status: :unprocessable_entity
      end
    end

    # DELETE /namings/1
    def destroy
      @naming.destroy
    end


    rescue_from(ActionController::UnpermittedParameters) do |pme|
       render json: { error:  { unknown_parameters: pme.params } },
                  status: :bad_request
     end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_naming
        @naming = Naming.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def naming_params
        params.require(:naming).permit(:name, :code)
      end
      def validate_params
        name =  Naming.find_by(name: params[:name])
        if !name
          render json: { error: "unknown parameters" } and return
        end
      end
  end
end
