//
//  NativeExpressAdViewController.m
//  GDTMobApp
//
//  Created by michaelxing on 2017/4/17.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "NativeExpressAdViewController.h"

#import <GDTAd.h>


@interface NativeExpressAdViewController ()<GDTNativeExpressAdDelegete>

// 用于请求原生模板广告，注意：不要在广告打开期间释放！
@property (nonatomic, retain)   GDTNativeExpressAd *nativeExpressAd;

// 存储返回的GDTNativeExpressAdView
@property (nonatomic, retain)       NSArray *expressAdViews;

// 当前展示模板广告的View（开发者可以自己设置）
@property (weak, nonatomic) IBOutlet UIView *expressAdView;



@property (weak, nonatomic) IBOutlet UILabel *positionWLabel;
@property (weak, nonatomic) IBOutlet UISlider *positionW;

@property (weak, nonatomic) IBOutlet UILabel *positionHLabel;
@property (weak, nonatomic) IBOutlet UISlider *positionH;
@property (weak, nonatomic) IBOutlet UITextField *positionIDTextField;

@end

@implementation NativeExpressAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //默认值
    self.positionW.value = 300;
    self.positionH.value = 200;
    
    self.positionWLabel.text = [NSString stringWithFormat:@"宽：300"];
    self.positionHLabel.text = [NSString stringWithFormat:@"高：200"];
    
    [self.positionW addTarget:self action:@selector(sliderPositionWChanged) forControlEvents:UIControlEventValueChanged];
    [self.positionH addTarget:self action:@selector(sliderPositionHChanged) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)refreshButton:(id)sender {
    
    self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105344611" placementId:self.positionIDTextField.text adSize:CGSizeMake(300, 200)];
    self.nativeExpressAd.delegate = self;

    // 拉取5条广告
    [self.nativeExpressAd loadAd:5];
}

- (void)sliderPositionWChanged {

    self.positionWLabel.text = [NSString stringWithFormat:@"宽：%.0f",self.positionW.value];
}

- (void)sliderPositionHChanged {
    
    self.positionHLabel.text = [NSString stringWithFormat:@"高：%.0f",self.positionH.value];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

/**
 * 拉取广告成功的回调
 */
- (void)nativeExpressAdSuccessToLoad:(GDTNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof GDTNativeExpressAdView *> *)views
{
    [self.expressAdViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GDTNativeExpressAdView *adView = (GDTNativeExpressAdView *)obj;
        [adView removeFromSuperview];
    }];
    
    self.expressAdViews = [NSArray arrayWithArray:views];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    //vc = [self navigationController];
#pragma clang diagnostic pop
    
    if (self.expressAdViews.count) {
        
        // 取一个GDTNativeExpressAdView
        GDTNativeExpressAdView *expressView =  [self.expressAdViews objectAtIndex:0];
        // 设置frame，开发者自己设置
        expressView.frame = CGRectMake(0, 0, self.positionW.value, self.positionH.value);
        expressView.controller = rootViewController;
        
        [expressView render];
        
        //添加View的时机，开发者控制
        [self.expressAdView addSubview:expressView];
       
    }
   
}

/**
 * 拉取广告失败的回调
 */
- (void)nativeExpressAdFailToLoad:(GDTNativeExpressAd *)nativeExpressAd error:(NSError *)error {
   
}
/**
 * 拉取广告失败的回调
 */
- (void)nativeExpressAdRenderFail:(GDTNativeExpressAdView *)nativeExpressAdView
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)nativeExpressAdViewRenderSuccess:(GDTNativeExpressAdView *)nativeExpressAdView
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)nativeExpressAdViewClicked:(GDTNativeExpressAdView *)nativeExpressAdView
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
