#objcscripts
This is a repository of example/useful obj-run scripts.

These scripts use the [ObjC-run](https://github.com/iljaiwas/objc-run) as well as (Barista)[https://github.com/stevestreza/Barista].

##Requirements
* [Xcode 5.1](https://developer.apple.com)
* Ruby (ruby 2.0.0p353 (2013-11-22 revision 43784) [x86_64-darwin13.0.0])
* [Cocoapods](http://cocoapods.org)
* [Homebrew](http://brew.sh)

##HowTo
Open two terminal windows/tabs. 

1. In the first terminal window/tab:

``` 
gem install cocoapods
brew install objc-run
source /etc/environment
cd /tmp/
git clone https://github.com/lottadot/objcscripts
cd objcscripts	
./objcscript1.m
```

2. In the second terminal window/tab:

```
open http://localhost:33333
```
	You'll see the "Hello World" response in your browser. Congratuations, it worked.
	

