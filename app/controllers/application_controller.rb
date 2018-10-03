require 'jwt'


class ApplicationController < ActionController::API

  respond_to :json

  def self.generate_jwt (payload)
    hmac_secret = ENV['JWT_HMAC_SECRET_KEY']
    token = JWT.encode payload, hmac_secret, 'HS256'
  end

  def self.decode_jwt (jwt)
    puts jwt
    hmac_secret = ENV['JWT_HMAC_SECRET_KEY']
    decoded_token = JWT.decode jwt, hmac_secret, true, { algorithm: 'HS256' }
  end


  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end


end

