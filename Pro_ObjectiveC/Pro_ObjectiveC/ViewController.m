//
//  ViewController.m
//  Pro_ObjectiveC
//
//  Created by MichaelFan on 2017/11/9.
//  Copyright © 2017年 MichaelFan. All rights reserved.
//

#import "ViewController.h"
extern void _objc_autoreleasePoolPrint();
typedef void(^testbbb)(void);

@interface ViewController ()
{
    testbbb bab;
    NSArray *aryblock;
}

@end

@implementation ViewController

-(void)testSemaphore
{
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t helloSemaphore = dispatch_semaphore_create(1);
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10000; i++) {
        dispatch_async(global, ^{
            dispatch_semaphore_wait(helloSemaphore, DISPATCH_TIME_FOREVER);  //-1
            [array addObject:[NSNumber numberWithInteger:1]];  //0
            dispatch_semaphore_signal(helloSemaphore);  //+1
        });
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t mySerialDq = dispatch_queue_create("com.game.hupu.pro.myserial_1", NULL);
    dispatch_queue_t mySerialDq1 = dispatch_queue_create("com.game.hupu.pro.myserial_2", NULL);
    dispatch_queue_t mySerialDq2 = dispatch_queue_create("com.game.hupu.pro.myserial_3", NULL);
    //dispatch_set_target_queue(mySerialDq2, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0));
    dispatch_queue_t myConcurrentDq = dispatch_queue_create("com.game.hupu.pro.myconcurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(mySerialDq, ^{
        NSLog(@"1");
    });
    dispatch_async(mySerialDq1, ^{
        NSLog(@"2");
    });
    dispatch_async(mySerialDq2, ^{
        NSLog(@"3");
    });
//    dispatch_release(mySerialDq);
    dispatch_group_t disGroup = dispatch_group_create();
    dispatch_group_async(disGroup, mySerialDq, ^{
        sleep(5);
        NSLog(@"4");
    });
    dispatch_group_async(disGroup, myConcurrentDq, ^{
        NSLog(@"5");
    });
    dispatch_group_notify(disGroup, mySerialDq2, ^{
        NSLog(@"6");
    });
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull * NSEC_PER_SEC);
    dispatch_group_wait(disGroup, time);
    NSLog(@"777");
    dispatch_after(time, mySerialDq, ^{
        NSLog(@"8888");
    });
    
    [self testSemaphore];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"0009900");
    });
    
    return;
    
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
    
    __block int bbaa = 666;
    int(^testblock)(int) = ^int(int a){
        NSLog(@"%d--------%d",a,bbaa);
        return a;
    };
    bbaa = 7777;
    testblock(1232223);
    
    id obj = [self getBlockArray];
    testbbb __bbb = (testbbb)[obj objectAtIndex:0];
    __bbb();
    
    aryblock = [NSArray array];
    [self test_Block];
    bab();
    NSLog(@"bab");
}

-(void)testbb:(int(^)(int))blk
{
    
}

-(void)test_Block
{
    NSMutableArray *ary = [[NSMutableArray alloc] init];
    NSArray *tempary = aryblock;
    bab = ^{
        NSLog(@"%@",tempary);
        [ary addObject:@"1"];
    };
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

-(id)getBlockArray
{
    int val = 10;
    return [[NSArray alloc] initWithObjects:^{NSLog(@"123");},^{NSLog(@"123");},^{NSLog(@"123");}, nil];
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
