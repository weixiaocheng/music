//
//  MusicListViewController.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicListViewController.h"
#import "MusicListManager.h"
#import "../musicPlay/MusicPlayViewController.h"
@interface MusicListViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MusicListManager *manager;
@property (nonatomic, strong) MusicPlayViewController *musicVC;
@end

@implementation MusicListViewController

- (MusicPlayViewController *)musicVC
{
    if (!_musicVC) {
        _musicVC = [[MusicPlayViewController alloc] init];
    }
    return _musicVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"音乐列表";
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-Height_BottomSafe);
    }];
}

- (MusicListManager *)manager
{
    if (!_manager) {
        _manager = [MusicListManager shareInstance];
    }
    return _manager;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.manager.musicList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idCell"];
    }
    MusicOBJ *obj = self.manager.musicList[indexPath.row];
    cell.textLabel.text = obj.name;
    cell.imageView.image = [UIImage imageNamed:obj.singerIcon];
    cell.detailTextLabel.text = obj.singer;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:false animated:true];
    MusicOBJ *obj = self.manager.musicList[indexPath.row];
    NSLog(@"\n选中的歌曲是 : %@\n", obj.name);
    [self presentViewController:self.musicVC animated:true completion:^{
        self.musicVC.musicObj = obj;
    }];
}

@end
