require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'about--no'" do
    it "returns http success" do
      get 'about--no'
      response.should be_success
    end
  end

  describe "GET 'test'" do
    it "returns http success" do
      get 'test'
      response.should be_success
    end
  end

  describe "GET 'framework'" do
    it "returns http success" do
      get 'framework'
      response.should be_success
    end
  end

end
