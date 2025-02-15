class Movies::ViewingPartiesController < ApplicationController
  def new
    if current_user
      @movie = MovieFacade.new(params[:movie_id]).find_movie
      @user = current_user
    else
      flash[:alert] = 'You must be logged in to create a viewing party.'
      redirect_to movie_path(params[:movie_id])
    end
  end

  def create
    host = current_user
    party = Party.new(party_params)
    if party.save
      Partygoer.create(user: host, party_id: party.id, host: true)
      params[:user].each do |user_id|
        Partygoer.create(user_id: user_id, party_id: party.id, host: false)
      end
      redirect_to dashboard_path
      flash[:notice] = 'Your party has been created!'
    else
      flash[:alert] = 'Please fill in all fields.'
      redirect_to new_movie_viewing_party_path(party_params[:movie_id])
    end
  end

  private
  def party_params
    params.permit(:movie_id, :duration, :date, :start_time)
  end
end
