module Api
  module V1
    class ResidencesController < ApplicationController
      def index
        residences = Residence.all
        render json: residences
      end

      def show
        residence = Residence.find(params[:id])
        render json: residence
      end

      def create
        residence = Residence.new(residence_params)
        if residence.save
          render json: residence, status: :created
        else
          render json: residence.errors, status: :unprocessable_entity
        end
      end

      private

      def residence_params
        params.require(:residence).permit(:name, :address, :city, :state, :zip_code)
      end
    end
  end
end
