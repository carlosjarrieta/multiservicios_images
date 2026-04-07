class EgresosController < ApplicationController
  def index
    render json: Egreso.all
  end

  def create
    @egreso = Egreso.new(egreso_params)

    if @egreso.save
      result = { result: :created, egreso: @egreso }
      render json: result
    else
      render json: @egreso.errors, status: :unprocessable_entity
    end
  end

  private

  def egreso_params
    params.permit(:image)
  end
end
