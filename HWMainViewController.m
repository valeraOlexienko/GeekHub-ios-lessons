//
//  HWMainViewController.m
//  HelloWorld
//
//  Created by Valery Olexienko on 10.10.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import "HWMainViewController.h"
#import "GDataXMLNode.h"
#import "UIImageView+WebCache.h"

@interface HWMainViewController ()

@property (strong, nonatomic) GDataXMLDocument *document;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSString *url;

@end

@implementation HWMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self grabPodcasts];
}

- (void)grabPodcasts
{
    if (!_url){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                          message:@"Please provide url to grab podcasts"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return;
    }
    
    self.document = [[GDataXMLDocument alloc] initWithData:data options:0 error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return;
    }
    _items = [self.document nodesForXPath:@"//channel/item" error:&error];
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Apply Item handler
- (IBAction)change:(id)sender
{
    _url = textField.text;
   [self grabPodcasts];
}

// Table view stuff
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *id = @"cell_ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    GDataXMLElement *item = _items[indexPath.row];
    NSString *cellName = @"[default]";
    NSArray *titles = [item elementsForName:@"title"];
    if (titles.count > 0) {
        GDataXMLElement *title = titles[0];
        cellName = title.stringValue;
    }
    
    NSArray *images = [item elementsForName:@"itunes:image"];
    NSString *cellImage = @"";
    if (images.count > 0) {
        GDataXMLElement *image = images[0];
        GDataXMLNode *href = [image attributeForName:@"href"];
        cellImage = href.stringValue;
    }
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:cellImage]
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    cell.textLabel.text = [NSString stringWithFormat:cellName, indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HWPodcastDetailsController *detailsController = [[HWPodcastDetailsController alloc] initWithPodcastName: [NSString stringWithFormat:@"Podcast %li", indexPath.row]];
    [self.navigationController pushViewController:detailsController animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Number of podcasts: %li", _items.count];
}

@end
