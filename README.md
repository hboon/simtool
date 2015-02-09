About
---
As iOS app developers, we'll often find it useful to have many more photos than the few that Apple has supplied along with the iOS simulator. That's what simtool is for.

Usage
---
Run the simulator with the device and iOS version that you want to import to.

Import a single photo at a time,

```
$ simtool add -p ~/Desktop/a-photo.jpg
```

or every photo in a directory:

```
$ simtool add -p ~/Desktop/important-photos
```

Installation
---
`gem install simtool`

Dependencies
---
* [commander](https://github.com/tj/commander)

License
---
BSD

Questions
---
* Email: [hboon@motionobj.com](mailto:hboon@motionobj.com)
* Web: [http://hboon.com/ios-simtool/](http://hboon.com/ios-simtool/)
* Twitter: [http://twitter.com/hboon](http://twitter.com/hboon)
