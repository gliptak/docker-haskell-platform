from ubuntu:trusty
run useradd -m -s /bin/bash haskell
run sed -i 's/main$/main universe/' /etc/apt/sources.list && apt-get update && apt-get -y install build-essential libedit2 libglu1-mesa-dev libgmp-dev libgmp10 zlib1g-dev freeglut3-dev wget sudo && apt-get clean
run locale-gen en_US.UTF-8
run echo "haskell ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell
run cd / && wget https://www.haskell.org/platform/download/2014.2.0.0/haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz && tar xzf haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz && rm haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz && /usr/local/haskell/ghc-7.8.3-x86_64/bin/activate-hs
user haskell
workdir /home/haskell
env HOME /home/haskell
env LC_ALL en_US.UTF8
