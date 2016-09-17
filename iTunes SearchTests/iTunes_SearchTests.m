//
//  iTunes_SearchTests.m
//  iTunes SearchTests
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ITSEntityController.h"
#import "ITSSearchContentViewController.h"
#import "BaseTableViewController.h"
#import "ITSResultsViewController.h"
#import "ITSItemDetailViewController.h"
#import "ITSThemeManager.h"
#import "ITSLabel.h"
#import "ITSJsonParser.h"
#import "ITSAPI.h"

NSString *testData = @"[{\"wrapperType\":\"track\", \"kind\":\"song\", \"artistId\":909253, \"collectionId\":879273552, \"trackId\":879273565, \"artistName\":\"Jack Johnson\", \"collectionName\":\"In Between Dreams\", \"trackName\":\"Better Together\", \"collectionCensoredName\":\"In Between Dreams\", \"trackCensoredName\":\"Better Together\", \"artistViewUrl\":\"https://itunes.apple.com/us/artist/jack-johnson/id909253?uo=4\", \"collectionViewUrl\":\"https://itunes.apple.com/us/album/better-together/id879273552?i=879273565&uo=4\", \"trackViewUrl\":\"https://itunes.apple.com/us/album/better-together/id879273552?i=879273565&uo=4\", \"previewUrl\":\"http://a898.phobos.apple.com/us/r1000/039/Music6/v4/13/22/67/1322678b-e40d-fb4d-8d9b-3268fe03b000/mzaf_8818596367816221008.plus.aac.p.m4a\", \"artworkUrl30\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/30x30bb.jpg\", \"artworkUrl60\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/60x60bb.jpg\", \"artworkUrl100\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/100x100bb.jpg\", \"collectionPrice\":10.99, \"trackPrice\":1.29, \"releaseDate\":\"2014-05-27T07:00:00Z\", \"collectionExplicitness\":\"notExplicit\", \"trackExplicitness\":\"notExplicit\", \"discCount\":1, \"discNumber\":1, \"trackCount\":15, \"trackNumber\":1, \"trackTimeMillis\":207679, \"country\":\"USA\", \"currency\":\"USD\", \"primaryGenreName\":\"Rock\", \"isStreamable\":true},{\"wrapperType\":\"track\", \"kind\":\"song\", \"artistId\":909253, \"collectionId\":879273552, \"trackId\":879273565, \"artistName\":\"Jack Johnson\", \"collectionName\":\"In Between Dreams\", \"trackName\":\"Better Together\", \"collectionCensoredName\":\"In Between Dreams\", \"trackCensoredName\":\"Better Together\", \"artistViewUrl\":\"https://itunes.apple.com/us/artist/jack-johnson/id909253?uo=4\", \"collectionViewUrl\":\"https://itunes.apple.com/us/album/better-together/id879273552?i=879273565&uo=4\", \"trackViewUrl\":\"https://itunes.apple.com/us/album/better-together/id879273552?i=879273565&uo=4\", \"previewUrl\":\"http://a898.phobos.apple.com/us/r1000/039/Music6/v4/13/22/67/1322678b-e40d-fb4d-8d9b-3268fe03b000/mzaf_8818596367816221008.plus.aac.p.m4a\", \"artworkUrl30\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/30x30bb.jpg\", \"artworkUrl60\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/60x60bb.jpg\", \"artworkUrl100\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/100x100bb.jpg\", \"collectionPrice\":10.99, \"trackPrice\":1.29, \"releaseDate\":\"2014-05-27T07:00:00Z\", \"collectionExplicitness\":\"notExplicit\", \"trackExplicitness\":\"notExplicit\", \"discCount\":1, \"discNumber\":1, \"trackCount\":15, \"trackNumber\":1, \"trackTimeMillis\":207679, \"country\":\"USA\", \"currency\":\"USD\", \"primaryGenreName\":\"Rock\", \"isStreamable\":true},{\"wrapperType\":\"track\", \"kind\":\"song\", \"artistId\":909253, \"collectionId\":879273552, \"trackId\":879273565, \"artistName\":\"Jack Johnson\", \"collectionName\":\"In Between Dreams\", \"trackName\":\"Better Together\", \"collectionCensoredName\":\"In Between Dreams\", \"trackCensoredName\":\"Better Together\", \"artistViewUrl\":\"https://itunes.apple.com/us/artist/jack-johnson/id909253?uo=4\", \"collectionViewUrl\":\"https://itunes.apple.com/us/album/better-together/id879273552?i=879273565&uo=4\", \"trackViewUrl\":\"https://itunes.apple.com/us/album/better-together/id879273552?i=879273565&uo=4\", \"previewUrl\":\"http://a898.phobos.apple.com/us/r1000/039/Music6/v4/13/22/67/1322678b-e40d-fb4d-8d9b-3268fe03b000/mzaf_8818596367816221008.plus.aac.p.m4a\", \"artworkUrl30\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/30x30bb.jpg\", \"artworkUrl60\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/60x60bb.jpg\", \"artworkUrl100\":\"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/100x100bb.jpg\", \"collectionPrice\":10.99, \"trackPrice\":1.29, \"releaseDate\":\"2014-05-27T07:00:00Z\", \"collectionExplicitness\":\"notExplicit\", \"trackExplicitness\":\"notExplicit\", \"discCount\":1, \"discNumber\":1, \"trackCount\":15, \"trackNumber\":1, \"trackTimeMillis\":207679, \"country\":\"USA\", \"currency\":\"USD\", \"primaryGenreName\":\"Rock\", \"isStreamable\":true}]";

