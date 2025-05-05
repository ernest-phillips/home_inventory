# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_residence, only: [:index, :show, :create]

      def index
        items = residence.items
        render json: items
      end

      def show
        residence = current_user.residences.find(params[:residence_id])
        item = residence.items.find(params[:id])
        render json: item
      end

      def create
        item = residence.items.new(item_params)
        if item.save
          render json: item, status: :created
        else
          render json: item.errors, status: :unprocessable_entity
        end
      end

      private

      def set_residence
        @residence = current_user.residences.find(params[:residence_id])
      end

      def item_params
        params.require(:item).permit(:name, :description, :value)
      end
    end
  end
end
