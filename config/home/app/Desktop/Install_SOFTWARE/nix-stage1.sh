# install nix single user
sh <(curl -L https://nixos.org/nix/install) --no-daemon
# sh <(curl -L https://nixos.org/nix/install) --daemon #! maybe install to /root first, and root would error, stop install
# mkdir /tmp/xxx/unpack
# tar -xJf "nix-2.9.2-x86_64-linux.tar.xz" -C "/tmp/$unpack"
```sh
tmpDir="$(mktemp -d -t nix-binary-tarball-unpack.XXXXXXXXXX || \
          oops "Can't create temporary directory for downloading the Nix binary tarball")"
#tarball=$tmpDir/nix-2.9.2-$system.tar.xz
tarball=$HOME/Desktop/Install_SOFTWARE/nix-2.9.2-x86_64-linux.tar.xz
unpack=$tmpDir/unpack
mkdir -p "$unpack"
tar -xJf "$tarball" -C "$unpack" || oops "failed to unpack '$url'"
```
#! * get install to string !!!
```sh
script=$(echo "$unpack"/*/install)
ln -s /home/app/Desktop/Install_SOFTWARE/nix-install $script-new
script=$script-new

[ -e "$script" ] || oops "installation script is missing from the binary tarball!"
export INVOKED_FROM_INSTALL_IN=1
# "$script" "$@"
# "$script" "--daemon"
"$script" "--no-daemon"
```
# * error if 
```
I am executing:

    $ sudo HOME=/root /nix/store/gccngwwdzwm5gybfh4gpvmnv1fdlw3av-nix-2.9.2/bin/nix-env -i /nix/store/gccngwwdzwm5gybfh4gpvmnv1fdlw3av-nix-2.9.2

to install a bootstrapping Nix in to the default profile

installing 'nix-2.9.2'
```
nix-env -i asciinema