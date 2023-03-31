Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA31F23D5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680259954; x=1711795954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kw7EmCpbW4u6XI1M/Z1hGr+mEd8ZvnyWBUB9fRp94Ak=;
  b=cKJoeqiQy4t01uZKvp6xBOn4QKMCv/OiYjgT8bg6ViUmyEe62XWMokAW
   Wy+B5X2VXPU1iQfykW2gsPgabQ/CGVXp64FXDFcPEH1O2PbimSL7JYd4e
   +cFvK6aQXyQjNG7LiI13lpQe3wqBfkKKD7VbRA4BTNPns0zMQAVlJkW/i
   nt55VzrQ9FX0CrxCKTYatiEtlEaW8rEuZJPGjJCmmhEeGvfwwgJL8SkHT
   +F3sbKgN5agMmMic8vlGs8UpgbwB8YbTUVdscKghycGu4WjfMP5GE2MlZ
   1RIxA3IF1W4aDIuhxeXjkp/aVrosxUE0pdDFYnvQMeYS3XLoqA4s/4D86
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329957093"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="329957093"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 03:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="859289963"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="859289963"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Mar 2023 03:52:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piCMy-000LhK-0w;
	Fri, 31 Mar 2023 10:52:32 +0000
Date: Fri, 31 Mar 2023 18:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/3] kunit: Add kunit_add_action() to defer a call
 until test exit
Message-ID: <202303311853.tn5NVivq-lkp@intel.com>
References: <20230331080411.981038-2-davidgow@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331080411.981038-2-davidgow@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/kunit-Add-kunit_add_action-to-defer-a-call-until-test-exit/20230331-160604
patch link:    https://lore.kernel.org/r/20230331080411.981038-2-davidgow%40google.com
patch subject: [RFC PATCH v2 1/3] kunit: Add kunit_add_action() to defer a call until test exit
config: arc-randconfig-r043-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311853.tn5NVivq-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3fe86a97881f9c663c66869d448b2dacf9363b53
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/kunit-Add-kunit_add_action-to-defer-a-call-until-test-exit/20230331-160604
        git checkout 3fe86a97881f9c663c66869d448b2dacf9363b53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash lib/kunit/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311853.tn5NVivq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/kunit/kunit-test.c: In function 'kunit_resource_test_remove_action':
>> lib/kunit/kunit-test.c:434:34: warning: variable 'cancel_token2' set but not used [-Wunused-but-set-variable]
     434 |         struct kunit_action_ctx *cancel_token2;
         |                                  ^~~~~~~~~~~~~
   lib/kunit/kunit-test.c: In function 'kunit_resource_test_release_action':
   lib/kunit/kunit-test.c:461:34: warning: variable 'cancel_token2' set but not used [-Wunused-but-set-variable]
     461 |         struct kunit_action_ctx *cancel_token2;
         |                                  ^~~~~~~~~~~~~


