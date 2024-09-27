class LeatherColorsController < ApplicationController
  def index
    @leather_colors = LeatherColor.all
  end

  def create
    @leather_color = LeatherColor.new(
      name: params[:name],
      abbreviation: params[:abbreviation],
    )

    if @leather_color.save
      render :show
    else
      render json: { errors: @leather_color.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
