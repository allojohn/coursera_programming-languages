### 技巧卡
  为什么要用Ruby,Racket,ML3种语言：因为它们再加上JAva，便构成了编程语言的4个象限：动态/静态类型 + 函数式/面向对象：
  * Ruby: 动态 + OOP
  * Racket: 动态 + 函数式
  * ML ： 静态 + 函数式
  * Java ： 静态  + OOP
  出处：Coursera: Programming Languages-introduction to Ruby
  
### 技巧卡
在命令行界面输入'irb'进入Ruby的REPL
  出处：
### 反常识卡
  反常识：Ruby中的所有**remain to be done** 都是对象
  印象：
  例子：

  出处：Coursera: Programming Languages-introduction to Ruby

### 任意卡
Ruby的OOP特点：
1. 所有的值都指向对象
2. 对象通过方法(method)(也称信息（message）)交流
3. 每个对象都有私有状态
4. 每个对象都是一个类的例子
5. 对象所属的类型，决定了对象的行为（behavior）
  出处：Coursera: Programming Languages-Programming Languages：introduction to Ruby
  
### 术语卡
  术语：new
  印象：新建对象的方法
  例子：已知类型A，可以在irb中调用 `B = A.new`创建A类对象B

  出处： 
  Coursera: Programming Languages
  

### 技巧卡
调用对象中的方法：如想要调用B对象中的方法c，可以用`B.c`来表示。
  出处：Coursera: Programming Languages-classes_and_objects
  
### 术语卡
  术语：self
  印象：指向对象本身，进而可以通过它再指向其它方法或值。可以用GEB里面的自指来理解，调用它之后便跨越到了对象层次（object），因而可以做更多的事情。
  例子：A中有方法m1,m2，m2不可以直接调用m1，**remain to be done**，但可以通过self.m1方式调用m2。

  出处：Coursera: Programming Languages-classes_and_objects
  
### 技巧卡
可以利用self连环嵌套：
`
class C
  def m1
    print "hi "
    self
  end
  def m2
    print "bye "
    self
  end
  def m3
    print "\n"
    self
  end
end
`
打印完字符串之后，返回的是self，这样可以继续调用其他方法。如`B.m1.m2.m1`, 可以打印出 "hi bye hi"
  出处：Coursera: Programming Languages-classes_and_objects
  
### 术语卡
  术语：object state/（instance variable）
  印象：描述对象的状态，名称以@开头方式命名。可以通过复制改变对象，别名方式（aliasing）创建的变量，不改变其值，对于新建的对象，状态重回初始值。
  例子：@ foo 

  出处：Coursera: Programming Languages-object_state
  
### 技巧卡
object state在未赋值之前，无法调用，但不会报错，而是返回nil。可以通过设置默认初始值的方法完善。
  出处：Coursera: Programming Languages-object_state
  
### 术语卡
  术语：aliasing
  印象：返回一个对象的引用。通过赋值语句表达。
  例子：已知对象x，则 `y=x` 返回对x的引用y。

  出处：Coursera: Programming Languages-object_state
  
### 术语卡
  术语：initalize
  印象：类似于Java中的constructor，初始化对象，可以对此传递参数，也可以对此默认复制。
  例子：`def initialize (x ,y = 1) {x;y } end `
  

  出处：Coursera: Programming Languages-object_state
  

### 术语卡
  术语：class variables
  印象：以@@开头，但不同于object state，它**被所有对象共享**。其值不仅仅会通过aliasing的赋值改变，该类的任意对象改变其值，它都会改变。
  例子：A类下有b,c 对象，有class variable E，E的初始值为0.b在使用@@E = 8时，c的@@E也会变成8

  出处：Coursera: Programming Languages-object_state
  
### 术语卡
  术语：class constants
  印象：类中的常量，开头需大写。与class variable不同，它在类外可见，方式是C::Foo
  例子：`Foo ` 此处因为大写，所以代表的是类中的常量，不应该被改变。

  出处：Coursera: Programming Languages-object_state
  
### 术语卡
  术语：class methods
  印象：与class constants类似，它是一个静态方法。命名的方式为`def self.method_name (args) end ` 通过C.method_name(args)调用
  例子：已知类型C，C类对象A，B，class method meth（），则调用该函数的方式，**不应该是A.meth(),而是C.meth()**。

  出处：Coursera: Programming Languages-object_state
  
