Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8E1F4615
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254035; cv=none; b=tRX4+KuC99S+i+d8q8VxjQeaD7AW2lr47abDHj1jvKxjvvKv0KZIrcWLgXVg7ExJfzbjxg+7a0YOd8GvnoG+gnpaoT7sb8oICVjfPNgk6wvDb15ROo+OsdFBysQENXhSiDrSszlThwj32rd6AzYxQtnDUsZHG/EBE1gR9gmbLVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254035; c=relaxed/simple;
	bh=xcZ32KGx9xMPe1yyRCdSh8EvrZ7hHfevHuR+jHk/dQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFBFcLKN6Bz4Nd0dZjZcHkZy4/WLqRt0SGKGYlmvFST/gTIThO8YFf4OxjS7FGvG+BvGxv/Z+A8JNZ/2gD+Aj62n4lqy/STliuqs5yU0g9d9R6LGXul9rX/Iw5nCmxBeIJUgI8CeLMffWekBNVSu3a/mPK8UH65FjsXrRxds1xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqFtHWFx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqFtHWFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754254033; x=1785790033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcZ32KGx9xMPe1yyRCdSh8EvrZ7hHfevHuR+jHk/dQs=;
  b=bqFtHWFxBEDxX7f1NzIbHOYlIID9VGE5S2qFFi8czVHZqsLtYdGQP5cS
   zwMV+ZIb/y3X/u/45SaHb4HzktJL3oL5ce3q7Lrh8lfg1wrr6IQ7dhY2X
   8/h+RzZAfmWJs7pL6rHfUldIvXybfI7x2Kb3te55SbgPhjSm0eszWDWPg
   gr6AQZVFLKpvVkd3WrOEzWum1Ad9CtjLSLEX4ODpFgEuXUxRfGLx9yLGW
   iGOJjklpI/H7L7mu7jjQzDVMfTINMTbtuVSCplKggFVqm7ssaAKQ8tNk0
   25XC0BKU8lVpXRcNYpLFWzGsR6+z2fdDnEl5rIUIMwUUeWE1JJYRAnnzK
   Q==;
X-CSE-ConnectionGUID: EF8Tp+/2Tfi1lJbPS6vyDg==
X-CSE-MsgGUID: Mw+nro0PRC6NHsLrjWQ3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="81962243"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="81962243"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 13:47:13 -0700
X-CSE-ConnectionGUID: 8Slcucn0TrCgNcfcRBw7rA==
X-CSE-MsgGUID: PpNJm2G6S+KJv8GWHKTOJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="201174373"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 03 Aug 2025 13:47:12 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uifbp-0001fv-2C;
	Sun, 03 Aug 2025 20:47:09 +0000
Date: Sun, 3 Aug 2025 22:46:38 +0200
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 34/34] kernel/sched/sched.h:3144:17: error:
 no member named 'lock' in 'struct rq'
Message-ID: <202508032215.CpDS7w6j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   0ec55cac64b4d3427708d952adc59cdd1d3493d1
commit: 0ec55cac64b4d3427708d952adc59cdd1d3493d1 [34/34] sched/core: Enable capability analysis
config: arm-randconfig-2003-20250803 (https://download.01.org/0day-ci/archive/20250803/202508032215.CpDS7w6j-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508032215.CpDS7w6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508032215.CpDS7w6j-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:89:
>> kernel/sched/sched.h:3144:17: error: no member named 'lock' in 'struct rq'
    3144 |         __acquire(rq2->lock);   /* Fake it out ;) */
         |                   ~~~  ^
   kernel/sched/sched.h:3159:17: error: no member named 'lock' in 'struct rq'
    3159 |         __release(rq2->lock);
         |                   ~~~  ^
>> kernel/sched/core.c:7673:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7673 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7648:1: note: array 'preempt_modes' declared here
    7648 | const char *preempt_modes[] = {
         | ^
   1 warning and 2 errors generated.


vim +3144 kernel/sched/sched.h

029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3131  
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3132  /*
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3133   * double_rq_lock - safely lock two runqueues
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3134   *
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3135   * Note this does not disable interrupts like task_rq_lock,
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3136   * you need to do so manually before calling.
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3137   */
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3138  static inline void double_rq_lock(struct rq *rq1, struct rq *rq2)
0ec55cac64b4d3 kernel/sched/sched.h Marco Elver    2025-08-03  3139  	__acquires(&rq1->__lock, &rq2->__lock)
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3140  {
09348d75a6ce60 kernel/sched/sched.h Ingo Molnar    2022-08-11  3141  	WARN_ON_ONCE(!irqs_disabled());
09348d75a6ce60 kernel/sched/sched.h Ingo Molnar    2022-08-11  3142  	WARN_ON_ONCE(rq1 != rq2);
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3143  	raw_spin_rq_lock(rq1);
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25 @3144  	__acquire(rq2->lock);	/* Fake it out ;) */
2679a83731d51a kernel/sched/sched.h Hao Jia        2022-04-30  3145  	double_rq_clock_clear_update(rq1, rq2);
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3146  }
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3147  

:::::: The code at line 3144 was first introduced by commit
:::::: 029632fbb7b7c9d85063cc9eb470de6c54873df3 sched: Make separate sched*.c translation units

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
