class QuestionsController < ApplicationController
  
  def create
    @history = History.find(params[:history_id])
    @question = Question.new
    if @question.update(question_params)
      redirect_to history_path(@history), notice: '作成しました!'
    else
      redirect_to history_path(@history), alert: '作成に失敗しました。再度やり直して下さい'
    end
  end
  
  def edit
    @history = History.find(params[:history_id])
    @question = @history.questions.find(params[:id])
  end
  
  def update
    @history = History.find(params[:history_id])
    @question = @history.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to history_path(@history), notice: '作成しました!'
    else
      flash[:alert] = '作成に失敗しました。再度やり直して下さい!'
      render :edit
    end
  end
  
  def destroy
    @history = History.find(params[:history_id])
    @question = @history.questions.find(params[:id])
    @question.destroy
    redirect_to history_path(@history), notice: '削除しました!'
  end
  
  private
    def question_params
      params.require(:question).permit(:history_id, :name, :title, :content, :status)
    end
    
end
