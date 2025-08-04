# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_residence
      before_action :set_item, only: [:show, :update, :destroy]

      def index
        items = @residence.items
        render json: items
      end

      def show
        render json: @item
      end

      def create
        item = @residence.items.new(item_params)
        if item.save
          render json: item, status: :created
        else
          render json: item.errors, status: :unprocessable_entity
        end
      end

      private

      def set_residence
        @residence = current_user.residences.find(params[:residence_id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Residence not found' }, status: :not_found
      end

      def set_item
        @item = @residence.items.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Item not found' }, status: :not_found
      end

      def item_params
        params.require(:item).permit(:name, :description, :value, :price, :quantity, :location, :condition, :category)
      end
    end
  end
end