### 技巧卡
object state（以单个@开头的变量）私有
* 只有该对象的方法可以调用，因此可以直接写成@foo,而不用写成e.foo。
* 如果需要改变object state为外部可见(publicly visible)，则可以调用"getters"以及“setters”方法。
  出处：Coursera: Programming Languages-visibility

### 术语卡
  术语：getters/setters
  印象：用来将私有的object state 变为 外部可见的*方法*
  例子：
  * `def get_foo = @foo end`
  * `def set_foo x= @foo = x end`
  *简化版*==>
  * getter:`def foo @foo end`
  * setter:`def foo= x
  @foo = x 
  end`
  出处：Coursera: Programming Languages-visibility
  
### 反常识卡
  反常识：Ruby函数中，以'=' 结尾的函数名，在表达式可以在名称与=之间加入等号。g
  印象：函数名称原来也可以不那么严格地调用。
  例子：在getter/setter函数设置的时候，`def foo= x`中，函数名其实是foo=,那似乎在表达的时候，只能用`foo= 4`，而不是`foo = 4`。因为加了空格之后，函数名其实就不同了。但是在Ruby中，这样的表达同样可以。

  出处：Coursera: Programming Languages-visibility 
  
### 技巧卡
object state私有的意义：隐藏这部分的内容，可以将模块的功能与实现相分离。
  出处：Coursera: Programming Languages-visibility 
  
### 技巧卡
3种可见程度：
1. private：只有对象本身可以调用
2. protected： 只有同类型的，或者其子类可以调用
3. public： 公开

**默认情况下，方法的属性为public**.
  出处： Coursera: Programming Languages-visibility 
  
### 反常识卡
  反常识：调用private方法m，应该直接用缩写m调用，而不是self.m。
  印象：因此self方法并非在任何情况下适用。
  例子：m，n为a类方法，那么在m方法中，可以通过m调用，而不是A.n

  出处：Coursera: Programming Languages-visibility 
  
### 反常识卡
  反常识：即使是Ruby中的值（value），也是对对象的引用（reference）
  印象：数字，nil，都是对象。
  例子：
  * `3.+（4）` :方法是'+' , 参数是4
  * `3.abs`
  * nil.nil? :nil也是对象
  
### 技巧卡
nil可以作为false值使用：
`if nil then puts "a" else puts "b" end`
=>b
  出处：Coursera: Programming Languages-everything_is_an_object
  
### 术语卡
  术语：所有的类都是object类的子类，因此在创建所有类的时候，自动继承object类中的方法。
  印象：新建的类其实还有老祖宗，它的名字叫object。object类内建了众多方法。丑陋的设计。参加王垠的文章[程序语言设计的常见错误：试图容纳世界](http://www.yinwang.org/blog-cn/2013/04/18/language-design-mistake2)
  例子：nil包含了许多来自object中的方法。

  出处：Coursera: Programming Languages-everything_is_an_object
  
### 术语卡
  术语：reflection
  印象：用来询问自身的特点.自指
  例子：
* nil.methods
* nil.class 
  出处：Coursera: Programming Languages-everything_is_an_object
  
### 反常识卡
  反常识：类的定义可以在运行时（runtime）修改。此类下的对象也会受到影响。
  印象：更加动态的语言，可以做到在更改类中的方法后，此时运行的此类对象中的方法也改变。
  例子：x = C.new  =>replace method older_m in C to new_m =>now x runs new_m.

  出处：Coursera: Programming Languages-class_definition_are_dynamic
  
### 术语卡
  术语：duck typing(鸭子类型)
  印象：让函数变得更加抽象、可复用的方法。原本函数只为鸭子类型而写，但是如果另一个方法如果同样可以使用，那么就可以认为这个函数可以放大到其他方法
  例子：
  'def mirror_update Pt 
    Pt.x = Pt.x * (-1)
	end'
  * 原来该函数的意思是，函数的参数是Pt对象，将其中其中的x变量乘以-1.
  * 但是duck typing为了做到尽可能的出现，将直接无视了参数 Pt，将Pt.x作为一个整体。因此，函数的意思变成了'y = y * (-1)' 也就是说，任何含义* 方法的对象。

  出处：Coursera: Programming Languages-duck_typing
  
### 反常识卡
  反常识：Ruby中的列表功能(array)非常灵活，可以调用众多方法。
  印象：列表类包含了众多的方法，可实现如插入，pop，压栈等功能。有的方法甚至可以接收新的函数。类似于closure。
  例子：
  * a= Array.new(10) 
  * a.shift 
  * a.push
  * x = Array.new(10) {0}
  * z = Array.new(10) {-i}

  出处：Coursera: Programming Languages-Arrays
  
### 术语卡
  术语：blocks
  印象：类似与函数式中的closure功能，**但并不完全是。**以`{funtion}`形式呈现
  例子：
  * `xs = [4,6,8].each{|x| if x> 5 then puts x else nil end}`

  出处：Coursera: Programming Languages-blocks
  
### 技巧卡
RUby中的block类似于array，同样拥有很多功能。如map （map），inject（reduce），select（filter)。 
例：
* `[4,5,6,7,8].select(|x| x > 4 && x < 30)`
* `[4,5,6,7,8].inject(0) {|acc,elt| acc + elt}`(其中0是初始值。)
  出处：Coursera: Programming Languages-blocks
  
