class Institution::MerchantsController < ApplicationController
    before_action :ensure_record_exists, only: [:show, :update, :destroy]

    def index
        merchants = Merchant.all
        render json: MerchantSerializer.new(merchants).serializable_hash.to_json
    end

    def show
        render json: MerchantSerializer.new(@record).serializable_hash.to_json
    end

    def update
        @record.update merchant_params
        render json: MerchantSerializer.new(@record).serializable_hash.to_json
    end

    def destroy
        @record.destroy
        render json: {message: 'OK' }.to_json, status: 200
    end

    def create
        merchant = Merchant.new merchant_params
        if merchant.save
            render json: MerchantSerializer.new(merchant).serializable_hash.to_json
        else
            render json: { errors: merchant.errors.full_messages }, status: 400
        end
    end

    private

    def merchant_params
        params.permit(
            :name,
            :phone_no,
            :reg_no,
            :email
        )
    end

    def ensure_record_exists
        @record = Merchant.find_by(id: params[:id])
        render json: { error: "Record not found" }, status: 404 unless @record
    end
end