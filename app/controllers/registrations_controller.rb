class RegistrationsController < ApplicationController
  respond_to :json

  def create
    build_resource(register_params)

    resource.save
    render_resource(resource)
  end

end
