class BoardsController < ApplicationController
  def show
    id = params[:id].presence || 1
    render json: {
        status: true
    }
  end

  def index
    render json: {
        status: 200,
        result: ['aa', 'bb']
    }
  end

  def creat
    render json: {
        status: true
    }
  end
end
