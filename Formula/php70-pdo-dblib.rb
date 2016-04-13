require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70PdoDblib < AbstractPhp70Extension
  init
  desc "A unified Sybase-DB style driver for PDO"
  homepage "https://github.com/php/php-src/tree/master/ext/pdo_dblib"
  bottle do
    sha256 "03bd467168ba3b226cc233b79c26959424653248ebd36fc3cf5a24a85a460019" => :el_capitan
    sha256 "10b2386b146b552289d56d781b08fff7cb43bdb56a3847cd70a125b6fbd6187c" => :yosemite
    sha256 "d83e35f97500a9e2840f77a7082dacd4da52ae06eef41b6db87b103fd8f72d64" => :mavericks
  end

  url PHP_SRC_TARBALL
  sha256 PHP_CHECKSUM[:sha256]
  version PHP_VERSION

  depends_on "freetds"

  def extension
    "pdo_dblib"
  end

  def install
    Dir.chdir "ext/pdo_dblib" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--with-pdo-dblib=#{Formula["freetds"].opt_prefix}", phpconfig
    system "make"
    prefix.install "modules/pdo_dblib.so"
    write_config_file if build.with? "config-file"
  end
end





