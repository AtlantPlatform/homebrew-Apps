require "formula"

class EthereumPlaybook < Formula
  desc "CLI tool that configures and deploys Ethereum DApp infrastructures using a static specification."
  homepage "https://github.com/AtlantPlatform/ethereum-playbook"
  url "https://github.com/AtlantPlatform/ethereum-playbook/archive/v1.0.1.tar.gz"
  sha256 "090f60a635548e898cebd1d28766534e25d88081213270834e2c5010d8adff67"

  head "https://github.com/AtlantPlatform/ethereum-playbook.git"

  depends_on "go" => :build

  bottle do
    root_url "https://homebrew.bintray.com/bottles-apps"
    cellar :any_skip_relocation
    sha256 "36fe4ff2869a97c555847b68b4c7895dc0b11e86a48398f1d4de49208df8d894" => :high_sierra
  end

  def install
    ENV["GOPATH"] = buildpath

    mkdir_p "#{buildpath}/src/github.com/AtlantPlatform"
    ln_sf buildpath, "#{buildpath}/src/github.com/AtlantPlatform/ethereum-playbook"
    system "go", "build", "-o", "ethereum-playbook", "github.com/AtlantPlatform/ethereum-playbook"
    bin.install "ethereum-playbook"
  end

  test do
    system "#{bin}/ethereum-playbook", "-h"
  end
end
