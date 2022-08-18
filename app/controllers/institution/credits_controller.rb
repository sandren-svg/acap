class Institution::CreditsController < ApplicationController
    before_action :ensure_record_exists, only: [:show, :update, :destroy]

    def index
        credits = Credit.all 
        render json: CreditSerializer.new(credits).serializable_hash.to_json
    end
    def show
        render json: CreditSerializer.new(@record).serializable_hash.to_json
    end

    def update
        @record.update credit_params
        render json: CreditSerializer.new(@record).serializable_hash.to_json
    end

    def destroy
        @record.destroy
        render json: {message: 'OK' }.to_json, status: 200
    end

     def create 
        credit = Credit.new credit_params
        if credit.save     
            render json: CreditSerializer.new(credit).serializable_hash.to_json
        else
            render json: { error: credit.errors.full_messages.first }, status: 400
        end
     end

     private

    def credit_params
        params.permit(
            :name, 
            :balance

        )
    end
    def ensure_record_exists
        @record = Credit.find_by(id: params[:id])
        render json: { error: "Record not found" }, status: 404 unless @record
    end
end
