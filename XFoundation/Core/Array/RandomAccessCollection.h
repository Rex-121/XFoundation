//
//  RandomAccessCollection.h
//  XFoundation
//
//  Created by Ray on 2018/10/16.
//

#import <Foundation/Foundation.h>


@protocol RandomAccessCollection


/**
 洗牌，对自身内部进行乱序处理
 
 @discussion 具体实现为
 
 (protocol) MutableRandomAccessCollection
 
 -(void)shuffle
 
 @return 随机排序后的数组
 */
- (nonnull NSArray *)shuffled;


/**
 随机一个元素
 
 @return 取出一个随机元素
 */
- (nullable id)randomElement;

@end

@protocol MutableRandomAccessCollection <RandomAccessCollection>


/**
 对自身数据进行乱序处理，自身异变
 
 @discussion NSMutableArray *array = @[@"-9",@"-4",@"-7",@"5",@"1",@"0",@"-3",@"6",@"-1",@"-4"];
 [array shuffle];
 NSLog(@"%@", array); //0,"-9",5,1,"-4","-7","-3",6,"-4","-1"
 
 @[@"-9",@"-4",@"-7",@"5",@"1",@"0",@"-3",@"6",@"-1",@"-4"];
      |     |___________________________________________|
      i     j                                           k
 将i与 j-k 区间里的随机一个交换，交换后 i ++，依此循环
 
 - Complexity: O(n), where n is the length of the collection.
 
 */
- (void)shuffle;

@end
