Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4107748E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692662197; x=1724198197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHnSB/5+1rU3DNwNfBSICblX+HBQBTwKUCdeG7yJpZw=;
  b=Y32hxdTXvCGUkWKHBvsgF/ELQWiom+lGRXSGY/bHXSinQjJjydalWo+M
   aJdPj45opq5hFTQOLzbzhMjI+JK+LKDQYi+lkwSB2gSAeOyJ8ojnVfTb6
   b7OE+ishVilLPt52kugko8EHHLMVLenGQO441syIiABC2ZmMqXshPPEAp
   s85PEIVvD4qrzZGKyjYOI/Abz23Zju8F/X6C9JruGZFUQCpZuQ2ZTjRdA
   Mrc9MljW9eRMq9B6OhoWWtpXpJlpRXSaEOXqCtimTG6rt2VPV/i6AsSbx
   9l5V2t7/wj3MWv7qC6I9xYOIIJxNR39sX3cMNEh+MPhy7Jgr4iWw2FwgP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440100615"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="440100615"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 16:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685838369"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="685838369"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 16:56:32 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYEl0-00014w-1V;
	Mon, 21 Aug 2023 23:56:27 +0000
Date: Tue, 22 Aug 2023 07:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/i915/gt/selftest_execlists.c:143:4: error: format
 string is not a string literal (potentially insecure)
Message-ID: <202308220738.3bnB1kuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chris,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: 33fa2468dce0a27c70fc9a95024281c7a07a3726 UPSTREAM: drm/i915: Add DEBUG_GEM to the recommended CI config
date:   2 years, 4 months ago
config: i386-randconfig-005-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220738.3bnB1kuJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220738.3bnB1kuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220738.3bnB1kuJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3904:
>> drivers/gpu/drm/i915/gt/selftest_execlists.c:143:4: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                           GEM_TRACE("spinner failed to start\n");
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.h:69:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:724:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:738:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/selftest_execlists.c:143:4: note: treat the string as an argument to avoid this
   drivers/gpu/drm/i915/i915_gem.h:69:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^
   include/linux/kernel.h:724:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^
   include/linux/kernel.h:738:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^
   In file included from drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3904:
   drivers/gpu/drm/i915/gt/selftest_execlists.c:1766:4: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                           GEM_TRACE("lo spinner failed to start\n");
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.h:69:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:724:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:738:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/selftest_execlists.c:1766:4: note: treat the string as an argument to avoid this
   drivers/gpu/drm/i915/i915_gem.h:69:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^
   include/linux/kernel.h:724:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^
   include/linux/kernel.h:738:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^
   In file included from drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3904:
   drivers/gpu/drm/i915/gt/selftest_execlists.c:1783:4: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                           GEM_TRACE("hi spinner failed to start\n");
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.h:69:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:724:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:738:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/selftest_execlists.c:1783:4: note: treat the string as an argument to avoid this
   drivers/gpu/drm/i915/i915_gem.h:69:24: note: expanded from macro 'GEM_TRACE'
   #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                          ^
   include/linux/kernel.h:724:3: note: expanded from macro 'trace_printk'
                   do_trace_printk(fmt, ##__VA_ARGS__);    \
                   ^
   include/linux/kernel.h:738:30: note: expanded from macro 'do_trace_printk'
                   __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                              ^
   3 errors generated.


vim +143 drivers/gpu/drm/i915/gt/selftest_execlists.c

280e285dc78f73 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2020-02-27  110  
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  111  static int live_sanitycheck(void *arg)
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  112  {
1357fa8136ea03 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-10-16  113  	struct intel_gt *gt = arg;
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  114  	struct intel_engine_cs *engine;
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  115  	enum intel_engine_id id;
8d2f6e2f272109 drivers/gpu/drm/i915/selftests/intel_lrc.c Tvrtko Ursulin 2018-11-30  116  	struct igt_spinner spin;
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  117  	int err = 0;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  118  
1357fa8136ea03 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-10-16  119  	if (!HAS_LOGICAL_RING_CONTEXTS(gt->i915))
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  120  		return 0;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  121  
1357fa8136ea03 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-10-16  122  	if (igt_spinner_init(&spin, gt))
2af402982ab382 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-10-04  123  		return -ENOMEM;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  124  
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  125  	for_each_engine(engine, gt, id) {
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  126  		struct intel_context *ce;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  127  		struct i915_request *rq;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  128  
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  129  		ce = intel_context_create(engine);
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  130  		if (IS_ERR(ce)) {
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  131  			err = PTR_ERR(ce);
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  132  			break;
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  133  		}
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  134  
f277bc0c98a407 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-07-31  135  		rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  136  		if (IS_ERR(rq)) {
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  137  			err = PTR_ERR(rq);
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  138  			goto out_ctx;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  139  		}
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  140  
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  141  		i915_request_add(rq);
8d2f6e2f272109 drivers/gpu/drm/i915/selftests/intel_lrc.c Tvrtko Ursulin 2018-11-30  142  		if (!igt_wait_for_spinner(&spin, rq)) {
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04 @143  			GEM_TRACE("spinner failed to start\n");
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  144  			GEM_TRACE_DUMP();
1357fa8136ea03 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-10-16  145  			intel_gt_set_wedged(gt);
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  146  			err = -EIO;
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  147  			goto out_ctx;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  148  		}
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  149  
8d2f6e2f272109 drivers/gpu/drm/i915/selftests/intel_lrc.c Tvrtko Ursulin 2018-11-30  150  		igt_spinner_end(&spin);
1357fa8136ea03 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-10-16  151  		if (igt_flush_test(gt->i915)) {
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  152  			err = -EIO;
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  153  			goto out_ctx;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  154  		}
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  155  
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  156  out_ctx:
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  157  		intel_context_put(ce);
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  158  		if (err)
e6ba76480299a0 drivers/gpu/drm/i915/gt/selftest_lrc.c     Chris Wilson   2019-12-21  159  			break;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  160  	}
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  161  
8d2f6e2f272109 drivers/gpu/drm/i915/selftests/intel_lrc.c Tvrtko Ursulin 2018-11-30  162  	igt_spinner_fini(&spin);
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  163  	return err;
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  164  }
2c66555ec19235 drivers/gpu/drm/i915/selftests/intel_lrc.c Chris Wilson   2018-04-04  165  

:::::: The code at line 143 was first introduced by commit
:::::: 2c66555ec19235efd689741c44bbeb893aa8e7de drm/i915/selftests: Add basic sanitychecks for execlists

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
