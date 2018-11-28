//
//  NSDictionary+Add.m
//  GIFoundation
//
//  Created by Ray on 2018/11/20.
//

#import "NSMutableDictionary+Add.h"

@implementation NSMutableDictionary (Add)

- (keyPlusValue)add {
    return ^NSMutableDictionary *(NSString *key, id obj) {
        
        if (!obj) { return self; }
        
        [self setValue:obj forKey:key];
        
        return self;
    };
}

+ (keyPlusValue)add {
    return ^NSMutableDictionary *(NSString *key, id obj) {
        return [NSMutableDictionary dictionary].add(key, obj);
    };
}

@end
