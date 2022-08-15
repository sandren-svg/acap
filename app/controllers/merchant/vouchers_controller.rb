class Merchant::VouchersController < ApplicationController
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

     def create 
        credit = Voucher.new voucher_params
        if credit.save     
            render json: VoucherSerializer.new(credit).serializable_hash.to_json
        else
            render json: { error: voucher.errors.full_messages.first }, status: 400
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
