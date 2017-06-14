class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registration_params)

    if @registered_application.save
      flash[:notice] = "Registration completed successfully"
      redirect_to @registered_application
    else
      flash[:notice] = 'There was an error while saving the Registration. Please try again'
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registration_params)

    if @registered_application.save
      flash[:notice] = "Registration updated successfully"
      redirect_to @registered_application
    else
      flash[:notice] = 'There was an error while updating the Registration. Please try again'
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "Registration deleted successfully"
      redirect_to registered_applications_path
    else
      flash[:notice] = 'There was a problem deleting the registration. Please try again'
      render :show
    end
  end


  private
  def registration_params
    params.require(:registered_application).permit(:name, :url)
  end

end
