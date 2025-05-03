module Api
  module V1
    class ResidencesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_residence, only: [:show, :update, :destroy]

      def index
        residences = current_user.residences
        render json: residences
      end

      def show
        render json: @residence
      end

      def create
        residence = current_user.residences.build(residence_params)
        if residence.save
          render json: residence, status: :created
        else
          render json: { errors: residence.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @residence.update(residence_params)
          render json: @residence
        else
          render json: { errors: @residence.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @residence.destroy
        head :no_content
      end

      private

      def set_residence
        @residence = current_user.residences.find(params[:id])
      end

      def residence_params
        params.require(:residence).permit(:name, :address, :city, :state, :zip_code)
      end
    end
  end
end
