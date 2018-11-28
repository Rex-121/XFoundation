//
//  PriceRange.h
//  ZLOTC
//
//  Created by Ray on 2018/9/28.
//  Copyright © 2018 ChuangShiZhiLian. All rights reserved.
//

#import <Foundation/Foundation.h>

struct PriceSuchRange {
    ///下限
    CGFloat down;
    ///上限
    CGFloat up;
    ///小数点
    NSInteger decimal;
};

@interface XRange : NSObject


/**
 初始化方法
 
 @param down 最小值
 @param up 最大值 (当最大为 null 时，认定为 Infinity)
 @param decimal 小数位数（在执行任意判断时, 超出此位数的数目将会被忽略, 默认为 0）
 @return range
 */
+ (instancetype)range:(NSString *)down to:(NSString *)up :(NSInteger)decimal;

/** 区间 */
@property (nonatomic, assign)struct PriceSuchRange range;

/**
 是否在此区间内 （在执行任意判断时, 超出 `decimal` 位数的数目将会被忽略）
 
 PriceRange *range = [PriceRange range:0 to:5.1234 :4];
 
 意味着 5.1234567 在 range 区间内
 
 @param value 值
 @return 是否在区间内
 */
//- (BOOL)ignorConsWhichContain:(NSNumber *)value;

/**
 是否在此区间内 (忽略 `decimal` 位数限制)
 
 PriceRange *range = [PriceRange range:0 to:5.1234 :4];
 
 意味着 5.1234567 不在 range 区间内
 
 @param value 值
 @return 是否在区间内
 */
- (BOOL)contain:(NSNumber *)value;




/**
 区间

 @return 50 - 70
 */
//- (NSString *)stringValue;

/** 是否无穷大 */
@property (nonatomic, readonly, getter=isInfinity)BOOL infinity;


///如何定义 无穷大
- (NSSet <NSString *>*)howU_Define_Infinity;

@end




