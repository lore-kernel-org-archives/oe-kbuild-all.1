Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085E5A44
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 05:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679982611; x=1711518611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D18cSqp+V2m8bLFMnD2c1heiyDeddXhXxIo6SmCp8+k=;
  b=UpZ2lD0N4RY9c8j+U00FEdWU9KUXjtb1m8QwL5sNrKgYro2IjNYH6RA0
   pO4XFvaoKhvAG1m0p/maaCg7tRnuZIq4y0tQFuwPeA7ipSVDlcf6Fkz3u
   nvutcYD0IB6gTrJDvCJBkMYXMMq+Ja1K0fLfcnEoO66GwwdC6hquEDI2E
   66eibAAeuitMygZz5UHw2FTjBoPrqmWhXvC9+dXQUTLzA3b53gOTqQCMR
   iU3k37jmjJWyN84blkvQLdCMyDVTnyxvyO0ZJ5BeEFRVOjGV77LTTqU/U
   YaFj0mCgd5rmByRKalXwICH73MqoDwjlwLi32mPa7uP6nS+vVPnaUaxUN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="405413759"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="405413759"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 22:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="661065626"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="661065626"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Mar 2023 22:49:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph2DO-000IJj-0F;
	Tue, 28 Mar 2023 05:49:50 +0000
Date: Tue, 28 Mar 2023 13:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] sched: Introduce mm_cid runqueue cache
Message-ID: <202303281344.0nOD9F8J-lkp@intel.com>
References: <20230327195318.137094-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327195318.137094-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.3-rc4 next-20230328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/sched-Introduce-mm_cid-runqueue-cache/20230328-035418
patch link:    https://lore.kernel.org/r/20230327195318.137094-1-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH] sched: Introduce mm_cid runqueue cache
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230328/202303281344.0nOD9F8J-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/1ed2ac17a591daac640ef7149cdc3c8e0870e474
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mathieu-Desnoyers/sched-Introduce-mm_cid-runqueue-cache/20230328-035418
        git checkout 1ed2ac17a591daac640ef7149cdc3c8e0870e474
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281344.0nOD9F8J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:721:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:721:31: sparse:     expected struct task_struct *task
   kernel/sched/core.c:721:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1038:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1038:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1038:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1096:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1096:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1096:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2202:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2202:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2202:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2202:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2202:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2202:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3677:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3677:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3677:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3886:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3886:28: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3886:28: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9408:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9408:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:9408:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5588:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5588:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5588:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5681:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5681:14: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5681:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6543:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6543:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6543:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7069:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7069:17: sparse:    struct task_struct *
   kernel/sched/core.c:7069:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7285:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7285:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7285:22: sparse:    struct task_struct *
   kernel/sched/core.c:11426:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11426:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11426:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:547:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:580:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:596:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1598:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1598:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:97:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:97:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:97:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2193:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2194:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2195:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
>> kernel/sched/sched.h:3318:30: sparse: sparse: dereference of noderef expression
>> kernel/sched/sched.h:3318:30: sparse: sparse: dereference of noderef expression
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/core.c:2168:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2168:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2168:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *

vim +3318 kernel/sched/sched.h

  3307	
  3308	static inline void rq_cid_cache_remove_mm_locked(struct rq *rq, struct mm_struct *mm, bool release_mm)
  3309	{
  3310		int cid;
  3311	
  3312		if (!mm)
  3313			return;
  3314		/*
  3315		 * Do not remove the cache entry for a runqueue that runs a task which
  3316		 * currently uses the target mm.
  3317		 */
> 3318		if (!release_mm && rq->curr->mm == mm)
  3319			return;
  3320		cid = rq_cid_cache_lookup_remove(rq, mm);
  3321		mm_cid_put(mm, cid);
  3322	}
  3323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
