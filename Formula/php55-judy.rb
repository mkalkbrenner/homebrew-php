require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php55Judy < AbstractPhp55Extension
  init
  homepage "https://github.com/orieg/php-judy"
  url "https://pecl.php.net/get/Judy-1.0.2.tgz"
  sha256 "6b913af2c44ac84a2224fecf8a81ddcb0c753252cafd153cb0e9d7c33a333118"
  head "https://github.com/orieg/php-judy.git"

  bottle do
    cellar :any
    sha256 "84217a84d72d8d00036cb6a41e8c958b090c0c643d44aad90024d960a4ce2e57" => :yosemite
    sha256 "82eb76ec5e48d27aec11b9ac5f4ed3b1b8888498e61e1e381313e8bddd97d076" => :mavericks
  end

  depends_on "judy"

  def install
    Dir.chdir "judy-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/judy.so"
    write_config_file if build.with? "config-file"
  end
end
