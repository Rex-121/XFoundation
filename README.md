# XFoundation

[![Build Status](https://travis-ci.org/Rex-121/XFoundation.svg?branch=master)](https://travis-ci.org/Rex-121/XFoundation)
[![codecov](https://codecov.io/gh/Rex-121/XFoundation/branch/master/graph/badge.svg)](https://codecov.io/gh/Rex-121/XFoundation)
[![codebeat badge](https://codebeat.co/badges/3e433671-13e0-412c-bc0b-7c3f93c5887f)](https://codebeat.co/projects/github-com-rex-121-xfoundation-master)
[![Platform](https://img.shields.io/badge/platform-iOS-red.svg)](https://github.com/Rex-121/XFoundation)
[![requirements](https://img.shields.io/badge/requirements-iOS%209.0%2B-blue.svg)](https://github.com/Rex-121/XFoundation)

### Random 随机数

```object-c
///生成 0 - 10 之间的随机数
int zero_to_ten = XRandom(10);
NSLog(@"%d", zero_to_ten); /// 0-10 之间的数

///生成-10 - 10 之间的随机数
int ten_to_ten = XRandomInRange(-10, 10);
NSLog(@"%d", zero_to_ten); /// 生成-10 - 10 之间的随机数


随机数生产一对数字 （最小-最大）

@param from 起始
@param to 结束
@param div 中间量，如果小于0，取2
如果去 0-21 （div为3的情况） 之间的随机数
min：0-7 之间产生
max:7-21 之间产生
上述的 7 为 21/div(3)
@return 随机数 （最小-最大）
+ (NSArray <NSNumber *>*)randomMinMax:(int)from to:(int)to div:(int)div;
```

### Array 数组乱序

```object-c
/**
洗牌，对自身内部进行乱序处理

@discussion 具体实现为

(protocol) MutableRandomAccessCollection

-(void)shuffle

@return 随机排序后的数组
*/
- (nonnull NSArray *)shuffled;


/**
随机一个元素

@return 取出一个随机元素
*/
- (nullable id)randomElement;

@end

@protocol MutableRandomAccessCollection <RandomAccessCollection>


/**
对自身数据进行乱序处理，自身异变

@discussion NSMutableArray *array = @[@"-9",@"-4",@"-7",@"5",@"1",@"0",@"-3",@"6",@"-1",@"-4"];
[array shuffle];
NSLog(@"%@", array); //0,"-9",5,1,"-4","-7","-3",6,"-4","-1"

@[@"-9",@"-4",@"-7",@"5",@"1",@"0",@"-3",@"6",@"-1",@"-4"];
|     |____________________________________________|
i     j                                            k
将i与 j-k 区间里的随机一个交换，交换后 i ++，依此循环

- Complexity: O(n), where n is the length of the collection.

*/
- (void)shuffle;
```

## Requirements

iOS 9.0+

## Installation

XFoundation is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XFoundation'
```

## Author
Rex

