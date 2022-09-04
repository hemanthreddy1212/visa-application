class VisaFormsController < ApplicationController
  # GET /visa_forms or /visa_forms.json
  def index
    @visa_forms = VisaForm.all
  end

  # GET /visa_forms/new
  def new
    @visa_form = VisaForm.new
    @visa_form.build_user
  end

  # POST /visa_forms or /visa_forms.json
  def create
    @visa_form = VisaForm.new(visa_form_params.except(:stay_period, :applying_from))
    @visa_form.stay_period = visa_form_params[:stay_period].to_i
    @visa_form.applying_from = visa_form_params[:applying_from].to_i
    @visa_form.user.relation_ship_status = params[:visa_form][:user_attributes][:relation_ship_status].to_i

    respond_to do |format|
      if @visa_form.save
        format.html { redirect_to visa_forms_path, notice: "Visa detail was successfully created." }
        format.json { render :show, status: :created, location: @visa_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visa_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def visa_form_params
    params.require(:visa_form).permit(
      :applying_from, :visit_start_date, :visit_end_date,
      :is_more_than_one_occasion, :types_of_occasion,
      :extend_date, :extend_date_description,
      :image, :stay_period,
      user_attributes: [:family_name, :gender, :given_names, :date_of_birth, :passport_number,
        :country_of_passport, :passport_nationality, :date_of_issue, :date_of_expired,
        :issueing_authority, :birth_city, :birth_country, :birth_state]
    )
  end
end
