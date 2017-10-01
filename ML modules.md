### 术语卡
术语：signature
印象：指定模块的输入输出类型
例子：
`signature MyMathLib =
sig
val fact : int -> int
val half_pi : Math.pi / 2.0
end `

出处：Signatures and Hiding Things

### 术语卡
术语：structure
印象：实现模块功能，该关键词用于封装一系列函数。signature 可提前规定所需实现的类型（关键词':>'）。
例子：
`structure MyMathLib :> MyMathLib =
fun fact x = ...
fun half_pi = Math.pi / 2 `

出处：modules for namespace management

