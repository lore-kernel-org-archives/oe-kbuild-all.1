Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA714019
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 18:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694889439; x=1726425439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHejwgC43egbmMjE6WlJhuE3VL8rqxOfyP04SrxamX8=;
  b=B115QIkSFggPCDJgQCiefcsssXjwk8jkL4EYh57gfUxNrebH64O5l7dZ
   bdH5yy0TjKCMP/lyyj6xqAH6uqvzDMfwVqGHTdlzKmPxbpfNu8HAv43MP
   piNv76p+8/3HnUry2C0Jcpe0vCCsvjoEXrhwp882iPoQ0UnEW3fh9drAY
   B/WU3lyH73z+OqB2vfdQzrogcC3Q9xF3FrYi6snzNFYgCnPGT79zgUtrr
   VMUEqBLdZtBPL5PiRCrGwDaZDu4jEvsodP8BHZ+vP/uD9DrwX4eBoeDJy
   dBGodcaq+EeG7ZKvhBhE68cQJHvAqc6VTVUtlYWAW8Y/3M7dEadZ84kWD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="378348145"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="378348145"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 11:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="748576775"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="748576775"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Sep 2023 11:37:16 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhaAM-0004Z8-2I;
	Sat, 16 Sep 2023 18:37:14 +0000
Date: Sun, 17 Sep 2023 02:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 184/184] lib/kunit/executor.c:43:9:
 error: dereferencing pointer to incomplete type 'struct kunit_glob_filter'
Message-ID: <202309170244.Ty3C6Aeb-lkp@intel.com>
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
config: x86_64-randconfig-003-20230916 (https://download.01.org/0day-ci/archive/20230917/202309170244.Ty3C6Aeb-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170244.Ty3C6Aeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170244.Ty3C6Aeb-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/kunit/executor.c:36:43: warning: 'struct kunit_glob_filter' declared inside parameter list will not be visible outside of this definition or declaration
    static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
                                              ^~~~~~~~~~~~~~~~~
   lib/kunit/executor.c: In function 'kunit_parse_glob_filter':
>> lib/kunit/executor.c:43:9: error: dereferencing pointer to incomplete type 'struct kunit_glob_filter'
      parsed->suite_glob = kzalloc(len + 1, GFP_KERNEL);
            ^~
   lib/kunit/executor.c: In function 'kunit_filter_suites':
   lib/kunit/executor.c:141:35: error: 'parsed_glob' undeclared (first use in this function); did you mean 'filter_glob'?
      *err = kunit_parse_glob_filter(&parsed_glob, filter_glob);
                                      ^~~~~~~~~~~
                                      filter_glob
   lib/kunit/executor.c:141:35: note: each undeclared identifier is reported only once for each function it appears in
   lib/kunit/executor.c:143:4: error: label 'free_copy' used but not defined
       goto free_copy;
       ^~~~
   In file included from lib/kunit/executor.c:239:0:
   lib/kunit/executor_test.c: In function 'parse_filter_test':
   lib/kunit/executor_test.c:29:2: error: implicit declaration of function 'kunit_parse_filter_glob'; did you mean 'parse_filter_test'? [-Werror=implicit-function-declaration]
     kunit_parse_filter_glob(&filter, "suite");
     ^~~~~~~~~~~~~~~~~~~~~~~
     parse_filter_test
   cc1: some warnings being treated as errors


vim +43 lib/kunit/executor.c

a127b154a8f231 Daniel Latypov 2021-09-14  34  
a127b154a8f231 Daniel Latypov 2021-09-14  35  /* Split "suite_glob.test_glob" into two. Assumes filter_glob is not empty. */
715180d7be0dc7 Jinjie Ruan    2023-09-03 @36  static int kunit_parse_glob_filter(struct kunit_glob_filter *parsed,
a127b154a8f231 Daniel Latypov 2021-09-14  37  				    const char *filter_glob)
a127b154a8f231 Daniel Latypov 2021-09-14  38  {
a127b154a8f231 Daniel Latypov 2021-09-14  39  	const int len = strlen(filter_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  40  	const char *period = strchr(filter_glob, '.');
a127b154a8f231 Daniel Latypov 2021-09-14  41  
a127b154a8f231 Daniel Latypov 2021-09-14  42  	if (!period) {
cd94fbc2cafb61 Daniel Latypov 2021-10-01 @43  		parsed->suite_glob = kzalloc(len + 1, GFP_KERNEL);
715180d7be0dc7 Jinjie Ruan    2023-09-03  44  		if (!parsed->suite_glob)
715180d7be0dc7 Jinjie Ruan    2023-09-03  45  			return -ENOMEM;
715180d7be0dc7 Jinjie Ruan    2023-09-03  46  
a127b154a8f231 Daniel Latypov 2021-09-14  47  		parsed->test_glob = NULL;
a127b154a8f231 Daniel Latypov 2021-09-14  48  		strcpy(parsed->suite_glob, filter_glob);
715180d7be0dc7 Jinjie Ruan    2023-09-03  49  		return 0;
a127b154a8f231 Daniel Latypov 2021-09-14  50  	}
a127b154a8f231 Daniel Latypov 2021-09-14  51  
a127b154a8f231 Daniel Latypov 2021-09-14  52  	parsed->suite_glob = kzalloc(period - filter_glob + 1, GFP_KERNEL);
715180d7be0dc7 Jinjie Ruan    2023-09-03  53  	if (!parsed->suite_glob)
715180d7be0dc7 Jinjie Ruan    2023-09-03  54  		return -ENOMEM;
715180d7be0dc7 Jinjie Ruan    2023-09-03  55  
a127b154a8f231 Daniel Latypov 2021-09-14  56  	parsed->test_glob = kzalloc(len - (period - filter_glob) + 1, GFP_KERNEL);
715180d7be0dc7 Jinjie Ruan    2023-09-03  57  	if (!parsed->test_glob) {
715180d7be0dc7 Jinjie Ruan    2023-09-03  58  		kfree(parsed->suite_glob);
715180d7be0dc7 Jinjie Ruan    2023-09-03  59  		return -ENOMEM;
715180d7be0dc7 Jinjie Ruan    2023-09-03  60  	}
a127b154a8f231 Daniel Latypov 2021-09-14  61  
a127b154a8f231 Daniel Latypov 2021-09-14  62  	strncpy(parsed->suite_glob, filter_glob, period - filter_glob);
a127b154a8f231 Daniel Latypov 2021-09-14  63  	strncpy(parsed->test_glob, period + 1, len - (period - filter_glob));
715180d7be0dc7 Jinjie Ruan    2023-09-03  64  
715180d7be0dc7 Jinjie Ruan    2023-09-03  65  	return 0;
a127b154a8f231 Daniel Latypov 2021-09-14  66  }
a127b154a8f231 Daniel Latypov 2021-09-14  67  

:::::: The code at line 43 was first introduced by commit
:::::: cd94fbc2cafb61cc1394cdba3f92b99ce07b03ae kunit: fix too small allocation when using suite-only kunit.filter_glob

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
