//
//  ViewController.m
//  GLEmitterDemo
//
//  Created by gelei on 2020/5/12.
//  Copyright © 2020 shaka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *likeBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.likeBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 400, 44, 44)];
    [self.likeBtn setTitle:@"👍" forState:UIControlStateNormal];
    [self.view addSubview:self.likeBtn];
    [self.likeBtn addTarget:self action:@selector(likeClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)likeClick:(id)sender {
    CAEmitterLayer *likeEmitter = [CAEmitterLayer layer];
    likeEmitter.emitterPosition = self.likeBtn.center;
    likeEmitter.emitterSize = CGSizeMake(24, 24);
    likeEmitter.emitterShape = kCAEmitterLayerCircle;
    likeEmitter.emitterMode = kCAEmitterLayerPoints;
    NSArray *imgs = @[@"fengmi_SVG",@"huandengpian_SVG",@"mianbao_SVG",@"shala_SVG",@"shengyu_SVG",@"shuiguo_SVG",@"tang_SVG"];
    NSMutableArray *cells = [NSMutableArray array];
    for (int i = 0; i < imgs.count; i++) {
        //发射单元
        CAEmitterCell *likeCell1 = [CAEmitterCell emitterCell];
        //每s多少个粒子
        likeCell1.birthRate = arc4random_uniform(3) + 8;
        //单个存活时间
        likeCell1.lifetime = (arc4random_uniform(10) +40) * 0.01;
        //单个粒子初始速度,
        likeCell1.velocity = 1000;
        //单个粒子初始速度变化范围
        likeCell1.velocityRange = 500;
        //y轴加速度,重力效果,可以看到抛物线效果
        likeCell1.yAcceleration = likeCell1.velocity * 2;
        //x轴加速度
        likeCell1.xAcceleration = -100;
        //发射角度,x与y轴夹脚
        likeCell1.emissionLongitude = -M_PI_4 * 1.5;
        //发射角度变化范围,以发射角度为中心,左右扩散角度之和
        likeCell1.emissionRange = M_PI_2;
        //发射角度,x与z轴夹脚
        likeCell1.emissionLatitude = 0;
        //alpha可变化范围
        likeCell1.alphaRange = 0.f;
        //生命周期内的alpha变化速度
        likeCell1.alphaSpeed = -1.f / likeCell1.lifetime;
        //cell内容
        likeCell1.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[i]].CGImage);
        [cells addObject:likeCell1];
    }
    likeEmitter.emitterCells = cells;
    [self.view.layer addSublayer:likeEmitter];
}


@end
