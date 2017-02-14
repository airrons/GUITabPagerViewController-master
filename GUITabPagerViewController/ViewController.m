//
//  ViewController.m
//  GUITabPagerViewController
//
//  Created by Guilherme Araújo on 27/02/15.
//  Copyright (c) 2015 Guilherme Araújo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <GUITabPagerDataSource, GUITabPagerDelegate>

@property(nonatomic,strong)NSArray * categoryIds;
@property(nonatomic,strong)NSArray * categoryNames;
@property(nonatomic,strong)NSArray * colors;

@end

@implementation ViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setDataSource:self];
  [self setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self reloadData];
}

#pragma mark - Tab Pager Data Source

- (NSInteger)numberOfViewControllers {
  return 10;
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
  #pragma unused (index)

  UIViewController *pageVC = [UIViewController new];
  [[pageVC view] setBackgroundColor:[UIColor colorWithRed:arc4random_uniform(255) / 255.0f
                                                    green:arc4random_uniform(255) / 255.0f
                                                     blue:arc4random_uniform(255) / 255.0f
                                                    alpha:1]];
  return pageVC;
}

- (NSArray *)categories{
    
    if (!_categoryIds) {
        _categoryIds = @[@"aiqing",@"keji",@"tiyu",@"mengchong",@"shuaige",@"yingshi",@"qita",@"youxi",@"junshi",@"meinv",@"zhiwu",@"dongman",@"jingwu",@"fengjing",@"chouxiang",@"jieri",@"mingche",@"chaoliu",@"chuangyi",@"xiaoqingxin",@"zhupingkong",@"wenzikong",@"tianshengyidui"];
    }
    return _categoryIds;
}

- (NSArray *)categoryNames{
    
    if (!_categoryNames) {
        _categoryNames = @[@"爱情",@"科技",@"体育",@"萌宠",@"帅哥",@"影视",@"其他",@"游戏",@"军事",@"美女",@"植物",@"动漫",@"静物",@"风景",@"抽象",@"节日",@"名车",@"潮流",@"创意",@"小清新",@"主屏控",@"文字控",@"天生一对"];
    }
    return _categoryNames;
}



- (NSArray *)colors{
    
    if (!_colors) {
        _colors = @[@"heise",@"zongse",@"huise",@"baise",@"caise",@"chengse",@"huangse",@"fense",@"zise",@"lanse",@"lvse",@"hongse"];
    }
    return _colors;
}

- (NSString *)titleForTabAtIndex:(NSInteger)index {
  return [self.categoryNames objectAtIndex:index];
}

- (CGFloat)tabHeight {
  // Default: 44.0f
  return 30.0f;
}

- (UIColor *)tabColor {
  // Default: [UIColor orangeColor];
  return [UIColor orangeColor];
}

- (UIColor *)tabBackgroundColor {
  // Default: [UIColor colorWithWhite:0.95f alpha:1.0f];
  return [UIColor lightGrayColor];
}

- (UIFont *)titleFont {
  // Default: [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0f];
  return [UIFont systemFontOfSize:15];
}

- (UIColor *)titleColor {
  // Default: [UIColor blackColor];
  return [UIColor blackColor];
}

#pragma mark - Tab Pager Delegate

- (void)tabPager:(GUITabPagerViewController *)tabPager willTransitionToTabAtIndex:(NSInteger)index {
  #pragma unused (tabPager)

  NSLog(@"Will transition from tab %ld to %ld", (long)[self selectedIndex], (long)index);
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index {
  #pragma unused (tabPager)

  NSLog(@"Did transition to tab %ld", (long)index);
}

@end