@interface iTunes_SearchTests : XCTestCase <ITSSearchContentViewControllerDelegate>
@end

@implementation iTunes_SearchTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAPIURLs {
    NSAssert([[ITSAPI urlFromTerm:@"term" entity:@"entity"] isEqual:[NSURL URLWithString:@"https://itunes.apple.com/search?term=term&limit=200&entity=entity"]], @"url is not populated correctly");
    NSAssert([[ITSAPI urlFromTerm:@"term term" entity:@"entity"] isEqual:[NSURL URLWithString:@"https://itunes.apple.com/search?term=term+term&limit=200&entity=entity"]], @"url is not populated correctly");
    NSAssert([[ITSAPI urlFromTerm:@"term term" entity:nil] isEqual:[NSURL URLWithString:@"https://itunes.apple.com/search?term=term+term&limit=200"]], @"url is not populated correctly");
    NSAssert([[ITSAPI urlFromTerm:@"term" entity:nil] isEqual:[NSURL URLWithString:@"https://itunes.apple.com/search?term=term&limit=200"]], @"url is not populated correctly");
    NSAssert([[ITSAPI urlFromTerm:@"term term term" entity:@"entity"] isEqual:[NSURL URLWithString:@"https://itunes.apple.com/search?term=term+term+term&limit=200&entity=entity"]], @"url is not populated correctly");
}

- (void)testBaseController {
    BaseTableViewController *controller = [[BaseTableViewController alloc] initWithNibName:nil bundle:nil];
    [controller viewDidLoad];
    
    NSAssert(controller.tableView.numberOfSections == 1, @"section count is wrong");
    NSAssert(controller.tableView.rowHeight == UITableViewAutomaticDimension, @"row height is wrong");
    NSAssert(controller.tableView.estimatedRowHeight == 60, @"estimated row height is wrong");
    NSAssert([controller.tableView numberOfRowsInSection:0] == 0, @"row count is wrong");
}

- (void)testEntity {
    ITSEntityController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"entity"];
    
    NSAssert([controller isKindOfClass:[BaseTableViewController class]], @"controller inherits from the wrong class");
    NSAssert(controller != nil, @"entity controller was not instantiated");
    NSAssert([[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController] isKindOfClass:[UINavigationController class]], @"root controller should be a navigation controller");
    NSAssert(controller.tableView != nil, @"tableview should not be nil");
    NSAssert(controller.tableView.rowHeight == UITableViewAutomaticDimension, @"row height is wrong");
    NSAssert(controller.tableView.estimatedRowHeight == 60, @"estimated row height is wrong");
}

- (void)testTheme {
    NSAssert([ITSThemeManager sizeNormal] == [UIFont systemFontSize], @"normal size font is wrong");
    NSAssert([[ITSThemeManager ITSLogo] isEqual:[UIImage imageNamed:@"logo.png"]], @"logo is worng");
    NSAssert([[ITSThemeManager defaultBackgroundColor] isEqual:[UIColor lightGrayColor]], @"background color is wrong");
}

