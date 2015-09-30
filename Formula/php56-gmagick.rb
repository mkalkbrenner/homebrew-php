require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Gmagick < AbstractPhp56Extension
  init
  homepage "https://pecl.php.net/package/gmagick"
  url "https://pecl.php.net/get/gmagick-1.1.7RC2.tgz"
  sha256 "8e51c8343d6e6d556d7b17417ce338c6ed2b0893869f1494410dfe6ba5105475"

  bottle do
    sha256 "61e11d790f4137c4c26ddb048417696fd81973e4eefe9bc4c86dd8fe6353cfbd" => :el_capitan
    sha256 "dc328fd60c147b3b3235b385311bc67065490cf5870fd73c8813ddae96ab8136" => :yosemite
    sha256 "45ba933332262ebe3fc86ed234f355882b613777d99174331b0c808d18539b47" => :mavericks
  end

  depends_on "graphicsmagick"

  def install
    Dir.chdir "gmagick-#{version}"

    ENV.universal_binary if build.universal?

    args = []
    args << "--prefix=#{prefix}"
    args << phpconfig
    args << "--with-gmagick=#{Formula["graphicsmagick"].opt_prefix}"

    safe_phpize
    system "./configure", *args

    system "make"
    prefix.install "modules/gmagick.so"
    write_config_file if build.with? "config-file"
  end
end
