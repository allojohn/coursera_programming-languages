### 技巧卡
函数式与OOP分解的方式不同：

* 函数式将程序分解为一个个函数，这些函数执行不同的操作。
* OOP将程序分解为一个个对象，这些对象在接受外界数据的情况下给出对应操作。

出处：Coursera: Programming Languages-OOP_versus_functional_decomposition

### 技巧卡
在处理任何一种编程语言的时候，都可以从两大维度去思考。

1. 变量
2. 操作
出处：Coursera: Programming Languages-OOP_versus_functional_decomposition

### 技巧卡
ML中分解程序的方式：在课程的实例中，各类变量用datatype统一，而对各种变量的操作，也因此变得简洁，可以添加针对该datatype的函数去解决。
出处：Coursera: Programming Languages-OOP_versus_functional_decomposition

### 金句卡
> * Fp and OOP often doing the same thing in exact opposite way--Organize the program "by row" or "by column"
* Which is "most natural" may depend on what you are doing (e.g., an interpreter vs. a GUI) or personal taste
* Code layout is important,but there is no perfect way since software has many dimensions of structure --Tool,IDEs can help with multiple "views"(e.g.,rows/columns)

出处：Coursera: Programming Languages-OOP_versus_functional_decomposition


### 技巧卡
For some operations over two(mutiple) arguments,functions and pattern-matching are straightford,but with OOP we can do it with double dispatch(multiple dispatch)
  出处：Coursera: Programming Languages-OOP_versus_functional_decomposition

### 技巧卡
在可扩展性方面，如果扩展的主要是函数，那么函数式更方便。如果扩展的主要是变量，那么主要使用的是OOP，因为可以将变量当成对象来添加。但是情况再复杂一些，两者都要添加的时候，就需要使用新的方法。
  出处：Coursera: Programming Languages-Adding_Operations_or_variants

### 术语卡
  术语：mixin
  印象：一组函数，而不是类。添加某些类
  例子：

  出处：