Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F40C636
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 00:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685407313; x=1716943313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ay+8n1Yd33syfx9hiZubY2Kuro3TLQ4h+Gm0He0cZrY=;
  b=czjYPoTwyd0eB5gpbed1WXDd9yOo5nzNX0PeebXFW4Ct3tDwFB00P6EH
   5i7JHKgzz7k9uf8VfM3PJi+OjFqL/XR2o1cKmNFwKYK+WK3NLbzOMPaeO
   2DGKV7Py3OaZVzlRUSCR420631bB8ulzWC1zuBRXALuXr4rj7COx+MDvm
   jaZmeMkUvjDFIi0PrvWnLRaPPtqzR2zMBXJZjavxsahUVg+UBlfnOEn/W
   r80kNFfboYP8wY+eRxX7lu1GxwyXpMBS/nH4xYeuTb8g7hSFqGnUduDEH
   6H0SmI8qkbiJy8rPbyZQ4tsKmR1IW6Sz44LnbxsOLJRdF+2meZvxwU3ki
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441142400"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="441142400"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 17:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706215484"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="706215484"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 May 2023 17:41:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3nQo-000LCM-1e;
	Tue, 30 May 2023 00:41:46 +0000
Date: Tue, 30 May 2023 08:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 1255/27651]
 include/trace/hooks/sched.h:32:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202305300851.23dh3TgM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   fb8d4193a852c7d62938aaf3a8c58bbc7888bb23
commit: 16330b35600f00c589cd1a621d132635aabc1816 [1255/27651] ANDROID: Add vendor hooks to the scheduler
config: i386-randconfig-s001-20230528 (https://download.01.org/0day-ci/archive/20230530/202305300851.23dh3TgM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common arcvm12-5.10
        git checkout 16330b35600f00c589cd1a621d132635aabc1816
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300851.23dh3TgM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:515:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:515:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:515:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1439:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1439:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:1439:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1439:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1439:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:1439:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3684:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3684:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:3684:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4119:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4119:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:4119:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4542:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4542:17: sparse:    struct task_struct *
   kernel/sched/core.c:4542:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:4742:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4742:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:4742:22: sparse:    struct task_struct *
   kernel/sched/core.c:8067:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8067:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:8067:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
>> include/trace/hooks/sched.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:36:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:36:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:36:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   kernel/sched/core.c:1422:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1423:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1426:40: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *

vim +32 include/trace/hooks/sched.h

  > 32	DECLARE_RESTRICTED_HOOK(android_rvh_enqueue_task,
    33		TP_PROTO(struct rq *rq, struct task_struct *p),
    34		TP_ARGS(rq, p), 1);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
