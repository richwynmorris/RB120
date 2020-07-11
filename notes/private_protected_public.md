# Public, Private and Protected

## What is a private method? 

A private method is a method whichm#, when when invoked, has all subsequent methods beneath it hidden from the public interface of the object. This means the methods contained beneath `private` are not accessible to the existing codebase and thus are not accesible outside of the object. This allows us to keep private the functionality of the object and any data within it. 


## Can you call a private method with `self`? 

Prior to Ruby 2.7, you couldn't as `self` refers to the object itself. Thus if the object is calling a private method from outside the scope of the object, it cannot be accessed and `private method called` error is returned. However, I believe this now been modified and you can now do this. 