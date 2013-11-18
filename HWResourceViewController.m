//
//  HWResourceViewController.m
//  HelloWorld
//
//  Created by Valery Olexienko on 10.11.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import "HWResourceViewController.h"
#import "HWMainViewController.h"
#import "HWPodcastModel.h"
#import "Reachability.h"
#import "MBProgressHUD.h"

@interface HWResourceViewController ()

@end

@implementation HWResourceViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)applyBtnTap:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [HWPodcastModel parsePodcastsFromUrl:urlField.text callback:^(NSArray *results){
        UIViewController *mainController = [[HWMainViewController alloc] initWithPodcasts:results];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainController];
        navigationController.topViewController.title = @"Podcasts";
        
        [self presentViewController:navigationController animated:YES completion:nil];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}


@end
