class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  def index
    @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = FormPdf.new(@form)
        send_data pdf.render, filename: "form_#{@form.company_name}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    @form = Form.new
  end

  def edit
  end

  def create
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @form }
      else
        format.html { render action: 'new' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { head no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end

private

    def set_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:company_name,
                                   :tel,
                                   :fax,
                                   :email,
                                   :business_address,
                                   :city,
                                   :state,
                                   :zip_code,
                                   :d_u_n_s,
                                   :tax_id,
                                   :annual_sales,
                                   :number_of_employees,
                                   :exfreight_sales_rep)
    end
end