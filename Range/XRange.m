//
//  PriceRange.m
//  ZLOTC
//
//  Created by Ray on 2018/9/28.
//  Copyright © 2018 ChuangShiZhiLian. All rights reserved.
//

#import "XRange.h"

@interface XRange ()
/**  */
@property (nonatomic, strong)NSString *coin;

@end

@implementation XRange

- (NSSet<NSString *> *)howU_Define_Infinity {
    return [NSSet setWithObjects:@"Infinity", nil];
}

+ (instancetype)range:(NSString *)down to:(NSString *)up :(NSInteger)decimal {
    
    __kindof XRange *range = [self new];
    
    range -> _range.down = down.floatValue;
    
    [range defineInfinity:up];
    
    if (decimal < 0) { decimal = 0; }
    
    range -> _range.decimal = decimal;
    
    return range;
}

///处理 ♾无限
- (void)defineInfinity:(NSString *)up {
    if ([[self howU_Define_Infinity] containsObject:up]) {
        _range.up = CGFLOAT_MAX;
        _infinity = YES;
    }
    else {
        _range.up = up.floatValue;
    }
}

- (BOOL)contain:(NSNumber *)value {
    return [XRange compar:@(self.range.down)
                           up:@(self.range.up)
                         with:value];
}

//- (BOOL)ignorConsWhichContain:(NSNumber *)value {
//
//    return [XRange compar:@(self.range.down)
//                           up:@(self.range.up)
//                         with:value];
//
//}

//NSComparisonResult lowerResult = [self.subject compare:self.lowerEndpoint];
//NSComparisonResult upperResult = [self.subject compare:self.upperEndpoint];
//return (lowerResult == NSOrderedDescending || lowerResult == NSOrderedSame) &&
//(upperResult == NSOrderedAscending || upperResult == NSOrderedSame);

+ (BOOL)compar:(NSNumber *)down up:(NSNumber *)up with:(NSNumber *)value {
    NSComparisonResult lowerResult = [value compare:down];
    NSComparisonResult upperResult = [value compare:up];
    return (lowerResult == NSOrderedDescending || lowerResult == NSOrderedSame) &&
    (upperResult == NSOrderedAscending || upperResult == NSOrderedSame);
    
//    if (result == NSOrderedDescending) {
//        return NO;
//    }
//
//    ///如果是无穷大
//    if (infinity) { return YES; }
//
//    result = [DataTools compare:up to:value];
//
//    if (result == NSOrderedAscending) {
//        return NO;
//    }
//
//    return YES;
}

//- (NSString *)stringValue {
//    
//    if (self.isInfinity) {
//        return [NSString stringWithFormat:@"%@ - ∞", [self decimaledValue:@(self.range.down)]];
//    }
//    
//    return [NSString stringWithFormat:@"%@ - %@", [self decimaledValue:@(self.range.down)], [self decimaledValue:@(self.range.up)]];
//}

@end

