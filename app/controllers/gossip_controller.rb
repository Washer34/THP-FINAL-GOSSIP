class GossipController < ApplicationController
  before_action :authenticate_user, only: [:new]

  def pouce
    @current_gossip = Gossip.find(params[:id])
    Pouce.create(user_id: current_user.id, gossip_id: @current_gossip.id)
    redirect_to gossip_path(@current_gossip)
  end

  def dispouce
    @current_gossip = Gossip.find(params[:id])
    @current_pouce = Pouce.where(user_id: current_user.id, gossip_id: @current_gossip.id)
    @current_pouce.first.destroy
    redirect_to gossip_path(@current_gossip)
  end

  def index
    @all_gossips = Gossip.all
    @all_users = User.all
  end

  def new
    @gossip = Gossip.new
  end
  
  def create
    @gossip = Gossip.new('user_id' => current_user.id,
                   'title' => params[:title],
                   'content' => params[:content])
    if params[:tag_ids].present?
      params[:tag_ids].each do |tag_id|
        @gossip.intertags.build(tag_id: tag_id)
      end
    end
    if @gossip.save
      redirect_to root_path(post_success: true)
    else
      render :new
    end
  end

  def edit

    @current_gossip = Gossip.find(params[:id].to_i)

  end

  def show
    @current_gossip = Gossip.find(params[:id].to_i)
  end

  def update

    @current_gossip = Gossip.find(params[:id].to_i)

    gossip_params = params.require(:gossip).permit(:title, :content)

  if !logged_in?
    redirect_to root_path(connection_failed: true) 
  elsif @current_gossip.user.id == current_user.id
      @current_gossip.update(gossip_params)
      redirect_to gossip_path(@current_gossip)
  else
      redirect_to root_path(update_failed: true)
    end

  end

  def destroy

    @current_gossip = Gossip.find(params[:id].to_i)


    if !logged_in?
      redirect_to root_path(connection_failed: true) 
    elsif @current_gossip.user.id == current_user.id
      @current_gossip.destroy
      redirect_to root_path(destroy_success: true)
    else 
      render :show
    end
  end

  end
  

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end