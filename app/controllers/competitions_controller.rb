class CompetitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition, only: %i[ show edit update destroy ]
  before_action :is_owner?, only: %i[edit destroy]

  # GET /competitions or /competitions.json
  def index
    @competitions = Competition.includes(:prizes)
  end

  # GET /competitions/1 or /competitions/1.json
  def show
  end

  # GET /competitions/new
  def new
    @competition = Competition.new

    # we need tp look for a better place to handle it (maybe a method in the model)
    if current_user.is_free
      3.times { @competition.prizes.build }
    else
      5.times { @competition.prizes.build }
    end
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions or /competitions.json
  def create
    @competition = Competition.new(competition_params)
    @competition.user = current_user

    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: "Competition was successfully created." }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1 or /competitions/1.json
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to @competition, notice: "Competition was successfully updated." }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1 or /competitions/1.json
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: "Competition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # TODO: handle this more properly, maybe with something like Pundit
    def is_owner?
      unless current_user == @competition.user
        redirect_back fallback_location: competitions_path, notice: 'User is not the owner of the competition'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def competition_params
      params.require(:competition).permit(:name, prizes_attributes: [:id, :name, :value])
    end
end
