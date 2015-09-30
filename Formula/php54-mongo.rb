require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php54Mongo < AbstractPhp54Extension
  init
  homepage "https://pecl.php.net/package/mongo"
  url "https://pecl.php.net/get/mongo-1.6.11.tgz"
  sha256 "cd180ae35f537a199d374a3105106ee5a2b0cab618b12f6221e4c985c28955ac"
  head "https://github.com/mongodb/mongo-php-driver.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "4d439e65a8bd493e5a6c1ed105edfa18839ac5337e6265314e8eccf2e5aee553" => :el_capitan
    sha256 "4d27ec66cbfecd8cf6624698c2fd3276b6ad954a073be4681a31a6d99d35e08b" => :yosemite
    sha256 "8cf44f1b1d59b13acbed86fff8058a419e775a6b884872a7552e7ada48f87e4c" => :mavericks
  end

  def install
    Dir.chdir "mongo-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/mongo.so"
    write_config_file if build.with? "config-file"
  end
end
