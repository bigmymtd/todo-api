class BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @board = Board.find_by(id: params[:id])
    tasks = @board.task_list.split.map { |task_id| Task.find_by(id: task_id) }
    render json: {
      status: 200,
      result: {
        board_name: @board.board_name,
        board_id: @board.id,
        tasks: tasks
      }
    }
  end

  def index
    boards = Board.all
    @boards = boards.map do |board|
      task_list = board.task_list.presence || ''
      {
        board_name: board.board_name,
        board_id: board.id,
        tasks: task_list.split(',').map { |task_id| Task.find_by(id: task_id) }
      }
    end
    render json: {
      status: 200,
      result: @boards
    }
  end

  def create
    @board = Board.new(board_name: params[:name])
    if @board.save
      render json: {
        status: 200,
        result: @board
      }
    else
      render json: 500
    end
  end
end
