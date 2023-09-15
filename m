Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A9B1B28A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 21:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694815054; x=1726351054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ryqI2SVeHwZDZpVVh9SRD0wPJPxsVRCuteQsazQPpz4=;
  b=Ll/cUIvcZQW961nW1PaIzvRJEkJgxG5NZ+IJmV3rrcfmy8gy4z5Z0nDs
   FAMyzY1Kbhdq+qVEc4voBcc/7LGN9+opXAfPyBfe67mx4isatnJZBiQkV
   k/HV/7/GhEcgObgJyRjImMSNeMc1ESDvab02xoMlWp+BynMbjupEoKkzl
   RlsESpqf8D3GZ+rRl5Y0+/MZIcWf1NdAQSyTuDlchyUtFUtXk6tO9iQXX
   u9MHLmgpLYl5Ve+sULAsfI9K5LOj9XrB85Qo1tTlQGV0IDEwasl95RxCL
   ajGeZHAzslh1IUPcIoloKmHljzJPyQWlx5dyc5WbgpFkjzY1vVO/DqMBs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="383184176"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="383184176"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 14:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745151285"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="745151285"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 14:57:33 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhGod-0003WM-1Y;
	Fri, 15 Sep 2023 21:57:31 +0000
Date: Sat, 16 Sep 2023 05:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 1/3] lib/kunit/ftrace_stub.c:67:6:
 warning: no previous prototype for 'kunit_deactivate_ftrace_stub'
Message-ID: <202309160528.O1hQyrBI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   915d1f69c42b297c8f26c23866ee454f9e824c34
commit: 7bf0be41652d3268148c9a598b9e60ec6f13f30a [1/3] kunit: expose ftrace-based API for stubbing out functions during tests
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230916/202309160528.O1hQyrBI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160528.O1hQyrBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160528.O1hQyrBI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/ftrace_stub.c:67:6: warning: no previous prototype for 'kunit_deactivate_ftrace_stub' [-Wmissing-prototypes]
      67 | void kunit_deactivate_ftrace_stub(struct kunit *test, void *real_fn_addr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/kunit/ftrace_stub.c:92:6: warning: no previous prototype for '__kunit_activate_ftrace_stub' [-Wmissing-prototypes]
      92 | void __kunit_activate_ftrace_stub(struct kunit *test,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kunit_deactivate_ftrace_stub +67 lib/kunit/ftrace_stub.c

    66	
  > 67	void kunit_deactivate_ftrace_stub(struct kunit *test, void *real_fn_addr)
    68	{
    69		struct kunit_resource *res;
    70	
    71		KUNIT_ASSERT_PTR_NE_MSG(test, real_fn_addr, NULL,
    72					"Tried to deactivate a NULL stub.");
    73	
    74		/* Look up the existing stub for this function. */
    75		res = kunit_find_resource(test,
    76					  __kunit_static_stub_resource_match,
    77					  real_fn_addr);
    78	
    79		/* Error out if the stub doesn't exist. */
    80		KUNIT_ASSERT_PTR_NE_MSG(test, res, NULL,
    81					"Tried to deactivate a nonexistent stub.");
    82	
    83		/* Free the stub. We 'put' twice, as we got a reference
    84		 * from kunit_find_resource(). The free function will deactivate the
    85		 * ftrace stub.
    86		 */
    87		kunit_remove_resource(test, res);
    88		kunit_put_resource(res);
    89	}
    90	EXPORT_SYMBOL_GPL(kunit_deactivate_ftrace_stub);
    91	
  > 92	void __kunit_activate_ftrace_stub(struct kunit *test,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
