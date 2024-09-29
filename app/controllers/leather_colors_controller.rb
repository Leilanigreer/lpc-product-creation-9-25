class LeatherColorsController < ApplicationController
  def index
    @leather_colors = LeatherColor.all
  end

  def create
    @leather_color = LeatherColor.new(leather_color_params)

    if @leather_color.save
      render json: @leather_color, status: :created
    else
      Rails.logger.error("LeatherColor errors: #{@leather_color.errors.full_messages}")
      render json: { errors: @leather_color.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def leather_color_params
    params.require(:leather_color).permit(:color, :image_url)
  end
end
