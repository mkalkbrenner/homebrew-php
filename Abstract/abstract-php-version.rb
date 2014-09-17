class AbstractPhpVersion < Formula
  module PhpdbgDefs
    PHPDBG_SRC_TARBAL = 'https://github.com/krakjoe/phpdbg/archive/v0.3.2.tar.gz'
    PHPDBG_CHECKSUM   = {
                        :md5    => '84255abff00fb31e338d03564c3cc4e4',
                        :sha1   => 'c57174ab235ec69997e1a37e6d2afe3e4edfb749',
                        :sha256 => 'feab6e29ef9a490aa53332fe014e8026d89d970acc5105f37330b2f31e711bbd',
                      }
  end

  module Php53Defs
    PHP_SRC_TARBALL = 'http://www.php.net/get/php-5.3.29.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '5.3.29'
    PHP_BRANCH      = 'PHP-5.3'

    PHP_CHECKSUM    = {
                        :md5    => '9469e240cbe6ac865aeaec89b253dd30',
                        :sha1   => '6e9e492c6d5853d063ddb9a4dbef60b8e5d87444',
                        :sha256 => 'c4e1cf6972b2a9c7f2777a18497d83bf713cdbecabb65d3ff62ba441aebb0091',
                      }
  end

  module Php54Defs
    PHP_SRC_TARBALL = 'http://www.php.net/get/php-5.4.32.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '5.4.32'
    PHP_BRANCH      = 'PHP-5.4'

    PHP_CHECKSUM    = {
                        :md5    => '0de30057773755c742ef4916c473292c',
                        :sha1   => 'cc43f47f522d59c200ce542485d2a1652802f459',
                        :sha256 => '26d0717669a098f18cd22dc3ae8282101d38508054500c26775ddcc26ca7c826',
                      }
  end

  module Php55Defs
    PHP_SRC_TARBALL = 'http://www.php.net/get/php-5.5.16.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '5.5.16'
    PHP_BRANCH      = 'PHP-5.5'

    PHP_CHECKSUM    = {
                        :md5    => '331a87fb27e100a88b3845d34582f769',
                        :sha1   => '36c007e24a440f97c4f56ac094ac5e271dbd1a11',
                        :sha256 => 'a1d7c4556a80bed744a348211b33bc35303edd56dd0a34e0a75a948c879cc5f6',
                      }
  end

  module Php56Defs
    PHP_SRC_TARBALL = 'http://www.php.net/get/php-5.6.0.tar.bz2/from/this/mirror'
    PHP_GITHUB_URL  = 'https://github.com/php/php-src.git'
    PHP_VERSION     = '5.6.0'
    PHP_BRANCH      = 'PHP-5.6'

    PHP_CHECKSUM    = {
                        :md5    => '1f889357528809a6675e2f23995832d7',
                        :sha1   => '4ab8ddc1b33abd87bcfd148553f4558697dbe719',
                        :sha256 => '097af1be34fc73965e6f8401fd10e73eb56e1969ed4ffd691fb7e91606d0fc09',
                      }
  end
end
