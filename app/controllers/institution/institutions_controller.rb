class Institution::InstitutionsController < ApplicationController
    before_action :ensure_record_exists, only: [:show, :update, :destroy]

    def index
        institutions = Institution.all 
        render json: InstitutionSerializer.new(institutions).serializable_hash.to_json
    end

    def show
        render json: InstitutionSerializer.new(@record).serializable_hash.to_json
    end

    def update
        @record.update institution_params
        render json: InstitutionSerializer.new(@record).serializable_hash.to_json
    end

    def destroy
        @record.destroy
        render json: {message: 'OK' }.to_json, status: 200
    end

     def create 
     institution = Institution.new institution_params
        if credit.save     
            render json: InstitutionSerializer.new(institution).serializable_hash.to_json
        else
            render json: { error: institution.errors.full_messages.first }, status: 400
        end

     private

    def institution_params
        params.permit(
            :name, 
            :phone_no, 
            :email

        )
    end
    def ensure_record_exists
        @record = Institution.find_by(id: params[:id])
        render json: { error: "Record not found" }, status: 404 unless @record
    end
end
