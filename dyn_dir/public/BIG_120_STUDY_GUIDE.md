1) **OOP DEFINED**

   

QUOTES TO USE---->



*OOP is a programming paradigm that was created to deal with the mounting complexity of large software systems.  Through the use of classes- and utilizing objects instantiated from these classes- the program can become an interaction of small parts and the data is containable.  These 'containers' allow for changes to be made to certain parts of the program, without it affecting the entire program.  In other words, classes and objects encapsulate themselves and reduce dependancies throughout the program.  This leads to code that can be easier maintained.  Defining basic classes and utilizing inheritance to introduce more detailed behaviors provides a greater level of reusability and flexibility. Another benefit is that by modeling classes that are appropriate to the problem, programmers are able to think at a higher level of abstraction through the use of real-world nouns and verbs.*



-------------->

- *Large, complex programs can be difficult to maintain due to dependencies throughout the program. OOP lets programmers write programs in which the different parts of the program interact, thus reducing dependencies and facilitating maintenance.*
- *Coding in a non-OO way often means writing code that is useful solely within a single context. Defining basic classes and leveraging concepts like inheritance to introduce more detailed behaviors provides a greater level of reusability and flexibility.*
- *Complex coding problems are often difficult to break down and solve in a clear and systematic way. Using OOP to  model classes appropriate to the problem, and using real-world nouns to represent objects, lets programmers think at a higher level of abstraction that helps them break down and solve problems.*

<u>Need more classes??</u>

**When you keep referring a noun within the instance methods,, you should probably encapsulate that logic into its own class.  If we encapsulate the logic we are able to have behaviors that we could call on the object itself, instead of calling straggling helper methods.* 

<u>Rules for Writing OOP</u>

1) *Explore Problem before design (spike)*

2. *Repetitive nouns in method names is a sign that you're missing a class*
3. *When naming methods, don't include class name*
4. *Avoid long method invocation chains*
5. *Avoid deisng patterns for now - "premature optimization is the root of all evil"*






----------------------------------------------------

2. **INITIALIZATION**



Quotes to use---------->



Initialization is a prerequisite for an instance variable to be a part of an object's state, therefor an uninitialzied variable will not show up when we call inspect on the object.



An unitialized instance variable will return `nil`, while an uninitialized local variable will raise a `NameError`.



--------------------->

*The initialize method gets called every time you create a new object. The `new` method leads us to the `initialize` method.  We refer to the `initialize` method as a constructor.  A constructor gets triggered whenever we instantiate a new object, therefor we refer to the `initialize` method as the constructor.*

```ruby 
class Being
  def initialize(name)
    @name = name 
  end
end

first = Being.new('human')
```



<u>nil vs initialized to nil</u>

```ruby 
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end 
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
```

*This code will not have `@grade = nil` as part of the state of the object because initialization is a prerequisite for an instance variable to be a part of an object's state.  Within the initialize method, there is no instance variable that is assigned to the value of the local variable `grade`.  An uninitialized instance variable will not show up when we call inspect on the object, but if we explicitly assign the value `nil` to `@grade`, then this output will be correct.  Interestingly, if we call the `grade` getter method on the object before `grade` initialization, `nil` will be returned.*  

*Why is this? An unitialized instance variable will return `nil`, while an uninitialized local variable will return a `NameError`.  Basically, explicitly referencing `nil` versus just being uninitialized (and thus referencing `nil`) are very different and this difference is reflected in the object's state.*

```ruby 
def initialize(name, grade=nil)
  @name = name 
  @grade = grade
end
```





---------------------------

3) **ENCAPSULATION**



*Encapsulation is shielding pieces of functionality and making it inaccessible to the rest of the codebase. It is a way of protecting data from manipulation without intent.  The creation of objects and methods, and the interaction between those objects, allows for more complexity in the code. The best practice in OOP is to use real-world language, which introduces a new level of abstraction as the programmer can think of programs in terms of nouns (classes) and verbs (methods).*

  1. <u>Objects encapsulate state</u>- *Ruby accomplishes encapsulation by creating objects and exposing interfaces (i.e. methods) to interact with those objects. An objects' state is saved in its instance variables. Instance variables are inaccessible outside of the class unless there are specific methods to expose them.  These accessor methods are specifically called getter methods and they allow us to call a method on an object to expose the value of the instance variables.*

  2. <u>Classes encapsulate behavior</u>- can further encapsulate through access modifiers 

     

     <u>Access Modifiers</u> 

*Encapsulation allows for the internal representation of an object to be hidden  from outside the class.  Through the use of access controls, there is added control and discretion given to the programmer.  Because Ruby interacts with objects through methods,  we comonly refer to these as method access controls.  Ruby uses the Module#public method to expose the properties and methods through the public interface. This is the default access control, so aside from the initialize method which is inheritantly private, all methods will be public unless expicitly stated otherwise. With the use of the module#private and module#protected methods, an error will be raised when trying to access those methods from outside the class.  This limits the public interface in terms of accesibility to those behaviors and states of an object.* 

```ruby 
class Being 
  def initialize(name)
    @name = name #@name is not available to the public interface unless a getter is defined 
  end
  
  private 
  
 attr_reader :name #This getter will only be available within the class due to the Module#private method 
end
```





------------------------

4. **ACCESSOR METHODS**



*Instance variables are inaccessible outside of the class unless there are specific methods to expose them.  These accessor methods are specifically called getter methods and they allow us to call a method on an object to expose the value of the instance variables.*

*An accessor method allows you to access the instance variables of an object. You would get a NoMethodError if you tried to access an instance variable from outside the class with no accessor methods available. There are getter methods which expose the instance variables, and setter methods which allow you to change the value of the instance variables from outside the class. In other words, getters and setters allow you to expose and change an object's state.* 

*The attr_accessor is a method defined in Module that defines both a getter and a setter method with the same name as the argument passed in as a symbol.*

<u>Why not add attr_accessor for every instance variable?</u>

*We don't want to add an attr_accessor for every instance variable because this would give the public access to both retrieve and change the values of the instance variables, or state of the object.  Each object encapsulates its' state by exposing interfaces to interact with those objects, therefor arbitrarily defining both a getter and a setter method might allow for more user access than desired.  Methods should be defined with purpose and intent, and extra functionality should not be added that may jeopardize the program through user manipulation.  An example is a program that initializes instance variables for a Username and a Password.  Both instance variables should be able to be changed (attr_writer: the setter), the Username should be able to be viewed (attr_reader: the getter), but the password should not be able to be viewed.  An attr_accessor would be appropriate in this case for the Username, and an attr_writer should be used for the password.* 



------------------------

5. **GETTER** 



*A getter method allows you to expose the state of an object(instance variable). An instance variable combined with the getter method is now said be an object's attribute. Without a getter method, a NoMethodError would arise when trying to access the instance variable from outside the class.  A shorthand for a getter method is the attr_reader which takes a symbol as an argument and returns the value of the instance variable with the same name. You might only need a getter if you only want to access the data, but don’t want or need to be able to change it.*

<u>Referencing Getter vs. Instance variable</u> 

**When using these methods from within the class, we generally want to utilize the getter and setter methods, instead of referencing the instance variables directly. This is helpful when the getter method alters the instance variable in any way.  If we reference the getter then we can easily resolve issues in the program that arise from that instance variable reference.* *In general, it is best practice to rely on sending "messages" (calling methods on objects).*

<u>Examples of Custom Getters</u>

```ruby 
class Doctor
  def initialize(name)
    @name = name
  end
  
  def name 
    "Doctor " + @name
  end
end
```

```ruby 
class Person
  attr_reader :name

  def initialize(name, ssn)
    @name = name
    @ssn = ssn.to_s
  end

  def ssn
    puts @ssn.chars.last(4).join("-")
  end
end

Person.new("chelsea", 123456789).ssn
```

*In the first example we can see that we can concatonate the return value of our instance variable to return something else.  If we use a getter, we will only return the value of the instance variable with that name, but if we use a custom getter, we can change the ouput in one part of the code- adhering to the DRY principle.  The second example shows how this is extremely useful in protecting private information while still exposing some pertinent information.* 

<u>Element Getter</u> 

```ruby 
def [](ind)    #getter
	array[ind]
end
```





-----------------

6. **SETTER**

QUOTE -------->

*Without prepending self within a setter method, instead of changing the value of the instance variable, you will initialize a new local variable to the value you wish to reassign the instance variable to. The instance variable's value will remain unchanged and you will have an local variable inaccessible to the rest of your program.*

------------->

<u>Custom Setter</u> 

