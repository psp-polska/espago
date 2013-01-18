require "spec_helper"
require "espago/api_connection"
require "json"

class StubbedResponse < Struct.new(:body); end

class Espago::ApiConnection::StubbedPath
  def initialize(connection); end

  def request(params = {})
    StubbedResponse.new("{\"data\":\"returned api data\"}")
  end
end

describe Espago::ApiConnection do

  context "#create" do
    it "should return response body in json format" do
      subject.create(:path, :stubbed).should eq(JSON.parse("{\"data\":\"returned api data\"}"))
    end

    it "should raise an error if path not found" do
      expect { subject.create(:fake, :class) }.to raise_error(Espago::ApiConnection::NoPathError)
    end
  end
end
