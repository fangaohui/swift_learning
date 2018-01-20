//
//  TestBlockClass.m
//  Pro_ObjectiveC
//
//  Created by MichaelFan on 2018/1/20.
//  Copyright © 2018年 MichaelFan. All rights reserved.
//

#import "TestBlockClass.h"

@implementation TestBlockClass

-(void)testBlock
{
    void(^testAbc)() = ^(){
        NSLog(@"%@",abc889900);
    };
    testAbc();
}

@end
