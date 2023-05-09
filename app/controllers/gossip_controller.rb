class GossipController < ApplicationController

  def index
    @all_gossips = Gossip.all
    @all_users = User.all
  end

  def new
    @gossip = Gossip.new
  end
  
  def create
    @gossip = Gossip.new('user_id' => User.all.sample.id,
                   'title' => params[:title],
                   'content' => params[:content])
    if @gossip.save
      redirect_to root_path(success: true)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @current_gossip = Gossip.find(params[:id].to_i)
  end

  def update
  end

  def destroy
  end
end
