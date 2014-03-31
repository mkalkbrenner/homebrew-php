require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54PdoDblib < AbstractPhp54Extension
  init
  homepage 'https://github.com/php/php-src/tree/master/ext/pdo_dblib'
  url PHP_SRC_TARBALL
  sha256 PHP_CHECKSUM[:sha256]
  version PHP_VERSION

  depends_on 'freetds'

  def extension
    "pdo_dblib"
  end

  def install

    touch "#{Formula['freetds'].opt_prefix}/include/tds.h"
    touch "#{Formula['freetds'].opt_prefix}/lib/libtds.a"
    Dir.chdir "ext/pdo_dblib" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--with-pdo-dblib=#{Formula['freetds'].opt_prefix}", phpconfig
    system "make"
    prefix.install "modules/pdo_dblib.so"
    write_config_file unless build.include? "without-config-file"
  end
end
