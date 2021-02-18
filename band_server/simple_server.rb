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
    session[:classifiers][params[:classifier_in]]
  end

  get '/summary/:dataset_in' do
    session[:init] = true
    dataset_in = session[:datasets][params[:dataset_in]]
    return dataset_in.summary[0].to_s,dataset_in.summary[1].to_s
  end

  post "/create_dataset" do
    params.each_key do |key|
      File.open('uploads/' + params[key]['dataset'][:filename], "w") do |f|
        f.write(params[key]['dataset'][:tempfile].read)
      end
      session[:datasets] ||= Hash.new
      session[:classifiers] ||= Hash.new  
      session[:datasets][params[key]['dataset_name']] = Core::Parser::parse_CSV('uploads/' + params[key]['dataset'][:filename])
    end
    return "The dataset was successfully created!"
  end

  get '/filter' do
    session[:init] = true
    $dataset_in = session[:datasets][params[:dataset_in]]
  