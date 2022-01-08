# typed: false
# frozen_string_literal: true

# Copied from https://raw.githubusercontent.com/peak/s5cmd/7f694fd5167d3e2b0c6a733f5b6d81abbf98c937/Formula/s5cmd.rb
# and modified only to fix 'brew audit' issues (and add this comment).

# This file was generated by GoReleaser. DO NOT EDIT.
class S5cmd < Formula
  desc "Parallel S3 and local filesystem execution tool"
  homepage "https://github.com/peak/s5cmd"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/peak/s5cmd/releases/download/v1.4.0/s5cmd_1.4.0_macOS-64bit.tar.gz"
      sha256 "3792eb2ea7a9044d001c704126d12cfd041d132427240c28001418e9b47e83dc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/peak/s5cmd/releases/download/v1.4.0/s5cmd_1.4.0_macOS-arm64.tar.gz"
      sha256 "1d597a80726042c9223ecd3fa9a0d99fc1a19a6ecb820c99419d0cc1f90bc3ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/peak/s5cmd/releases/download/v1.4.0/s5cmd_1.4.0_Linux-64bit.tar.gz"
      sha256 "b62c0600d8dc75974bb7ba6a0cba870870cdd295b63ab6aa42b9713c2d634be5"
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/peak/s5cmd/releases/download/v1.4.0/s5cmd_1.4.0_Linux-armv6.tar.gz"
      sha256 "0edb520347dbb52f10b7b42b034c831bdb7913cd9010cc2be30eaee84dc5ff13"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peak/s5cmd/releases/download/v1.4.0/s5cmd_1.4.0_Linux-arm64.tar.gz"
      sha256 "9207f5cb8fce5367bc532dbfc30ef51097e85522e8e9e617c36bc21c3e6ea048"
    end
  end

  def install
    bin.install "s5cmd"
  end

  test do
    system "#{bin}/s5cmd", "version"
  end
end