vim +/cancel_token2 +434 lib/kunit/kunit-test.c

   410	
   411	static void kunit_resource_test_action(struct kunit *test)
   412	{
   413		int num_actions = 0;
   414	
   415		kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   416		KUNIT_EXPECT_EQ(test, num_actions, 0);
   417		kunit_cleanup(test);
   418		KUNIT_EXPECT_EQ(test, num_actions, 1);
   419	
   420		/* Once we've cleaned up, the action queue is empty. */
   421		kunit_cleanup(test);
   422		KUNIT_EXPECT_EQ(test, num_actions, 1);
   423	
   424		/* Check the same function can be deferred multiple times. */
   425		kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   426		kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   427		kunit_cleanup(test);
   428		KUNIT_EXPECT_EQ(test, num_actions, 3);
   429	}
   430	static void kunit_resource_test_remove_action(struct kunit *test)
   431	{
   432		int num_actions = 0;
   433		struct kunit_action_ctx *cancel_token;
 > 434		struct kunit_action_ctx *cancel_token2;
   435	
   436		cancel_token = kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   437		KUNIT_EXPECT_EQ(test, num_actions, 0);
   438	
   439		kunit_remove_action_token(test, cancel_token);
   440		kunit_cleanup(test);
   441		KUNIT_EXPECT_EQ(test, num_actions, 0);
   442	
   443		/* Check calls from the same function/context pair can be cancelled independently*/
   444		cancel_token = kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   445		cancel_token2 = kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   446		kunit_remove_action_token(test, cancel_token);
   447		kunit_cleanup(test);
   448		KUNIT_EXPECT_EQ(test, num_actions, 1);
   449	
   450		/* Also check that we can cancel just one of the identical function/context pairs. */
   451		cancel_token = kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   452		cancel_token2 = kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   453		kunit_remove_action(test, increment_int, &num_actions);
   454		kunit_cleanup(test);
   455		KUNIT_EXPECT_EQ(test, num_actions, 2);
   456	}
   457	static void kunit_resource_test_release_action(struct kunit *test)
   458	{
   459		int num_actions = 0;
   460		struct kunit_action_ctx *cancel_token;
   461		struct kunit_action_ctx *cancel_token2;
   462	
   463		cancel_token = kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   464		KUNIT_EXPECT_EQ(test, num_actions, 0);
   465		/* Runs immediately on trigger. */
   466		kunit_release_action_token(test, cancel_token);
   467		KUNIT_EXPECT_EQ(test, num_actions, 1);
   468	
   469		/* Doesn't run again on test exit. */
   470		kunit_cleanup(test);
   471		KUNIT_EXPECT_EQ(test, num_actions, 1);
   472	
   473		/* Check calls from the same function/context pair can be triggered independently*/
   474		cancel_token = kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   475		cancel_token2 = kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   476		kunit_release_action_token(test, cancel_token);
   477		KUNIT_EXPECT_EQ(test, num_actions, 2);
   478		kunit_cleanup(test);
   479		KUNIT_EXPECT_EQ(test, num_actions, 3);
   480	
   481		/* Also check that we can trigger just one of the identical function/context pairs. */
   482		kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   483		kunit_add_action(test, increment_int, &num_actions, GFP_KERNEL);
   484		kunit_release_action(test, increment_int, &num_actions);
   485		KUNIT_EXPECT_EQ(test, num_actions, 4);
   486		kunit_cleanup(test);
   487		KUNIT_EXPECT_EQ(test, num_actions, 5);
   488	}
   489	static void action_order_1(void *ctx)
   490	{
   491		struct kunit_test_resource_context *res_ctx = (struct kunit_test_resource_context *)ctx;
   492	
   493		KUNIT_RESOURCE_TEST_MARK_ORDER(res_ctx, free_order, 1);
   494		kunit_log(KERN_INFO, current->kunit_test, "action_order_1");
   495	}
   496	static void action_order_2(void *ctx)
   497	{
   498		struct kunit_test_resource_context *res_ctx = (struct kunit_test_resource_context *)ctx;
   499	
   500		KUNIT_RESOURCE_TEST_MARK_ORDER(res_ctx, free_order, 2);
   501		kunit_log(KERN_INFO, current->kunit_test, "action_order_2");
   502	}
   503	static void kunit_resource_test_action_ordering(struct kunit *test)
   504	{
   505		struct kunit_test_resource_context *ctx = test->priv;
   506		struct kunit_action_ctx *cancel_token;
   507	
   508		kunit_add_action(test, action_order_1, ctx, GFP_KERNEL);
   509		cancel_token = kunit_add_action(test, action_order_2, ctx, GFP_KERNEL);
   510		kunit_add_action(test, action_order_1, ctx, GFP_KERNEL);
   511		kunit_add_action(test, action_order_2, ctx, GFP_KERNEL);
   512		kunit_remove_action(test, action_order_1, ctx);
   513		kunit_release_action_token(test, cancel_token);
   514		kunit_cleanup(test);
   515	
   516		/* [2 is triggered] [2], [(1 is cancelled)] [1] */
   517		KUNIT_EXPECT_EQ(test, ctx->free_order[0], 2);
   518		KUNIT_EXPECT_EQ(test, ctx->free_order[1], 2);
   519		KUNIT_EXPECT_EQ(test, ctx->free_order[2], 1);
   520	}
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
