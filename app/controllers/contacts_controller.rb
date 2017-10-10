class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.paginate(:page => params[:page], :per_page => 15)
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    Contact.transaction do
    @contact = Contact.new(contact_params)
      respond_to do |format|
        if @contact.save
          format.html { redirect_to contacts_path, notice: 'Contact was successfully created.' }
          format.json { render :show, status: :created, location: @contact }
        else
          format.html { render :new }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    Contact.transaction do
      respond_to do |format|
        @contact.addresses.delete_all
        @contact.phone_numbers.delete_all
        if @contact.update(contact_params)
          format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :edit }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name,:email,:bdate,:anniv, addresses_attributes: [:country_id,:street, :city, :state,:zipcode],phone_numbers_attributes:[:country_id,:area_code,:fax_number,:alternate_number])
    end
end
