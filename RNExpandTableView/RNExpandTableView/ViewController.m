//
//  ViewController.m
//  RNExpandTableView
//
//  Created by 婉卿容若 on 2016/12/9.
//  Copyright © 2016年 婉卿容若. All rights reserved.
//

#import "ViewController.h"
#import "RNExpandTableViewCell.h"


#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) NSMutableDictionary *modelDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"expandCell";
    
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark - lazy

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStyleGrouped];
        [_tableView registerNib:[UINib nibWithNibName:@"RNExpandTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            demoModel *model = [[demoModel alloc] init];
            model.No = [NSString stringWithFormat:@"Num%d期",i];
            [_dataSource addObject:model];
            
        }
        
        [_tableView reloadData];
    }
    
    return _dataSource;
}

- (NSMutableDictionary *)modelDic{
    if (!_modelDic) {
        _modelDic = [[NSMutableDictionary alloc] init];
    }
    
    return _modelDic;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event repsonse

- (void)expandAction:(UIButton *)sender{
    
    [self.modelDic setValue:self.dataSource[sender.tag] forKey:@(sender.tag)];
    
    NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:sender.tag];
    [self.tableView reloadSections:set withRowAnimation: UITableViewRowAnimationFade];
}

#pragma UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([self.modelDic objectForKey:@(section)]) {
        return 1;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 230;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
    headView.backgroundColor = [UIColor orangeColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 10, 200, 30)];
    titleLabel.text = @"20001000lakjlk";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [headView addSubview:titleLabel];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(WIDTH-50, 10, 50, 30);
    btn.titleLabel.textColor = [UIColor blueColor];
    [btn setTitle:@"展开" forState: UIControlStateNormal];
    
    btn.tag = section;
    [btn addTarget:self action:@selector(expandAction:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:btn];
    
    return  headView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cellID";
    RNExpandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RNExpandTableViewCell" owner:nil options:nil] lastObject];
    }
    
    cell.currentModel = [_dataSource objectAtIndex:indexPath.section];
    cell.myIndexpath = indexPath;
//    cell.myContentView.hidden = true;
//    
//    [cell setCallback:^(NSIndexPath *index){
//        self.rowHeightDic[@(index.section)] = @(280);
//        
//        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:index.section];
//        [self.tableView reloadSections:set withRowAnimation: UITableViewRowAnimationFade];
//    }];
//    
    return cell;
}


@end
