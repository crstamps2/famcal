# frozen_string_literal: true

class API::KeysController < ApplicationController
  before_action :set_key, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  # GET /keys
  # GET /keys.json
  def index
    @keys = Key.all
    render json: @keys
  end

  def save_keys
    mom_api_key = saved_keys_params[:momAPIKey]
    dad_api_key = saved_keys_params[:dadAPIKey]
    @key_1 = Key.new(mom_api_key)
    @key_2 = Key.new(dad_api_key)
    if @key_1.save && @key_2.save
      render json: [@key_1, @key_2], status: :created
    else
      render json: [@key_1.errors, @key_2.errors], status: :unprocessable_entity
    end
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

  def saved_keys_params
    params.require(:keys).permit(:momAPIKey => [:name, :value], :dadAPIKey => [:name, :value])
  end
end
