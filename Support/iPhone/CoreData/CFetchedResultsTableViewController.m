//
//  CFetchedResultsTableViewController.m
//  TouchCode
//
//  Created by Jonathan Wight on 6/10/09.
//  Copyright 2009 toxicsoftware.com, Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "CFetchedResultsTableViewController.h"

@implementation CFetchedResultsTableViewController

@synthesize fetchedResultsController;
@synthesize placeholderLabel;

- (void)dealloc
{
self.fetchedResultsController = NULL;
self.placeholderLabel = NULL;
//
[super dealloc];
}

#pragma mark -

- (UILabel *)placeholderLabel
{
if (placeholderLabel == NULL)
	{
	UILabel *theLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 44 * 3, 320, 44)] autorelease];
	theLabel.textAlignment = UITextAlignmentCenter;
	theLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize] + 3];
	theLabel.textColor = [UIColor grayColor];
	theLabel.opaque = NO;
	theLabel.backgroundColor = [UIColor clearColor];
	theLabel.text = @"No Rows";
	self.placeholderLabel = theLabel;
	}
return(placeholderLabel);
}

- (void)setPlaceholderLabel:(UILabel *)inPlaceholderLabel
{
if (placeholderLabel != inPlaceholderLabel)
	{
	[placeholderLabel release];
	placeholderLabel = [inPlaceholderLabel retain];
    }
}

#pragma mark -

- (void)viewWillAppear:(BOOL)animated
{
[super viewWillAppear:animated];

[self update];
}

- (void)update
{
[self.fetchedResultsController performFetch:NULL];
[self.tableView reloadData];

if (self.fetchedResultsController.fetchedObjects.count == 0)
	{
	if (self.placeholderLabel.superview != self.tableView)
		[self.tableView addSubview:self.placeholderLabel];
	}
else
	{
	if (self.placeholderLabel.superview == self.tableView)
		[self.placeholderLabel removeFromSuperview];
	}
}

@end
