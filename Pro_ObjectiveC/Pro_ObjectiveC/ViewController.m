//
//  ViewController.m
//  Pro_ObjectiveC
//
//  Created by MichaelFan on 2017/11/9.
//  Copyright © 2017年 MichaelFan. All rights reserved.
//

#import "ViewController.h"
extern void _objc_autoreleasePoolPrint();

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *strongObj = [[NSObject alloc] init];
    NSObject __weak *weakObj = strongObj;
//    NSLog(@"%d",_objc_rootRetainCount(strongObj));
    
    //必须指定__strong 默认是__autoreleasing。赋值给对象指针时 对象指针时 对象指针时 所有权修饰符必须一致。
    NSObject * __strong *testPoint = &strongObj;
    
    /*
     编译器自动做以下操作
     NSObject __autoreleasing *tmp = strongObj;
     [self testPoint:&tmp];
     strongObj = tmp;
     */
    [self testPoint:&strongObj];
    
    @autoreleasepool {
        
    }
    
    struct data {
        //对象加入c语言结构体struct/union中时 只能强转为void*或附加__unsafe_unretained修饰符
        NSMutableArray __unsafe_unretained *array;
    };
    
    id oc = [[NSObject alloc] init];
    void *p = (__bridge_retained void *)oc;
    oc = (__bridge_transfer id)p;
    
    [[UIView alloc] init];
    (void)[[UIView alloc] init]; //无警告且arc不会内存泄漏
    (void)[[[UIView alloc] init] setHidden:YES];
    
    [NSThread detachNewThreadSelector:@selector(testThread) toTarget:self withObject:nil];
    
    int(^testblock)(int) = ^int(int a){
        NSLog(@"%d",a);
        return a;
    };
}

-(void)testbb:(int(^)(int))blk
{
    
}

-(void)testThread
{
    @autoreleasepool {
        
        id __strong obj = [[NSObject alloc] init];
        _objc_autoreleasePoolPrint();
        id __weak o = obj;
        NSLog(@"-->%d",_objc_rootRetainCount(obj));
        NSLog(@"%@",[o class]);
        NSLog(@"++>%d",_objc_rootRetainCount(obj));
        _objc_autoreleasePoolPrint();
    }
}

-(BOOL)allowsWeakReference
{
    return [super allowsWeakReference];
}
-(BOOL)retainWeakReference
{
    return [super retainWeakReference];
}

CFTypeRef CFBridgingRetain_test(id X) {
    return (__bridge_retained CFTypeRef)X;
}

id CFBridgingRelease_test(CFTypeRef X) {
    return (__bridge_transfer id)X;
}

typedef int (^blkk)(int);
void func (blkk blka)
{
    blka(123);
//    blkk *bbaa = &blka;
//    (*bbaa)(123);
    
}

char (^funcb()) (int)
{
    return ^char(int a){ return 1; };
}

/*
CFMutableArrayRef cfObject = nil;
{
    id obj = [[NSMutableArray alloc] init];
    cfObject = CFBridgingRetain_test(obj);
    CFShow(cfObject);
}
CFRelease(cfObject);
 */

//两个方法参数等同 对象的指针默认__autoreleasing
-(void)testPoint:(NSObject **)obj
{
    //因为默认是__autoreleasing 所以obj是一个注册到autoreleasepool中的对象
    *obj = [[NSObject alloc] init];
}
-(void)testAutoReleasePoint:(NSObject * __autoreleasing *)error
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
