class UserStoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    user=current_user
    @stories = user.stories
    @story=Story.new
    @user=current_user.id
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story=Story.new
    @user=current_user.id
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @user=current_user.id
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
  end

  private
end
