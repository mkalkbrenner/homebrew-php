require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php54Apcu < AbstractPhp54Extension
  init
  homepage "https://pecl.php.net/package/apcu"
  url "https://pecl.php.net/get/apcu-4.0.7.tgz"
  sha256 "178a731ee3435b451f1144bc4a63c9d70d4909a2c434e17c6e07db554df90bd6"
  head "https://github.com/krakjoe/apcu.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "71fd875398600818c8ba0438f582e60873f0f54eb609491c6158693414c1577c" => :el_capitan
    sha256 "68b5f9dfbc037cae8e2d28a1b412c9222c56b1f3f27c3ac0a72abead8861a1d7" => :yosemite
    sha256 "2899e25e3a9bce9175b1d1b016dd4c4d6ba76e05b4aac019383497bd840cfe0c" => :mavericks
  end

  option "with-apc-bc", "Whether APCu should provide APC full compatibility support"
  depends_on "pcre"

  def install
    Dir.chdir "apcu-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    args = []
    args << "--enable-apcu"
    args << "--enable-apc-bc" if build.with? "apc-bc"

    safe_phpize

    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          *args
    system "make"
    prefix.install "modules/apcu.so"
    write_config_file if build.with? "config-file"
  end

  def config_file
    super + <<-EOS.undent
      apc.enabled=1
      apc.shm_size=64M
      apc.ttl=7200
      apc.mmap_file_mask=/tmp/apc.XXXXXX
      apc.enable_cli=1
    EOS
  end
end
