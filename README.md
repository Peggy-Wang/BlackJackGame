# BlackJackGame
2月23号做完了仿知乎日报，之后就在构思继续用swift实现一个小游戏，最后决定做21点扑克牌游戏。开始建项目的时候已经是25号了，离deadline还有不到3天，所以做的比较匆忙，效果也比较简陋。

21点应该算是扑克牌玩法中最简单的玩法了，我自行修改了一部分规则，玩家可以参考游戏内的规则页面。

# 基础页面展示
* 主页面，有跟牌、停牌、更改下注和规则四个选项。
  * ![image](https://github.com/Peggy-Wang/BlackJackGame/blob/master/主页面.PNG)
* 规则页面
  * ![image](https://github.com/Peggy-Wang/BlackJackGame/blob/master/规则页面.PNG)
* 显示结果时的页面（此时隐藏跟牌和停牌选项）
  * ![image](https://github.com/Peggy-Wang/BlackJackGame/blob/master/结果显示.PNG)
* 显示更改下注时的页面（此时隐藏跟牌和停牌选项）
  * ![image](https://github.com/Peggy-Wang/BlackJackGame/blob/master/更改下注显示.PNG)

# 结构简析
基本设计思路：

21点主要就是通过判断各种牌组合而成的多种情况，在开局形成黑杰克局面时或玩家选择停牌操作后得出游戏结果：玩家胜利/庄家胜利/平局。

将实现游戏逻辑的操作封装在函数中，UI界面再根据玩家的操作来调用函数，得出结果时显示相应的结果页面。
* Card结构(Card.swift)：包括card的属性（花色，类型和点数）和发牌（初始化一副牌）、洗牌、将每张牌与其图片的编号对应起来等功能
* Data结构(Data.swift)：里面记录了所有的数据，以及根据游戏规则来更改数据的函数
* 游戏主页面(GameView.swift)：两个卡牌模块界面（包含牌的图像显示、角色、金币和下注等信息） + 四个选项的Button，在显示结果页面和更改赌注页面时，会覆盖涉及游戏操作的跟牌和停牌两个Button。
* 一些细节：
  * 实际上的发牌顺序应该为玩家和庄家交替从牌堆一侧开始，我在实现发牌时为了方便起见从牌堆的两侧开始发牌，玩家发牌从牌堆的0号开始，依次递增，庄家发牌从牌堆的最后一号开始，依次递减。
  * 在开局一瞬间，所有的牌就已经全部发出去了，用变量player/dealer cardNumber来控制显示的数量，开局时这两个变量都是2，之后每发一张牌就相应增加1.
  * 关于扑克牌的显示：时间关系我没有设计多数量（每个人大于4张）扑克牌的显示布局，用了暴力的方法只显示前四张牌。每个人的牌数大于4张是小概率事件，经过测试出现的频率很低。以后有机会的话我会做包括游戏玩法上的进一步完善。
