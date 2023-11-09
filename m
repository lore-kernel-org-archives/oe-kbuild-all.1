Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F9A1A72F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 11:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYATKs7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699530050; x=1731066050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXOsCPrvUtcr0Q87i1UPBXDvD5C/mY/RQvvMcLU0ILU=;
  b=aYATKs7pFvVN3CTtn8+qlAexeTS1E+NMtq/XX/A+A8aj6n6546iLhIPh
   QYkLesdckdNiG9YJCwvD55pdp2VZV/5xHW50AZylbpLdQWR+DzwX7fyGm
   NVdNr7RZK2yXZu3xbpasxO5Jc7jgjS/HtnwmE5sCS0wkeDUBVpO0ePAzo
   TyJ6fs48d/iSk73AEKac7dnRTSCBgb57/q/dr1ow1zWkgL15FSbDw4hhl
   ZRxUNn4hPSA95r6YToqkSDHIK/TMKNWfGQ6UYUorufRDqJanbMt4HwZmL
   9dKDlN4WTeX6pwsiEFTnsELttrCAhqIzF14gixdUemDTIRJknwQmoyVG0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="8618153"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="8618153"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 03:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="886968692"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="886968692"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 03:40:45 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r13Ot-0008gu-0n;
	Thu, 09 Nov 2023 11:40:43 +0000
Date: Thu, 9 Nov 2023 19:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1255/24078]
 include/trace/hooks/sched.h:32:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202311091931.g68Kvnvw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   6dcfedcb7cf5ac7ddd3c71ee1500d0e33384a489
commit: 16330b35600f00c589cd1a621d132635aabc1816 [1255/24078] ANDROID: Add vendor hooks to the scheduler
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231109/202311091931.g68Kvnvw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091931.g68Kvnvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091931.g68Kvnvw-lkp@intel.com/

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
   kernel/sched/core.c:2187:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:2187:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:2187:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2360:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2360:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:2360:36: sparse:     got struct task_struct [noderef] __rcu *curr
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
   kernel/sched/pelt.h:80:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:80:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:80:13: sparse:     got struct task_struct [noderef] __rcu *curr
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
   include/trace/hooks/sched.h:36:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:36:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:36:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/sched.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *
   kernel/sched/core.c:1395:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:1395:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:1395:38: sparse:    struct task_struct const *
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
