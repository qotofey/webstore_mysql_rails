# frozen_string_literal: true

class UserRolesController < ApplicationController
  before_action :set_user_role, only: %i[show edit update destroy]

  def index
    @user_roles = UserRole.all
  end

  def show; end

  def new
    @user_role = UserRole.new
  end

  def edit; end

  def create
    @user_role = UserRole.new(user_role_params)

    if @user_role.save
      redirect_to @user_role, notice: 'User role was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user_role.update(user_role_params)
      redirect_to @user_role, notice: 'User role was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user_role.destroy
    redirect_to user_roles_url, notice: 'User role was successfully destroyed.'
  end

  private

  def set_user_role
    @user_role = UserRole.find(params[:id])
  end

  def user_role_params
    params.require(:user_role).permit(:position, :user_id)
  end
end
