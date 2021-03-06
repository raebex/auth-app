class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render "show.json.jb"
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      render "show.json.jb"
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end
end
