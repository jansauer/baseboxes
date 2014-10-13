# Vagrant Baseboxes

My [Packer](http://www.packer.io/) templates to build small
[Vagrant](http://www.vagrantup.com/) baseboxes for personal projects. They only
use the distributions core packages and are intended to be used with
[Chef](http://docs.opscode.com/) and [Berkshelf](http://berkshelf.com/).

The work is heavily inspired by the grate work of [Mischa Taylor]
(https://github.com/misheska/basebox-packer). Other good documentation can be
found [here](http://docs-v1.vagrantup.com/v1/docs/base_boxes.html).


## Quick start

```bash
brew install https://github.com/homebrew/homebrew-binary/blob/master/packer.rb
make list
make <name>.box version=<version>
```


## Contributing

Pull requests are always welcome. I'm grateful for any help or inspiration.


##  License and Authors

Author: Jan Sauer
<[jan@jansauer.de](mailto:jan@jansauer.de)>
([https://jansauer.de](https://jansauer.de))

```text
Copyright 2013-2014, Jan Sauer <jan@jansauer.de> (https://jansauer.de)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
