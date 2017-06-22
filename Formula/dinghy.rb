require 'formula'

DINGHY_VERSION='4.5.0-fork.1'

class Dinghy < Formula
  homepage 'https://github.com/Sitback/dinghy'
  url  'https://github.com/Sitback/dinghy.git', :tag => "v#{DINGHY_VERSION}"
  head 'https://github.com/Sitback/dinghy.git', :branch => :fork
  version DINGHY_VERSION

  depends_on 'docker'
  depends_on 'docker-machine'
  depends_on "Sitback/dh/unfs3"

  def install
    bin.install "bin/dinghy"
    bin.install "bin/_dinghy_command"
    prefix.install "cli"
  end

  def caveats; <<-EOS.undent
    Run `dinghy create` to create the VM, then `dinghy up` to bring up the VM and services.
    EOS
  end
end
