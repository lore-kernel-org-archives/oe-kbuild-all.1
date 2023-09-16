Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C612B9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694878209; x=1726414209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5/TrRGwAZue0Bg7dr0nyQ0t/q/LKtp/8nhlgEBpa+aM=;
  b=ZSx+PNhgCmM/Ubxpf6/MsXt0JMNDtn1Nx+2Vz1xqPPmJfg0dVfn/er6F
   kzG2NF1SSZscTHjuWKcpMW8mpf/61NPkkOkJVCVJXtB0x4SqzrpkWkS+Z
   iS1hQE0SIchx0yXgom1Ne+ex6kqs5VxQEJmGs2kuW10dx4yzZrEXIeDjK
   /WctfKkad+kwSdd4PzIMHeuhAF/IPm4KGJ4TE+2dA5r79cBm/cqnqBOzR
   CfqTUc4RYl2YfrXchN9jhwQH1uvsWmmaRQikUMjuqSta29DaLElXrk31K
   kbDKeExnwD/1uM8CoQeZQUEkepRH+FtOKXkZmBRPma/EgojCwedi9vQB+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="358837630"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="358837630"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 08:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="780442428"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="780442428"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Sep 2023 08:29:58 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhXF6-0004Ns-1b;
	Sat, 16 Sep 2023 15:29:56 +0000
Date: Sat, 16 Sep 2023 23:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 184/184] lib/kunit/executor.c:43:23:
 error: invalid use of undefined type 'struct kunit_glob_filter'
