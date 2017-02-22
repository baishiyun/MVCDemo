//
//  ViewController.m
//  MVCDemo
//
//  Created by 白仕云 on 2017/2/22.
//  Copyright © 2017年 BSY.com. All rights reserved.
//

#import "ViewController.h"
#import "MVCList.h"
#import "MVCListModel.h"
#import <Masonry.h>
#import <AFNetworking.h>

@interface ViewController ()
{
    MVCList *list;

    MVCListModel *listModel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"MVCDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUIForMVCList];

        [self getData];
}


- (void)creatUIForMVCList {

    list = [[MVCList alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:list];
    [list mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@(0));
    }];

    listModel = [[MVCListModel alloc]init];
    listModel.array = [NSMutableArray array];

}

-(void)getData
{

    UIActivityIndicatorView *hud  =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    hud.frame = CGRectMake(0, 0, 60, 60);
    [hud setCenter:self.view.center];
    [self.view addSubview:hud];
    [hud startAnimating];

    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    [manger GET:@"http://gank.io/api/data/iOS/50/1" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        [listModel.array addObjectsFromArray:[responseObject[@"results"] mutableCopy]];
        dispatch_async(dispatch_get_main_queue(), ^{
            list.listModel = listModel;
            [list reloadData];
            [hud stopAnimating];
            [hud setHidden:YES];
        });

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        [hud stopAnimating];
        [hud setHidden:YES];
    }];


}
@end