### 技巧卡
block除了用`{}`表示之外，还可以用`do ... end`来表示
  出处：Coursera: Programming Languages-blocks
  

### 术语卡
  术语：yield
  印象：block中的一种使用方法，yield a代表a将要传递给一个block，但是这个block尚未确定。因此这就实现了block的抽象，将来可以传递不同的block给这个a。
  例子：
  `def silly 
 yield (4,5) + yield (0,0)
 end`
 ==>
 `silly {|x,y| x+y}`
 
  出处：Coursera: Programming Languages-using_blocks
  
### 技巧卡
block的局限：
block可以考yield传递不同函数，因而乍看它起到了first-class 功能，但是它只能传递函数，但是不能返回函数，也无法将它存储在一个对象当中。因此功能不完全。只能算“second-class” 。

  出处：Coursera: Programming Languages-procs
  
### 术语卡
  术语：hashes
  印象：包含了不同键（key）对值（value）的隐射
  例子：`hi = {} ;hi["bye"] = 'noe'`

  出处：Coursera: Programming Languages-hashes_and_ranges
  
### 术语卡
  术语：range
  印象：
  例子：`a = (1..9); a.inject(0) {|acc,elt| acc + elt}`

  出处：Coursera: Programming Languages-hashes_and_ranges
  
### 技巧卡
因为ranges,hashes,arrays有很多相似的功能，所以之前提到的duck typing 就可以在这里体现出来了。
* `def foo a
     a.count {|x| x*x < 50}
   end
   foo [3,5,7,9]
   foo(3..9)`
  出处：Coursera: Programming Languages-hashes_and_ranges
  
### 术语卡
  术语：dynamic dispatch
  印象：Ruby中dynamic dispatch方法不同于closure，它依据self的变化而调用不同的函数，而self的变化规则是从当前子类逐级回溯到父类。
  例子：
* 父类的函数中，m1调用m2,如果子类也定义了同名函数m2，那么在调用m1的时候，调用的将是子类中的m2.
  出处：Coursera: Programming Languages-overridding_and_dynamic_dispatch
  
### 任意卡
我自己很不赞成使用dynamic dispatch，因为它带来的开销非常明显，这种开销指的是，在编写、阅读代码的时候，都需要回溯到之前的代码中，构思新的函数会如何改变之前的模块。这就意味着很可能出现n的平方级别的复杂度。
  出处：Coursera: Programming Languages-dynamic dispatch and closures
  
### 术语卡
  术语：method lookup
  印象：回溯向上，有限调用函数的规则。
  例子：
* 对象e0 的的父类依次为e1-e2-e3-e4，那么如果要e0对象中的方法m1(不管这个m1是在哪个类中定义的)要调用方法m2，那么寻找的路径始终是e0-e1-e2-e3。实现方法是改变指针self指向的对象:e0->e1->e2->e3...

  出处：