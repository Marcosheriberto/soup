class FindIdentityService
  attr_reader :auth

  def initialize(auth)
    @auth = auth
    self
  end

  def perform
    hash = identity_params(auth)
    Identity.find_or_create_by(provider: hash[:provider], uid: hash[:uid])
  end

  private

  def identity_params(auth)
    auth.slice(:provider, :uid)
  end

  class << self
    def perform(auth)
      self.new(auth).perform
    end
  end
end
