//
//  NavigationView.m
//  QiDeOnline
//
//  Created by mac on 2020/11/24.
//

#import "NavigationView.h"



@interface NavigationView()

/**
 *  数组
 */
@property (nonatomic , strong) NSMutableArray *views;

/**
 *  数量长度
 */
@property (nonatomic , assign) NSInteger count;

/**
 *  列数
 */
@property (nonatomic , assign) NSInteger column;


/**
 * 距离顶部距离
 */
@property (nonatomic , assign) CGFloat topMargin;

/**
 * 距离左侧距离
 */
@property (nonatomic , assign) CGFloat leftMargin;

/**
 * item大小
 */
@property (nonatomic , assign) CGSize itemSize;

@end

@implementation NavigationView


- (void)reloadData {
    [self setDataSource:self.dataSource];
}

- (void)setDataSource:(id<NavigationViewDataSource>)dataSource {
    _dataSource = dataSource;
    
    for (UIView *view in self.views) {
        [view removeFromSuperview];
    }
    [self.views removeAllObjects];
    
    if ([_dataSource navigationView:self numberOfRowsInSection:0]) {
        self.count = [dataSource navigationView:self numberOfRowsInSection:0];
    }
    
    if ([_dataSource respondsToSelector:@selector(navigationView:numberOfColumnsInSection:)]) {
        self.column = [dataSource navigationView:self numberOfColumnsInSection:0];
    }
    
    if ([_dataSource respondsToSelector:@selector(navigationViewTopMargin)]) {
        self.topMargin = [dataSource navigationViewTopMargin];
    }
    if ([_dataSource respondsToSelector:@selector(navigationViewLeftMargin)]) {
        self.leftMargin = [dataSource navigationViewLeftMargin];
    }
    if ([_dataSource respondsToSelector:@selector(navigationViewItemSize)]) {
        self.itemSize = [dataSource navigationViewItemSize];
    }
    
    for (int i = 0; i < self.count; i++) {
        UIView *sview = [[UIView alloc] init];
        if ([_dataSource respondsToSelector:@selector(navigationView:viewForRowAtIndexPath:)]) {
            
            UIView *view = [_dataSource navigationView:self viewForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            view.tag = i;
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView:)];
            view.userInteractionEnabled=YES;
            [view addGestureRecognizer:tapGestureRecognizer];
            [sview addSubview:view];
        }
        [self addSubview:sview];
        [self.views addObject:sview];
    }
    [self layoutIfNeeded];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self configuration];
    }
    return self;
}

- (instancetype)init {
    if (self == [super init]) {
        [self configuration];
    }
    return self;
}

- (void)configuration {
    
    self.count = 10;
    self.column = 5;
    self.topMargin = 20;
    self.leftMargin = 20;
    self.itemSize = CGSizeMake(50, 50);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat topMargin = self.topMargin;
    CGFloat leftMargin = self.leftMargin;
    CGFloat buttonWidth = self.itemSize.width;
    CGFloat buttonHeight = self.itemSize.height;
    CGFloat marginH = (kGHScreenWidth - 2 * self.leftMargin - self.column * buttonWidth)/(self.column - 1);
    
    for (int i = 0; i < self.views.count; i++) {
        UIButton *button = self.views[i];
        if (i < self.column) {
            topMargin = 6;
        } else {
            topMargin = self.topMargin;
        }
        button.frame = CGRectMake(leftMargin + marginH * (i % self.column) + (i % self.column) * buttonWidth, topMargin + topMargin * (i / self.column) + (i /self.column) * buttonHeight, buttonWidth, buttonHeight);
    }
    
    UIButton *last = self.views.lastObject;
    CGFloat maxY =  CGRectGetMaxY(last.frame);
    if (self.completeLayoutBlock) {
        self.completeLayoutBlock(self,maxY);
    }
    NSLog(@"%f",maxY);
}

- (void)clickView:(UITapGestureRecognizer *)ges {
    [self.delegate navigationView:self didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:ges.view.tag inSection:0]];
}

- (NSMutableArray *)views {
    if (_views == nil) {
        _views = [NSMutableArray array];
    }
    return _views;
}

@end
