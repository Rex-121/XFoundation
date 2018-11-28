//
//  NSNumber+Random.m
//  XFoundation
//
//  Created by Ray on 2018/10/5.
//

#import "NSNumber+Random.h"

@implementation NSNumber (Random)

+ (int)randomTo:(int)to {
    if (to == 0) {
        return 0;
    }
    
    int random = arc4random() % abs(to);
    
    if (to > 0) {
        return random;
    }

    return random + to;
}

+ (NSString *)randomTo:(int)to withDecimal:(int)decimal {
    
    if (0 == to) { return @"0"; }
    
    int big = 0;
    
    BOOL nag = to < 0;
    
    big = [NSNumber randomTo:to];

    if (decimal <= 0) { return [NSString stringWithFormat:@"%d", big]; }
    
    NSString *afterDot = [NSNumber randomWithDecimal:decimal];
    
    if ((big == to) && nag) {
        big += 1;
    }
    
    return [NSString stringWithFormat:@"%d%@", big, afterDot];
}

+ (NSString *)randomWithDecimal:(int)decimal {
    NSString *afterDot = @".";
    for (int i = 0; i < decimal; i ++) {
        afterDot = [afterDot stringByAppendingFormat:@"%d", [NSNumber randomTo:10]];
    }
    return afterDot;
}

+ (int)random:(int)from to:(int)to {
    if (from > to) {
        return [self randomTo:to];
    }
        
    return [self randomTo:(to - from)] + from;
}

+ (NSArray<NSNumber *> *)randomMinMax:(int)from to:(int)to div:(int)div {
    if (div < 0) { div = 2; }
    
    ///差量
    int left = to - from;
    
    int halfEnd = left / div + from;
    
    int min = [self random:from to:halfEnd];
    int max = [self random:halfEnd to:to];
    
    return @[@(min), @(max)];
}

@end
