require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Pspell < AbstractPhp55Extension
  init
  homepage 'http://php.net/manual/en/book.pspell.php'
  url PHP_SRC_TARBALL
  sha256 PHP_CHECKSUM[:sha256]
  version PHP_VERSION

  depends_on 'aspell'

  def install
    Dir.chdir "ext/pspell"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--disable-debug",
                          "--with-pspell=#{Formula.factory('aspell').opt_prefix}"
    system "make"
    prefix.install "modules/pspell.so"
    write_config_file unless build.include? "without-config-file"
  end
end
