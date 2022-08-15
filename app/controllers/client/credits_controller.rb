class Client::CreditsController < ApplicationController
    def index
        credits = Credit.all 
        render json: CreditSerializer.new(credits).serializable_hash.to_json
    end
    def show
        credit = Credit.find(params[:id])
        render json: CreditSerializer.new(credit).serializable_hash.to_json
    end
    
    def update
        credit = Credit.find(params[:id])
        credit.update credit_params
        render json: CreditSerializer.new(credit).serializable_hash.to_json
    end

     private

    def credit_params
        params.permit(
            :balance
        )
    end
end
