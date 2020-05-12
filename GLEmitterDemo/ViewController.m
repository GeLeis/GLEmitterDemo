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
        CAEmitterCell *likeCell1 = [CAEmitterCell emitterCell];
        //每s多少个
        likeCell1.birthRate = arc4random_uniform(3) + 8;
        //存活时间
        likeCell1.lifetime = (arc4random_uniform(10) +40) * 0.01;
        likeCell1.velocity = 800;
        likeCell1.velocityRange = 500;
        likeCell1.yAcceleration = 300;
        likeCell1.emissionLongitude = -M_PI_4;
        likeCell1.emissionRange = M_PI_2;
        likeCell1.emissionLatitude = 0;
        likeCell1.alphaRange = 0.f;
        likeCell1.alphaSpeed = -1.f / likeCell1.lifetime;
        likeCell1.contents = (__bridge id _Nullable)([UIImage imageNamed:imgs[i]].CGImage);
        [cells addObject:likeCell1];
    }
    likeEmitter.emitterCells = cells;
    [self.view.layer addSublayer:likeEmitter];
}


@end
