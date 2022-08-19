class MemosController < ApplicationController
  before_action :authenticate_user!

  def index
    @memos = Memo.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to memos_path
    else
      redirect_to memos_path
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    redirect_to memos_path if @memo.destroy
  end

  private

  def memo_params
    params.require(:memo).permit(:name, :contents).merge(user_id: current_user.id)
  end

  
end
