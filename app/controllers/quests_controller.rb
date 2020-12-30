class QuestsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @flag = false
  end  
  
  def create
     @quest = current_user.quests.build(quest_params)
    if @quest.save
      flash[:success] = 'クエストを登録しました。'
      redirect_to root_url
    else
      @quests = current_user.quests.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'クエストの登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
      @quest.destroy
      flash[:success] = 'クエストを削除しました。'
      redirect_back(fallback_location: root_path)
  end
  
   private

  def quest_params
    params.require(:quest).permit(:content)
  end
  
   def correct_user
    @quest = current_user.quests.find_by(id: params[:id])
    unless @quest
      redirect_to root_url
    end
   end  
end
