//
//  ViewController.m
//  GHNavigationView
//
//  Created by mac on 2020/11/27.
//

#import "ViewController.h"
#import "NavigationView.h"

#define kNav1DataArray @[@{@"imageName":@"image1",@"title":@"雅思",@"showTip":@0},@{@"imageName":@"image2",@"title":@"托福",@"showTip":@0}, @{@"imageName":@"image3",@"title":@"SAT",@"showTip":@1},@{@"imageName":@"image4",@"title":@"GRE",@"showTip":@1},@{@"imageName":@"image5",@"title":@"GAMT",@"showTip":@1},@{@"imageName":@"image6",@"title":@"ACT",@"showTip":@1},@{@"imageName":@"image7",@"title":@"语言测试",@"showTip":@1}]

@interface ViewController ()<NavigationViewDelegate,NavigationViewDataSource>

@property (nonatomic , strong) NavigationView *navigationView1;

@property (nonatomic , strong) NavigationView *navigationView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.navigationView1];
    [self.view addSubview:self.navigationView2];
    
}

- (void)navigationView:(NavigationView *)navigationView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",(long)indexPath.row);
}
/**
 *  返回总长度一共有多少个
 *  @param navigationView navigationView
 *  @param section 是第几组
 *  @return 返回长度
 */

- (NSInteger)navigationView:(NavigationView *)navigationView numberOfColumnsInSection:(NSInteger)section {
    if (navigationView == self.navigationView2) {
        return 4;
    }
    return 5;
}

- (NSInteger)navigationView:(NavigationView *)navigationView numberOfRowsInSection:(NSInteger)section {
    if (navigationView == self.navigationView1) {
        return kNav1DataArray.count;
    } else {
        return kNav1DataArray.count - 2;
    }
}

- (UIView *)navigationView:(NavigationView *)navigationView viewForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = kNav1DataArray[indexPath.row];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:dict[@"imageName"]];
    imageView.frame = CGRectMake(0, 0, 50, 50);
    imageView.userInteractionEnabled = YES;
    return imageView;
}

- (NavigationView *)navigationView1 {
    if (_navigationView1 == nil) {
        _navigationView1 = [[NavigationView alloc]initWithFrame:CGRectMake(0, 100, kGHScreenWidth, 140)];
        _navigationView1.dataSource = self;
        _navigationView1.delegate = self;
        _navigationView1.completeLayoutBlock = ^(NavigationView * _Nonnull navigationView, CGFloat height) {
           
        };
    }
    return _navigationView1;
}

- (NavigationView *)navigationView2{
    if (_navigationView2 == nil) {
        _navigationView2 = [[NavigationView alloc]initWithFrame:CGRectMake(0, 400, kGHScreenWidth, 400)];
        _navigationView2.dataSource = self;
        _navigationView2.delegate = self;
    }
    return _navigationView2;
}


@end
