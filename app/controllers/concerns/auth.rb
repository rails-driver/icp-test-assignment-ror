module Auth
  extend ActiveSupport::Concern
  NotAuthorized = Class.new(StandardError)
  included do
    before_action :authenticate
    before_action :set_new_token, if: :token
    rescue_from NotAuthorized, with: :not_authorized
  end

  private

  def authenticate
    token ? decode : raise(NotAuthorized, 'Token not present')
  end

  def token
    @token ||= begin
      header = request.env['HTTP_AUTHORIZATION']
      header.scan(/Bearer (.*)$/).flatten.last if header
    end
  end

  def decode
    JWTTokenService.decode(token)
  rescue JWT::VerificationError
    raise NotAuthorized, 'Invalid token'
  rescue JWT::ExpiredSignature
    raise NotAuthorized, 'Expired token'
  end

  def set_new_token
    response.headers['Token'] = new_token
  end

  def new_token
    JWTTokenService.encode(exp: TOKEN_EXPIRE.from_now.to_i)
  end

  def not_authorized(exception)
    render json: {
      error: exception.message
    }, status: 401
  end
end
