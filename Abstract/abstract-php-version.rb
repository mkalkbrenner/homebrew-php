class AbstractPhpVersion < Formula
  module PhpdbgDefs
    PHPDBG_SRC_TARBAL = 'https://github.com/krakjoe/phpdbg/archive/v0.3.2.tar.gz'
    PHPDBG_CHECKSUM   = {
                        :sha256 => 'feab6e29ef9a490aa53332fe014e8026d89d970acc5105f37330b2f31e711bbd',
                      }
  end

  module Php53Defs
    PHP_SRC_TARBALL = 'https://php.net/get/php-5.3.29.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '5.3.29'
    PHP_BRANCH      = 'PHP-5.3'

    PHP_CHECKSUM    = {
                        :sha256 => 'c4e1cf6972b2a9c7f2777a18497d83bf713cdbecabb65d3ff62ba441aebb0091',
                      }
  end

  module Php54Defs
    PHP_SRC_TARBALL = 'https://php.net/get/php-5.4.45.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '5.4.45'
    PHP_BRANCH      = 'PHP-5.4'

    PHP_CHECKSUM    = {
                        :sha256 => '4e0d28b1554c95cfaea6fa2b64aac85433f158ce72bb571bcd5574f98f4c6582',
                      }
  end

  module Php55Defs
    PHP_SRC_TARBALL = 'https://php.net/get/php-5.5.37.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '5.5.37'
    PHP_BRANCH      = 'PHP-5.5'

    PHP_CHECKSUM    = {
                        :sha256 => 'd2380ebe46caf17f2c4cd055867d00a82e6702dc5f62dc29ce864a5742905d88',
                      }
  end

  module Php56Defs
    PHP_SRC_TARBALL = 'https://php.net/get/php-5.6.23.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '5.6.23'
    PHP_BRANCH      = 'PHP-5.6'

    PHP_CHECKSUM    = {
                        :sha256 => 'facd280896d277e6f7084b60839e693d4db68318bfc92085d3dc0251fd3558c7',
                      }
  end

  module Php70Defs
    PHP_SRC_TARBALL = 'https://php.net/get/php-7.0.8.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '7.0.8'
    PHP_BRANCH      = 'PHP-7.0'

    PHP_CHECKSUM    = {
                        :sha256 => '66dc7ba388490e07b1313fe3a06b1fa822e1310585fe29f4909995f131e27c8d',
                      }
  end

  module Php71Defs
    PHP_SRC_TARBALL = 'https://downloads.php.net/~krakjoe/php-7.1.0alpha2.tar.bz2'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '7.1.0-alpha.2'
    PHP_BRANCH      = 'PHP-7.1.0'

    PHP_CHECKSUM    = {
                        :sha256 => 'e545c6bc229cf27d0540c8277da5b369c5de0e9c5c723d6b26902b3791d8795d',
                      }
  end
end
