Espago gem
======

[![Build Status](https://travis-ci.org/pkurek/espago.png?branch=master)](https://travis-ci.org/pkurek/espago)

### Installing Espago gem

    gem install espago

or just add it to your Gemfile if you are running a Rails project

## Configuration

After registering at <http://espago.com> configure your app with the security credentials.

### Global

The most standard way of configuring Espago is to do it globally on the Espago class.

    Espago.app_id = 'your-espago-app-id'
    Espago.app_password = 'your-espago-secret'
    Espago.public_key = 'your-espago-key'

### Sending request

    response = Espago.send_request(:clients, :get)
