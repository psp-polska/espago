require 'spec_helper'
require 'espago/client'

class StubbedApiConnection
  def initialize(enviroment); end
  def authenticate(app_id, app_password); end
  def create(path, method, params= {})
    'returned api data'
  end
end

describe Espago::Client do
  subject { Espago::Client.new( app_id: 'App12345', app_password: 'secret', connection: stubbed_api_connection) }
  let(:stubbed_api_connection) { StubbedApiConnection }
  let(:response) { {id: 1, status: "2012"}.to_json }

  it { subject.should respond_to :app_id }
  it { subject.should respond_to :app_password }
  it { subject.should respond_to :public_key }

  context "#send_request" do
    let(:method) { :get }
    let(:path) { :new_client }
    let(:params) { { name: "Jan Kowalski"} }

    it "should create an api request" do
      subject.send_request(path, method, params).should eq('returned api data')
    end

    context "with no credentials" do
      subject { Espago::Client.new }

      it "should raise error" do
        expect { subject.send_request(path, method, params)}.to raise_error(Espago::Client::NotAuthenticated)
      end
    end
  end

  context "#parse_response" do
    subject { Espago::Client.new }
 
    it "should delegate work to parser" do
      Espago::Response.should_receive(:new).with(response)
      subject.parse_response(response)
    end
    
    it "should parse response into object" do
      subject.parse_response(response).class.should eq(Espago::Response)
    end
  end

end
