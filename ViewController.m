//
//  ViewController.m
//  YMPhotoBrowserDemo
//
//  Created by dazhi on 2017/4/10.
//  Copyright © 2017年 yanming. All rights reserved.
//

#import "ViewController.h"
#import "PhotoContentCell.h"
#import "UIImageView+WebCache.h"
#import "YMPhotoBrowserView.h"
// 宏定义
#define CellID @"PhotoContentCellID"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

// DATA
@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSArray *textArray;
// UI
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // DATA
    self.dataArray = @[@"http://img1.gtimg.com/17/1765/176545/17654571_1200x1000_0.jpg", @"http://avatar.csdn.net/6/E/7/1_lutaotony.jpg", @"https://imgsa.baidu.com/baike/s%3D500/sign=eb4639d80b33874498c52f7c610ed937/caef76094b36acaf33bff1747bd98d1000e99cde.jpg"];
    
    self.textArray = @[@"蒲公蒲公英", @"蒲公英的约定最牛", @"真的很"];
    
}

#pragma mark - tabelView DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 297;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
//    NSLog(@"%p", cell);
    
    for (int i = 0; i < self.dataArray.count; i++) {
        
        UIImageView *iv = (UIImageView *)[cell.contentView viewWithTag:i + 10];
        [iv sd_setImageWithURL:[NSURL URLWithString:self.dataArray[i]]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [iv addGestureRecognizer:tap];
    }
    
    cell.contentL.text = self.textArray[indexPath.row];
    return cell;
}

- (void)tap:(UITapGestureRecognizer *)sender {
    
    UIImageView *superView = (UIImageView *)sender.view;
    UIView *contentView = superView.superview;
    
    UIImageView *fromView = nil;
    NSMutableArray *items = [NSMutableArray new];
//    NSArray<T1Media *> *images = cell.layout.images;
    
    for (NSUInteger i = 0, max = self.dataArray.count; i < max; i++) {
        YMPhotoGroupItem *item = [YMPhotoGroupItem new];
        item.thumbView = [contentView viewWithTag:10 + i];
        item.largeImageURL = [NSURL URLWithString:self.dataArray[i]];
        [items addObject:item];
        if (i == superView.tag - 10) {
            fromView = superView;
        }
    }
    
    YMPhotoBrowserView *v = [[YMPhotoBrowserView alloc] initWithGroupItems:items];
    [v presentFromImageView:fromView toContainer:self.view animated:YES completion:nil];
}

#pragma mark - Other Method
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