*It's preferred to use a setter over direct reference because it makes making changes further down*
*the road within a class much more convenient, since you only have to make them in one place (the setter method's definition). Additionally, using a setter allows you to implement protections for what conditions might need to be met in order to be allowed to change some instance variable's value.*
*It's better to rely on methods than explicit assignment. We want our code to rely on sending "messages" (calling methods on objects) as opposed to explicit, hard-coded reassignment.*

```ruby 
class PhoneNumberDB
  attr_reader :phone_number

  def initialize(pin, phone_number)
    @pin = pin
    @phone_number = phone_number
  end

  def change_phone_number_to(new_number, input_pin)
    unless input_pin == pin
      return 'Invalid'
    end
    self.phone_number = new_number
  end

  private

  attr_writer :phone_number
  attr_reader :pin
end

chelsea = PhoneNumberDB.new('123', '123456789')
puts chelsea.phone_number
chelsea.change_phone_number_to('987654321', '123')
puts chelsea.phone_number
```



<u>Element Setter</u> 

```ruby 
def []= (ind, value)  #setter
	array[ind]= value
end
```



<u>Return Value</u> 

*Setter methods always return the value that is passed in as an argument, regardless of what happens inside the method. If the setter tries to return something other than the argument's value, it just ignores that attempt.*

```ruby 
class Dog
  def name=(n)
    @name = n
    "Laddieboy"              # value will be ignored
  end
end

sparky = Dog.new()
puts(sparky.name = "Sparky")  # returns "Sparky"
```





-----------------

7. **SELF**



*`Self` is a way of being explicit about what our program is referencing and what our intentions are as far as behavior.  Self refers to the calling object of the currently executing code.  When scoped within an instance method, `self` refers to the instance. While defining a class method, `self` refers to the class itself.  Self from within an instance method references the calling object, or the object instantiated from the class.  Self inside a class and outside of an instance method refers to the class itself.  When `self` is prepended to a method definition it defines a class method.*

*<u>Self when using a setter</u>* 

*Without prepending self within a setter method, instead of changing the value of the instance variable, you will initialize a new local variable to the value you wish to set the instance variable to. The instance variable's value will remain unchanged.  Adding `self` invokes the setter method on the calling object (an instance of the class).*

<u>Examples</u>

1) 

```ruby 
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.
```

*Upon instantiation of the new GoodDog object initialized to the local variable `sparky`, we initialize three instance variables: `@name`, `@height`, and `@weight`.  When we invoke the instance method `change_info`on `sparky` and pass in three arguments, the implementation of the method is actually creating three new local variables and assigning them to the values of the arguments. Because we did not prepend `name`, `height`, and `weight`within the body of the method with `self`, which refers to the calling object referenced by `sparky`, we are not invoking the intended methods.  To fix this we need to add `self` as the caller of the methods which will invoke the attribute setter methods and will reassign the values of the instance variables.  This way when `info` is called, we will return the intended values that reflect the change of state.*

```ruby 
 def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
```

*Invoking the `puts` method and passing in `sparky.info` will output the return value of the `info`method invocation on `sparky`.  Through string interpolation we ouput the intended sentence : "Spartacus weighs 45 lbs and is 24 inches tall."*



2. ```ruby 
   class Person
     attr_accessor :name
   
     def initialize(name)
       @name = name
     end
     
     def change_name
       name = name.upcase
     end
   end
   
   bob = Person.new('Bob')
   p bob.name 
   bob.change_name
   p bob.name
   ```

*In the code above, when we invoke the `change.name` method on `bob`, an instance of the Person class, we are unintentially attempting to initialize a local variable to its unitialized value upcased; it attempts to `upcase` `nil`, which of course is impossible as there is no `upcase` method available to `nil`.  This raises a NoMethodError error.  Instead we want to invoke the attribute setter method `name=` and invoke that on self, which within an instance method refers to the calling object- in our case `bob`.  We can change this implementation as follows:*

```ruby 
def change_name
    self.name = name.upcase
  end
```

*This will invoke the setter method and reassign the `@name` instance variable, exposed through the attribute getter method `name,` to the value of `@name` upcased.  Thus when we invoke the `name` attribute getter method on `bob`we will return the reassigned value `BOB`. `p`outputs the return value.* 



3. <u>What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.</u>

*Self refers to the calling object of the currently executing code. If a method is defined within a class and is prepended with 'self', then the calling object('self') is the class itself. An example of 'self' used within the class scope is as follows:* 

```ruby 
class Being
  @@number_of_beings = 0
  
  def initialize 
    @@number_of_beings += 1
  end
  
  def self.count #'self' prepended to a method definition refers to the class
    @@number_of_beings 
  end
  
  self #'self' outside a class/instance method but enclosed in the class refers to the class
end
```

 *'Self' can also be used within the object's scope, which means that the calling object is the object intantiated from a class. A method defined within a class that is not prepended with 'self' is an instance method and within that defined method, 'self' refers to the object itself.* 

```ruby 
class Being
  attr_accessor :name 
  
  def initialize(name)
    @name = name 
  end
  
  def change_name(name)
    self.name = name #An example of self being used within an instance method to differentiate from assigning a local variable. The calling object('self') is the object instantiated from the Being class and is calling the instance setter method 'name=' defined within the class. 
  end
end
  
```



*'Self' can also be called within a module outside of a method and would reference the module itself.*



4.

```ruby 
class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
  
  def change_grade(new_grade)
    grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
priya.grade 
```

<u>In the above code snippet, we want to return `”A”`. What is actually returned and why? How could we adjust the code to produce the desired result?</u>

*If we run this code, 'nil' will be returned.  We see here that `@grade` is initialized to `nil` upon instantiation of the Student object. When we invoke the #change_grade method and pass in the string 'A', the implementation of the method actually assigns a new local variable 'grade' to the argument passed into the method.  This was obviously not the intent, which is to reassign the value of the instance variable `@grade` to 'A'.  The way to do this is to explicitly declare the calling object as 'self' and invoke the `grade=` setter method defined in the class.  `self` in this case is the callinng object, the object referenced by `priya`.  This method invocation will pass in 'A' as an argument and reassign the instance variable to 'A'. We can confirm this by invoking the getter method and returning 'A'.*

```ruby 
def change_grade(new_grade)
  self.grade = new_grade 
end
```



5. ```ruby 
   class MeMyselfAndI
     self
   
     def self.me
       self
     end
   
     def myself
       self
     end
   end
   
   i = MeMyselfAndI.new
   ```

   <u>What does each `self` refer to in the above code snippet?</u>

   *The keyword self enables you to access the current object, or the object that is recieving the current message.  `self` within the class definition, but outside a method definition, refers to the class itself- in this example MeMyselfAndI class. `self` prepended to a method definition defines a class method and refers to the class itself- MeMyselfAndI class.  `self` within a class method refers to the calling object of that method, which is the class itself again.  `self` within an instance method (one not prepended by `self`) refers to the object instantiated from that class, in this case the object referenced by the local variable `i`.* 





------------

8. **CLASS METHODS/ VARIABLES**



*Class Methods are ones that we call on the class itself without having to instantiate a new object.  When defining a class method, we prepend the method name with the reserved word, `self`. Class methods are a way to have functionality that does not pertain to individual objects, or their state.*

*A class variable is created using two @ symbols (@@) and are specific to the entire class.  The class variable is scoped to the class and can be accessed from methods within the class. The class variable can reference data that is applicable to every instance of that class.  There is only one copy of a class variable and it is loaded as the code is run. This means that subclasses can change the value of a class variable for all subclasses and the superclass.*

<u>When writing the name of methods in normal/ md text, how do you write the name of an instance method? A class method?</u>

**ClassName#instance_method_name // ClassName::class_method_name*

<u>Difference between class method and instance method</u>

*Instance methods are those available to instances of a particular class and any subsequent subclasses. These methods are scoped at the object level.  They are not prepended with self in the definition, and the calling object is the object instantiated from that class.  Instance methods are behaviors that every instance of that class can access.  Public instance methods comprise the public interface in relation to the object, and instance methods of all access types are the way that the program interacts with said objects.  They contain information about the object's state which are only accessible and subject to manipulation via instance methods.*

*Class methods are prepended with self within the class definition, and are scoped at the class level. Self refers to the calling object, which is the class itself.  They are only accessible to the class, thus objects instantiated from the class cannot call these methods.  These behaviors are not specific to any one object of that data type, but are relevent to all objects of that class.* 





---------------

9. **ACCESSOR VS CUSTOM**

   

*When using these methods from within the class, we generally want to utilize the getter and setter methods, instead of referencing the instance variables directly. This is helpful when the getter method alters the instance variable in any way.  If we reference the getter then we can easily resolve issues in the program that arise from that instance variable reference. It's better to rely on methods than explicit assignment.  We want our code to rely on sending "messages" (calling methods on objects) as opposed to explicit, hard-coded reassignment.*

