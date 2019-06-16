#include "HomeDockXRootListController.h"
#import <spawn.h>

@implementation HomeDockXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void)respring {
	CFPreferencesSynchronize(CFSTR("pw.ssnull.homedockx"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

	pid_t pid;
	const char *args[] = {"killall", "-9", "backboardd", NULL};
	posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char *const *)args, NULL);
}

@end
