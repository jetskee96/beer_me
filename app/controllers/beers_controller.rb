class BeersController < ApplicationController
  before_action :find_beer, only: [:show, :edit, :update, :destroy, :votes] 
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @beers = Beer.paginate(:page => params[:page], :per_page => 2).find_with_reputation(:votes, :all, order: "votes desc")

  end
  
  def show
    @beers = Beer.all.order("created_at DESC")
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @beer = Beer.find(params[:id])
    @beer.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "thanks for the vote"
  end
  
  
  def new 
    @beer = current_user.beers.build
  end

  
  def create
    @beer = current_user.beers.build(beer_params)
    
    if @beer.save
      redirect_to @beer, notice: "Cheers"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @beer.update(beer_params)
      redirect_to @beer, notice: "Beer was updated, cheers."
    else 
      render 'edit'
    end
  end
  
  def destroy
    @beer.destroy 
    redirect_to root_path
  end
    
  
  private
  
  def beer_params
    params.require(:beer).permit(:title, :content, :image)
  end
  
  def find_beer
    @beer = Beer.find(params[:id])
  end

end
