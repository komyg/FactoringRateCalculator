class CustomersController < ApplicationController
  def new
  end

  def create
    # Check if a company with that name exists, if not, create a new one.
    if Company.exists?(name: customer_params[:company_name])
      company = Company.find_by(name: customer_params[:company_name])
    else
      company = Company.new(name: customer_params[:company_name])

      unless company.save
        redirect_to '/signup'
        puts "Error saving company: #{company.errors.messages}"
        return
      end
    end

    user = company.customers.new(name: customer_params[:name], email: customer_params[:email], password: customer_params[:password])
    if user.save
      session[:customer_id] = user.id
      redirect_to '/'
    else
      puts "Error saving user: #{user.error.messages}"
      redirect_to '/signup'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :company_name, :email, :password)
  end
end
