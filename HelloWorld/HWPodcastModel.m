//
//  HWPodcastModel.m
//  HelloWorld
//
//  Created by Valery Olexienko on 16.11.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import "HWPodcastModel.h"
#import "GDataXMLNode.h"

@implementation HWPodcastModel

@synthesize title;
@synthesize description;
@synthesize imageUrl;

- (id)initWithTitle:(NSString *) title Description:(NSString *) description andImageUrl: (NSString *) imageUrl
{
    self = [super init];
    if (self) {
        self.title = title;
        self.description = description;
        self.imageUrl = imageUrl;
    }
    return self;
}

+ (void)parsePodcastsFromUrl:(NSString *) urlOrNill callback: (void (^)(NSArray*)) callbackOrNill{
    
    __block GDataXMLDocument *document;
    
    NSURL *url = [NSURL URLWithString: urlOrNill];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    id callback = ^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        NSMutableArray *result = [[NSMutableArray alloc] init];
        document = [[GDataXMLDocument alloc] initWithData:data options:0 error:&error];
        NSArray *items = [document nodesForXPath:@"//channel/item" error:&error];
        
        for (GDataXMLElement *item in items) {
            GDataXMLElement *titleTag = [item elementsForName:@"title"][0];
            GDataXMLElement *descriptionTag = [item elementsForName:@"description"][0];
            GDataXMLElement *imageUrlTag = [item elementsForName:@"itunes:image"][0];
            GDataXMLNode *imageUrlNode = [imageUrlTag attributeForName:@"href"];
            
            HWPodcastModel *m = [[HWPodcastModel alloc] initWithTitle:titleTag.stringValue Description:descriptionTag.stringValue andImageUrl:imageUrlNode.stringValue];
            
            [result addObject: m];
        }
        callbackOrNill(result);
    };

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:callback];

}

@end
