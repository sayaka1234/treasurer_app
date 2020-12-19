class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]
  
  def index
    @histories = History.all
    @total_income = History.where(status: History.statuses[:income]).sum(:price)
    @total_outcome = History.where(status: History.statuses[:outcome]).sum(:price)
    @total_price = @total_income - @total_outcome
  end
  
  def search
    @histories = params[:search].nil? ? History.search(history_params) : History.search(history_search_params)
  end

  def show
    @question = Question.new
  end

  def new
    @history = History.new
  end
  
  def create
    @history = History.new(history_create_params)
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
    if @history.update(history_create_params)
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
      params.permit(:payee, :treasurer, :title, :description, :price, :category, :status, :start_received_day, :finish_received_day, :start_return_day, :finish_return_day, :image)
    end
  
    def history_search_params
      params.require(:search).permit(:payee, :treasurer, :title, :description, :price, :category, :status, :start_received_day, :finish_received_day, :start_return_day, :finish_return_day, :image)
    end
    
    def history_create_params
      params.require(:history).permit(:payee, :treasurer, :received_day, :return_day, :title, :description, :price, :category, :status, :image)
    end

end
