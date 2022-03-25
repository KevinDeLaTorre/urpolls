class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @votes = @user.votes.includes([:poll_choice, poll: :poll_choices ]).paginate(page: params[:page], per_page: DEFAULTITEMSPERPAGE)
  end
end
