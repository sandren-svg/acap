class Institution::InstitutionsController < ApplicationController
    def index
        institutions = Institution.all 
        render json: InstitutionSerializer.new(institutions).serializable_hash.to_json
    end
    def show
        institution = Institution.find(params[:id])
        render json: InstitutionSerializer.new(institution).serializable_hash.to_json
    end
    
    def update
        institution = Institution.find(params[:id])
        institution.update institution_params
        render json: InstitutionSerializer.new(institution).serializable_hash.to_json
    end

    def destroy
        Institution.find(params[:id]).destroy
        render json: {message: 'OK' }.to_json, status: 200
     end

     def create 
     institution = Intitution.new cinstitution_params
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
end
