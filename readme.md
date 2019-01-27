# Go-Lang Download, Build, and Install Script
Many information security tools are built using Go-Lang. For this reason, I have scripted a simple way to quickly setup a Go-Lang environment in Linux.

Simply run the [go-setup.sh]() script. This will,
1. Download the amd64 bit versio of Go-Lang directly from Google
2. Unpack it into /usr/local
3. Set up the environment
4. Download build and install [chisel](https://github.com/jpillora/chisel) as a test package.

The environment will be `/root/.go-projects`. If you would like to build and install a new project, from GitHUB for instance, use the follwing syntax,
```
root@demon:~# go get github.com/jpillora/chisel
root@demon:~# cd $GOPATH/src/github.com/jpillora
root@demon:~/.go-projects/src/jpillora# go build
root@demon:~/.go-projects/src/jpillora# go install
```
This will build the project from the GitHUB repository and place the compiled binar(y|ies) into `~/.go-projects/bin` which is already in your `$PATH`. So, we can now simply execute the binary as,
```
root@demon:~# chisel
```
If an error occurs during the `go build` process, you may need to gather dependencies for the project by following the same exact steps above for each listed dependency.
