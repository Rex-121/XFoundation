//
//  NSArray+Find.m
//  XFoundation
//
//  Created by Ray on 2018/10/15.
//

#import "NSArray+Find.h"

#import "NSNumber+Random.h"

@implementation NSArray (Find)

- (id)firstMatch:(predicate)predicate {
    
    if (!self.count) { return nil; }
    if (1 == self.count) { return predicate(self.firstObject) ? self.firstObject : nil; }
    
    XIndex index = [self findMatch:predicate];
    return index.outOfBounds ? nil : self[index.index];

}

- (XIndex)firstElementMatch:(predicate)predicate {
    
    if (!self.count) { return XIndexNull(); }
    if (1 == self.count) { return predicate(self.firstObject) ? XIndexMake(0) : XIndexNull(); }
    return [self findMatch:predicate];
    
}

- (XIndex)findMatch:(predicate)predicate {
    for (int i = 0; i < self.count; i ++) {
        if (predicate(self[i])) {
            return XIndexMake(i);
        }
    }
    return XIndexNull();
}

- (NSArray *)shuffled {
    if (self.count <= 1) { return [self copy]; }
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array shuffle];
    return array;
}

- (id)randomElement {
    if (self.count <= 1) { return self.firstObject; }
    return self[XRandom((int)self.count)];
}

- (void)mapping:(void (^)(id _Nonnull))map {
    if (!map) { return; }
    for (id obj in self) { map(obj); }
}

- (NSArray *)map:(id  _Nonnull (^)(id _Nonnull))map {
    if (!self.count) { return @[]; }
    if (1 == self.count) { return @[map(self.firstObject)]; }
    
    NSMutableArray *a = [NSMutableArray arrayWithCapacity:self.count];
    [self mapping:^(id  _Nonnull obj) {
        [a addObject:map(obj)];
    }];
    return a;
}

@end


@implementation NSMutableArray (RandomAccess)

- (void)shuffle {
    
    if (self.count <= 1) { return; }
    
    int count = (int)self.count;
    
    int i = 0;
    
    while (i < (count - 1)) {
        int j = [NSNumber random:(i + 1) to:count];
        [self exchangeObjectAtIndex:i withObjectAtIndex:j];
        i ++;
    }
}

@end
