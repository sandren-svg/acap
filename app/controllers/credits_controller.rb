class CreditsController < ApplicationController
    def index
        @credit = Credit.all 
        render json: CreditSerializer.new(@credit).serializable_hash.to_json
    end
    def show
        @credit = Credit.find(params[:id])
        render json: CreditSerializer.new(@credit).serializable_hash.to_json
    end
    
    def update
        @credit = Credit.find(params[:id])
        @credit.update credit_params
        render json: CreditSerializer.new(@credit).serializable_hash.to_json
    end
    def destroy
        Credit.find(params[:id]).destroy
        render json: {message: 'OK' }.to_json, status: 200
     end

     private

    def credit_params
        params.permit(
            :name, 
            :balance

        )
    end
end
