# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  Link.delete_all
  Rails.application.load_seed

  context "Validating Correct Values=>" do
    link = Link.create!(:in_url => "https://www.google.com/", :accesses => 2, :title => "Google")
    it "checking 2 clicks" do
      expect(link.accesses).to eq(2)
    end

    it "checking title" do
      expect(link.title).to eq('Google')
    end

    it "checking NewUrl" do
      expect(link.display_token).to eq(ENV['BASE_URL'] + Link.last.token)
    end
  end

  context "Validating data restrictions=>" do
    link = Link.create(:in_url => '')
    it 'is not valid without a url' do
      # subject.url = nil
      expect(link).to_not be_valid
    end

    it 'is not valid without a access' do
      # subject.access = nil
      expect(link).to_not be_valid
    end
  end

end
