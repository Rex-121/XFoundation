//
//  XRandomTests.m
//  XFoundation_Tests
//
//  Created by Ray on 2018/10/5.
//  Copyright © 2018 Ray. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSNumber+Random.h"

#import "NSArray+String.h"

@interface XRandomTests : XCTestCase

@end

@implementation XRandomTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testRandomMinMax {
    for (int i = 0; i < 10009; i ++) {
        NSArray <NSNumber *>*k = [NSNumber randomMinMax:-30 to:30 div:8];
        XCTAssertGreaterThanOrEqual(k.firstObject.integerValue, -30);
        XCTAssertLessThan(k[1].integerValue, 30);
    }
}

- (void)testRandomFromTo {
    
    for (int i = 0; i < 1000; i ++) {
        int random = XRandom(1);
        
        int from = -10;
        
        int rangeX = XRandomInRange(from, random);
        
        XCTAssertGreaterThanOrEqual(rangeX, from);
        XCTAssertLessThan(rangeX, random);
    }
    
    for (int i = 0; i < 1000; i ++) {
        int random = [NSNumber randomTo:20];
        
        int from = -1;
        
        int rangeX = [NSNumber random:from to:random];
        
        XCTAssertGreaterThanOrEqual(rangeX, from);
        XCTAssertLessThan(rangeX, random);
    }
    
    NSMutableArray <NSNumber *>*numArray = [NSMutableArray arrayWithCapacity:100];
    
    for (int i = 0; i < 100; i ++) {
        [numArray addObject:@(YesOrNo())];
    }
    
    NSString *a = [numArray words:^NSString * _Nonnull(NSNumber * _Nonnull obj) {
        return [NSString stringWithFormat:@"%@", obj];
    } joinedBy:@""];
    
    XCTAssertFalse([a hasPrefix:@"1111111111111111111111111111"] || [a hasPrefix:@"11111111111111111111111"] || [a hasSuffix:@"000000000000000000000000000000000000000000000"] || [a hasPrefix:@"000000000000000000000000000000000000000000000"]);
    
 
}

- (void)testRandomToNag {
    int count = 10000;
    int top = -20;
    for (int i = 0; i < count; i ++) {
        NSInteger random = [NSNumber randomTo:top];
        XCTAssertGreaterThanOrEqual(random, top);
    }
}

- (void)testRandomTo {
    
    int count = 10000;
    
    int top = 10;
    
    for (int i = 0; i < count; i ++) {
        int random = [NSNumber randomTo:top];
        XCTAssertGreaterThanOrEqual(random, 0);
        XCTAssertLessThan(random, top);
    }
}


- (void)testRandomDecimal {
    
    
    int count = 10000;
    
    int top = 30;
    
    for (int i = 0; i < count; i ++) {
        top = [NSNumber randomTo:30];
        NSString *random = [NSNumber randomTo:top withDecimal:4];
        XCTAssertLessThanOrEqual(random.floatValue, top);
    }
    
    
    for (int i = 0; i < count; i ++) {
        NSString *random = [NSNumber randomTo:-10 withDecimal:4];
        XCTAssertLessThanOrEqual(random.floatValue, 0);
        XCTAssertGreaterThan(random.floatValue, -10);
    }

}

@end
