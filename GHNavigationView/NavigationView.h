//
//  NavigationView.h
//  QiDeOnline
//
//  Created by mac on 2020/11/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define kGHScreenWidth                ([UIScreen mainScreen].bounds.size.width)   //屏幕宽度


@class NavigationView;

typedef void(^NavigationViewCompleteLayoutBlock)(NavigationView *navigationView,CGFloat height);


@protocol NavigationViewDelegate <NSObject>

- (void)navigationView:(NavigationView *)navigationView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol NavigationViewDataSource <NSObject>

@optional

/**
 *  返回每个item大小
 *  @return 返回每个item大小
 */
- (CGSize)navigationViewItemSize;

/**
 *  返回距离左侧的距离
 *  @return 返回距离左侧的距离
 */
- (CGFloat)navigationViewLeftMargin;
/**
 *  返回距离顶部的距离
 *  @return 返回距离顶部的距离
 */
- (CGFloat)navigationViewTopMargin;


/**
 *  返回一行有几列
 *  @param navigationView navigationView
 *  @param section 是第几组
 *  @return 返回一行有几列
 */

- (NSInteger)navigationView:(NavigationView *)navigationView numberOfColumnsInSection:(NSInteger)section;

@required

/**
 *  返回总长度一共有多少个
 *  @param navigationView navigationView
 *  @param section 是第几组
 *  @return 返回长度
 */

- (NSInteger)navigationView:(NavigationView *)navigationView numberOfRowsInSection:(NSInteger)section;

/**
 *  返回view
 *  @param navigationView navigationView
 *  @param indexPath 是第几组的第几行
 *  @return view
 */

- (UIView *)navigationView:(NavigationView *)navigationView viewForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

/**
 *  导航view
 */
@interface NavigationView : UIView

/**
 *  dataSource
 */
@property (nonatomic , weak) id <NavigationViewDataSource> dataSource;

/**
 *  delegate
 */
@property (nonatomic , weak) id <NavigationViewDelegate> delegate;


/**
 * 计算最终高度回调
 */
@property (nonatomic , copy) NavigationViewCompleteLayoutBlock completeLayoutBlock;

/**
 *  刷新数据
 */
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
