class PagesController < ApplicationController
  def create
    @match = Match.last
    @comment = @match.page.create(pages_params)
    redirect_to root_path
  end

  def index
    @match = Match.find(params[:match_id])
  end

  private
    def pages_params
      params.require(:page).permit(:first_team, :second_team, :player, :minutes, :comment, :user_id)
    end
end
