class PagesController < ApplicationController
  def index
    if params[:order_by]
      @films = Film.paginate(page: params[:page], per_page: 20).order(params[:order_by] + ' DESC')
    else
      @films = Film.paginate(page: params[:page], per_page: 20)
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to pages_path
  end
end
