class HealthCheckController < ApplicationController
    def show
        render json: {"status"=>"OK"}, status: 200
    end
end