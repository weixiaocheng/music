//
//  CrlView.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//  显示歌词 和 歌曲的背景

#import "CrlView.h"

@interface CrlView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *changeBtn;
@property (nonatomic, strong) UIImageView *backview;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CrlView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.backview.image = [UIImage imageNamed:imageName];
}

- (void)setUpUI
{
    self.backview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    self.backview.contentMode = UIViewContentModeScaleAspectFill;
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.backBtn setImage:[UIImage imageNamed:@"quit"] forState:UIControlStateNormal];
    [self.changeBtn setImage:[UIImage imageNamed:@"lyric_normal"] forState:UIControlStateNormal];
    [self addSubview:self.backview];
    [self addSubview:self.tableView];
    [self addSubview:self.backBtn];
    [self addSubview:self.changeBtn];
    WeakSelf;
    [self.backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(weakSelf);
    }];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(10);
        make.top.equalTo(weakSelf).offset(Height_NavBar );
        make.width.offset(42);
        make.height.offset(48);
    }];
    
    [self.changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-10);
        make.top.equalTo(weakSelf).offset(Height_NavBar);
        make.width.offset(42);
        make.height.offset(48);
    }];
    
    // 添加点击事件
    [self.backBtn addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    [self.changeBtn addTarget:self action:@selector(showOrhiddenLrc:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setDatasoure:(NSArray<MusicLrcOBJ *> *)datasoure
{
    _datasoure = datasoure;
    [self.tableView reloadData];
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"28131977_1383101943208"]];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.hidden = true;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, 80)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, 80)];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasoure.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"idCell"];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.numberOfLines = 0;
    }
    MusicLrcOBJ *lrcObj = self.datasoure[indexPath.row];
    cell.textLabel.text = lrcObj.word;
    return cell;
}


- (void)dismissView{
    if ([self.delegate respondsToSelector:@selector(backCrlView:)]) {
        [self.delegate backCrlView:self];
    }
}

// 显示歌词 如果没有 打开 就不进行关于歌词的进行时
- (void)showOrhiddenLrc: (UIButton *)sender
{
    self.tableView.hidden = !self.tableView.hidden;
}

@end