- (void)testParsing {
    NSAssert([ITSJsonParser extractBoolFromJSON:nil] == false, @"bad parsing");
    NSAssert([ITSJsonParser extractBoolFromJSON:@[]] == false, @"bad parsing");
    NSAssert([ITSJsonParser extractBoolFromJSON:@(false)] == false, @"bad parsing");
    NSAssert([ITSJsonParser extractBoolFromJSON:@(true)] == true, @"bad parsing");
    
    NSAssert([[ITSJsonParser extractArrayFromJSON:nil] isEqual:@[]], @"bad parsing");
    NSAssert([[ITSJsonParser extractArrayFromJSON:@(true)] isEqual:@[]], @"bad parsing");
    NSAssert([[ITSJsonParser extractArrayFromJSON:@[]] isEqual:@[]], @"bad parsing");
    NSAssert([[ITSJsonParser extractArrayFromJSON:@[@"1"]] isEqual:@[@"1"]], @"bad parsing");
    NSAssert(![[ITSJsonParser extractArrayFromJSON:@[@"1"]] isEqual:@[@"2"]], @"bad parsing");
    
    NSAssert([[ITSJsonParser extractDictionaryFromJSON:nil] isEqual:@{}], @"bad parsing");
    NSAssert([[ITSJsonParser extractDictionaryFromJSON:@"string"] isEqual:@{}], @"bad parsing");
    NSAssert([[ITSJsonParser extractDictionaryFromJSON:@{}] isEqual:@{}], @"bad parsing");
    NSAssert([[ITSJsonParser extractDictionaryFromJSON:@{@"key" : @"value"}] isEqual:@{@"key" : @"value"}], @"bad parsing");
    NSAssert(![[ITSJsonParser extractDictionaryFromJSON:@{@"key" : @"value"}] isEqual:@{@"key" : @"value2"}], @"bad parsing");
    
    NSAssert([[ITSJsonParser extractNumberFromJSON:nil] isEqual:@0], @"bad parsing");
    NSAssert([[ITSJsonParser extractNumberFromJSON:@[]] isEqual:@0], @"bad parsing");
    NSAssert([[ITSJsonParser extractNumberFromJSON:@0] isEqual:@0], @"bad parsing");
    NSAssert([[ITSJsonParser extractNumberFromJSON:@450] isEqual:@450], @"bad parsing");
    NSAssert(![[ITSJsonParser extractNumberFromJSON:@450] isEqual:@45], @"bad parsing");
    
    NSAssert([[ITSJsonParser extractStringFromJSON:nil] isEqual:@"unavailable"], @"bad parsing");
    NSAssert([[ITSJsonParser extractStringFromJSON:@123] isEqual:@"unavailable"], @"bad parsing");
    NSAssert([[ITSJsonParser extractStringFromJSON:@""] isEqual:@""], @"bad parsing");
    NSAssert([[ITSJsonParser extractStringFromJSON:@"test"] isEqual:@"test"], @"bad parsing");
    NSAssert(![[ITSJsonParser extractStringFromJSON:@"test"] isEqual:@"tesst"], @"bad parsing");
    
    NSError *error = nil;
    
    NSData *data = [testData dataUsingEncoding:kCFStringEncodingUTF8];
    NSAssert(data != nil, @"bad test data fetch");
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    NSAssert(error == nil, @"bad test data pasring");
    
    NSArray *array = [NSArray new];
    
    NSAssert([[ITSJsonParser extractArrayFromJSON:json] isKindOfClass:[NSArray class]], @"wrong type returned from API");
    
    array = [ITSJsonParser extractArrayFromJSON:json];
    
    NSAssert(array.count == 3, @"should be 3 objects, something went wrong creating the raw data array");
    NSAssert([array.firstObject isKindOfClass:[NSDictionary class]], @"wrong object type parsed, should be a dictionary");
    
    [self testParsingArrayData:array];
}

- (void)testParsingArrayData:(NSArray *)array {
    NSArray<ITSMediaObject *> *dataArray = [NSArray new];
    
    for (NSDictionary *dict in array) {
        ITSMediaObject *objct = [[ITSMediaObject alloc] initWithDictionary:dict];
        NSAssert(objct != nil, @"oITSMediaObject creation failed");
        dataArray = [dataArray arrayByAddingObject:objct];
    }
    
    NSAssert(dataArray.count == 3, @"should be 3 ITSMediaObjects, something went wrong creating the parsed data array");
    NSAssert(dataArray.firstObject.kind != nil || dataArray.firstObject.kind.length > 0, @"all object tyoes should have a kind");
    
    for (ITSMediaObject *object in dataArray)
        [self testMediaObject:object];
    
    [self testResults:dataArray];
}

- (void)testMediaObject:(ITSMediaObject *)object {
    NSAssert(object.wrapperType != nil, @"wrapperType is nil");
    NSAssert(object.kind != nil, @"kind is nil");
    NSAssert(object.artistId != nil, @"artistId is nil");
    NSAssert(object.collectionId != nil, @"collectionId is nil");
    NSAssert(object.trackId != nil, @"trackId is nil");
    NSAssert(object.artistName != nil, @"artistName is nil");
    NSAssert(object.collectionName != nil, @"collectionName is nil");
    NSAssert(object.artworkUrl30 != nil, @"artworkUrl30 is nil");
    NSAssert(object.artworkUrl60 != nil, @"artworkUrl60 is nil");
    NSAssert(object.artworkUrl100 != nil, @"artworkUrl100 is nil");
    NSAssert(object.previewUrl != nil, @"previewUrl is nil");
    NSAssert(object.trackPrice != nil, @"trackPrice is nil");
    NSAssert(object.longDescription != nil, @"longDescription is nil");
    NSAssert(object.shortDescription != nil, @"shortDescription is nil");
    
    NSAssert(![object.description isEqualToString:@""], @"needs description set");
    
    NSString *tryDescription =[NSString stringWithFormat:@"%@ %@ %@ %i %i %i %i",
                               object.artistName,
                               object.kind,
                               object.trackPrice,
                               object.shortDescription != nil,
                               object.longDescription != nil,
                               object.artworkUrl30 != nil,
                               object.artworkUrl100 != nil];
    
    NSAssert([object.description isEqualToString:tryDescription], @"needs description set properly");
}

