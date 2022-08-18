class Merchant::CreditsController < ApplicationController
    before_action :ensure_record_exists, only: [:show, :update]

    def index
        credits = Credit.all
        render json: CreditSerializer.new(credits).serializable_hash.to_json
    end

    def show
        credit = Credit.find(params[:id])
        render json: CreditSerializer.new(credit).serializable_hash.to_json
    end

    def update
        @record.update credit_params
        render json: CreditSerializer.new(@record).serializable_hash.to_json
    end

    private

    def credit_params
        params.permit(
            :balance
        )
    end
    def ensure_record_exists
        @record = Credit.find_by(id: params[:id])
        render json: { error: "Record not found" }, status: 404 unless @record
    end
end
