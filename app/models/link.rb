class Link < ApplicationRecord
  validates_presence_of :in_url, :accesses
  after_create :generate_token #, :scrape

  MAX_RETRIES = 3
  INITIAL_POSITION = 8
  @lastPosition = 12

  def generate_token
    lastPos = self.class.lastPosition
    self.token = Digest::SHA2.hexdigest(self.id.to_s)[INITIAL_POSITION..lastPos]
    self.save
  rescue ActiveRecord::RecordNotUnique => e
    @token_attempts += 1
    retry if max_entries?
    @lastPosition += 1
    @token_attempts = 0
    retry
  end

  def display_token
    ENV['BASE_URL'] + self.token
  end

  private
  def self.lastPosition
    @lastPosition
  end

  def max_entries?
    @token_attempts < MAX_RETRIES
  end
end