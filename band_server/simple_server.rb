#### This simple example server should run on JRuby, while the client can be run
### either on Ruby or JRuby


require 'sinatra/base'
require 'ruby-band'
require 'JSON'

class Trial < Sinatra::Base
  use Rack::Session::Pool

  get '/datasets' do
    session[:datasets].keys.join(",\t")
  end
  get '/classifiers' do
    session[:classifiers].keys.join(",\t")
  end

  # return a dataset using Json format
  get '/datasets/:dataset_in' do
    # force session to start by writing in the Hash ## ODDDDD
    session[:init] = true
    session[:datasets][params[:dataset_in]].to_json_format
  end

  get '/classifiers/:classifier_in' do
    session[:init] = true
    session[:classifiers][params[