- (void)testResults:(NSArray<ITSMediaObject *> *)results {
    ITSResultsViewController *controller = [[ITSResultsViewController alloc] initWithResults:results];
    
    NSAssert(controller.results != nil, @"results should not be nil");
    NSAssert([controller.results isEqual:results], @"results arrays are not the same");
    
    [controller viewDidLoad];
    
    NSAssert(controller.tableView != nil, @"tableview should not be nil");
    NSAssert([controller.tableView numberOfRowsInSection:0] == controller.results.count, @"row count is wrong");
    NSAssert(controller.tableView.rowHeight == UITableViewAutomaticDimension, @"row height is wrong");
    NSAssert(controller.tableView.estimatedRowHeight == 60, @"estimated row height is wrong");
    
    for (ITSMediaObject *object in controller.results)
        [self testResultsDetail:object];
}

- (void)testResultsDetail:(ITSMediaObject *)result {
    ITSItemDetailViewController *controller = [[ITSItemDetailViewController alloc] initWithResult:result];
    
    NSAssert([controller.result isEqual:result], @"result object is not the same as the passed object");
    
    [controller viewDidLoad];
    
    NSAssert(controller.tableView != nil, @"tableview should not be nil");
    NSAssert(controller.tableView.numberOfSections == 3, @"section count is wrong");
    NSAssert(controller.tableView.rowHeight == UITableViewAutomaticDimension, @"row height is wrong");
    NSAssert(controller.tableView.estimatedRowHeight == 60, @"estimated row height is wrong");
    NSAssert([controller.tableView numberOfRowsInSection:0] == 1, @"row count is wrong");
    NSAssert([controller.tableView numberOfRowsInSection:1] == 1, @"row count is wrong");
    NSAssert([controller.tableView numberOfRowsInSection:2] == 1, @"row count is wrong");
    NSAssert([[controller.tableView.dataSource tableView:controller.tableView titleForHeaderInSection:0] isEqualToString:kNameHeader], @"title is wrong");
    NSAssert([[controller.tableView.dataSource tableView:controller.tableView titleForHeaderInSection:1] isEqualToString:kArtworkHeader], @"title is wrong");
    NSAssert([[controller.tableView.dataSource tableView:controller.tableView titleForHeaderInSection:2] isEqualToString:kDescriptionHeader], @"title is wrong");
    NSAssert([controller.tableView.delegate tableView:controller.tableView heightForHeaderInSection:0] == kHeaderHeight, @"header height is wrong");
    NSAssert([controller.tableView.delegate tableView:controller.tableView heightForHeaderInSection:1] == kHeaderHeight, @"header height is wrong");
    NSAssert([controller.tableView.delegate tableView:controller.tableView heightForHeaderInSection:2] == kHeaderHeight, @"header height is wrong");
}

- (void)testSearchContentController {
    ITSSearchContentViewController *content = [[ITSSearchContentViewController alloc] initWithDelegate:self];
    NSAssert(content.delegate != nil, @"delegate should not be nil");
    NSAssert(content.delegate == self, @"delegate should be self");
    
    [content viewDidLoad];
    
    NSAssert(content.textField != nil, @"textField shouldn't be nil");
    NSAssert(content.textField.adjustsFontSizeToFitWidth == YES, @"textField should adjust width accordingly");
    NSAssert(content.textField.autocorrectionType == UITextAutocorrectionTypeNo, @"textField should not have autocorrection enabled");
    NSAssert(content.textField.font == [ITSThemeManager defaultFont], @"textField is using th wrong font type");
    NSAssert(content.textField.delegate = content, @"textField delegate is not set properly");
    
    [content viewDidAppear:YES];
    
    [content searchButtonTapped];
    content.textField.text = @"test";
    [content searchButtonTapped];
}

- (void)ITSSearchContentViewController:(ITSSearchContentViewController *)controller didReturnWithSearchTerm:(NSString *)term {
    NSAssert(term.length > 0, @"empty string should never be returned");
}

- (void)testLabel {
    ITSLabel *label = [ITSLabel new];
    
    NSAssert(label.numberOfLines == 0, @"number of lines should be 0");
    NSAssert([label.font isEqual:[ITSThemeManager defaultFont]], @"wrong font");
}

@end
