//
//  NSArray+Find.h
//  XFoundation
//
//  Created by Ray on 2018/10/15.
//

#import <Foundation/Foundation.h>

typedef struct _XIndex {
    BOOL outOfBounds; ///是否越界
    NSInteger index;
}XIndex;


NS_INLINE XIndex XIndexMake (NSInteger i) {
    XIndex r;
    r.index = i;
    r.outOfBounds = i < 0;
    return r;
}

NS_INLINE XIndex XIndexNull () {
    return XIndexMake(-1);
}

#import "RandomAccessCollection.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (Find)<RandomAccessCollection>

typedef BOOL(^predicate)(ObjectType obj);


/**
 第一个满足条件的元素

 @param predicate 满足条件
 @return 元素
 */
- (nullable ObjectType)firstMatch:(predicate)predicate;


/**
 第一满足条件的元素的序号

 @param predicate 满足条件
 @return 序号
 */
- (XIndex)firstElementMatch:(predicate)predicate;

///乱序数组
- (nonnull NSArray <ObjectType> *)shuffled;
///随机选择一个元素
- (nullable ObjectType)randomElement;

- (void)mapping:(void (^_Nullable)(ObjectType obj))map;

- (NSArray *)map:(id (^)(ObjectType obj))map;

@end

NS_ASSUME_NONNULL_END

@interface NSMutableArray<ObjectType> (RandomAccess)<MutableRandomAccessCollection>

@end


