class Institution::MerchantsController < ApplicationController
    def index
        merchant_accounts = Merchant.all 
        render json: MerchantSerializer.new(merchant_accounts).serializable_hash.to_json
    end
    def show
        merchant_account = Merchant.find(params[:id])
        render json: MerchantSerializer.new(merchant_account).serializable_hash.to_json
    end
    
    def update
        merchant_account = Merchant.find(params[:id])
        merchant_account.update merchant_params
        render json: MerchantSerializer.new(merchant_account).serializable_hash.to_json
    end
    
    def destroy
        Merchant.find(params[:id]).destroy
        render json: {message: 'OK' }.to_json, status: 200
     end

     def create 
        merchant = Merchant.new merchant_params
        if credit.save     
            render json: MerchantSerializer.new(merchant).serializable_hash.to_json
        else
            render json: { error: merchant.errors.full_messages.first }, status: 400
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
end
