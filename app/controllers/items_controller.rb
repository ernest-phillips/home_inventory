# frozen_string_literal: true

# Controller for Items

class ItemsController < ApplicationController # rubocop:todo Style/Documentation
  before_action :authenticate_user!
  before_action :set_item, only: %i[show edit update destroy]
  def index; end

  def show; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
