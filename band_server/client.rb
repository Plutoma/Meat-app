require 'rest_client'
require 'uri'

address = 'http://localhost:4567/'

response_old = RestClient.post "#{address}create_dataset", { 'first' => { 'dataset' => File.new('first_dataset.csv'),'dataset_name' => 'dataset_1'}, 
                                                             'second' => {'dataset' => File.new('second_dataset.csv'),'dataset