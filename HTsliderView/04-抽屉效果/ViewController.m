//
//  ViewController.m
//  04-抽屉效果
//
//  Created by Page on 16/3/19.
//  Copyright © 2016年 Apple.com. All rights reserved.
//

#import "ViewController.h"
#import "redView.h"
#import "blueView.h"
#import "UIView+frame.h"
#import "yellowView.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
//缩放比例
#define scale (KScreenHeight * 4 /9)/KScreenWidth

@interface ViewController ()

//红色试图
@property (nonatomic,strong) UIView *redview;

//蓝色视图
@property (nonatomic,strong) UIView *blueview;

//蓝色视图
@property (nonatomic,strong) UIView *yellowview;

//起点
@property (nonatomic,assign) CGPoint StartPoint;

//手指
@property (nonatomic,strong) UITouch *touch;

//创建一个标记记录蓝色View是否在右边
@property (nonatomic,assign) BOOL isRight;

//创建一个标记记录蓝色View是否在左边
@property (nonatomic,assign) BOOL isLeft;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //初始化蓝色视图
    [self initBlueView];
    
    //初始化红色视图
    [self initRedView];
    
    //初始化黄色视图
    [self initYellowView];
    
    //设置导航栏
    [self setNavBar];
    
}

//设置导航栏按钮
- (void)setNavBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(ClickLeftBtn)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(ClickRightBtn)];
}

//LeftBtn滑到左边
- (void)LeftBtnmoveLeft
{
    [UIView animateWithDuration:0.7 animations:^{
        
        self.blueview.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        
        //导航栏移动左边
        self.navigationController.navigationBar.x = 0;
        
        //红色view
        self.redview.frame = CGRectMake(0,KScreenHeight/6,0,KScreenHeight * 0.75);

    }];
    
    //记录位置
    self.isRight = NO;
}

//LeftBtn滑到右边
- (void)LeftBtnmoveRight
{
    [UIView animateWithDuration:0.3 animations:^{
        
        //蓝色view
        self.blueview.frame = CGRectMake(KScreenWidth*0.75, 0, KScreenWidth, KScreenHeight);
        
        //导航栏移动左边
        self.navigationController.navigationBar.x = KScreenWidth*0.75;
        
        //红色view
        self.redview.frame = CGRectMake(0, 0, KScreenWidth*0.75, KScreenHeight);
        
        
    }];
    
    ////记录位置
    self.isRight = YES;
}

//左边按钮点击事件
- (void)ClickLeftBtn
{
    //如果blueview不在右边,点击后滑到右边
    if (!self.isRight) {
    
        [self LeftBtnmoveRight];
    
    }else{
        
        [self LeftBtnmoveLeft];
    
    }
    
}

//RightBtn滑到左边
- (void)RightBtnmoveLeft
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.blueview.frame = CGRectMake(-KScreenWidth*0.75, 0, KScreenWidth, KScreenHeight);
        
        //黄色view
        self.yellowview.frame = CGRectMake(KScreenWidth*0.25, 0, KScreenWidth*0.75, KScreenHeight);
        
        //导航栏移动右边
        self.navigationController.navigationBar.x = -KScreenWidth*0.75;
    }];
    
    ////记录位置
    self.isLeft = YES;
}

//RightBtn滑到右边
- (void)RightBtnmoveRight
{
    [UIView animateWithDuration:0.7 animations:^{
        
        self.blueview.frame = CGRectMake(KScreenWidth*0.75*0, 0, KScreenWidth, KScreenHeight);
        
        //黄色view
        self.yellowview.frame = CGRectMake(KScreenWidth, KScreenHeight/6, 0, 2*KScreenHeight/3);
        
        //导航栏移动右边
        self.navigationController.navigationBar.x = KScreenWidth*0;
        
        
    }];
    
    //记录位置
    self.isLeft = NO;
}


//右边按钮点击事件
- (void)ClickRightBtn
{
    //如果blueview不在左边,点击滑到左边
    if (!self.isLeft) {
        
        [self RightBtnmoveLeft];
        
    }else{
        
        [self RightBtnmoveRight];
        
    }
}

//初始化红色视图
- (void)initRedView
{
    CGRect frame = CGRectMake(0,KScreenHeight/6,0,2*KScreenHeight/3);
    
    self.redview = [[redView alloc] initWithFrame:frame];
    
    [self.view addSubview:self.redview];
    
}

