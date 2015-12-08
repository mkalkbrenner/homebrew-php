require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Yaz < AbstractPhp56Extension
  init
  desc "This extension implements a Z39.50/SRU client for PHP using the YAZ toolkit and the ZOOM framework."
  homepage "http://www.indexdata.com/phpyaz"
  url "https://pecl.php.net/get/yaz-1.1.6.tgz"
  sha256 "dd9b919ba3b2a09a9c77c847407f106512fe75979cc0689ebccef08c80719eee"

  bottle do
    sha256 "7b6cb327d11486cffe95f390decfec202909be4908406c569e1efc92cfdd5762" => :el_capitan
    sha256 "d1083d2eb020dbba56ece25340bcb572633c0170314fad8796d0eb21b11ff13e" => :yosemite
    sha256 "379cca773ee52205e5ecd31e312b2e9ad793a0d25ca7b5cebd042db5a20569a7" => :mavericks
  end

  depends_on "yaz"

  def install
    Dir.chdir "yaz-#{version}"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/yaz.so"
    write_config_file if build.with? "config-file"
  end
end
