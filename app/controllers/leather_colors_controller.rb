class LeatherColorsController < ApplicationController
  def index
    @leather_colors = LeatherColor.all
  end
end
