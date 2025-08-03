Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A055C1FCF7C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754257345; cv=none; b=Ng2iAAg2o6YCp4d6qzActr21somr9mQt28qygUQuqJq7a1fh5jtJFRlcrD5kyyVnuurxDiAl98AVhu0VxF0GL+Y0RZzZuZwIY55YrByq+kCskO4WxJa8YoUN4sEINuPE40+RNYubFYRxkDvm1YkAmOWev1uRJjkOd1HhI6sA+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754257345; c=relaxed/simple;
	bh=3hQADqteI/jdSzsPh00SeUEGWcegKNZEsd4guxcxelY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNfXnWO8W5SYcvAeD16DwhKPTvtoCZ1DbCpRaiPidAC/A4iiTfMQMGPSRnmnTtRGIcz55eAH8UPFXnDvXCpp8IdcdJG09LSzAFxnQl0ZKXHO2Ogbchpjj+tRIvbuBuOA+LGOFByJdqBolWoE03JruDQq+78ovJ6YWJGQ6DbN7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOLa8TYj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOLa8TYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754257344; x=1785793344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3hQADqteI/jdSzsPh00SeUEGWcegKNZEsd4guxcxelY=;
  b=WOLa8TYjDjjNEqYklRggMxVomMhbfjbzyfe1ast7TfaMFWE9Guf1kgHS
   LikUtOEI6YUX9rPXDyPPrgZbC8QlmRiS2oRU0MoRTlvy2oCraBzU7hSqY
   BD09hWV8ptfx1Y4M0KuQii8QJXdH9pGbcPDaiB0vhnmAWTPe76VSTQEgV
   b/e4NdUzr6JQLuzyohhZHjX0xc0RBoOODWiv/GH/G02XQkdfGed2rRiPm
   4ucG51ANiamr6JLJibk4GxqIzKes7r5+iaWZhZ1wRjpHMEDogjR3kHRDi
   PG4sur47qlDoc4I1IqstAPe+1MGyFNgNdQlR5tDWdJPo/BisiV2DRjYMR
   A==;
X-CSE-ConnectionGUID: kOcG3hFERZughiaEtB/aqA==
X-CSE-MsgGUID: iVhjQ6oPR/ihi0IJXmCZBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="79069591"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79069591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 14:42:22 -0700
X-CSE-ConnectionGUID: FeJVOEoEQ+q+s7xAOct5HQ==
X-CSE-MsgGUID: 3iVxYdRFRPmIyMtuk3z7vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164395276"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Aug 2025 14:42:20 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uigTC-0006eO-0y;
	Sun, 03 Aug 2025 21:42:18 +0000
Date: Mon, 4 Aug 2025 05:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 34/34] kernel/sched/sched.h:3144:17: error:
 no member named 'lock' in 'struct rq'
Message-ID: <202508040554.X2TkbxzJ-lkp@intel.com>
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
config: arm-randconfig-001-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040554.X2TkbxzJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040554.X2TkbxzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040554.X2TkbxzJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:14:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1509:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:59:
   include/linux/srcutiny.h:93:2: warning: releasing srcu_struct 'ssp' that was not held [-Wthread-safety-analysis]
      93 |         __srcu_read_unlock(ssp, __srcu_ptr_to_ctr(ssp, scp));
         |         ^
   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:14:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1509:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:117:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     117 | }
         | ^
   include/linux/srcu.h:113:19: note: srcu_struct acquired here
     113 | static inline int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:272:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     272 | }
         | ^
   include/linux/srcu.h:263:19: note: srcu_struct acquired here
     263 | static inline int srcu_read_lock(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:299:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     299 | }
         | ^
   include/linux/srcu.h:291:41: note: srcu_struct acquired here
     291 | static inline struct srcu_ctr __percpu *srcu_read_lock_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
   include/linux/srcu.h:317:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     317 | }
         | ^
   include/linux/srcu.h:312:41: note: srcu_struct acquired here
     312 | static inline struct srcu_ctr __percpu *srcu_down_read_fast(struct srcu_struct *ssp) __acquires_shared(ssp)
         |                                         ^
   include/linux/srcu.h:345:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     345 | }
         | ^
   include/linux/srcu.h:336:19: note: srcu_struct acquired here
     336 | static inline int srcu_read_lock_lite(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:379:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     379 | }
         | ^
   include/linux/srcu.h:371:1: note: srcu_struct acquired here
     371 | srcu_read_lock_notrace(struct srcu_struct *ssp)
         | ^
   include/linux/srcu.h:409:1: warning: expecting srcu_struct 'ssp' to be held at the end of function [-Wthread-safety-analysis]
     409 | }
         | ^
   include/linux/srcu.h:403:19: note: srcu_struct acquired here
     403 | static inline int srcu_down_read(struct srcu_struct *ssp)
         |                   ^
   include/linux/srcu.h:440:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     440 | }
         | ^
   include/linux/srcu.h:435:2: note: srcu_struct acquired here
     435 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-capability-analysis.h:340:32: note: expanded from macro '__releases_shared'
     340 | #define __releases_shared(...)  __releases_shared_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:21:53: note: expanded from macro '__releases_shared_cap'
      21 | # define __releases_shared_cap(...)             __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:14:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1509:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:456:1: warning: srcu_struct 'ssp' is still held at the end of function [-Wthread-safety-analysis]
     456 | }
         | ^
   include/linux/srcu.h:451:2: note: srcu_struct acquired here
     451 |         __releases_shared(ssp)
         |         ^
   include/linux/compiler-capability-analysis.h:340:32: note: expanded from macro '__releases_shared'
     340 | #define __releases_shared(...)  __releases_shared_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:21:53: note: expanded from macro '__releases_shared_cap'
      21 | # define __releases_shared_cap(...)             __attribute__((release_shared_capability(__VA_ARGS__)))
         |                                                                ^
   In file included from kernel/sched/core.c:89:
>> kernel/sched/sched.h:3144:17: error: no member named 'lock' in 'struct rq'
    3144 |         __acquire(rq2->lock);   /* Fake it out ;) */
         |                   ~~~  ^
   kernel/sched/sched.h:3159:17: error: no member named 'lock' in 'struct rq'
    3159 |         __release(rq2->lock);
         |                   ~~~  ^
   kernel/sched/core.c:7673:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7673 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7648:1: note: array 'preempt_modes' declared here
    7648 | const char *preempt_modes[] = {
         | ^
   11 warnings and 2 errors generated.


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
