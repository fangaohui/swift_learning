//
//  test_block.c
//  Pro_ObjectiveC
//
//  Created by MichaelFan on 2017/11/13.
//  Copyright © 2017年 MichaelFan. All rights reserved.
//

void testBlock(){
    __block int cc = 1;
    void(^blk)(void) = ^void(){ int aa = 123; };
}


