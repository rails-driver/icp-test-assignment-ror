module Auth
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    # raise NotImplementedError
  end
end
