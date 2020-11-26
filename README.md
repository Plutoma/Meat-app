# ruby-band

[![Build Status](https://travis-ci.org/arrigonialberto86/ruby-band.png?branch=master)](https://travis-ci.org/arrigonialberto86/ruby-band)

Data mining and machine learning algorithms for Ruby

## Installation

Install the  'jbundle' gem and 'bundle' for JRuby before trying to install the
'ruby-band' gem. Maven is also required for .jars automatic download and
installation. On Ubuntu/Debian Maven should already be installed and on OSX
system you can get it from Brew

If you want to use 'ruby-band' APIs without installing the gem you need to run
command 'rake -T' once before requiring the gem in your script (this is
necessary for jbundler to download the '.jar' files and subsequently set the
Java classpath). Otherwise use:

    gem install ruby-band

## Usage

### Dataset parsing
One central datatype of ruby-band is derived from the Weka counterpart (the class Weka.core.Instances). By instantiating this class, we obtain a matrix-like structure for storing an entire dataset. Ad-hoc methods were created to guarantee that 'Instances' class objects can be converted to other datatypes (e.g. Apache matrix) and back.
There are currently many ways to import data into ruby-band. 
### Parsing data from ARFF/CSV files
You can simply parse an external Weka ARFF/CSV file by doing:
```ruby
require 'ruby-band'
dataset = Core::Parser.parse_ARFF(my_file.arff)
dataset = Core::Parser.parse_CSV(my_file.csv)
```
### In-memory dataset creation
Since the dataset type used by ruby-band is derived from Weka Instances class, we must define the domain of the data we want to insert into it. The attribute types supported by ruby-band are 'numeric', 'nominal', 'string' and 'date'. For this reason, each column in the dataset can contain only one data type to be valid.
If you want to build an in-memory dataset you can create an empty scaffold at first, then you populate it with your data, like this:
```ruby
require 'ruby-band'
# we create a dataset containing three columns (attributes)
dataset = Core::Type::Instances::Base.new do
  nominal :first_attribute, ['yes','no']
  nominal :second_attribute, ['maybe','perhaps']
  numeric :third_attribute
end
```
we can populate 'by row' our matrix-like dataset using a bidimensional array:
```ruby
dataset.populate_by_row([['yes','maybe',6],['no','perhaps',21]])
```
Every row in the dataset above must meet this construction criteria: [a_nominal_value,b_nominal_value,c_numeric value], in order to match the structure assigned during dataset initialization.

### How to operate on a dataset

The ruby-band `Core::Type::Instances` class offers a wide range of operations to easily access and modify a dataset. Some of the are very intuitive:
```ruby
require 'ruby-band'
dataset = Core::Parser.parse_ARFF(my_file.arff)
# we can now access the dataset

dataset.summary
dataset.n_col/.n_row/.dim # R-like functions
dataset.each_row/each_column {|row/column| function}
```
or we can modify it by doing:
```ruby
# to add a row
dataset.add_instance ['yes','maybe',21]

# to add a column
dataset.add_numeric_attribute 'my_numeric_attribute'
dataset.add_nominal_attribute 'my_nominal_attribute', ['ruby','is','fun']
```
In addition to these methods, ruby-band offers a wide range of filters to operate on the structure and the content of the Instances datasets.

### How to export a dataset
It is fairly easy to export a dataset to a CSV/ARFF file or to a Mysql table (with reference to the example above):
```ruby
dataset.to_ARFF my_output_file.arff
dataset.to_CSV my_output_file.csv
dataset.save_to_mysql 'jdbc:mysql://localhost:3306/DB_name',