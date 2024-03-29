class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    @members = Member.all
    render json: @members
  end
  
  def birthday
    require 'active_support/core_ext'
    @date = Date.today + 7.hours
    @members = Member.where("extract(month from birthday) = ?", @date.strftime('%m'))
    render json: @members
  end
  # GET /members/1
  def show
    render json: @Member 
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.permit(:name, :team, :birthday, :gen, :score)
    end
end
