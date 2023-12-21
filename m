Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85A358208
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRu9ZRZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703184670; x=1734720670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WdgxX8KCqY1GT/mJ60C6UQ8EqNF6e6XsaKTrhgigZUU=;
  b=LRu9ZRZH7YwybEs+Jm0wA0gE8zuragSwTmaZ6IpB+ru6pfSeD4e+BMlZ
   UuGhWiLWE43U6/s0Fmc3MQHb9FcP2RyU3Gu1XhIFmzEUauZl1HN3J120Z
   pPPpCpdbHi2w+3hilTAtMgw+oLb/3HZipsCU5kgeX4houLtbqKdQrGCf4
   syWEG4FI8XSqsGATmv/NnmcKU81rYKp5th55PbvK5uGaHH5unTm89WYH0
   tNBxKeTARzFkzC1JStYZ2/6Fcu8KphsHPuHDeEYf40QoRUgDdTP7rqgHG
   PsoYLnehw7KIZmh0DVnTBicGwlhi94ulQmjwWISSHf6K09zINFFPISLWt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="395748700"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="395748700"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 10:51:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="950004713"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="950004713"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Dec 2023 10:51:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGO8Q-0008aZ-29;
	Thu, 21 Dec 2023 18:51:06 +0000
Date: Fri, 22 Dec 2023 02:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/2]
 include/trace/hooks/delayacct.h:26:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202312220229.r1h9KLYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   40ab06a97493a79f38d56ac3af0f1dad3c6adef3
commit: bb57557246d39dba8a66df7f43983fe1ec71bff6 [1/2] ANDROID: Add vendor_hooks to workaround CONFIG_TASK_DELAY_ACCT
config: x86_64-randconfig-122-20231221 (https://download.01.org/0day-ci/archive/20231222/202312220229.r1h9KLYG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220229.r1h9KLYG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220229.r1h9KLYG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/delayacct.c:218:5: sparse: sparse: symbol 'delayacct_enabled' was not declared. Should it be static?
   kernel/delayacct.c: note: in included file:
>> include/trace/hooks/delayacct.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/delayacct.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/delayacct.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/delayacct.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/delayacct.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/delayacct.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/delayacct.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/delayacct.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/delayacct.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +26 include/trace/hooks/delayacct.h

    17	
    18	struct task_struct;
    19	struct taskstats;
    20	DECLARE_HOOK(android_vh_delayacct_set_flag,
    21		TP_PROTO(struct task_struct *p, int flag),
    22		TP_ARGS(p, flag));
    23	DECLARE_HOOK(android_vh_delayacct_clear_flag,
    24		TP_PROTO(struct task_struct *p, int flag),
    25		TP_ARGS(p, flag));
  > 26	DECLARE_RESTRICTED_HOOK(android_rvh_delayacct_init,
    27		TP_PROTO(void *unused),
    28		TP_ARGS(unused), 1);
    29	DECLARE_RESTRICTED_HOOK(android_rvh_delayacct_tsk_init,
    30		TP_PROTO(struct task_struct *tsk),
    31		TP_ARGS(tsk), 1);
    32	DECLARE_RESTRICTED_HOOK(android_rvh_delayacct_tsk_free,
    33		TP_PROTO(struct task_struct *tsk),
    34		TP_ARGS(tsk), 1);
    35	DECLARE_HOOK(android_vh_delayacct_blkio_start,
    36		TP_PROTO(void *unused),
    37		TP_ARGS(unused));
    38	DECLARE_HOOK(android_vh_delayacct_blkio_end,
    39		TP_PROTO(struct task_struct *p),
    40		TP_ARGS(p));
    41	DECLARE_HOOK(android_vh_delayacct_add_tsk,
    42		TP_PROTO(struct taskstats *d, struct task_struct *tsk, int *ret),
    43		TP_ARGS(d, tsk, ret));
    44	DECLARE_HOOK(android_vh_delayacct_blkio_ticks,
    45		TP_PROTO(struct task_struct *tsk, __u64 *ret),
    46		TP_ARGS(tsk, ret));
    47	DECLARE_HOOK(android_vh_delayacct_is_task_waiting_on_io,
    48		TP_PROTO(struct task_struct *tsk, int *ret),
    49		TP_ARGS(tsk, ret));
    50	DECLARE_HOOK(android_vh_delayacct_freepages_start,
    51		TP_PROTO(void *unused),
    52		TP_ARGS(unused));
    53	DECLARE_HOOK(android_vh_delayacct_freepages_end,
    54		TP_PROTO(void *unused),
    55		TP_ARGS(unused));
    56	DECLARE_HOOK(android_vh_delayacct_thrashing_start,
    57		TP_PROTO(void *unused),
    58		TP_ARGS(unused));
    59	DECLARE_HOOK(android_vh_delayacct_thrashing_end,
    60		TP_PROTO(void *unused),
    61		TP_ARGS(unused));
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
