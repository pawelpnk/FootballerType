class MatchesController < ApplicationController

    def home
        @match = Match.last
    end

    def new
        @match = Match.new
    end

    def index
      @number_all_matches = Match.all
      @number_archiwum_maches = @number_all_matches.length() - 1
      @matches = Match.all.take(@number_archiwum_maches)
    end

    def create
        @match = Match.new(match_params)
    
        if @match.save
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @match = Match.find_by id: params[:id]
    end

    def update
      @match = Match.find(params[:id])

      @match.update(match_full_params)
      @match.update(show_result: true)

      @point = 0

      @match.page.each do |r|
        if r.first_team.to_i == @match.first_team_result.to_i 
          @match.all_points = @match.all_points + 1
          @point = 1 + @point.to_i
        end
        if r.second_team.to_i == @match.second_team_result.to_i
          @match.all_points = @match.all_points + 1
          @point = 1 + @point.to_i
        end
        if r.player.to_s.downcase == @match.player.to_s.downcase
          @match.all_points = @match.all_points + 1
          @point = 1 + @point.to_i
        end
        if r.minutes.to_i == @match.minutes.to_i
          @match.all_points = @match.all_points + 1
          @point = 1 + @point.to_i
        end
        @match.page.find_by_id(r.id).update(points: @point)
        @user = User.find_by_id(r.user.id)
        @points = @user.rate.to_i + @point.to_i
        @user.update(rate: @points)
        @point = 0
      end

      @type = @match.page.order("points DESC, created_at ASC").first
      @find_user = User.find_by_id(@type.user_id)
      @match.update(best_typer: @find_user.name)
      @match.update(highest_result: @type.points)

      redirect_to root_path          
    end

    def blocked
      @match = Match.last
      @match.update(isActive: false)

      redirect_to root_path
    end

    private
    def match_params
        params.require(:match).permit(:first_team_name, :second_team_name, :user_id)
    end

    private
    def match_full_params
        params.require(:match).permit(:first_team_result, :second_team_result, :minutes, :player)
    end

  end