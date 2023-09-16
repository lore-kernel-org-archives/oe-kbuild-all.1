Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC861B276
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694889441; x=1726425441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YOGAVNuW+UqfRQLtuOXh1XS4peXu+kHZhY795OsMjSY=;
  b=Po8rcjiMvB+9z249Cs+Pghs7pD/lSjtH7OJo1U7gzmG9qyZZeraXUZar
   VbxHp+N6qo4UYQ6JecA7icAOsPzcbwMKMdT+Z8BcmLzHaTXkJDCKwYPM6
   NY/p6v4cJFKVAtAg3AqOnZlu+6tPif1X0Qwk8maDwMy/Xst50y+XsOQ5W
   Uohi0YunwM0BjYfqU5EGWShfY+NFMdnjItLsMPx7u5Q8OwaDV1n4uM67M
   L38/ECBk88Bl7Jjb3+E7F/TV4n7T32VLEwWpTJk32OjpzUa+8kzHfoo2u
   jpmxqrmffBWSPF3tTnZswMoB3PFkbd3OPsjAPuuXAtEASLgTX5Pe/iIbB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="378348147"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="378348147"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 11:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="748576776"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="748576776"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Sep 2023 11:37:16 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhaAM-0004Z6-2A;
	Sat, 16 Sep 2023 18:37:14 +0000
Date: Sun, 17 Sep 2023 02:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 184/184] lib/kunit/executor.c:36:43:
 warning: declaration of 'struct kunit_glob_filter' will not be visible
 outside of this function
Message-ID: <202309170220.UlKObbOB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.5
head:   715180d7be0dc7b490130050422b9e80d26008fd
commit: 715180d7be0dc7b490130050422b9e80d26008fd [184/184] kunit: Fix possible null-ptr-deref in kunit_parse_glob_filter()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230917/202309170220.UlKObbOB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170220.UlKObbOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170220.UlKObbOB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/executor.c:36:43: warning: declaration of 'struct kunit_glob_filter' will not be visible outside of this function [-Wvisibility]
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:43:9: error: incomplete definition of type 'struct kunit_glob_filter'
                   parsed->suite_glob = kzalloc(len + 1, GFP_KERNEL);
                   ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:44:14: error: incomplete definition of type 'struct kunit_glob_filter'
                   if (!parsed->suite_glob)
                        ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:47:9: error: incomplete definition of type 'struct kunit_glob_filter'
                   parsed->test_glob = NULL;
                   ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:48:16: error: incomplete definition of type 'struct kunit_glob_filter'
                   strcpy(parsed->suite_glob, filter_glob);
                          ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:52:8: error: incomplete definition of type 'struct kunit_glob_filter'
           parsed->suite_glob = kzalloc(period - filter_glob + 1, GFP_KERNEL);
           ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:53:13: error: incomplete definition of type 'struct kunit_glob_filter'
           if (!parsed->suite_glob)
                ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:56:8: error: incomplete definition of type 'struct kunit_glob_filter'
           parsed->test_glob = kzalloc(len - (period - filter_glob) + 1, GFP_KERNEL);
           ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:57:13: error: incomplete definition of type 'struct kunit_glob_filter'
           if (!parsed->test_glob) {
                ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:58:15: error: incomplete definition of type 'struct kunit_glob_filter'
                   kfree(parsed->suite_glob);
                         ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:62:16: error: incomplete definition of type 'struct kunit_glob_filter'
           strncpy(parsed->suite_glob, filter_glob, period - filter_glob);
                   ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:63:16: error: incomplete definition of type 'struct kunit_glob_filter'
           strncpy(parsed->test_glob, period + 1, len - (period - filter_glob));
                   ~~~~~~^
   lib/kunit/executor.c:36:43: note: forward declaration of 'struct kunit_glob_filter'
   static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                             ^
   lib/kunit/executor.c:141:35: error: use of undeclared identifier 'parsed_glob'
                   *err = kunit_parse_glob_filter(&parsed_glob, filter_glob);
                                                   ^
   lib/kunit/executor.c:143:9: error: use of undeclared label 'free_copy'
                           goto free_copy;
                                ^
   1 warning and 13 errors generated.


vim +36 lib/kunit/executor.c

    34	
    35	/* Split "suite_glob.test_glob" into two. Assumes filter_glob is not empty. */
  > 36	static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
    37					    const char *filter_glob)
    38	{
    39		const int len = strlen(filter_glob);
    40		const char *period = strchr(filter_glob, '.');
    41	
    42		if (!period) {
    43			parsed->suite_glob = kzalloc(len + 1, GFP_KERNEL);
    44			if (!parsed->suite_glob)
    45				return -ENOMEM;
    46	
    47			parsed->test_glob = NULL;
    48			strcpy(parsed->suite_glob, filter_glob);
    49			return 0;
    50		}
    51	
    52		parsed->suite_glob = kzalloc(period - filter_glob + 1, GFP_KERNEL);
    53		if (!parsed->suite_glob)
    54			return -ENOMEM;
    55	
    56		parsed->test_glob = kzalloc(len - (period - filter_glob) + 1, GFP_KERNEL);
    57		if (!parsed->test_glob) {
    58			kfree(parsed->suite_glob);
    59			return -ENOMEM;
    60		}
    61	
    62		strncpy(parsed->suite_glob, filter_glob, period - filter_glob);
    63		strncpy(parsed->test_glob, period + 1, len - (period - filter_glob));
    64	
    65		return 0;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
