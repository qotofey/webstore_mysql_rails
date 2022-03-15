# frozen_string_literal: true

class CategoryFieldsController < ApplicationController
  before_action :set_category_field, only: %i[show edit update destroy]

  def show; end

  def new
    @category_field = CategoryField.new
  end

  def edit; end

  def create
    @category_field = CategoryField.new(category_field_params)

    if @category_field.save
      redirect_to @category_field, notice: 'Category field was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category_field.update(category_field_params)
      redirect_to @category_field, notice: 'Category field was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category_field.destroy
    redirect_to category_fields_url, notice: 'Category field was successfully destroyed.'
  end

  private

  def set_category_field
    @category_field = CategoryField.find(params[:id])
  end

  def category_field_params
    params.require(:category_field).permit(:name, :value, :type)
  end
end