//初始化蓝色视图
- (void)initBlueView
{
    self.blueview = [[blueView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    [self.view addSubview:self.blueview];
    
}

//初始化黄色视图
- (void)initYellowView
{
    CGRect frame = CGRectMake(KScreenWidth,KScreenHeight/6,0,2*KScreenHeight/3);
    
    self.yellowview = [[yellowView alloc] initWithFrame:frame];
    
    [self.view addSubview:self.yellowview];
    
}



//设定起点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取手指
    self.touch = [touches anyObject];
    
    //获取起点
    self.StartPoint = [self.touch locationInView:self.touch.window];
    
    NSLog(@"%f",self.StartPoint.x);
    
    //判断点在哪个位置
    if (self.StartPoint.x <= 0) {
        NSLog(@"红色view");
    }else if (self.StartPoint.x >= KScreenWidth){
    
        NSLog(@"黄色view");
    
    }else{
    
       NSLog(@"蓝色view");
    }
    
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取终点点
    CGPoint movePoint = [self.touch locationInView:self.touch.window];
    
//    NSLog(@"%f",movePoint.x);
    
//    CGFloat moveX = movePoint.x - self.StartPoint.x;
    CGFloat moveX = movePoint.x - [self.touch previousLocationInView:self.touch.window].x;
    
    //蓝色view向右最大移动x
    CGFloat MaxmoveRightX = KScreenWidth*0.75;
    
    //蓝色view向左移动最大x
    CGFloat MaxmoveLeftX = -KScreenWidth*0.75;
    
    
#pragma mark:--判断边界
    //蓝色View向右滑动后X最大为 MaxmoveLeftX
    if (self.blueview.x >= MaxmoveRightX && moveX > 0) {
        self.blueview.x = MaxmoveRightX;
        return;
    }
    
    //当蓝色view移动到左边
    if (self.blueview.x <= MaxmoveLeftX && moveX < 0) {
        
        self.blueview.x = MaxmoveLeftX;
        
        return;
        
    }
    
#pragma mark:--蓝色view的移动
    self.blueview.x += moveX;
    
    
#pragma mark:--黄色View的移动
    //黄色View向左滑动的时候, self.yellowview.x = 屏幕的宽-蓝色view的X
    self.yellowview.x = KScreenWidth + self.blueview.x;
    self.yellowview.height += scale * -moveX;
    self.yellowview.width -= moveX;
    self.yellowview.y = (self.view.height - self.yellowview.height) * 0.5;
    
    //导航条的移动
    self.navigationController.navigationBar.x = self.blueview.x;
    
    //黄色view到达最大X,则不让她继续变化,固定即可
    if (self.yellowview.x <= KScreenWidth*0.25) {
        //方法1:不太稳定
//        self.yellowview.x = KScreenWidth*0.25;
//        self.yellowview.height = KScreenHeight;
//        self.yellowview.width = KScreenWidth*0.75;
        //方法2:直接点击右边按钮有
        [self RightBtnmoveLeft];
        
    }
    
#pragma mark:--红色view的移动
    
    NSLog(@"右边==%f",moveX);
    //红色View的移动
    //当黄色view出现的时候.红色View不允许出现
    if (self.yellowview.x <= KScreenWidth) {
        self.redview.width = 0;
    }else{
    
        self.redview.height += scale * moveX;
        self.redview.width += moveX;
        self.redview.y = (self.view.height - self.redview.height) * 0.5;
        
        if (self.blueview.x >= MaxmoveRightX) {
            
            [self LeftBtnmoveRight];
            
        }
    }
    
}

#pragma mark:--触摸结束后
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取结束蓝色View位置
    CGFloat endblueViewX = self.blueview.x;
    
    //判断蓝色view的X是否大于屏幕的0.4倍
    if (endblueViewX > self.view.window.width*0.4) {
        //如果大于则向右边移动
        [self LeftBtnmoveRight];
    }else if(endblueViewX < self.view.window.width*0.4 && endblueViewX > 0){
        //否则像左移动
        [self LeftBtnmoveLeft];
    }
    
    //判断蓝色view的X是否大于屏幕的-0.4倍并且是在屏幕的左边
    if (endblueViewX > -self.view.window.width*0.4 && endblueViewX < 0) {
        //如果是,则右边移动
        [self RightBtnmoveRight];
    }else if (endblueViewX < -self.view.window.width*0.4 && endblueViewX < 0){
        //否则,则左边移动
        [self RightBtnmoveLeft];
    }
    
}

@end













