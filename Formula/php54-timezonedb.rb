require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php54Timezonedb < AbstractPhp54Extension
  init
  desc "Timezone Database to be used with PHP's date and time functions"
  homepage "https://pecl.php.net/package/timezonedb"
  url "https://pecl.php.net/get/timezonedb-2016.9.tgz"
  sha256 "9207c0f6bff2dd8a1bb0d5b1b4ee644437d555538d02a1cc8c63ebbce6c893e8"
  head "https://svn.php.net/repository/pecl/timezonedb/trunk/"

  bottle do
    cellar :any_skip_relocation
    sha256 "fdea102ed97e33e0cf940ea5c429d2580180639cffbb73090be2a125a535b0c6" => :sierra
    sha256 "fcc53c5f300884376ccd234995fd2cf6349146d60582143080c16504b676355a" => :el_capitan
    sha256 "01c77eded6c9b61f2817a340427a6a0c842794c877a64425c950d32a69f86370" => :yosemite
  end

  def install
    Dir.chdir "timezonedb-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/timezonedb.so"
    write_config_file if build.with? "config-file"
  end
end