*Anytime you want to control how the user is able to access or change data a custom getter/setter is useful.  A custom getter and setter can be used to format and/ or validate the data.  This can add extra functionality to the method ex/ capitalize input .. make sure the input meets certain requirements before setting it to an instance variable.*

<u>SEE GETTER AND SETTER (#5,6) for examples of custom getters and setters</u> 





------------------

10. **CLASS VS OBJECT**



*<u>Object</u> - Everything in Ruby is an object, at least everything with a value.  Classes are the blueprint for objects, in such, objects are created from classes.  Objects are self-contained, and contain data (state) and have access to behaviors (instance methods) that can communicate with other objects. Objects created from the same class have access to the same behaviors, but do not share information with other objects of the same type.*

*<u>Class-</u> Classes define the attributes and behaviors of the objects instantiated from that class.  It is essentially a blueprint from which objects are created.  The methods inside the class can be available to the class itself (class methods- not available to objects) or instances of that class (instance methods).  All objects instantiated from the class will have access to the methods within the class.* 

*Classes are the blueprints in which objects are instantiated. Classes define behaviors and attribute signifiers that will be available to all instances of the class.  Classes encapsulate behaviors and will allow for further encapsulation of certain methods through access modifiers, which will limit the public access to certain behaviors and manipulations.  Objects are created from classes. They encapsulate the state of the object and have access to all the behaviors and attribute signifiers defined within their class/superclass. Objects do not share state and are self contained, but they do share the behaviors defined within the class.* 



SEE FALSE OPERATORS AND RETURNING A NEW CLASS WHEN ADDING (#35) Example 2



--------------------

11. **POLYMORPHISM**



*The ability for different types of data to respond to a common interface.  For example, if you call an enumerable method on an array containing different class types, and each one has access to a method with the same name as the one being invoked within the enumerable method, this is an example of polymorphism. In other words, objects of different data types responding to the same method invocation.  Polymorphism can involve inheritance from a common superclass, but that is not required.  Unless you design methods to be polymorphic with intention, you shouldn't use polymorphism.*

- *<u>Polymorphism through inheritance</u> (can also be defined as method overriding- which will allow objects of classes within a hierarichal relationship to respond differently to the same method invocation.* 

```ruby 
class Animal 
  def talk
    puts "Animal is talking"
  end
end 

class Dog < Animal 
 def talk 
   puts "Dog is talking"
 end
end 

[Animal.new, Dog.new].each {|el| el.talk}
```



- *<u>Polymorphism through duck-typing</u> (unrelated types responding to the same method name)- Working on the idea of what an object can do, rather than its class.* 

  - *Duck-typing occurs when unrelated types respond to the same method name.  We are not concerned with the type, only the behavior of the type. Duck-typing is a form of polymorphism, and it is an informal way to classify a type to objects.  Using Duck-typing, we are able to avoid lengthy case statements and invoke methods of the same name on unrelated classes.* 

    ```ruby 
    class Wedding 
      def planning
        [Photographer.new, Cook.new].each {|employee| puts employee.plan}
      end
    end
    
    class Photographer
      def plan 
        "#{self.class} takes photos."
      end
    end
    
    class Cook
      def plan
        "#{self.class} cooks."
      end
    end
    ```

    

- <u>*Polymorphism through interface*</u>- multiple classes that have the same module mixin. 

```ruby 
module Walkable 
  def walks
    puts "#{self.class} walks"
  end
end

class Dog 
  include Walkable
end

class Cat 
  include Walkable 
end

[Cat.new, Dog.new].each {|animal| animal.walks}
```





<u>Examples:</u>

1. ```ruby 
   class Animal
     def eat
       puts "I eat."
     end
   end
   
   class Fish < Animal
     def eat
       puts "I eat plankton."
     end
   end
   
   class Dog < Animal
     def eat
        puts "I eat kibble."
     end
   end
   
   def feed_animal(animal)
     animal.eat
   end
   
   array_of_animals = [Animal.new, Fish.new, Dog.new]
   array_of_animals.each do |animal|
     feed_animal(animal)
   end
   ```

   <u>What is output and why? How does this code demonstrate polymorphism?</u> 

   *This is an example of polymorphism through inheritance.  Both the Dog class and the Fish class are subclasses of the parent class Animal.  Each class defines their own implementation of the `eat` method.  The subclasses `eat` methods override the parent's `eat`method, so upon invocation the calling object will dictate where the method is resolved.  When we call the enumerable method `each`on the array containing an object from each class, we invoke the `Dog#feed_animal` method and pass in each object as an argument.  Within the body of the method we see the `eat` method being called upon each instance.  The Animal object will search within the Animal class to resolve the method call, and we see the output  'I eat.'  Next, the Fish object calls the `eat` method which gets resolved in the Fish class (overriding the parent class' `eat` method) and 'I eat plankton' gets output.  Finally `eat` gets called on the instance of the Dog class and the `eat` instance method gets resolved in the Dog class(calling object's class).  'I eat kibble.' is output.*  

   *This shows that different data types within a hierarchal structure can respond differently to a common interface through method overriding, which helps with code reusability and avoiding redundancy*. 





-------------------

12. **DUCK-TYPING**



*Duck-typing occurs when unrelated types respond to the same method name.  We are not concerned with the type, only the behavior of the type. Duck-typing is a form of polymorphism, and it is an informal way to classify a type to objects.  Using Duck-typing, we are able to avoid lengthy case statements and invoke methods of the same name on unrelated classes.*

- *There is intent, it makes sense to use these in a polymorphic manner (unlike the draw blinds/draw circle example)*
- *Unrelated types / no inheritance / no explicit relationship between player and computer*
- *Both respond to the same method name: pick_square*
- *Informal Type / Duck Type - they are both objects that can pick a square. This is the informal classification*

<u>SEE POLYMORPHISM(#11) for examples</u>





---------------------

13. **INHERITANCE**



*A class (subclass) inherits behaviors from another class, often called the superclass.* 

*A subclass has the characteristics of the superclass but is more refined.  The subclass has a "is-a" relationship with the superclass. Ruby does not allow for multiple inheritance. This allows Ruby to define basic classes with large reusability and smaller suclasses for more detailed behaviors. In this way, we can extract common behaviors and adhere to the DRY(don't repeat yourself) principle.*

- <u>*Class inheritance- superclass/subclass relationship*-</u> 
  - *Class inheritance is useful when defining an 'is-a' relationship.  If you can say the subclass 'is-a' superclass, using class inheritance is most likely the best solution. All subclasses of the superclass will have access to the methods defined within it's own class and the superclass. We do not want the subclass to have access to methods that are not appropriate for that data type, so limiting the public interface is necessary through correct code implentation.*

- <u>*Interface Inheritance- modules (mixins)*</u>
  - *Interface inheritance is inheritance through mixins.  It is useful for "has-a" relationships and often describes actions that an object has access to.  With interface inheritance, the class doesn't inherit from another type, but instead inherits the interface provided by the mixin module.  The result type is not a specialized type with respect to the module.  By extracting the logic into a contained module that groups similar behaviors, we can adhere to the DRY principle of coding and only include the module into classes that require those behaviors.*
    - *Because Ruby does not allow for multiple direct superclasses (single inheritance), mixins are a way to acquire multiple inheritance.  You can mixin as many modules as you like, so through class inheritance and interface inheritance you are able to have access to multiple inheritance.  Mixins act as a copy- paste of the methods within the module to the class.*





---------------

14. **METHOD OVERRIDING**



<u>Accidental method Overriding</u> 

*Accidental method overriding occurs when a method defined in some superclass is overridden by a method in some subclass to that superclass.  It occurs when we have two methods that share the same name and that method is invoked. An example is overriding the Object#send method which is defined in the parent class to take a number of arguments: the first as a symbol that is the method name wished to be invoked, and subsequent arguments which will be passed into our method invoked as arguments. If we override this method unintentionly in a subclass, and attempt to invoke that method on an object of the subclass, the implentation of the method may not be what we expect. This is due to the path that will be traversed to resolve that method call, aka the method lookup path. Ruby will search the calling object's class before traversing the method lookup path, so any method with the same name will resolve in the first place it is found.* 



<u>Why is it generally a bad idea to override methods from the Object class, and which method is commonly overriden?</u>

*A method commonly overriden is the to_s method, which outputs the class name and the encoding of the class object id.  When overriden within the class, you can give a more human- readable representation of the object when puts is called or during string interpolation.*

*Every class you create subclasses from the class Object.  If you override a method found in the Object class, it could have far-reaching ramifications.  Every class that subsequently subclasses from that class would inherit this overriden method and that may not be the intention.*  



<u>In inheritance, when would it be good to override a method?</u>

*If an object of a class cannot perform a certain behavior, you can subclass that object and override that method(behavior).  If most other subclasses of that superclass can perform that behavior present in the superclass, overriding within the subclass that cannot may be the best option.*

*Method overriding is also how we implement polymorphism through inheritance. (See POLYMORPHISM #11)*





--------------

15. **STATE VS BEHAVIOR**



*State and behavior are the internal representation of an object.  State refers to the entirety of instance variables and their values which are specific to each instance of a class.  State is not shared between objects of the same class, and is encapsulated by the object.  The only way to expose an object's state is through getter instance methods defined within the class.  Classes encapsulate behaviors, wich are methods defined in a class that all objects instantiated from that class and subclasses can access. They are essentially shared behaviors amongst all objects of that class, or define what the objects in that class are capable of doing.* 



<u>Example</u>

<u>Do `molly` and `max` have the same states and behaviors in the code above? Explain why or why not, and what this demonstrates about objects in Ruby.</u>

```ruby 
class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")
```

*The two local variables, `max` and `molly` are initialized to two separate instances of the Cat class. Upon instantiation they pass in two values to the initialize method wherein the `@name` and `@coloring` instance variables are initialized. The state of the object assigned to `max` is now`@name = 'Max', @coloring = 'tabby'`, and for the object referenced by `molly` we have `@name = 'Molly', @coloring = 'gray'`.  Because `max` and `molly` are both instances of the Cat class, they share behaviors. That is, they both have access to the methods defined within the Cat class.  However instances of the same class do not share state.  Even if the values of their instance variables were the same, their states would still be different.  This demonstrates how objects encapsulate themselves in Ruby and are self-contained.  Although they share common behaviors with other instances of their class, they are separate objects with separate state.* 





------------

16. **MODULE**



*A module is a collection of behaviors that is usable in other classes via mixins. A module is mixed in to a class via the include method invocation.  Modules do not inherit and the programmer can mixin multiple modules into a class. We can achieve polymorphism through modules because classes of different types that include the same module have access to the same methods.*

*This is a way to add interface inheritance to your program.  The goal here is to not repeat yourself (DRY code).  You see these mixins often named with an "able" suffix on a verb.  You can add as many mixins to your program as needed.*

*Because Ruby does not allow for multiple direct superclasses (single inheritance), mixins are a way to acquire multiple inheritance.  You can mixin as many modules as you like, so through class inheritance and interface inheritance you are able to have access to multiple inheritance.  Mixins act as a copy- paste of the methods within the module to the class.* 

*Modules can work great as containers when there are methods that seem out of place in the codebase.  By prepending the method with self (in this case, the module itself) we can call a method from outside the module using module name and method.  In this way, we can contain the out of place methods, and give them a module to call upon invocation.* 

*Namespacing is another use of modules, which means organizing similar classes under a module.  If we group related classes, we can easily recognize that they are related and it will reduce the likelihood of classes interfering with other similarly named classes in the codebase.*  

<u>Difference between modules and classes?</u>

*Modules are instances of the `Module` class, and classes are instances of the `Class` class. While objects can be instantiated from a class and classes can inherit from superclasses, that is not the case with modules.  Classes define the behaviors and potential attributes of objects; they are the blueprints in which objects are created.  There are two primary ways in which modules are used: namespacing and mixins.  It is best to think of a mixin module as a group of methods that can be essentially cut-and-paste into the class in which they are mixed in.  All objects will have access to the methods that are within a mixin included in that class or superclass.  The use of mixins is an example of interface inheritance, and a way that Ruby impliments multiple inheritance. There is no limit on the number of mixins that can be included in a class, but a subclass can only inherit from one superclass. A module used as a namespace is a container for similar or related classes. Modules named with a -able suffix are generally mixin modules, whereas a namespace module may be named with a describing word of some shared trait.* 

<u>Example</u> 

1.

```ruby 
module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk
```

<u>What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?</u>

*"Mike strolls forward", "Kitty saunters forward".  It makes more sense to use a mixin as the Cat class and the Human class are not related in the hierachical sense.  There is no 'is-a' relationship between Human and Cat therefor a hierachical relationship would be inappropriate for these two classes. Because one is not a subclass of the other, the method would need to be defined in both classes for the objects from these two classes to have access to the 'walk' instance method.  This would not adhere to the DRY principle of codeing, therefor extracting this behavior and defining it in a module which we can include in both classes would be better practice.* 

2. 

```ruby 
module Drivable
  def self.drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
```

<u>What is output and why? What does this demonstrate about how methods need to be defined in modules, and why?</u>

*NoMethodError is raised because the module `Driveable` included as a mixin to the Car class, defines a module method `drive` prepended with `self` which is the module itself.  When an instance of the Car class attempts to call a `drive` method, no instance method by that name is found.* 





________________

17. **INSTANCE VARIABLE/METHODS**



*An instance variable is a way to track an object's state.  It is preceded by the @ symbol and is scoped to whatever object self refers to. Instance variables are never public, and are accessed through getter methods. They are how we tie data to objects.*

*An instance method is defined within the class and is not preceded with self (which refers to the Class).  It provides functionality to one instance of a class. AKA singleton methods.*



<u>How they differ from local variables</u> 



1.

```ruby 
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
```

<u>What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?</u>

*This will output `nil` because the `@name` instance variable is never initialized, and uninitialized instance variables return `nil`.  When we call `p` and invoke the `name` getter method upon `bob`, we see this output the expected return value ,`nil`.  If we were to call the `set_name` method on the new Person object, the` @name` instance variable would be initialized to the string 'Bob', and the `name` method invocation would return 'Bob'.  This differs from local variables, as uninitialized local variables will raise a NameError error, thus we cannot reference uninitialized local variables as we can uninitialized instance variables.* 

2. ```ruby 
   module Swimmable
     def enable_swimming
       @can_swim = true
     end
   end
   
   class Dog
     include Swimmable
   
     def swim
       "swimming!" if @can_swim
     end
   end
   
   teddy = Dog.new
   p teddy.swim 
   ```

   <u>What is output and why? What does this demonstrate about instance variables?</u>

   *`nil` is output when we invoke `p teddy.swim`.  When we invoke`Dog#swim` on the Dog object `teddy`, the instance variable `@can_swim` is uninitialized, thus returns nil. It is important to note that, unlike uninitialized local variables which raise a NameError, uninitialized instance variables return `nil`.  Because `@can_swim`evaluates to `nil`, the expression to the left of the `if` conditional (the string 'swimming!') is not returned, and instead `nil` is returned since the conditional's body is not evaluated. The `Swimmable` module is included as a mixin in the `Dog` class, giving objects instantiated from this class access to the instance methods defined within the `Swimmable`module. If our Dog object `teddy`invoked the `enable_swimming`method prior to invoking the `Dog#swim` method, the `@can_swim` instance variable would be initialized to `true`.  If we were then to invoke the `swim`method on `teddy`, 'swimming' would be returned, as `@can_swim` is assigned to `true`.*



3. ```ruby 
   class Animal
     def initialize(name)
       @name = name
     end
   end
   
   class Dog < Animal
     def initialize(name); end
   
     def dog_name
       "bark! bark! #{@name} bark! bark!"
     end
   end
   
   teddy = Dog.new("Teddy")
   puts teddy.dog_name   
   ```

   <u>What is output and why?</u>

   

   *'bark! bark! bark! bark!' is output upon the `puts teddy.dog_name` method invocation.  We can see that the Dog class is a subclass of Animal class.  To instantiate a new Dog object we invoke the `new` method, which leads us to the `initialize` method.  Because an `initialize` method is defined in the Dog class, overriding the parent's `initialize` method, this is where the method call is resolved.  The string argument 'Teddy' is never initialized to an instance variable `@name` so when the `Dog#dog_name`method is invoked on the dog object referenced by the local variable `teddy` the string interpolation will return `nil`because an uninitialized instance variable returns `nil`. `to_s` is then called on `nil` which returns ` `(an empty string). This is different than an uninitialized local variable which will raise a NameError.  Therefor the string 'bark! bark!  bark! bark!' is ouput when the `puts` method is called.  If we took out the `Dog#initialize`method, the `initialize` method call would resolve in the Animal class and the `@name` instance variable would be initialized.  Another way to solve this would be to add `super` to the `Dog#initialize` method.  This would give us the desired output of "bark! bark! Teddy bark! bark!" when we invoked the dog_name method on `teddy`.*  





---------------

18. **COLLABORATOR OBJECT**



*A collaborator object is an object that is stored as another objects state.  All objects stored as state in another object are technically collaborator objects, but we are generally referencing custom objects. They are useful to connect different pieces of your program.  Collaborator objects allow you to modularize the problem into cohesive pieces, and allow you to model more complicated problems. The collaborator object generally exhibits a "has-a" relationship with the defining object.   When an instance variable is assigned to a new object, within a class, that new object's interface becomes available to the instance variable. This allow for purposeful connections and flexibility in a program.*

*Although there is no hierarchical relationship with the collaborator object, the incorporation of that object in another's state models a connection between the two that aids in the readibility and functionality of the program.  In a sense, they help to represent the connections between different parts of our program by abstracting certain areas of our code to more easily digestible concepts or ideas.  An example is a deck of cards that is comprised of card objects.  We can initialize an instance variable within the 'Deck' class to objects from the 'Card' class thus expanding our code accessibility and connections within our 'Deck' class.* 



<u>Examples</u> 

1. ```ruby 
   class Person
     def initialize(name)
       @name = name
     end
   end
   
   class Cat
     def initialize(name, owner)
       @name = name
       @owner = owner
     end
   end
   
   sara = Person.new("Sara")
   fluffy = Cat.new("Fluffy", sara)
   ```

   <u>What are the collaborator objects in the above code snippet, and what makes them collaborator objects?</u>

   *The collabotor objects in the code above are "Sara", "Fluffy", and `sara`.  While the two string objects aren't custom objects and are generally not what we are referring to when we speak of collaborator objects, they are objects stored as state within another object, which make them collaborators. The only custom collaborator object is `sara`, the local variable that is assigned to the custom Person object.  A collaborator object is an object that is stored as state within another object.  They work with the class they are associated with, and allow you to modularize the problem domain into cohesive pieces.  The collaborator object generally exhibits a "has-a" relationship with the defining object.   When an instance variable is assigned to a new object, that new object's public interface becomes available to an instance variable in a different class. This allow for purposeful connections and flexibility in a program, as well as added complexity and readability.* 

   

   2. ```ruby 
      class Person
        attr_accessor :name, :pets
      
        def initialize(name)
          @name = name
          @pets = []
        end
      end
      
      class Pet
        def jump
          puts "I'm jumping!"
        end
      end
      
      class Cat < Pet; end
      
      class Bulldog < Pet; end
      
      bob = Person.new("Robert")
      
      kitty = Cat.new
      bud = Bulldog.new
      
      bob.pets << kitty
      bob.pets << bud                     
      
      bob.pets.jump 
      ```

      <u>We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?</u> 

      *We raise an error in this code because we are attempting to invoke the `Pet#jump` method on an array assigned to the instance variable `@pets`.  There is no method available to an array with that name.  Although the Person class has no hierarchal relationship with the other classes, we can see that `kitty` and `bud` are collaborator objects within the Person object `bob`.  This is evident by the fact that both pets comprise part of the Person object's state- they are within the`@pets` array.  This gives us an informal 'has-a' relationship and allows the objects to access their class' interface from within the enclosing class. If instead we use an enumerable method to invoke the `jump` method on the instances of the Cat and Bulldog objects directly, we can resolve the method call in the parent class `Pet`.  This will ouput 'I am jumping!' twice, as both objects (`kitty` and `bud`) have access to the methods defined within the superclass `Pet`.*  

      ```ruby 
      bob.pets.each {|animal| animal.jump}
      ```

   

   

   ------------

   19. **CONSTANT VARIABLE**

   

   *A constant variable is a variable whose values you never want to change throughout the program. Constants are defined by using upper case letters (technically the first letter only needs to be capitalized).  Constants should be defined outside of the methods within the class.  Ruby constants are accessed within the class or outside of the class using this syntax: Class::constant.  The :: is a unary/scope/namespace resolution operator. Constants are available to the entire codebase using this scope resolution operator.*

   

   

   ---------------

   20. **to_s**

   

   *The `to_s` method comes built in to every class in Ruby from the `Object` class. The `to_s` method returns the name of the object's class and the encoding of the object id.  Every time `puts` is called or string interpolation is used, Ruby calls `to_s` on the evaluated argument.  To override this we can define our own `to_s` instance method within the class.  This allows us to make a more more human- friendly output while referencing the object.* 

   *Returns - Objects class and encoding of the object id.*

   

   <u>Examples</u>

   

   1. ```ruby 
      class Person
        attr_reader :name
      
        def initialize(name)
          @name = name
        end
      
        def to_s
          "My name is #{name.upcase!}."
        end
      end
      
      bob = Person.new('Bob')
      puts bob.name
      puts bob
      puts bob.name
      ```

      *Bob', 'My name is BOB', 'BOB'.  When we invoke the `name` getter instance method on the Person object referenced by the local variable `bob` we see that upon instantiation, the `@name` instance variable was initialized to the string 'Bob', which was passed in as an argument to the `new` method. When `puts`is invoked and passed in `bob.name`, 'Bob' is output.  When we pass `bob` into `puts` , we are calling the `to_s` method on `bob`.  This method is defined within the Person class, overriding `Object#to_s`.  Within the string interpolation, we see that the `String#upcase!` method mutates the string object referenced by the `@name` instance variable (which is returned by the getter method `name`) and returns the upcased value.  `to_s` is called on this return value and the string is inbedded in the given string.  This will return "My name is BOB."  Because the value of `@name` is mutated, when we call the `name` getter method again, the return value reflects this change.  Calling the `puts`method outputs the respective return values and returns `nil`.*

      *It bears mentioning that when we interpolated the return value of `name.upcase!` within our custom `to_s`, the `String#to_s` was called on this return value automatically.*

      

   2. ```ruby 
      class GoodDog
        DOG_YEARS = 7
      
        attr_accessor :name, :age
      
        def initialize(n, a)
          self.name = n
          self.age  = a * DOG_YEARS
        end
      end
      
      sparky = GoodDog.new("Sparky", 4)
      puts sparky
      ```

      <u>What is output and why? How could we output a message of our choice instead?</u>

      *The output would be the `to_s` method called on the object assigned to the local variable `sparky`. This will be the class name and the string representation of the encoded object's id.  We can override the `Obect#to_s` method and implement a more human- readable output by defining a `GoodDog#to_s` method within our class. Ex/*

      ```ruby 
      def to_s
        "My dog's name is #{name} and is #{age} years old!"
      end
      ```

      





-----------

21. **SUPER**



*The super keyword calls methods earlier in the method lookup path.  When you call super from within a method, it searches the method lookup path for a method with the same name, and then invokes it.  This is a way to extend functionality to a method.  Another way to use it is within the initialize method, which will call initialize and can give access to the instance variables higher in the method lookup path.*

*When super is called without an argument it will take the arguments from the method it is within and forwards them to the method super is invoking.  If you specify the arguments to super, it will only take those arguments.  If you call super() then no arguments will be passed to the parent method with the same name. This demonstrates that the way we invoke `super` is extremely important to achieving the proper, desired functionality.*  

<u>Examples</u>

1. ```ruby 
   class Animal
     attr_accessor :name
   
     def initialize(name)
       @name = name
     end
   end
   
   class GoodDog < Animal
     def initialize(color)
       super
       @color = color
     end
   end
   
   bruno = GoodDog.new("brown")       
   p bruno
   ```

   <u>What is output and why? What does this demonstrate about `super`?</u>

   *A GoodDog object is instantiated to the local variable `bruno` and the string "brown" is passed in as an argument to the `GoodDog#initialize` method.  This method overrides the `Animal#initialize` method as GoodDog is a subclass of Animal.  Within the body of the method, we see the keyword `super`. This will invoke a method with the same name as the enclosing method in the parent class. If no arguments are explicitly passed into `super`, the arguments passed into the enclosing method call will be passed into the parents' method call. We can see that in the case above, the string 'brown' is passed into `Animal#initialize` and the `@name`instance variable is assigned to that value.  Upon returning to the enclosing method, `@color`instance variable is initialized to 'brown' as well.  When we invoke the `p` method, we call `inspect` on `bruno` which returns the class name, encoding of the object's id and the state of the object- which now includes both `@name = 'brown', @color = 'brown'`.*  *`p` then outputs and returns this return value.*  

   *If we instead want to pass in no arguments to `super`, we would have to include `()` , or expicitly state which argument to pass in if we don't wish to pass in any/all of the enclosing methods arguments upon method invocation.* 

2. ```ruby 
   class Animal
     def initialize
     end
   end
   
   class Bear < Animal
     def initialize(color)
       super
       @color = color
     end
   end
   
   bear = Bear.new("black")  
   ```

   <u>What is output and why? What does this demonstrate about `super`?</u> 

   *This will raise an ArgumentError.  To instantiate a new Bear object, we invoke the `new` method which leads us to the `initialize` method.  Because the Bear Class is a subclass of the Animal class, we can see that `Bear#initialize`overrides the `Animal#initialize` method.  Within the body of the `initialize` method we see the `super` keyword, with no explicit arguments.  This will invoke a method with the same name as the enclosing method in the parent class and pass in all arguments passed into the enclosing method call. In this case, the string 'black' was passed in and because there is no `()`added to `super`, we pass that string argument into `Animal#initialize`. Because `Animal#initialize` isn't defined with a parameter and we are attempting to invoke it with an argument, we will raise an error.* 

   *The way to fix this is to add `()` to `super` - `super()`. If the parent's instance method defined less parameters than the subclass, you can explicitly define which to pass upon invocation.  This demonstrates the three ways in which we can use `super` and how the way we invoke `super` is extremely important to achieving the proper, desired functionality.*  

3. ```ruby 
   class Animal
     def initialize(name)
       @name = name
     end
   
     def speak
       puts sound
     end
   
     def sound
       "#{@name} says "
     end
   end
   
   class Cow < Animal
     def sound
       super + "moooooooooooo!"
     end
   end
   
   daisy = Cow.new("Daisy")
   daisy.speak
   ```

   <u>What does this code output and why?</u>

   *This outputs "Daisy says mooooooo!".   A new Cow object is instantiated and assigned to the local variable 'daisy'. The string 'Daisy' is passed into the #new method invocation as an argument.  Because the Cow class is a subclass of the Animal class, the #new method invocation will trigger the #initialize method defined within the Animal class. Within #initialize we are initializing the @name instance variable to the string 'Daisy'.  This is now part of our Cow object's state.  When @speak is invoked on 'daisy', the method lookup path will first check to resolve this method call in the Cow class. When it is not found, it will traverse the method lookup path and will check to see if it is found in the superclass Animal class.  The instance method #speak is found and we see it calling the puts method and passing in another method #sound.  Because our calling object is an object of the Cow class, this is where the method search begins.  We see that #sound is found within Cow.  Cow#sound  calls the 'super' keyword which will check the superclass for a method with the same name as the enclosing method and invoke that method, before returning to the enclosing method. Animal #sound implements string interpolation and references the instance variable @name, which is assigned to 'Daisy', so this method returns "Daisy says ". We then return to the Cow#sound method and contatonate this return value with the string 'moooo!'.  The speak method invokes the puts method and passes in the return value as an argument which outputs "Daisy says mooooooo!".*

4. ```ruby 
   class FarmAnimal
     def speak
       "#{self} says "
     end
   end
   
   class Sheep < FarmAnimal
     def speak
       super + "baa!"
     end
   end
   
   class Lamb < Sheep
     def speak
       super + "baaaaaaa!"
     end
   end
   
   class Cow < FarmAnimal
     def speak
       super + "mooooooo!"
     end
   end
   
   p Sheep.new.speak
   p Lamb.new.speak
   p Cow.new.speak 
   ```

   <u>What is output and why?</u> 

   *`Sheep.new.speak` will resolve the method call within the Sheep class.  The Sheep `#speak` method overrides the superclass' `#speak` method, and uses the keyword `super` to invoke the method with the same name as the enclosing method in the superclass.  FarmAnimal#speak will return the return value of the to_s method called on the new sheep object followed by "says " .  This is because string interpolation will call the to_s method on the calling object (`self` in this case, which is an instance of the Sheep class). Back within Sheep#speak this return value will then concatonate with the string 'baa!' to return the to_s method on the Sheep object followed by "says baa!".  `p Lamb.new.speak`will output return value of `to_s`called on `self` which in this case is a new Lamb object followed by "says baa! baaaaa!", The `speak` method invocation will resolve in the calling object's class, Lamb.  Lamb#speak uses the keyword super to invoke the method with the same name in the superclass, which again uses the keyword super to invoke the method with the same name in that class' superclass.  The final return value gets concatonated with 'baaaaa'.  `p Cow.new.speak`ouputs the return value of the to_s method called on the Cow object followed by "says mooooo!".  The #speak method invocation is resolved within the calling object's class. The super keyword withing the method will invoke the method with the same name in the superclass, FarmAnimal.  String interpolation is used to return the return value of the to_s method called on self(an object of the Cow class) with "says ''. This return value is concatonated with "moooo!" within the Cow#speak method.  The `p`method invocations will output the return values of the arguments passed in.  The way to fix this to a more readable code would be to add the `class`method invocation to self, which will return the class name of the calling object.*

```ruby 
  def speak
    "#{self.class} says "
  end
```





----------------

22. **METHOD LOOKUP**



*The method lookup path is the order in which classes are inspected when you call a method.  Ruby first looks in the class itself, then the modules (The last module included in the class will be first in the method lookup path), then the superclass, the superclasses modules, so on...Object, Kernal, BasicObject.  Ruby will traverse all the classes and modules in the method lookup path.  Mixins available to the superclasses will also be available to the subclass.  You can find the method lookup path by calling the ancestors method on the class.* 

<u>Examples</u>

1. ```ruby 
   module Walkable
     def walk
       "I'm walking."
     end
   end
   
   module Swimmable
     def swim
       "I'm swimming."
     end
   end
   
   module Climbable
     def climb
       "I'm climbing."
     end
   end
   
   module Danceable
     def dance
       "I'm dancing."
     end
   end
   
   class Animal
     include Walkable
   
     def speak
       "I'm an animal, and I speak!"
     end
   end
   
   module GoodAnimals
     include Climbable
   
     class GoodDog < Animal
       include Swimmable
       include Danceable
     end
     
     class GoodCat < Animal; end
   end
   
   good_dog = GoodAnimals::GoodDog.new
   p good_dog.walk
   ```

   <u>What is the method lookup path used when invoking `#walk` on `good_dog`?</u>

   *GoodAnimals::GoodDog < Danceable < Swimmable < Animal < Walkable < Object < Kernal < BasicObject*

2. ```ruby 
   class Thing
   end
   
   class AnotherThing < Thing
   end
   
   class SomethingElse < AnotherThing
   end
   ```

   <u>Describe the inheritance structure in the code above, and identify all the superclasses.</u>

   *In the code above, the `SomethingElse` class inherits from the `AnotherThing` class. That is, `SomethingElse` is a subclass of the superclass `AnotherThing`. `AnotherThing` inherits from `Thing`, where `AnotherThing` class is a subclass and `Thing` is a superclass. Thing class inherits from the `Object` class which inherits from the `BasicObject` class. If we invoked the `ancestors` method on the `SomethingElse` class, we would see that the method lookup path would traverse the entire class hierachy: SomethingElse < AnotherThing < Thing < Object < Kernal < BasicObject. Note that `Kernal` is a module included in the `Object` class and modules are also traversed through the method lookup path if included in a class/superclass.  Therefore within this path, every class following `SomethingElse`, excluding `Kernal`, is a superclass. This means that `SomethingElse` will have access to all the methods/ attribute signifiers available to those superclasses, unless method overriding overrides that functionality*

3. ```ruby 
   module Flight
     def fly; end
   end
   
   module Aquatic
     def swim; end
   end
   
   module Migratory
     def migrate; end
   end
   
   class Animal
   end
   
   class Bird < Animal
   end
   
   class Penguin < Bird
     include Aquatic
     include Migratory
   end
   
   pingu = Penguin.new
   pingu.fly
   ```

   <u>What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.</u>

   *Penguin < Migratory < Aquatic < Bird < Animal < Object < Kernal < BasicObject. Because the `Flight` Module is not included in the method lookup path, the instance of Penguin will not have access to the `fly` method invocation.  A `NoMethodError` will be raised.  We can check this by calling `ancestors` on the Penguin class.* 





------------------

23. **NAMESPACING**



*Namespacing is another use of modules, which means organizing similar classes under a module.  If we group related classes, we can easily recognize that they are related and it will reduce the likelihood of classes interfering with other similarly named classes in the codebase. You can instantiate a class contained in a module by using the namespace resolution operator, `::`  (Module::Class.new)*

<u>SEE MODULE (#16)</u>





--------------

24. **PUBLIC**



*Through encapsulation, we are able to hide the internal representation of an object from the outside and only expose the methods and properties that user's of the object need.  Method access controls allow us to limit the methods available to the public interface. We are able to hide how the method is implemented.  Using the least amount of public methods as possible allows us to simplify using that class and protect the data from undesired changes from the outer world.*

*<u>Method Access Control</u> is a way to further encapsulate objects by explicity defining what behaviors are available to the public interface.  Method access control is implemented with the three `Module` methods `public`, `private`, and`protected`. All methods are `public` unless explicitly stated otherwise, aside from the inheritantly `private` `initialize` method. This means that they are accessible to the object from outside the class.  Methods that only do work from inside the class should be either `private` or `protected`.  `Private` methods cannot have other objects as explicit callers, so comparing different objects can only be done through `public` or `protected` methods.  `Private` and `protected` methods cannot be called from outside the class, but `protected` methods act much like public methods from within the class.` Private` methods are appropriate when there is work being done within the class that does not need to be available to the public.  `Protected` methods work when we are comparing two objects, meaning there is another object as an explicit caller aside from `self`.* 

```ruby 
class Human
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def say_hey #public method that accesses private method
   puts  "Hi there, #{name}" 
  end

  def same_age?(other)
    puts age == other.age
  end
  
  protected

  attr_reader :age #making #age protected allows for us to have another object as an explicit caller in the #same_age? method
  
  private

  def name 
    @name 
  end
end
```





-------------------

25. **PRIVATE**



*These are for methods that are doing work within the class but don't need to be available to the rest of the program. Private methods help further encapsulate an object, they’re used to shield instance methods that aren’t necessary to be public from being accessed by the rest of the code-base. This eliminates unintentional changes to an object's state.  We cannot call a private method with any other object, not even one of the same type. We can only call a private method with the current object.*

SEE PUBLIC (#24) example for private example





----------

26. **PROTECTED**



*The protected keyword restricts access to the methods from outside the class by working as private, and acts as a public  from within the class.*  *Protected methods work when we are comparing two objects within the class, meaning there is another object as an explicit caller aside from `self`*.

- *From inside the class they act just like public methods*

- *From outside the class they act like private methods*

  

SEE PUBLIC (#24) example for protected example





----------------

27. **p and puts**



The `p` method outputs the call of #inspect on the object: the class, encoding of object id, and inititalized instance variables- state). 

`puts` outputs the call of `to_s` on the object which is the class name and encoding of the object id. 



<u>Example</u>

`puts`

```ruby 
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky
```

*The output would be the #to_s method called on the object assigned to the local variable 'sparky'. This will be the class name and the string representation of the encoded object's id.  `puts` will output this return value and retun `nil`. We can override the Obect#to_s method and implement a more human- readable output by defining a `GoodDog#to_s` method within our class.* 

`p`

```ruby 
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky
```

*Calling the 'p' method and passing in `sparky` will call the #inspect method on the argument, which in this case is an object instantiated from the `GoodDog` class assigned to the local variable ``sparky`. `inspect` will return the class name, encoded object's id, and the object's initialized instance variables (state). In this example, both `@name` and `@age` are initialized upon instantiation therefor both will be present upon the 'p' method invocation. `p` will then output and return the return value.* 





---------------

28. **Spike**



*Exploratory code to play around with the problem. This is throw- away code to confirm or disprove initial hypotheses.*





-----------

29. **Equivalence**



One of the most common fake operators to be overridden is the `==` equality operator. It is very useful to provide your own `==` method, which will override `BasicObject#==` that determines if two objects have the same object_ids(are the same object).  We may want to determine if an instance variable contains the same value as another object.  Defining this method also gives us a `!=` method automatically."

`==` and `.equal?` are defined in BasicObject and determines if the two values are the same object,, but each class should define a `==` method to specify the value to compare.  `==` is a method that you need to define to compare what value you want to compare (override)

`===` The `===` method asks if a number is within a range of numbers. in Range (like include?)*
*Can act as `.is_a?` to determine class ex/ class Being ;end a = Being.new Being == a (true)*
*Case statements use `===` implicitly* 

 `eql?` Same value and same class- Used implicitly in Hash. Determines if two objects contain the same value and if they're of the same class. 



<u>Example</u>

1.

```ruby 
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true
```

<u>In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`?</u>
<u>Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?</u>

*When we invoke the `BasicObject#==` method to compare the two Person objects, the implementation is checking to see if the two objects point to the same memory space- that is are the two objects the same object.  This is not what we are attempting to determine.  We want to figure out if the value of a specific attribute is the same.  The way to do this is to override the BasicObject method and define our own `Person#==` method within the class.*

```ruby 
def ==(other)
  name == other.name  #String#== method compares values of strings 
end #true
```

*This will now check if the two strings assigned to the `@name` instance variables of the two objects have the same value.  Because both objects's `@name` instance variables reference a string object with the value 'Alexander', it will return `true`.  To clarify, this does not mean that the string objects referenced by `al` and `alex`'s `@name` instance variables are the same object, only that they have the same value. We can verify this by writing this code :*

```ruby 
al.name.object_id == alex.name.object_id #false

#or we can define this method in our class, which also compares object_ids

def ==(other)
  name.equal?(other.name)
end #false
```



2. ```ruby 
   number = 42
   
   case number
   when 1          then 'first'
   when 10, 20, 30 then 'second'
   when 40..49     then 'third'
   end
   ```

   <u>What methods does this `case` statement use to determine which `when` clause is executed?</u>

   *This case statement uses different implementations of the case equality operator.  The `Integer#===` method is implemented in the first statement, `Integer#===` in the second, and `Range#===` in the third. It workds much like `include?` and determines whether the given value is within the values given.* 





-------------------

30. **SCOPING INSTANCE VARIABLES**



*Instance variables are scoped at the object level.  They track individual object state and do not cross over between objects.  The instance variable is accessible within the object's instance methods, even if defined outside of that method (don't require being passed in as an argument).  If you try to access an uninitialized instance variable you get nil instead of an Error.  You cannot access instance variables from outside the class without specific 'getter' methods.*

Example

1. ```ruby 
   class Person
     def initialize(n)
       @name = n
     end
     
     def get_name
       @name
     end
   end
   
   bob = Person.new('bob')
   joe = Person.new('joe')
   
   puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
   puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">
   
   p bob.get_name # => "bob"
   ```

   <u>What does the above code demonstrate about how instance variables are scoped?</u>

   *Instance variables are scoped at the object level and are only accesible through instance methods defined within the class. Upon instantiation of a Person object, the `@name` instance variable is initialized to the argument passed into the `new` method. This `@name` instance variable is only accessible to the public interface through the `get_name` (getter) instance method, but will show up as state when the `inspect` method is called on an object. This is an example of the object encapsulating the state, and only allowing exposure and manipulation of that state through defined instance methods.* 

   2. ```ruby 
      class Person
        TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']
      
        @@total_people = 0
      
        def initialize(name)
          @name = name
        end
      
        def age
          @age
        end
      end
      ```

      <u>What are the scopes of each of the different variables in the above code?</u>

      *The scope of the constant `Titles` is essentially everywhere in the codebase if we use the constant resolution operator `::`.  If the class in which the constant is defined, or subclass, references the constant, then no namespace resolution operator is necessary.  The class variable `@@total_people`is available anywhere in the `Person` class and any subclass of `Person`.  The instance variable `@name`is scoped at the object level and can only be accessed by instance methods.  The instance variable `@age`is also scoped at the object level and when accessed through the `age`instance method, will return `nil` as it is never initialized.* 

```ruby 
class Being
  def display_titles
    p Person::TITLES
  end
end

class Person < Being
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end

  def self.age #will return nil even if the @age instance variable is initialized 
    @age #not the same @age as the instance variable defined in the instance method
  end
end

class Me < Person
  def display_titles
    p TITLES
  end
  puts @@total_people
end

puts Person::TITLES
Me.new('chelsea').display_titles
Being.new.display_titles
```





---------------

31. **SCOPING CLASS VARIABLES**



*Class variables are scoped at the class level.  They are inaccesible from the outside of the class and contain data that pertains to every object of that class, in other words.. is not specific to any instance of that class. They can be used to track class level information.*

*All objects share 1 copy of the class variable- objects can access class variables via instance methods*

*Class variables are accessible to sub-classes and can also be resassigned from other sub-classes, so be careful when and if you wish to reassign a class variable from a subclass bc it will affect the superclass and all subclasses of that superclass. The class variable is loaded when the class is evaluated in Ruby.*

SEE SCOPING INSTANCE VARIABLES (#30) Example 2





------------

32. **SCOPING CONSTANT** 



*Constant variables have lexical scope (AKA static scope), meaning that where the constant is defined determines where it is available.  When Ruby tries to resolve a constant, it searches lexically. Accessible to both class and instance methods.  If a Constant is defined in an unrelated class, the Constant is inaccessible and will produce a NameError unless we reach into the defining class using the namespace resolution operator.*

*Constant resolution will resolve the constant in a lexical fashion, meaning that if the constant is referenced within a module where the constant is defined, it will resolve the constant within the module.  If the constant is unresolved lexically, is will traverse the inheritance hierachy until it resolves the constant.*



<u>Example</u>

1.

```ruby 
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides 
p Square.new.sides 
p Square.new.describe_shape 

```

<u>What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?</u> 

*When we invoke `p Square.sides` , we are calling the class method `sides`on the Square class. Because Square inherits from Quadrilateral which inherits from Shape, Square has access to the methods defined in said classes.  Ruby traverses the method lookup path and resolves this method call in the Shape class.  Here we see the class method, which is prepended with `self` referencing the calling object- the Square class.  Within the method definition, `self::SIDES` will begin the search to resolve the constant `SIDES` in `self` which is the Square class. Constants will resolve in a lexical fashion and then will traverse the method lookup path if it is unresolved.  Because `SIDES` is not found in Square, we resolve it in the superclass Quadrilateral.  `4` will be output.*  

 *When we invoke `p Square.new.sides`, we are calling the instance method `sides`on an object of the Square class.  We resolve this method call in the Shape class, which is within class hierarchy.  `self` within an instance method refers to the calling object, the instance of the Square class.  When we invoke the `class`method on the object referenced by `self`, the Square class is returned.  Via the constant resolution operator, `Square::SIDES`is where it begins to search for the constant `SIDES`.  Because our calling object is the Square class and constants resolve in a lexical fashion, we begin our search in that class. We then traverse the inheritance hierachy when we don't find it and it resolves in the Quadrilateral class. `4` will be output.*

*When we invoke `p Square.new.describe_shape` , we are calling the instance method `describe_shape` on an object of the Square class. We resolve this method call in the Shape class, where the Describable module is included.  Because `SIDES` is not called with a constant resolution operator, after searching lexically for the constant, Ruby will not have context on where to continue the search for constant resolution. A NameError will be raised.*  



SEE SCOPING INSTANCE VARIABLES (#30) Example 2





---------------------

33. **CLASS VARIABLE TREACHERY**



*Because class variables are loaded when the class is evaluated in Ruby, any reassignment of the class variable in any sub-classes will be visible upon defining that sub-class and can lead to unwanted ramifications in other subclasses as well as the superclass.  This is due to the fact that there is only one copy of the instance variable and it is accessible to any subclass.*

<u>Example</u>

1. ```ruby 
   class Vehicle
     @@wheels = 4
   
     def self.wheels
       @@wheels
     end
   end
   
   p Vehicle.wheels                             
   
   class Motorcycle < Vehicle
     @@wheels = 2
   end
   
   p Motorcycle.wheels                           
   p Vehicle.wheels                              
   
   class Car < Vehicle; end
   
   p Vehicle.wheels
   p Motorcycle.wheels                           
   p Car.wheels     
   ```

   <u>What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?</u>

   *The code above outputs 4, 2,2,2,2,2. This is because there is only one copy of a class variable available to the class and all subclasses.  Any reassignement of said class variable will be seen throughout all classes that have access to the variable (any class within the inheritance hierachy). Class variables contain information that is relevent to all objects of the class and subclasses, that is, it is not specific to any one instance of the class. When we invoke `self.wheels` upon the `Vehicle` class, at this point in the execution, `@@wheels`points at `4`. However, as soon as ruby processes the reassignment of `@@wheels`, now all references to `@@wheels` point at this new value `2` (as evidenced by the `p` method.*

   *We should avoid using class variables when working with inheritance for the reason above- any change in value will have repercussions throughout the code.  The class variable may be reassigned in a subclass and the reassignment may not be intended for the superclass and all subsequent subclasses.* 

   

2. ```ruby 
   class Shape
     @@sides = nil
   
     def self.sides
       @@sides
     end
   
     def sides
       @@sides
     end
   end
   
   class Triangle < Shape
     def initialize
       @@sides = 3
     end
   end
   
   class Quadrilateral < Shape
     def initialize
       @@sides = 4
     end
   end
   ```

   <u>What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?</u>

*`p Triangle.sides` returns `nil` because we never instantiated a new Triangle object (this is a class method resolved in the superclass Shape) so  the `Triangle#initialize` method is not invoked.  If we execute `Triangle.new` , the `Triangle#initialize`method is invoked upon instantiation of the new Triangle object and `@@sides` is reassigned to `3`.  The instance method `sides` is then invoked on the new Triangle object and resolves in the superclass Shape. The return value is the value of `@@sides`which is now `3`. This shows that there is only one copy of a class variable, and any change to that variable will be seen wherever that variable is accessible- superclass and all subclasses.  We should avoid using class variables when working with inheritance for the reason above- any change in value will have repercussions throughout the code.  The class variable may be reassigned in a subclass and the reassignment may not be intended for the superclass and all subsequent subclasses.*





------------

34. **NAMESPACE RESOLUTION OPERATOR**



*(scope/namespace/unary) resolution operator- helps to identify and specify the context to which an identifier refers.*





---------

35. **FALSE OPERATORS AND RETURNING A NEW CLASS WHEN ADDING**



*Many operators are in fact methods that Ruby gives special treatment to. Because they are methods, we can implement them in our classes and take advantage of the special syntax for our own objects. If we do that, we must be careful to follow conventions established in the Ruby standard library. Otherwise, using those methods will be very confusing.*

<u>How and why would we implement a fake operator in a custom class? Give an example.</u>

*A fake operator is one that is actually a method defined within a class.  Each class can have its' own implementation of a method, meaning the same method may behave differently depending on the class of the calling object. We would define a method for a fake operator if we wanted to override the functionality of a fake operator defined within a superclass.  For example, we can override the `== (equality)`method defined in the `BasicObject` class which directly compares two objects.  It may make more sense to determine if the two objects contain instance variables that point to the same value.  We can define a `==` method that then compares the two values, thus allowing more readibility and a more human-friendly interface. For example, if we have two human objects and we want to use the equality method to compare their names, we would implement that as follows:*

```ruby 
def ==(other)
  name == other.name
end
```

*assuming that the class in which this is defined has a `name` getter method defined.* 



Example

1. 

```ruby 
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes 
```

<u>What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?</u>

*The output is an array of Animal objects that includes all animal objects from the `mammals` and `birds` objects `@animal` arrays. The `<<`method is defined in the AnimalClass class and allows the argument to be added to the object's `@animal` array.  The `+`method is also defined, which allows two AnimalClass objects to add their `@animal` arrays together.  This is not what we would expect, as we are adding to `AnimalClass`objects and returning an array.  Instead we want to change the implementation so we return a new `AnimalClass`object:* 

```ruby 
def +(other_class)
  added = AnimalClass.new(name + ' & ' + other.name)
  added.animals = animals + other.animals 
  added
end
```



2. ```ruby 
   class Cat
   end
   
   whiskers = Cat.new
   ginger = Cat.new
   paws = Cat.new

<u>If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?</u>

*The `BasicObject#==` method determines whether the two objects are the same object- 'same' meaning that both objects are located at the same memory address. When we instantiate an object from a class, it has it's own unique memory address. That is, it has it's own state and object_id and is a completely separate object from any other object instantiated from that class. Therefor whiskers, ginger, and paws are all different objects and if we invoke the `==` equality method to compare any two, it will return `false`.  This demonstrates that objects instantiated from the same class share behaviors, but are separate objects.  If we wanted to compare some value within an object, then we can override the `BasicObject#==` method by defining our own Cat#== method.  Ex/* 

```ruby 
class Cat 
  attr_reader :name
  
  def initialize(name)
    @name = name 
  end
  
  def ==(other)
    name == other.name 
  end
end
```





---------------

36. **COMPARABLE**



```ruby 
class House
  attr_reader :price

  def initialize(price)
    @price = price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive
```

<u>What module/method could we add to the above code snippet to output the desired output on the last 2 lines, and why?</u>

```ruby 
class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end
  
  def <=>(other)
    price <=> other.price 
  end
end
```

*or*

```ruby 
class House
  attr_reader :price

  def initialize(price)
    @price = price
  end
  
  def <(other)
    price < other.price 
  end
  
  def >(other)
    price > other.price 
  end
end
```



37. **STRING INTERPOLATION QUOTE**



Within the `` ` method we see that string interpolation will evaluate the code inside the `#{}`   and call `to_s`on the return value, which then is inbedded into the string. 



38. **PUTS / P QUOTE**



`puts`

On line ` ` we execute `whole line of code` .  We invoke the `puts` method and pass in `argument of puts` as an argument which will output the return value of the argument and return `nil`.



`p` 

On line ` ` we execute `whole line of code` .  We invoke the `p` method and pass in `argument of p` as an argument which will output, and return, the return value of the argument. 

