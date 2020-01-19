class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:notice] = '送信ありがとうございました。'
      redirect_to root_path
    else
      flash[:alert] = '入力に不備があります。'
      render :new

    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
