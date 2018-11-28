//
//  NSNumber+Compare.m
//  XFoundation
//
//  Created by Ray on 2018/10/23.
//

#import "NSNumber+Compare.h"

@implementation NSNumber (Compare)

+ (BOOL)biggerThan:(NSNumber *)one :(NSNumber *)two {
    return [one compare:two] == NSOrderedDescending;
}

+ (BOOL)biggerThanOrEqual:(NSNumber *)one :(NSNumber *)two {
    return [one compare:two] != NSOrderedAscending;
}

@end
