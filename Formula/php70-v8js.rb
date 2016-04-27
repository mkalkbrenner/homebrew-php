require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70V8js < AbstractPhp70Extension
  init
  desc "PHP extension for Google's V8 Javascript engine"
  homepage "https://pecl.php.net/package/v8js"
  url "https://pecl.php.net/get/v8js-1.0.0.tgz"
  sha256 "f44424e1bd9aaf11caee1ec1baf4bd46e71afd832a0b3411d2f3dfaf1bef5377"
  revision 2

  bottle do
    cellar :any
    sha256 "ab22f9e7ce429f7ca75e07ed0d327e957c08004b574e8f893e22f875119986ca" => :el_capitan
    sha256 "7424e13cdf62e621a96377dffbfbecbd29f0025add9d5485d06300f6743bff14" => :yosemite
    sha256 "90f8d1b6e03bca219a825c3b797bedda7f102c9afa71014466e3d83d359bd81a" => :mavericks
  end

  depends_on "v8"

  def install
    Dir.chdir "v8js-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/v8js.so"
    write_config_file if build.with? "config-file"
  end
end
