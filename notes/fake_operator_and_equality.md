# Fake Operators

## Is it a a method or is it an operator? 
### [], []=

Methods

### **

Method

### !,~. +, -

Methods

### *, /, %

Methods

### <<, >>

Methods

### <=, <, >, =>

Methods

### <=>, ==, ===, !=, =~, !~

Methods

## &&

Operator

## ||

Operator

## .., ...
Operator

## ? : (ternary if-then-else)
Operator



## What does the `eql?` method check for? 

The `eql?` method checks for whether two objects are the same class and have the same values. 

```ruby
'hello'.eql?('hello') # => true
```

In the example above, both the objects are of the same `String` class and they both have the same value with `'hello'`

## What does BasicObject#== check for? 

`BasicObject#==` checks whether two objects are the same, if they are, it returns `true`. Most objects overide this method to check for specific cases of equivalence.
For example, String#== checks whether their values are the same but does not consider whether the objects are the same. 

```ruby 
'hello' == 'hello' #=> true
'hello'.object_id == 'hello'.object_id # => false 
```

## Can you customise the '==' method? If so, why would you want to?

You can customise the `==` method for a custom object as you may want to check the truthiness of of a specific value. 

For example, if you want to check whether the index position of 2 in an array is the same in every array object

```ruby
class CustomArrayObject
  attr_reader :array
  
  def initialize(new_array)
    @array = new_array
  end

  def ==(other)
    array[2] == other.array[2]
  end
end 

arr1 = CustomArrayObject.new([1,3,4,7,8,9])
arr2 = CustomArrayObject.new([2,6,4,6,4,1])

p arr1 == arr2 #=> true
```

## What method can you use to compare if two object are the same and have the same value? 

You would need to use the `#equal?` method to check if two objects are the same sand contain the same values. 

```ruby
str1 = 'Hello'
str1_copy = str1
p str1.equal?(str1_copy) # => true 
```

## What method can you use to see if two objects contain the same value? 
You can use the `==` operator to override the `#BasicObject== method, which can then check whether to values of an object are the same. For instance the #String== method does this. 

## What does the '===' method do ?
This method will check if the right hand arguement is contained within the range of the left hand argument. This is often used with `case` statements. 

```ruby
p (0..99) === 77 #=> true
```

This can also be used to see whether an object in contained within a specific class:
```ruby
p String === 'Hello' # => true
```
