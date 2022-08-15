class VouchersController < ApplicationController
    def index
        vouchers = Voucher.all 
        render json: VoucherSerializer.new(vouchers).serializable_hash.to_json
    end
    def show
        voucher = Voucher.find(params[:id])
        render json: VoucherSerializer.new(voucher).serializable_hash.to_json
    end
    
    def update
        voucher = Voucher.find(params[:id])
        voucher.update voucher_params
        render json: VoucherSerializer.new(voucher).serializable_hash.to_json
    end
    
    def destroy
        Voucher.find(params[:id]).destroy
        render json: {message: 'OK' }.to_json, status: 200
     end

     private

    def voucher_params
        params.permit(
            :name, 
            :description
            :image
            :amount
            :amount_use
            :capped_amount
            :min_purchase 

        )
    end
end
