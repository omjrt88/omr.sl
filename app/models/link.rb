class Link < ApplicationRecord
  after_create :generate_token #, :scrape

  def generate_token
    self.token = self.id.to_s(36)
    self.save
  end

  def display_token
    ENV['BASE_URL'] + self.token
  end
end