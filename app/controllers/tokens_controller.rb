class TokensController < ApplicationController
  skip_before_action :authenticate

  def create
    render json: {
      token: new_token
    }
  end
end
