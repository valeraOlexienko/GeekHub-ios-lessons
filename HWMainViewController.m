//
//  HWMainViewController.m
//  HelloWorld
//
//  Created by Valery Olexienko on 10.10.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import "HWMainViewController.h"
#import "UIImageView+WebCache.h"
#import "HWPodcastModel.h"

@interface HWMainViewController ()

@end

@implementation HWMainViewController{
    NSArray *podcastItems;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (id)initWithPodcasts:(NSArray *)podcasts
{
    self = [super init];
    if (self){
        podcastItems = podcasts;
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtn:)];
    self.navigationItem.leftBarButtonItem = cancelBtn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation bar stuff -

- (IBAction)cancelBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TableView delegate stuff -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return podcastItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *id = @"cell_ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    HWPodcastModel *p = podcastItems[indexPath.row];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:p.imageUrl]
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    cell.textLabel.text = [NSString stringWithFormat:p.title, indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HWPodcastDetailsController *detailsController = [[HWPodcastDetailsController alloc] initWithPodcast:  podcastItems[indexPath.row]];
    self.navigationController.title = @"Podcast %li";
    [self.navigationController pushViewController:detailsController animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Number of podcasts: %li", podcastItems.count];
}

@end
