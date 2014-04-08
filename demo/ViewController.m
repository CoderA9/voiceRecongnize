//
//  ViewController.m
//  demo
//
//  Created by ANine on 4/7/14.
//  Copyright (c) 2014 apple. All rights reserved.
//

#import "ViewController.h"
#import "AVSpeechUtteranceViewController.h"
#import "OpenEars_OfflineSpecchRecognize.h"
#define  tourialCnt   3

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            AVSpeechUtteranceViewController *vc =[[AVSpeechUtteranceViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
            vc = nil;
        }
            break;
        case 1: {
            OpenEars_OfflineSpecchRecognize *vc =[[OpenEars_OfflineSpecchRecognize alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
            vc = nil;

        }
            break;
        case 2: {
        }
            break;

        default:
            break;
    }
}

#pragma mark - UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tourialCnt;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDENTIFIER"];
    if (! cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IDENTIFIER"];
    }
    NSArray *array = @[@"文字转语音",@"Offline speech recognize",@"Synthesized speech/text-to-speech"];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
