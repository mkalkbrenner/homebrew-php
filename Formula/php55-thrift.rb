require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Thrift < AbstractPhp55Extension
  init
  homepage 'http://thrift.apache.org/'
  url 'https://github.com/apache/thrift/archive/0.9.1.tar.gz'
  sha1 '9009293ede029289c9a64365faff31ac20597758'

  def module_path
    prefix / "thrift_protocol.so"
  end

  def install
    Dir.chdir "lib/php/src/ext/thrift_protocol"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/thrift_protocol.so"
    write_config_file unless build.include? "without-config-file"
  end
end
