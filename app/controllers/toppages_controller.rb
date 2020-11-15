class ToppagesController < ApplicationController
  def index
     if logged_in?
      @quest = current_user.quests.build  # form_with 用
      @quests = current_user.quests.order(id: :desc).page(params[:page])
     end
  end
end
