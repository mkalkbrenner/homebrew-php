require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Augmentedtypes < AbstractPhp55Extension
  init
  homepage 'https://github.com/box/augmented_types'
  url 'https://github.com/box/augmented_types/archive/v0.5.2.tar.gz'
  sha1 '289537c8ec853c35516d1d81cb5665800df45b0b'
  head 'https://github.com/box/augmented_types.git'

  def extension_type; "zend_extension"; end

  def extension
    "augmented_types"
  end

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-augmented_types"
    system "make"
    prefix.install "modules/augmented_types.so"
    write_config_file if build.with? "config-file"
  end

  def config_file
    super + <<-EOS.undent
      augmented_types.enforce_by_default = 1
    EOS
  end
end
