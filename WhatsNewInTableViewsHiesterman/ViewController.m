//
//  ViewController.m
//  WhatsNewInTableViewsHiesterman
//
//  Created by Jan Jirout on 1/30/15.
//  Copyright (c) 2015 Indiegogo. All rights reserved.
//

#import "ViewController.h"
#import "DynamicCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *headlines;
@property NSMutableDictionary *estimatedRowHeightCache;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[DynamicCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
    
    self.estimatedRowHeightCache = [NSMutableDictionary new];
    
    [self loadHeadlines];
}


- (void)loadHeadlines {
    self.headlines = @[
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       ];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"subview" sender:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.headlines.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.headlineLabel.text = _headlines[indexPath.row];
    
    // put estimated cell height in cache if needed
    if (![self isEstimatedRowHeightInCache:indexPath]) {
        CGSize cellSize = [cell systemLayoutSizeFittingSize:CGSizeMake(self.view.frame.size.width, 0) withHorizontalFittingPriority:1000.0 verticalFittingPriority:50.0];
        [self putEstimatedCellHeightToCache:indexPath height:cellSize.height];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self getEstimatedCellHeightFromCache:indexPath defaultHeight:41.5];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"Content Height: %f", self.tableView.contentSize.height);
}

#pragma mark - estimated height cache methods
// From http://stackoverflow.com/a/26371697/40444
// put height to cache
- (void) putEstimatedCellHeightToCache:(NSIndexPath *) indexPath height:(CGFloat) height {
    [self initEstimatedRowHeightCacheIfNeeded];
    [self.estimatedRowHeightCache setValue:[[NSNumber alloc] initWithFloat:height] forKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
}

// get height from cache
- (CGFloat) getEstimatedCellHeightFromCache:(NSIndexPath *) indexPath defaultHeight:(CGFloat) defaultHeight {
    [self initEstimatedRowHeightCacheIfNeeded];
    NSNumber *estimatedHeight = [self.estimatedRowHeightCache valueForKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
    if (estimatedHeight != nil) {
        //NSLog(@"cached: %f", [estimatedHeight floatValue]);
        return [estimatedHeight floatValue];
    }
    //NSLog(@"not cached: %f", defaultHeight);
    return defaultHeight;
}

// check if height is on cache
- (BOOL) isEstimatedRowHeightInCache:(NSIndexPath *) indexPath {
    if ([self getEstimatedCellHeightFromCache:indexPath defaultHeight:0] > 0) {
        return YES;
    }
    return NO;
}

// init cache
-(void) initEstimatedRowHeightCacheIfNeeded {
    if (self.estimatedRowHeightCache == nil) {
        self.estimatedRowHeightCache = [[NSMutableDictionary alloc] init];
    }
}

// custom [self.tableView reloadData]
-(void) tableViewReloadData {
    // clear cache on reload
    self.estimatedRowHeightCache = [[NSMutableDictionary alloc] init];
    [self.tableView reloadData];
}

@end
