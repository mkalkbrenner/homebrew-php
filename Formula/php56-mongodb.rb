require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Mongodb < AbstractPhp56Extension
  init
  desc "MongoDB driver for PHP."
  homepage "https://pecl.php.net/package/mongodb"
  url "https://pecl.php.net/get/mongodb-1.1.9.tgz"
  sha256 "c4882991da323dfb0e60a43390a7a6cad27f632294f2becd44604dc9f7e90c3f"
  head "https://github.com/mongodb/mongo-php-driver.git"

  bottle do
    sha256 "e3714d60cadc854d9f1ed52523785e21248122b08f8457d527e570a48f4c84c4" => :sierra
    sha256 "3f797ce58482c2cd054f4784cb83b1b74077a0f9ea7dd4b68488e02e53442350" => :el_capitan
    sha256 "80b3660a9d2d3a9ff5521d5c66f639d8922f55ecc7c78bdcf0ac12815bb354ba" => :yosemite
  end

  devel do
    url "https://pecl.php.net/get/mongodb-1.2.0alpha3.tgz"
    sha256 "295ff6792e734c5d0352efb0f2bb0c1dad25114d5c48bd98004d7650d742de3f"
    version "1.2.0alpha3"
  end

  depends_on "openssl"

  def install
    Dir.chdir "mongodb-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--with-openssl-dir=#{Formula["openssl"].opt_prefix}"
    system "make"
    prefix.install "modules/mongodb.so"
    write_config_file if build.with? "config-file"
  end
end
