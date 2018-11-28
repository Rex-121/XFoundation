//
//  NSNumber+Random.h
//  XFoundation
//
//  Created by Ray on 2018/10/5.
//

#import <Foundation/Foundation.h>


@interface NSNumber (Random)

/**
 随机数
 生成 0～`to`之间的数
 
 @discussion 如果 `to` 为正数, 返回 0 <= Int < to;
 
 如果 `to` 为负数, 返回 to <= Int < 0
 
 @param to 结束
 @return (to 为正数时) 0 <= Int < to   |-|-|-|   (to 为负数时) to <= Int < 0
 */
+ (int)randomTo:(int)to;

/**
 随机 `from` - `to` 之间的随机数 --> 如果 `from` 大于 `to` 将忽略 `from` 生成 0～`to`之间的数
 
 @discussion int rangeX = [NSNumber random:from to:random];
 
 from <= rangeX < to
 
 @param from 起始
 @param to 结束
 @return from <= Int < to
 */
+ (int)random:(int)from to:(int)to;

/**
 随机 0 - `to` 之间的随机小数
 
 @discussion int rangeX = [NSNumber randomTo:10 withDecimal:2];
 
 from <= rangeX < to
 
 @param to 结束
 @return from <= Int < to
 */
+ (NSString *)randomTo:(int)to withDecimal:(int)decimal;

/**
 随机数生产一对数字 （最小-最大）
 
 @param from 起始
 @param to 结束
 @param div 中间量，如果小于0，取2
 如果去 0-21 （div为3的情况） 之间的随机数
 min：0-7 之间产生
 max:7-21 之间产生
 上述的 7 为 21/div(3)
 @return 随机数 （最小-最大）
 */
+ (NSArray <NSNumber *>*)randomMinMax:(int)from to:(int)to div:(int)div;

@end

NS_INLINE int XRandom(int to) {
    return [NSNumber randomTo:to];
}

NS_INLINE int XRandomInRange(int from, int to) {
    return [NSNumber random:from to:to];
}

NS_INLINE BOOL YesOrNo() {
    return [NSNumber randomTo:2];
}
