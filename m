Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EEA2AB55
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687334403; x=1718870403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/M6lCzQKtMMW9uTkAeD/+RA/fHkZkF0brwEfOepFotc=;
  b=Ts5TRPfQfvokK8MSV0IKRVFsOrW2PqUD9n8A44xy29E4F7F47Boz2ALJ
   l6jy9H92FwfQi2TeDIQlklPBzigoTwnHzPBQMc2qZnKzNMfHvhT31GjzH
   xod5WW+sxacCZnWQ58RklvI1RpxtU5W/FT6KSgZfubGZUgrEHMVu5KLuo
   rZsgNs/SG/fIkXuFZ2K980gQchj6G52Pa/9Y133ght0d3pGckrpaauHeI
   aDvUKzTe8dwtMiSW/mPQJtqiQ5ItCkwzEHFBCfsofEhRmCBjaI+cz1nEL
   vwwoEjUR/LdYd2LCgldHXgAa6bs6rHczgEPuHc1lufAfyjM5SiDkFHMpD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="426056581"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="426056581"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 01:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691754541"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="691754541"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2023 01:00:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBsky-0006fX-2b;
	Wed, 21 Jun 2023 08:00:00 +0000
Date: Wed, 21 Jun 2023 15:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 9505/26704]
 include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306211550.8Oy8KHCf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   1ea6ab2cc196e3fddf9659166be30f28c04c4b95
commit: 3b773b24e67678aae79072c2d5b7783e7d5dc6a1 [9505/26704] ANDROID: sched: add vendor hooks to handle scheduling priority
config: i386-randconfig-s003-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211550.8Oy8KHCf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211550.8Oy8KHCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211550.8Oy8KHCf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:2207:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] <asn:4> *parent @@
   kernel/sched/core.c:2207:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:2207:17: sparse:     got struct sched_domain [noderef] <asn:4> *parent
   kernel/sched/core.c:2385:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2385:27: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:2385:27: sparse:    struct task_struct *
   kernel/sched/core.c:4079:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4079:17: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:4079:17: sparse:    struct task_struct *
   kernel/sched/core.c:6071:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6071:9: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:6071:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
>> include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:19:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:23:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:27:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:31:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/sched.h:35:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/sched.h:35:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:35:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs

vim +19 include/trace/hooks/sched.h

  > 19	DECLARE_RESTRICTED_HOOK(android_rvh_prepare_prio_fork,
    20		TP_PROTO(struct task_struct *p),
    21		TP_ARGS(p), 1);
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
