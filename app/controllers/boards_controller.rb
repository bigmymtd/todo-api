class BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    id = params[:id].presence || 1
    render json: {
        status: true
    }
  end

  def index
    render json: {
        status: 200,
        result: Board.all
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
