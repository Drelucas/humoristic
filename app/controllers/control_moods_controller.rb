class ControlMoodsController < ApplicationController
  before_action :set_control_mood, only: [:show, :edit, :update, :destroy]

  # GET /control_moods
  # GET /control_moods.json
  def index
    #@control_moods = ControlMood.all
    @control_moods ||= ControlMood.all
    @control_moods = make_paginate(@control_moods)
  end

  # GET /control_moods/1
  # GET /control_moods/1.json
  def show
  end

  # GET /control_moods/new
  def new
    @control_mood = ControlMood.new
  end

  # GET /control_moods/1/edit
  def edit
  end

  # POST /control_moods
  # POST /control_moods.json
  def create
    @control_mood = ControlMood.new(control_mood_params)
    @control_mood.user_id = current_user.id

    respond_to do |format|
      if @control_mood.save
        format.html { redirect_to @control_mood, notice: 'Control mood was successfully created.' }
        format.json { render :show, status: :created, location: @control_mood }
      else
        format.html { render :new }
        format.json { render json: @control_mood.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @control_mood = ::ControlMood::FinderService.find(search_params)
    @control_mood = make_paginate(@control_mood)
    render action: 'index'
  end

  # PATCH/PUT /control_moods/1
  # PATCH/PUT /control_moods/1.json
  def update
    respond_to do |format|
      if @control_mood.update(control_mood_params)
        format.html { redirect_to @control_mood, notice: 'Control mood was successfully updated.' }
        format.json { render :show, status: :ok, location: @control_mood }
      else
        format.html { render :edit }
        format.json { render json: @control_mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_moods/1
  # DELETE /control_moods/1.json
  def destroy
    @control_mood.destroy
    respond_to do |format|
      format.html { redirect_to control_moods_url, notice: 'Control mood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_control_mood
    @control_mood = ControlMood.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def control_mood_params
    params.require(:control_mood).permit(:mood_id, :work, :user_id)
  end

  def search_params
    params.require(:search).permit(:type, :text)
  end
end
