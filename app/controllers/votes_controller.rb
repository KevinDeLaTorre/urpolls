class VotesController < ApplicationController
  before_action :set_user

  def index
    @votes = @user.votes.includes(:poll_choice, :poll)
  end

  def create
    @vote = @user.votes.build(vote_params)
    if !@vote.save
      flash[:danger] = "You already voted for this poll"
      redirect_to poll_path(@vote.poll_id)
    else
      redirect_to user_votes_path(@user)
    end
  end

  def destroy
  end

  private

  def vote_params
    params.permit(:user_id, :poll_choice_id, :poll_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
