Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1490A21
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 03:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680752378; x=1712288378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sovU0yQau/osGjnPp7nqvrmaLGy2OTxeo1hJVTXeUPQ=;
  b=YmRU2vc571l2YEDGgXMVGuFE/63gouX+oRYpKBV8LEnNKUhVdTnBdSqn
   ZyBGJhkgw8yqKBkwX1NFPcFqk7/Fbjb6CRkxsN5eO439rimkcC8jcDk2U
   JqDGIFEAVwkKMezbBEbWQdfhGI/cTCDW9JBLAmql1NvSCEM4nHbIsKmsJ
   PNgU/w6K4pIeR1TWUHQzS+vfrplfKrVuTaO26MEE/AN7R1coo/upvy7SQ
   vENNsqrY+6nhKdykDDGbRlfqdsYd54uCPuzs/K9Dq214hD/8RIJ/KDFZb
   xQ30iyFHC6zX9Vy8J7BqSd6Ox4sbpnDmmhNJOJBeUMzSMGOLE7a/NGV0q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="340121936"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="340121936"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 20:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680506004"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="680506004"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 20:39:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkGTH-000R1e-1F;
	Thu, 06 Apr 2023 03:39:35 +0000
Date: Thu, 6 Apr 2023 11:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] sched: Fix performance regression introduced by
 mm_cid (v2)
Message-ID: <202304061139.3nSy5gpA-lkp@intel.com>
References: <20230405121535.3891327-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405121535.3891327-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc5]
[cannot apply to tip/sched/core next-20230405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/sched-Fix-performance-regression-introduced-by-mm_cid-v2/20230405-201753
patch link:    https://lore.kernel.org/r/20230405121535.3891327-1-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH] sched: Fix performance regression introduced by mm_cid (v2)
config: x86_64-randconfig-s021-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061139.3nSy5gpA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/be4cd97c120346420c4119144e117345d490bc8b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mathieu-Desnoyers/sched-Fix-performance-regression-introduced-by-mm_cid-v2/20230405-201753
        git checkout be4cd97c120346420c4119144e117345d490bc8b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061139.3nSy5gpA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:260:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:260:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:260:56: sparse:    struct task_struct *
   kernel/sched/core.c:1023:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1023:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1023:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1081:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1081:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1081:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2192:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2192:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2192:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2192:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2192:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2192:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3665:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3665:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3665:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3872:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3872:28: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3872:28: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9337:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9337:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:9337:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5573:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5573:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5573:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5666:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5666:14: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5666:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6210:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6210:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6210:32: sparse:    struct task_struct *
   kernel/sched/core.c:6241:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6241:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6241:23: sparse:    struct task_struct *
   kernel/sched/core.c:6249:46: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6249:46: sparse:    struct task_struct *
   kernel/sched/core.c:6249:46: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6304:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:6304:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:6304:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:6520:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6520:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6520:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7046:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7046:17: sparse:    struct task_struct *
   kernel/sched/core.c:7046:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7262:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7262:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7262:22: sparse:    struct task_struct *
   kernel/sched/core.c:11339:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11339:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11339:25: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:11503:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *dest_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11503:19: sparse:     expected struct task_struct *dest_task
   kernel/sched/core.c:11503:19: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:319:9: sparse: sparse: context imbalance in 'sched_core_lock' - different lock contexts for basic block
   kernel/sched/core.c:329:17: sparse: sparse: context imbalance in 'sched_core_unlock' - unexpected unlock
   kernel/sched/core.c:532:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:557:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1230:30: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/sched.h:1582:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1582:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:97:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:97:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:97:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1438:13: sparse: sparse: context imbalance in 'uclamp_update_util_min_rt_default' - wrong count at exit
   kernel/sched/core.c:2183:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2184:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2185:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/core.c:2158:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2158:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2158:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *

vim +11503 kernel/sched/core.c

 11474	
 11475	/*
 11476	 * Migration to dst cpu. Called with dst_rq lock held.
 11477	 */
 11478	void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t)
 11479	{
 11480		struct mm_struct *mm = t->mm;
 11481		int src_cid, dst_cid, *dst_pcpu_cid;
 11482		struct task_struct *dest_task;
 11483	
 11484		lockdep_assert_rq_held(dst_rq);
 11485	
 11486		src_cid = t->last_mm_cid;
 11487		if (!mm || src_cid == -1)
 11488			return;
 11489	
 11490		dst_pcpu_cid = per_cpu_ptr(mm->pcpu_cid, cpu_of(dst_rq));
 11491	
 11492		/*
 11493		 * If destination cpu cid is greater than the source cpu cid, unset it
 11494		 * so it can be reallocated.
 11495		 */
 11496		dst_cid = READ_ONCE(*dst_pcpu_cid);
 11497		if (!mm_cid_is_valid(dst_cid) || dst_cid <= src_cid)
 11498			return;
 11499		/*
 11500		 * Put dst_cid if it is not currently in use, else it will be lazy put
 11501		 * on the next context switch.
 11502		 */
 11503		dest_task = dst_rq->curr;
 11504		if (dest_task->mm_cid_active && dest_task->mm == mm) {
 11505			WARN_ON_ONCE(dest_task->mm_cid != dst_cid);
 11506			/*
 11507			 * Attempt to set lazy-put flag. Can fail due to concurrent
 11508			 * migrate-from, which sets lazy-put flag or MM_CID_UNSET.
 11509			 */
 11510			(void) cmpxchg(dst_pcpu_cid, dst_cid, mm_cid_set_lazy_put(dst_cid));
 11511			return;
 11512		}
 11513		/*
 11514		 * Attempt to set MM_CID_UNSET. Can fail due to concurrent
 11515		 * migrate-from, which sets lazy-put flag or MM_CID_UNSET.
 11516		 */
 11517		if (cmpxchg(dst_pcpu_cid, dst_cid, MM_CID_UNSET) != dst_cid)
 11518			return;
 11519		__mm_cid_put(mm, dst_cid);
 11520	}
 11521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
