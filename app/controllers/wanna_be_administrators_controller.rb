class WannaBeAdministratorsController < ApplicationController

  def send_admin_request
    @id = params[:id].to_i
    @requests = WannaBeAdministrator.where(requestor_id: @id)
    if @requests.empty?
      @request = WannaBeAdministrator.create(requestor_id: params[:id])
    end
    redirect_to user_path(@id)
  end

  def process_request
    @request = WannaBeAdministrator.find(params[:id])
    if params[:status] == "accepted"
        @request.update(status: "accepted")
        @usuario = User.find(@request.requestor_id)
        @usuario.administrador = true
        @usuario.save
    else
        @request.update(status: "declined")
    end
    redirect_to users_path()
  end

  def stop_being
    @id = params[:id].to_i
    @user = User.find(@id)
    @user.administrador = false
    @user.save
    redirect_to user_path(@id)
  end
end
