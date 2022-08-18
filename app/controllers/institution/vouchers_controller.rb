class Institution::VouchersController < ApplicationController
    before_action :ensure_record_exists, only: [:show, :update, :destroy]
    
    def index
        vouchers = Voucher.all 
        render json: VoucherSerializer.new(vouchers).serializable_hash.to_json
    end

    def show
        render json: VoucherSerializer.new(@record).serializable_hash.to_json
    end

    def update
        @record.update voucher_params
        render json: VoucherSerializer.new(@record).serializable_hash.to_json
    end

    def destroy
        @record.destroy
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
    def ensure_record_exists
        @record = Voucher.find_by(id: params[:id])
        render json: { error: "Record not found" }, status: 404 unless @record
    end
end
