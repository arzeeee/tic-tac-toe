class PagesController < ApplicationController
  before_action :validate_name, except: [:home, :reset]

  def home
    @p1 = session[:player1] || 'p1'
    @p2 = session[:player2] || 'p2'
  end

  def player1
    if params[:player1][:name] !=  session[:player2]
      session[:player1] = params[:player1][:name]
    end
    redirect_to root_path
  end

  def player2
    if params[:player2][:name] !=  session[:player1]
      session[:player2] = params[:player2][:name]
    end
    redirect_to root_path
  end
  
  def reset
    session[:player1] = nil
    session[:player2] = nil
    redirect_to root_path
  end

  private

  def validate_name
    name = params[:player1].nil? ? params[:player2][:name] : params[:player1][:name]
    if name.match(/\A[a-zA-Z0-9]*\z/).nil? || name.length > 15
      return redirect_to root_path
    end
  end
end