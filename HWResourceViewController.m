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
    [HWPodcastModel parsePodcastsFromUrl:urlField.text callback:^(NSArray *results){
        UIViewController *mainController = [[HWMainViewController alloc] initWithPodcasts:results];
        [self.navigationController pushViewController:mainController animated:YES];
    }];
    
    
//    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];
//    reach.reachableBlock = ^(Reachability*reach)
//    {
//        
//    };
//    reach.unreachableBlock = ^(Reachability*reach)
//    {
//        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error!"
//                                                          message:@"No Internet connection"
//                                                         delegate:nil
//                                                cancelButtonTitle:@"OK"
//                                                otherButtonTitles:nil];
//        [message show];
//    };
//    [reach startNotifier];
}


@end
