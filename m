Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B84DDB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694779459; x=1726315459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDcAoJ7J4txzO1z/WgiscYN6uKgud1uTm5Hgz0eTN4U=;
  b=TpRIYESrhKR9l1/9rLBfqTBESf6tDvteAk+dnKCsNoi7W1boCVW6rZxC
   e3MahnzrUbGlXji3erwxOwykUCPuFfgt+i2y5n0CbwA/1m2CYK7TnoSSN
   IoRsFuShBWkU+NHCpD/ynG8xZo7amRHH2Q2I1azcqCjb9mwoOURq1dHp0
   FNnUsqm75KhhSCvx7513WCQiBBoPu/3zxE/QA/81V8Z1ftjgG184ynqb2
   hWohcZiX6WL8Eywd+hlsMm6ryq5KcqEMnCehh7m/KBERqYZjOQYSJ0/pC
   dczNwpsf4RDG9rn3IOoz+ZCNtkzpo4nP9/q3G3JqadFH5fi0hrX+U6NNZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381959953"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="381959953"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 05:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="738302923"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="738302923"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Sep 2023 05:03:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh7Y8-0002w9-0B;
	Fri, 15 Sep 2023 12:03:52 +0000
Date: Fri, 15 Sep 2023 20:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9622/28548]
 include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202309152036.d1ONBMKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   19cff29fe49cb187d02a308880d58ad8ce1cdc71
commit: 5aeda5a3ccb1823eec337c21c1e56e19e16b8e94 [9622/28548] ANDROID: sched: add vendor hooks to handle scheduling priority
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230915/202309152036.d1ONBMKC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152036.d1ONBMKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152036.d1ONBMKC-lkp@intel.com/

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
