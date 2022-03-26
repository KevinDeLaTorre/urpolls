class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @votes = @user.votes.includes(poll: [:poll_choices, :user ]).paginate(page: params[:page], per_page: DEFAULTITEMSPERPAGE)
  end
end
