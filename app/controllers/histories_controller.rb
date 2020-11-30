class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]
  
  def index
    @histories = History.all
  end
  
  def search
    @histories = History.search(params)
  end

  def show
    @question = Question.new
  end

  def new
    @history = History.new
  end
  
  def create
    @history = History.new(history_params)
    if @history.save
      redirect_to root_path, notice: '登録に成功しました!'
    else
      flash[:alert] = '作成に失敗しました。再度やり直して下さい'
      render :new
    end
  end

  def edit
  end
  
  def update
    if @history.update(history_params)
      redirect_to root_path, notice: '編集しました!'
    else
      flash[:alert] = '編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @history.destroy
    redirect_to root_path, notice: '削除しました!'
  end
  
  private
    def set_history
      @history = History.find(params[:id])
    end
  
    def history_params
      params.require(:history).permit(:payee, :treasurer, :content, :received_day, :return_day, :title, :description, :price, :category, :status)
    end
end
