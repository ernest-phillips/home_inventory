# frozen_string_literal: true

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
        residence = current_user.residences.new(residence_params)
        if residence.save
          render json: residence, status: :created
        else
          render json: residence.errors, status: :unprocessable_entity
        end
      end

      private

      def set_residence
        @residence = current_user.residences.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Residence not found' }, status: :not_found
      end

      def residence_params
        params.require(:residence).permit(:name, :address, :city, :state, :zip_code)
      end
    end
  end
end
