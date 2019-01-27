#!/bin/bash
# Installing and setting up the Go-Lang compiler and environment.
# 2019 Douglas Berdeaux, WeakNet Labs, Demon Linux
export TOP_PID=$$ # store the PID of this program
die () {
 printf "\n[!] ${1}.\n[!] Exiting.\n" >&2
 kill -s TERM $TOP_PID
}
cd /tmp 2>/dev/null 2>/dev/null || die "Cannot access development directory"
printf "[*] Downloading the Go-Lang 64bit version. This will take a minute or so ... "
wget -q https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz || die "Cannot download Go-Lang package. Are you online?"
if [ -f "/tmp/go1.11.4.linux-amd64.tar.gz" ]
 then
  printf "\n[*] Download completed. Extracting ... ";
 else
  die "Could not download the Go-Lang package. Are you online?"
fi
printf "\n[*] Extracting Go-Lang package to /usr/local ... "
tar -C /usr/local/ -vzxf /tmp/go1.11.4.linux-amd64.tar.gz > /dev/null || die "Could not extract he Go-Lang package."
printf "\n[*] Updating the ~/.profile environment settings for Go-Lang ... "
echo "export PATH=\$PATH:/usr/local/go/bin:\$HOME/.go-projects/bin" >> ~/.profile || die "Cannot update the ~/.profile file to set up environment"
echo "export GOROOT=/usr/local/go" >> ~/.profile || die "Cannot update the ~/.profile file to set up environment"
echo "export GOPATH=\$HOME/.go-projects" >> ~/.profile || die "Cannot update the ~/.profile file to set up environment"
printf "\n[*] Building out skeleton directories in ~/.go-projects ... "
mkdir ~/.go-projects 2>/dev/null # add error handling of this
mkdir -p ~/.go-projects/src/github.com
mkdir -p ~/.go-projects/src/golang.org
source ~/.profile
printf "\n" # clean up
go version
printf "\n[*] Downloading && building test Go package, \"chisel\" (github.com/jpillora/chisel) ... "
go get github.com/jpillora/chisel
cd $GOPATH/src/github.com/jpillora/chisel && go build && go install
printf "\n[*] Build completed. Testing.\n"
chisel
printf "\n[*] Install script completed.\n"
