require File.join(File.dirname(__FILE__), 'abstract-php')

class Php54 < AbstractPhp
  init
  url 'http://www.php.net/get/php-5.4.20.tar.bz2/from/this/mirror'
  sha1 'b468faaf1f88dd4dd5dbeb11283dd9d76c523cd5'
  version '5.4.20'

  head 'https://github.com/php/php-src.git', :branch => 'PHP-5.4'

  # Leopard requires Hombrew OpenSSL to build correctly
  depends_on 'openssl' if MacOS.version == :leopard

  def install_args
    args = super
    args << "--with-homebrew-openssl" if MacOS.version == :leopard
    args + [
      "--enable-zend-signals",
      "--enable-dtrace",
    ]
  end

  def php_version
    5.4
  end

  def php_version_path
    54
  end

end
