class MerchantsController < ApplicationController
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
