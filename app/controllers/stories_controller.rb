class StoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.limit(5).order('rank IS NULL, rank desc')
    @story=Story.new
    if user_signed_in?
      @user = current_user.id
    end
    @sentence=Sentence.new
    if params[:search]
      @stories = Story.search(params[:search]).order("created_at DESC")
    else
      @recipes = Story.limit(5).order('rank IS NULL, rank desc')
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @confirmed=@story.sentences.where(:confirmed => true).order('created_at')
    @unconfirmed = @story.sentences.where(:confirmed => nil).order('created_at')
  end

  # GET /stories/new
  def new
    @story = Story.new
    @user = current_user.id
  end

  # GET /stories/1/edit
  def edit
    @user = current_user.id
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to story_description_path(@story), notice: 'Book was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to story_starter_path(@story), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def description
    @story=Story.find(params[:story_id])
    @user=current_user.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:name, :description, :user_id)
    end
end
