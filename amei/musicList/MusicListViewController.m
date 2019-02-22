//
//  MusicListViewController.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicListViewController.h"

@interface MusicListViewController ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MusicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"音乐列表";
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    }
    return _tableView;
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
