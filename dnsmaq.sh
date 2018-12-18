#!/usr/bin/env bash

local_tld=$(whoami)
brew install dnsmasq
mkdir -pv $(brew --prefix)/etc
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo mkdir -pv /etc/resolver
echo "address=/.$local_tld/127.0.0.1" | sudo tee -a $(brew --prefix)/etc/dnsmasq.conf
echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/$local_tld
