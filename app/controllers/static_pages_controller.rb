class StaticPagesController < ApplicationController

  def home 
    if user_signed_in?
      @polls = current_user.polls.includes(:poll_choices, :user).paginate(page: params[:page], per_page: DEFAULTITEMSPERPAGE)
    else
      @polls = Poll.includes(:poll_choices, :user).all.paginate(page: params[:page], per_page: DEFAULTITEMSPERPAGE)
    end
  end
end