Message-ID: <202309162334.w2FXLNpG-lkp@intel.com>
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
config: i386-buildonly-randconfig-006-20230916 (https://download.01.org/0day-ci/archive/20230916/202309162334.w2FXLNpG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309162334.w2FXLNpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309162334.w2FXLNpG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> lib/kunit/executor.c:36:43: warning: 'struct kunit_glob_filter' declared inside parameter list will not be visible outside of this definition or declaration
      36 | static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
         |                                           ^~~~~~~~~~~~~~~~~
   lib/kunit/executor.c: In function 'kunit_parse_glob_filter':
>> lib/kunit/executor.c:43:23: error: invalid use of undefined type 'struct kunit_glob_filter'
      43 |                 parsed->suite_glob = kzalloc(len + 1, GFP_KERNEL);
         |                       ^~
   lib/kunit/executor.c:44:28: error: invalid use of undefined type 'struct kunit_glob_filter'
      44 |                 if (!parsed->suite_glob)
         |                            ^~
   lib/kunit/executor.c:47:23: error: invalid use of undefined type 'struct kunit_glob_filter'
      47 |                 parsed->test_glob = NULL;
         |                       ^~
   lib/kunit/executor.c:48:30: error: invalid use of undefined type 'struct kunit_glob_filter'
      48 |                 strcpy(parsed->suite_glob, filter_glob);
         |                              ^~
   lib/kunit/executor.c:52:15: error: invalid use of undefined type 'struct kunit_glob_filter'
      52 |         parsed->suite_glob = kzalloc(period - filter_glob + 1, GFP_KERNEL);
         |               ^~
   lib/kunit/executor.c:53:20: error: invalid use of undefined type 'struct kunit_glob_filter'
      53 |         if (!parsed->suite_glob)
         |                    ^~
   lib/kunit/executor.c:56:15: error: invalid use of undefined type 'struct kunit_glob_filter'
      56 |         parsed->test_glob = kzalloc(len - (period - filter_glob) + 1, GFP_KERNEL);
         |               ^~
   lib/kunit/executor.c:57:20: error: invalid use of undefined type 'struct kunit_glob_filter'
      57 |         if (!parsed->test_glob) {
         |                    ^~
   lib/kunit/executor.c:58:29: error: invalid use of undefined type 'struct kunit_glob_filter'
      58 |                 kfree(parsed->suite_glob);
         |                             ^~
   lib/kunit/executor.c:62:23: error: invalid use of undefined type 'struct kunit_glob_filter'
      62 |         strncpy(parsed->suite_glob, filter_glob, period - filter_glob);
         |                       ^~
   lib/kunit/executor.c:63:23: error: invalid use of undefined type 'struct kunit_glob_filter'
      63 |         strncpy(parsed->test_glob, period + 1, len - (period - filter_glob));
         |                       ^~
   lib/kunit/executor.c: In function 'kunit_filter_suites':
>> lib/kunit/executor.c:141:49: error: 'parsed_glob' undeclared (first use in this function)
     141 |                 *err = kunit_parse_glob_filter(&parsed_glob, filter_glob);
         |                                                 ^~~~~~~~~~~
   lib/kunit/executor.c:141:49: note: each undeclared identifier is reported only once for each function it appears in
>> lib/kunit/executor.c:143:25: error: label 'free_copy' used but not defined
     143 |                         goto free_copy;
         |                         ^~~~
   In file included from lib/kunit/executor.c:239:
   lib/kunit/executor_test.c: In function 'parse_filter_test':
>> lib/kunit/executor_test.c:29:9: error: implicit declaration of function 'kunit_parse_filter_glob' [-Werror=implicit-function-declaration]
      29 |         kunit_parse_filter_glob(&filter, "suite");
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +43 lib/kunit/executor.c

a127b154a8f231 Daniel Latypov 2021-09-14   34  
a127b154a8f231 Daniel Latypov 2021-09-14   35  /* Split "suite_glob.test_glob" into two. Assumes filter_glob is not empty. */
715180d7be0dc7 Jinjie Ruan    2023-09-03  @36  static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
a127b154a8f231 Daniel Latypov 2021-09-14   37  				    const char *filter_glob)
a127b154a8f231 Daniel Latypov 2021-09-14   38  {
a127b154a8f231 Daniel Latypov 2021-09-14   39  	const int len = strlen(filter_glob);
a127b154a8f231 Daniel Latypov 2021-09-14   40  	const char *period = strchr(filter_glob, '.');
a127b154a8f231 Daniel Latypov 2021-09-14   41  
a127b154a8f231 Daniel Latypov 2021-09-14   42  	if (!period) {
cd94fbc2cafb61 Daniel Latypov 2021-10-01  @43  		parsed->suite_glob = kzalloc(len + 1, GFP_KERNEL);
715180d7be0dc7 Jinjie Ruan    2023-09-03   44  		if (!parsed->suite_glob)
715180d7be0dc7 Jinjie Ruan    2023-09-03   45  			return -ENOMEM;
715180d7be0dc7 Jinjie Ruan    2023-09-03   46  
a127b154a8f231 Daniel Latypov 2021-09-14   47  		parsed->test_glob = NULL;
a127b154a8f231 Daniel Latypov 2021-09-14   48  		strcpy(parsed->suite_glob, filter_glob);
715180d7be0dc7 Jinjie Ruan    2023-09-03   49  		return 0;
a127b154a8f231 Daniel Latypov 2021-09-14   50  	}
a127b154a8f231 Daniel Latypov 2021-09-14   51  
a127b154a8f231 Daniel Latypov 2021-09-14   52  	parsed->suite_glob = kzalloc(period - filter_glob + 1, GFP_KERNEL);
715180d7be0dc7 Jinjie Ruan    2023-09-03   53  	if (!parsed->suite_glob)
715180d7be0dc7 Jinjie Ruan    2023-09-03   54  		return -ENOMEM;
715180d7be0dc7 Jinjie Ruan    2023-09-03   55  
a127b154a8f231 Daniel Latypov 2021-09-14   56  	parsed->test_glob = kzalloc(len - (period - filter_glob) + 1, GFP_KERNEL);
715180d7be0dc7 Jinjie Ruan    2023-09-03   57  	if (!parsed->test_glob) {
715180d7be0dc7 Jinjie Ruan    2023-09-03   58  		kfree(parsed->suite_glob);
715180d7be0dc7 Jinjie Ruan    2023-09-03   59  		return -ENOMEM;
715180d7be0dc7 Jinjie Ruan    2023-09-03   60  	}
a127b154a8f231 Daniel Latypov 2021-09-14   61  
a127b154a8f231 Daniel Latypov 2021-09-14  @62  	strncpy(parsed->suite_glob, filter_glob, period - filter_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  @63  	strncpy(parsed->test_glob, period + 1, len - (period - filter_glob));
715180d7be0dc7 Jinjie Ruan    2023-09-03   64  
715180d7be0dc7 Jinjie Ruan    2023-09-03   65  	return 0;
a127b154a8f231 Daniel Latypov 2021-09-14   66  }
a127b154a8f231 Daniel Latypov 2021-09-14   67  
a127b154a8f231 Daniel Latypov 2021-09-14   68  /* Create a copy of suite with only tests that match test_glob. */
a127b154a8f231 Daniel Latypov 2021-09-14   69  static struct kunit_suite *
d2fbdde838f270 Daniel Latypov 2022-05-16   70  kunit_filter_tests(const struct kunit_suite *const suite, const char *test_glob)
a127b154a8f231 Daniel Latypov 2021-09-14   71  {
a127b154a8f231 Daniel Latypov 2021-09-14   72  	int n = 0;
a127b154a8f231 Daniel Latypov 2021-09-14   73  	struct kunit_case *filtered, *test_case;
a127b154a8f231 Daniel Latypov 2021-09-14   74  	struct kunit_suite *copy;
a127b154a8f231 Daniel Latypov 2021-09-14   75  
a127b154a8f231 Daniel Latypov 2021-09-14   76  	kunit_suite_for_each_test_case(suite, test_case) {
a127b154a8f231 Daniel Latypov 2021-09-14   77  		if (!test_glob || glob_match(test_glob, test_case->name))
a127b154a8f231 Daniel Latypov 2021-09-14   78  			++n;
a127b154a8f231 Daniel Latypov 2021-09-14   79  	}
a127b154a8f231 Daniel Latypov 2021-09-14   80  
a127b154a8f231 Daniel Latypov 2021-09-14   81  	if (n == 0)
a127b154a8f231 Daniel Latypov 2021-09-14   82  		return NULL;
a127b154a8f231 Daniel Latypov 2021-09-14   83  
d2fbdde838f270 Daniel Latypov 2022-05-16   84  	copy = kmemdup(suite, sizeof(*copy), GFP_KERNEL);
a02353f491622e Daniel Latypov 2022-05-11   85  	if (!copy)
a02353f491622e Daniel Latypov 2022-05-11   86  		return ERR_PTR(-ENOMEM);
a127b154a8f231 Daniel Latypov 2021-09-14   87  
a127b154a8f231 Daniel Latypov 2021-09-14   88  	filtered = kcalloc(n + 1, sizeof(*filtered), GFP_KERNEL);
94681e289bf5d1 David Gow      2022-07-13   89  	if (!filtered) {
94681e289bf5d1 David Gow      2022-07-13   90  		kfree(copy);
a02353f491622e Daniel Latypov 2022-05-11   91  		return ERR_PTR(-ENOMEM);
94681e289bf5d1 David Gow      2022-07-13   92  	}
a127b154a8f231 Daniel Latypov 2021-09-14   93  
a127b154a8f231 Daniel Latypov 2021-09-14   94  	n = 0;
a127b154a8f231 Daniel Latypov 2021-09-14   95  	kunit_suite_for_each_test_case(suite, test_case) {
a127b154a8f231 Daniel Latypov 2021-09-14   96  		if (!test_glob || glob_match(test_glob, test_case->name))
a127b154a8f231 Daniel Latypov 2021-09-14   97  			filtered[n++] = *test_case;
a127b154a8f231 Daniel Latypov 2021-09-14   98  	}
a127b154a8f231 Daniel Latypov 2021-09-14   99  
a127b154a8f231 Daniel Latypov 2021-09-14  100  	copy->test_cases = filtered;
a127b154a8f231 Daniel Latypov 2021-09-14  101  	return copy;
a127b154a8f231 Daniel Latypov 2021-09-14  102  }
5d31f71efcb6bc Daniel Latypov 2021-02-05  103  
b6d5799b0b5866 David Gow      2021-05-26  104  static char *kunit_shutdown;
b6d5799b0b5866 David Gow      2021-05-26  105  core_param(kunit_shutdown, kunit_shutdown, charp, 0644);
b6d5799b0b5866 David Gow      2021-05-26  106  
e5857d396f35e5 Daniel Latypov 2022-07-09  107  /* Stores an array of suites, end points one past the end */
5d31f71efcb6bc Daniel Latypov 2021-02-05  108  struct suite_set {
e5857d396f35e5 Daniel Latypov 2022-07-09  109  	struct kunit_suite * const *start;
e5857d396f35e5 Daniel Latypov 2022-07-09  110  	struct kunit_suite * const *end;
5d31f71efcb6bc Daniel Latypov 2021-02-05  111  };
5d31f71efcb6bc Daniel Latypov 2021-02-05  112  
a127b154a8f231 Daniel Latypov 2021-09-14  113  static void kunit_free_suite_set(struct suite_set suite_set)
a127b154a8f231 Daniel Latypov 2021-09-14  114  {
e5857d396f35e5 Daniel Latypov 2022-07-09  115  	struct kunit_suite * const *suites;
a127b154a8f231 Daniel Latypov 2021-09-14  116  
a127b154a8f231 Daniel Latypov 2021-09-14  117  	for (suites = suite_set.start; suites < suite_set.end; suites++)
e5857d396f35e5 Daniel Latypov 2022-07-09  118  		kfree(*suites);
a127b154a8f231 Daniel Latypov 2021-09-14  119  	kfree(suite_set.start);
a127b154a8f231 Daniel Latypov 2021-09-14  120  }
a127b154a8f231 Daniel Latypov 2021-09-14  121  
1d71307a6f94df Daniel Latypov 2021-04-20  122  static struct suite_set kunit_filter_suites(const struct suite_set *suite_set,
a02353f491622e Daniel Latypov 2022-05-11  123  					    const char *filter_glob,
a02353f491622e Daniel Latypov 2022-05-11  124  					    int *err)
5d31f71efcb6bc Daniel Latypov 2021-02-05  125  {
5d31f71efcb6bc Daniel Latypov 2021-02-05  126  	int i;
e5857d396f35e5 Daniel Latypov 2022-07-09  127  	struct kunit_suite **copy, *filtered_suite;
5d31f71efcb6bc Daniel Latypov 2021-02-05  128  	struct suite_set filtered;
a127b154a8f231 Daniel Latypov 2021-09-14  129  	struct kunit_test_filter filter;
5d31f71efcb6bc Daniel Latypov 2021-02-05  130  
1d71307a6f94df Daniel Latypov 2021-04-20  131  	const size_t max = suite_set->end - suite_set->start;
5d31f71efcb6bc Daniel Latypov 2021-02-05  132  
5d31f71efcb6bc Daniel Latypov 2021-02-05  133  	copy = kmalloc_array(max, sizeof(*filtered.start), GFP_KERNEL);
5d31f71efcb6bc Daniel Latypov 2021-02-05  134  	filtered.start = copy;
5d31f71efcb6bc Daniel Latypov 2021-02-05  135  	if (!copy) { /* won't be able to run anything, return an empty set */
5d31f71efcb6bc Daniel Latypov 2021-02-05  136  		filtered.end = copy;
5d31f71efcb6bc Daniel Latypov 2021-02-05  137  		return filtered;
5d31f71efcb6bc Daniel Latypov 2021-02-05  138  	}
5d31f71efcb6bc Daniel Latypov 2021-02-05  139  
715180d7be0dc7 Jinjie Ruan    2023-09-03  140  	if (filter_glob) {
715180d7be0dc7 Jinjie Ruan    2023-09-03 @141  		*err = kunit_parse_glob_filter(&parsed_glob, filter_glob);
715180d7be0dc7 Jinjie Ruan    2023-09-03  142  		if (*err)
715180d7be0dc7 Jinjie Ruan    2023-09-03 @143  			goto free_copy;
715180d7be0dc7 Jinjie Ruan    2023-09-03  144  	}
a127b154a8f231 Daniel Latypov 2021-09-14  145  
e5857d396f35e5 Daniel Latypov 2022-07-09  146  	for (i = 0; &suite_set->start[i] != suite_set->end; i++) {
e5857d396f35e5 Daniel Latypov 2022-07-09  147  		if (!glob_match(filter.suite_glob, suite_set->start[i]->name))
e5857d396f35e5 Daniel Latypov 2022-07-09  148  			continue;
e5857d396f35e5 Daniel Latypov 2022-07-09  149  
e5857d396f35e5 Daniel Latypov 2022-07-09  150  		filtered_suite = kunit_filter_tests(suite_set->start[i], filter.test_glob);
e5857d396f35e5 Daniel Latypov 2022-07-09  151  		if (IS_ERR(filtered_suite)) {
e5857d396f35e5 Daniel Latypov 2022-07-09  152  			*err = PTR_ERR(filtered_suite);
a02353f491622e Daniel Latypov 2022-05-11  153  			return filtered;
a02353f491622e Daniel Latypov 2022-05-11  154  		}
e5857d396f35e5 Daniel Latypov 2022-07-09  155  		if (!filtered_suite)
e5857d396f35e5 Daniel Latypov 2022-07-09  156  			continue;
e5857d396f35e5 Daniel Latypov 2022-07-09  157  
e5857d396f35e5 Daniel Latypov 2022-07-09  158  		*copy++ = filtered_suite;
5d31f71efcb6bc Daniel Latypov 2021-02-05  159  	}
5d31f71efcb6bc Daniel Latypov 2021-02-05  160  	filtered.end = copy;
a127b154a8f231 Daniel Latypov 2021-09-14  161  
a127b154a8f231 Daniel Latypov 2021-09-14  162  	kfree(filter.suite_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  163  	kfree(filter.test_glob);
5d31f71efcb6bc Daniel Latypov 2021-02-05  164  	return filtered;
5d31f71efcb6bc Daniel Latypov 2021-02-05  165  }
5d31f71efcb6bc Daniel Latypov 2021-02-05  166  

:::::: The code at line 43 was first introduced by commit
:::::: cd94fbc2cafb61cc1394cdba3f92b99ce07b03ae kunit: fix too small allocation when using suite-only kunit.filter_glob

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
