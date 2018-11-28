//
//  NSNumber+Compare.h
//  XFoundation
//
//  Created by Ray on 2018/10/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Compare)


/**
 是否大于

 @param one one
 @param two two
 @return one 是否大于 two
 */
+ (BOOL)biggerThan:(NSNumber *)one :(NSNumber *)two;

/**
 是否大于或者等于

 @param one one
 @param two two
 @return one是否大于或者等于two
 */
+ (BOOL)biggerThanOrEqual:(NSNumber *)one :(NSNumber *)two;



@end



NS_ASSUME_NONNULL_END


