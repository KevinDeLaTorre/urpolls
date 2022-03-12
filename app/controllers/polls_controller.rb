class PollsController < ApplicationController
  before_action :set_poll, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_minimum_choices, only: [:create, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  NUM_MINIMUM_CHOICES = 2.freeze

  # GET /polls or /polls.json
  def index
    @polls = Poll.includes([:poll_choices, :user]).all.paginate(page: params[:page], per_page: DEFAULTITEMSPERPAGE)
  end

  # GET /polls/1 or /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls or /polls.json
  def create
    @poll = Poll.new(poll_params.except(:choices))

    respond_to do |format|
      if @poll.save
        params[:poll][:choices].each do |choice|
          @poll.poll_choices.create(content: choice)
        end
        format.html { redirect_to poll_url(@poll), notice: "Poll was successfully created." }
        format.json { render :show, status: :created, location: @poll }
      else
        flash[:danger] = "Poll was not created successfully"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1 or /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to poll_url(@poll), success: "Poll was successfully updated." }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1 or /polls/1.json
  def destroy
    @poll.destroy

    respond_to do |format|
      format.html { redirect_to polls_url, notice: "Poll was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_poll
    @poll = Poll.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def poll_params
    params.require(:poll).permit(:user_id, :title, choices: [])
  end

  def correct_user
    if @poll.user_id != current_user.id
      flash[:info] = "Unable to access because you are not signed in as the owner/admin"
      redirect_to @poll
    end
  end

  def check_minimum_choices
    if params[:poll][:choices].nil? or params[:poll][:choices].size < NUM_MINIMUM_CHOICES 
      flash[:danger] = "At least 2 poll choices are required"
      if params[:id].nil?
        redirect_to new_poll_path
      else
        redirect_to edit_poll_path
      end
    end
  end
end
