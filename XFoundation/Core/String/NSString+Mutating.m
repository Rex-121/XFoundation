//
//  NSString+Mutating.m
//  XFoundation
//
//  Created by Ray on 2018/10/8.
//

#import "NSString+Mutating.h"

#import "NSString+XExt.h"

#import <Foundation/Foundation.h>

@implementation NSString (Mutating)


- (NSString *)erase:(NSString *)sets {
    return [NSString erase:sets from:self];
}
- (NSString *(^)(NSString *))erase {
    return ^NSString *(NSString *sets) {
        return [self erase:sets];
    };
}

- (NSString *)dropZero {
    return [self erase:@"0"];
}

- (NSString *)dropAllDigits {
    return [NSString dropAllDigitNum:self invert:NO];
}

- (NSString *)leftAllDigits {
    return [NSString dropAllDigitNum:self invert:YES];
}

- (BOOL)isDecimal {
    NSScanner* scanner = [NSScanner scannerWithString:self];
    NSDecimal d;
    return [scanner scanDecimal:&d] && [scanner isAtEnd];
}

- (NSString *)dropAllWhiteSpace {
    return [NSString dropAllSpace:self];
}

@end
