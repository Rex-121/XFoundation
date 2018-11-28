//
//  NSArray+String.m
//  XFoundation
//
//  Created by Ray on 2018/10/17.
//

#import "NSArray+String.h"


@implementation NSArray (String)

- (NSString *)words:(NSString * _Nonnull (^)(id _Nonnull))display joinedBy:(NSString *)join {
    
    if (!self.count) { return join.length ? join : @""; }
    
    NSMutableArray <NSString *>*array = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id obj in self) {
        [array addObject:display(obj)];
    }
    
    return [array componentsJoinedByString:join];
}

@end

@implementation NSDictionary (String)

- (NSArray<NSString *> *)flatKeyValue:(NSString * _Nonnull (^)(id _Nonnull))display joinedBy:(NSString *)join {
    if (!self.allKeys.count) { return @[]; }
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.allKeys.count];
    
    for (NSString *key in self.allKeys) {
        [array addObject:[key stringByAppendingFormat:@"%@%@", join, display(self[key])]];
    }
    return array;
}

- (NSString *)flatKeyValue:(NSString * _Nonnull (^)(id _Nonnull))display joinedBy:(NSString *)join pending:(NSString *)pending {
    return [[self flatKeyValue:display joinedBy:join] componentsJoinedByString:pending];
}

@end
