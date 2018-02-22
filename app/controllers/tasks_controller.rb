class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @task = Task.new(name: params[:name], status: 1, board_id: params[:board_id])
    if @task.save
      @board = Board.find_by(id: params[:board_id])
      @board.task_list = @board.task_list.to_s + "#{@board.task_list.present? ? ',' : ''}#{@task.id}"

      if @board.save
        render json: {
          status: 200,
          result: {
            board: @board,
            task: @task
          }
        }
      else
        render json: 500
      end
    else
      render json: 500
    end
  end
end
