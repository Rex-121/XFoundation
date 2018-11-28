//
//  XTestFindArray.m
//  XFoundation_Tests
//
//  Created by Ray on 2018/10/15.
//  Copyright © 2018 Ray. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+Find.h"
#import "NSArray+String.h"
#import "NSNumber+Random.h"


@interface XTestFindArray : XCTestCase

@end

@implementation XTestFindArray

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}


- (void)testFirstMatch {
    NSArray <NSString *>*array = @[@"-9",@"-4",@"-7",@"5",@"1",@"0",@"-3",@"6",@"-1",@"-4"];
    
    XIndex index = [array firstElementMatch:^BOOL(NSString * _Nonnull obj) {
        return [obj isEqualToString:@"1"];
    }];
    
    XCTAssertTrue([array[index.index] isEqualToString:@"1"]);
    
    NSString *k = [array words:^NSString * _Nonnull(NSString * _Nonnull obj) {
        return obj;
    } joinedBy:@","];
    XCTAssertTrue([k isEqualToString:@"-9,-4,-7,5,1,0,-3,6,-1,-4"]);
}

- (void)testExample {

    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithCapacity:100];
    
    int firstMatch_1000 = 10;
    
    for (int i = 0; i < 100; i ++) {
        
        if (i == firstMatch_1000) {
            [array addObject:@1000];
            continue;
        }
        
        int random = [NSNumber random:-10 to:10];
        XCTAssertGreaterThanOrEqual(random, -10);
        XCTAssertLessThan(random, 10);
        
        [array addObject:@(random)];
    }
    
    XCTAssertEqual([array firstElementMatch:^BOOL(NSNumber *obj) {
        return [obj isEqualToNumber:@1000];
    }].index, firstMatch_1000);
    
    
}

///测试乱序
- (void)testShuffleWithLineWords {
    
    NSArray *array = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    
    for (int i = 0; i < 1000; i ++) {
        NSArray *sArray = [array shuffled];
        
        NSString *a = [sArray words:^NSString * _Nonnull(id  _Nonnull obj) {
            return [NSString stringWithFormat:@"%@", obj];
        } joinedBy:@""];

        XCTAssertNotEqual(a, @"12345678910");

    }
  

}

- (void)testRandomElement {
    
    NSArray <NSString *>*array = @[@"-9",@"-44",@"-7",@"5",@"1",@"0",@"-3",@"6",@"-1",@"-4"];
    for (int i = 0; i < 100; i ++) {
        NSString *k = array.randomElement;
        XCTAssertTrue([array containsObject:k]);
    }
    NSArray <NSNumber *>*onlyOne = @[@123];
    for (int i = 0; i < 100; i ++) {
        XCTAssertEqual(onlyOne.randomElement, @123);
    }
    
}

- (void)testXIndex {
    
    XIndex index = XIndexNull();
    
    XCTAssertTrue(index.outOfBounds == YES && index.index == -1);
    
    XIndex ten = XIndexMake(10);
    
    XCTAssertTrue(ten.outOfBounds == NO && ten.index == 10);
    
}


- (void)testMapping {
 
    NSArray <NSString *>*array = @[@"-9",@"-44",@"-7",@"5",@"1",@"0",@"-3",@"6",@"-1",@"-4"];

    NSArray *a = [array map:^id _Nonnull(NSString * _Nonnull obj) {
        return [obj stringByAppendingString:@"+"];
    }];
    
    NSArray *dd = @[@"-9+",@"-44+",@"-7+",@"5+",@"1+",@"0+",@"-3+",@"6+",@"-1+",@"-4+"];
    
    XCTAssertTrue([a isEqualToArray:dd]);
    
}

@end
