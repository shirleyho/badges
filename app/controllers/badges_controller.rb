class BadgesController < ApplicationController
  before_filter :requires_admin_access, except: :index

  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  # GET /badges
  # GET /badges.json
  def index
    @badges = Badge.all
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
  end

  # GET /badges/new
  def new
    @badge = Badge.new
    @badge.build_artwork
  end

  # GET /badges/1/edit
  def edit
  end

  # POST /badges
  # POST /badges.json
  def create
    @badge = Badge.new(badge_params)

    respond_to do |format|
      if @badge.save
        format.html { redirect_to @badge, notice: 'Badge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @badge }
      else
        format.html { render action: 'new' }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to @badge, notice: 'Badge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    @badge.destroy
    respond_to do |format|
      format.html { redirect_to badges_url }
      format.json { head :no_content }
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params[:badge].permit(:artwork_attributes, :name, :description, :restriction)
  end
end
