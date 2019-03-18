# Vim Config

## Vim Version
Make sure your vim is updated.
https://github.com/vim/vim/releases

## Setup
```bash
~$ git clone https://github.com/genexu/vim-config.git
~$ cd vim-config
~$ bash ./setup.sh
```

## Setup YCM (Mac)
Ref: https://github.com/Valloric/YouCompleteMe

### Requirement
- [CMake](https://cmake.org/download/)

### Setup CMake Path
```bash
~$ echo 'export CMAKE_ROOT="/Applications/CMake.app"' >> ~/.bash_profile
~$ echo 'export PATH="$CMAKE_ROOT/Contents/bin:$PATH"' >> ~/.bash_profile
```

``` bash
~$ ~/.vim/bundle/youcompleteme/install.py
```
