class MatchesController < ApplicationController
    def home
        @match = Match.last
    end

    def new
        @match = Match.new
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
        # @match = Match.find(params[:id])
        @match = Match.find_by id: params[:id]
    end

    def update
        @match = Match.find(params[:id])
        # @match = Match.find_by id: params[:id]
    
        if @match.update(match_full_params)
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
      end

    private
    def match_params
        params.require(:match).permit(:first_team_name, :second_team_name)
    end

    private
    def match_full_params
        params.permit(:first_team_name, :second_team_name, :first_team_result, :second_team_result, :minutes, :player)
    end

  end