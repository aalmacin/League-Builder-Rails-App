class PlayersController < ApplicationController
  before_filter :check_if_logged_in
  def index
    @players = Player.order('rating DESC')

    respond_to do |format|
      format.html
      format.json { render json => @players }
    end
  end

  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json => @player }
    end
  end

  def new
    @player = Player.new

    respond_to do |format|
      format.html
      format.json { render json => @player }
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice => 'Player was successfully created.' }
        format.json { render json => @player, status => :created, location => @player }
      else
        format.html { render action => "new" }
        format.json { render json => @player.errors, status => :unprocessable_entity }
      end
    end
  end

  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice => 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action => "edit" }
        format.json { render json => @player.errors, status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

end
