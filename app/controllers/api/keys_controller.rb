# frozen_string_literal: true

class API::KeysController < ApplicationController
  before_action :set_key, only: %i[show update destroy]

  # GET /keys
  # GET /keys.json
  def index
    @keys = Key.all
    render json: @keys
  end

  # GET /keys/1
  # GET /keys/1.json
  def show 
    render json: @key
  end

  # POST /keys
  # POST /keys.json
  def create
    @key = Key.new(key_params)

    if @key.save
      render json: @key, status: :created, location: api_key_url(@key)
    else
      render json: @key.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /keys/1
  # PATCH/PUT /keys/1.json
  def update
    if @key.update(key_params)
      render json: @key
    else
      render json: @key.errors, status: :unprocessable_entity
    end
  end

  # DELETE /keys/1
  # DELETE /keys/1.json
  def destroy
    @key.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_key
    @key = Key.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def key_params
    params.require(:key).permit(:name, :value)
  end
end
