path = File.expand_path(File.dirname(__FILE__))

def command?(name)
  `which #{name}`
  $?.success?
end

module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG['host_os']) != nil
  end

  def OS.mac?
   (/darwin/ =~ RbConfig::CONFIG['ho