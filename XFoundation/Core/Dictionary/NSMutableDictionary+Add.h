//
//  NSDictionary+Add.h
//  GIFoundation
//
//  Created by Ray on 2018/11/20.
//



NS_ASSUME_NONNULL_BEGIN


@interface NSMutableDictionary<KeyType, ObjectType> (Add)

typedef NSMutableDictionary<KeyType, ObjectType> *(^keyPlusValue)(NSString *, id);

+ (keyPlusValue)add;

- (keyPlusValue)add;

@end

NS_ASSUME_NONNULL_END
