Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608713D966
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 23:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eyl6VXfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699658795; x=1731194795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nhjJ/VaVL6XRSng9UJl7z/85xBth35Nzf07ThXQZ4VA=;
  b=Eyl6VXfgoPvZzvpizrlLiQ2rRJkoJQAqncQvhL1aVvOwuSuJiGWDmFA4
   RePeSZI5nf4W0q5XOTnd/lYgTTUlx1PU9VlMdiBGVWwKkpzuM9SzOV+Lj
   iwWl4AAAPQzwtstnf9ilnwcNGBSoNZW6gXXueNkrrDot0wGUppYIB7rea
   vi4xeGfTpQSYecxNBagYu6k988MmzdKSKc1tQjitrAu5q+XoDzJcM/GJA
   waonDjXsXLpVkOsSyHQl0ik/xB2gPCyt6R1Y5rsqHkKc6DEwthy7ixW0p
   kQgIocrm/+YJTDKoy+MK/rZHNenz4VxrgXRQTdcn8ekBasEoSMpyqsHEj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375274643"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="375274643"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 15:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937274499"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="937274499"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Nov 2023 15:26:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1atQ-000A1F-2Y;
	Fri, 10 Nov 2023 23:26:28 +0000
Date: Sat, 11 Nov 2023 07:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1255/24081]
 include/trace/hooks/sched.h:32:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202311110741.BfnxSrf6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d8156345d8c56a2b082c1877eaee48a22c33014f
commit: 16330b35600f00c589cd1a621d132635aabc1816 [1255/24081] ANDROID: Add vendor hooks to the scheduler
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231111/202311110741.BfnxSrf6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110741.BfnxSrf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110741.BfnxSrf6-lkp@intel.com/

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
