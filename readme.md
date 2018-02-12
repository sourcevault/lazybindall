[![Build Status](https://travis-ci.org/sourcevault/lazybindall.svg?branch=master)](https://travis-ci.org/sourcevault/lazybindall)

![](https://github.com/sourcevault/lazybindall/blob/master/images/logo.jpg)

**Install Using Any ..**
```
- npm install lazybindall

- npm install @sourcevault/lazybindall
```

**Type Signature**

```haskell
lazybindall  :: ( ob , methds ) -> obmethds
``` 

-  `ob <Object>`  -  Methods in `methds` get bound to `Ob`.

-  `methds <Object>` - Object with props *that are methods* that we want to lock to `ob`

- `obmethds <Object>` is an object whose props are defined be `methds` and have there context locked to `ob`.

**Simple Example**

```javascript

var foo = {name:"sourcevault"}

var methds = 
  {
    show:function()
    {
      console.log (this)
    }
  }

// ----------------------------------------------

var lazybindall = require ("lazybindall")

var bound = lazybindall ( foo , methds )

bound.show() // {name:"sourcevault"}

```


### Benchmark 

*...for 10,000 object with 9 methods*

|   Method         | Total Memory (MB) | Time (millisecond)  |
|:----------------:|------------------:|--------------------:|
|     `.prototype` |                  6|                   31|
| lazy  closure    |                  9|                   54|
| eagar closure    |                 49|                6,172|

|[.. view detailed documentation ..](https://github.com/sourcevault/lazybindall/tree/master) 
| --- |

### Updates and API change

- Initial `0.0.1` release with a single exported function.

## License
 
- Code released under MIT Licence, see [LICENSE](https://github.com/sourcevault/lazybindall/blob/master/LICENCE) for details.

- Documentation released using CC-BY-4.0 see [LICENSE](https://github.com/sourcevault/lazybindall/blob/master/images/LICENCE) for details.



