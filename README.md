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
One central datatype of ruby-band is derived from the Weka counterpart (the class Weka.core.Instances). By instantiating this class, we obtain a matrix-like structure for storing an entire dataset. Ad-hoc methods were created to guarantee that 'Instances' class objects can be converted t