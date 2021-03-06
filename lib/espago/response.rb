require "json"
require "time"

module Espago
  class Response
    attr_reader :body
 
    def initialize(response)
      @body = parse(response)
    end
 
    def response_id
      body["id"]
    end
 
    def description
      body["description"]
    end
 
    def amount
      body["amount"]
    end
 
    def currency
      body["currency"]
    end
 
    def state
      body["state"]
    end
 
    def client
      body["client"]
    end

    def created_at
      body["client"]
    end

    def card
      body["card"] || {}
    end

    def created_at
      Time.parse body["created_at"]
    end
 
    private
 
    def parse(body)
      JSON.parse body
    end
  end  
end
 