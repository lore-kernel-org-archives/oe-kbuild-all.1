Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49643367F59
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774193992; cv=none; b=OZzTq3AtlXRFa3RiiL4BfXAj8li8pkJxKauuXE/Q3+WBtEowZ+4+QSA6D8OuE5VKY+v9BIY1RI/McsdhtmtYe9h9xdBJ3TUJIvspKFXVSFIOtb4SRcdx1W1EUkKyPXO7ai8Lo32bD6upkq597JiniGCyHtidqDTKoWtuxD51zgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774193992; c=relaxed/simple;
	bh=IsO+s6rRzVIo4A6tyCeZou3W002F2QdxA8copGjL2UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYgfmLFwLdxYbdurNdut4JDzYFC9Ond5Clk7ZKZv9rIgQb/XNFBTXDBUB8qreI/Da6NUk72S/DWN5UxWS1W+PkalnYRnSiCiQVkXhXNbmPnEvLi8Tz4OTJXl4iyM4UpRm2s7IwsKt9GZJyA1BQCQah9mX/qyyAxBSO9ncZ5xS1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/DW/zvx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/DW/zvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774193990; x=1805729990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IsO+s6rRzVIo4A6tyCeZou3W002F2QdxA8copGjL2UA=;
  b=S/DW/zvxkJQET5MOwvwvH4saHpoBWDq4iPmSMf1CxoPPkXnTZo3QEOQg
   SZTs9K/M9zjKw4yurGzjyODmHa1ZzIfkxckDkPfKVBDjTYbGvB3b2aqjF
   25TonaUwJnaixLunSP198jIbfoSxCy5CDyqRikhKzHeKTIpM81/D9u1v5
   8iEmd9M6YCQ+qohA8XvHFLTIvLlUnwAYbNeh0jKMMycTzFhfBBZ0dLa9K
   EVuS+AeK16fMcc05u6kKS5wHl97Eu8SsAOoj6RXbQpDMJJTzDgUH10XDn
   IW0U1+mLCtUDCleqrgKWurF/i3Ks8kh/nH8WaFUW70FY80QvP+YnXGsUS
   A==;
X-CSE-ConnectionGUID: jnwr2nETR0mENeft68nklw==
X-CSE-MsgGUID: Q5vhck1+QFSphktvAjlLBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74231344"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="74231344"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 08:39:50 -0700
X-CSE-ConnectionGUID: 69t5FfQJRca0EwOthl8wwA==
X-CSE-MsgGUID: PFbcLtyWS/q7QeIkItNq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="219482153"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2026 08:39:46 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Kty-000000002JB-49MY;
	Sun, 22 Mar 2026 15:39:42 +0000
Date: Sun, 22 Mar 2026 23:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: Change gfp_t to unsigned long
Message-ID: <202603222339.TqgmWGnk-lkp@intel.com>
References: <20260319-gfp64-v1-5-2c73b8d42b7f@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-gfp64-v1-5-2c73b8d42b7f@google.com>

Hi Brendan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/drm-managed-Use-special-gfp_t-format-specifier/20260322-145930
base:   8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
patch link:    https://lore.kernel.org/r/20260319-gfp64-v1-5-2c73b8d42b7f%40google.com
patch subject: [PATCH 5/5] mm: Change gfp_t to unsigned long
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260322/202603222339.TqgmWGnk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222339.TqgmWGnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222339.TqgmWGnk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:23,
                    from lib/test_lockup.c:8:
>> lib/test_lockup.c:133:47: error: expected ';' before 'long'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         |                                               ^~~~
   include/linux/moduleparam.h:175:23: note: in definition of macro 'module_param_named_unsafe'
     175 |         param_check_##type(name, &(value));                             \
         |                       ^~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/moduleparam.h:175:32: error: expected ')' before ',' token
     175 |         param_check_##type(name, &(value));                             \
         |                                ^
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/moduleparam.h:176:39: error: 'param_ops_unsigned' undeclared here (not in a function); did you mean 'param_ops_uint'?
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |                                       ^~~~~~~~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:47: error: expected '}' before 'long'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         |                                               ^~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:305:11: note: to match this '{'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |           ^
   include/linux/moduleparam.h:192:9: note: in expansion of macro '__module_param_call'
     192 |         __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1,    \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:23,
                    from test_lockup.c:8:
   test_lockup.c:133:47: error: expected ';' before 'long'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         |                                               ^~~~
   include/linux/moduleparam.h:175:23: note: in definition of macro 'module_param_named_unsafe'
     175 |         param_check_##type(name, &(value));                             \
         |                       ^~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/moduleparam.h:175:32: error: expected ')' before ',' token
     175 |         param_check_##type(name, &(value));                             \
         |                                ^
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/moduleparam.h:176:39: error: 'param_ops_unsigned' undeclared here (not in a function); did you mean 'param_ops_uint'?
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |                                       ^~~~~~~~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:47: error: expected '}' before 'long'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         |                                               ^~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:305:11: note: to match this '{'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |           ^
   include/linux/moduleparam.h:192:9: note: in expansion of macro '__module_param_call'
     192 |         __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1,    \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~


vim +133 lib/test_lockup.c

     6	
     7	#include <linux/kernel.h>
   > 8	#include <linux/module.h>
     9	#include <linux/delay.h>
    10	#include <linux/sched.h>
    11	#include <linux/sched/signal.h>
    12	#include <linux/sched/clock.h>
    13	#include <linux/cpu.h>
    14	#include <linux/nmi.h>
    15	#include <linux/mm.h>
    16	#include <linux/uaccess.h>
    17	#include <linux/file.h>
    18	
    19	static unsigned int time_secs;
    20	module_param(time_secs, uint, 0600);
    21	MODULE_PARM_DESC(time_secs, "lockup time in seconds, default 0");
    22	
    23	static unsigned int time_nsecs;
    24	module_param(time_nsecs, uint, 0600);
    25	MODULE_PARM_DESC(time_nsecs, "nanoseconds part of lockup time, default 0");
    26	
    27	static unsigned int cooldown_secs;
    28	module_param(cooldown_secs, uint, 0600);
    29	MODULE_PARM_DESC(cooldown_secs, "cooldown time between iterations in seconds, default 0");
    30	
    31	static unsigned int cooldown_nsecs;
    32	module_param(cooldown_nsecs, uint, 0600);
    33	MODULE_PARM_DESC(cooldown_nsecs, "nanoseconds part of cooldown, default 0");
    34	
    35	static unsigned int iterations = 1;
    36	module_param(iterations, uint, 0600);
    37	MODULE_PARM_DESC(iterations, "lockup iterations, default 1");
    38	
    39	static bool all_cpus;
    40	module_param(all_cpus, bool, 0400);
    41	MODULE_PARM_DESC(all_cpus, "trigger lockup at all cpus at once");
    42	
    43	static int wait_state;
    44	static char *state = "R";
    45	module_param(state, charp, 0400);
    46	MODULE_PARM_DESC(state, "wait in 'R' running (default), 'D' uninterruptible, 'K' killable, 'S' interruptible state");
    47	
    48	static bool use_hrtimer;
    49	module_param(use_hrtimer, bool, 0400);
    50	MODULE_PARM_DESC(use_hrtimer, "use high-resolution timer for sleeping");
    51	
    52	static bool iowait;
    53	module_param(iowait, bool, 0400);
    54	MODULE_PARM_DESC(iowait, "account sleep time as iowait");
    55	
    56	static bool lock_read;
    57	module_param(lock_read, bool, 0400);
    58	MODULE_PARM_DESC(lock_read, "lock read-write locks for read");
    59	
    60	static bool lock_single;
    61	module_param(lock_single, bool, 0400);
    62	MODULE_PARM_DESC(lock_single, "acquire locks only at one cpu");
    63	
    64	static bool reacquire_locks;
    65	module_param(reacquire_locks, bool, 0400);
    66	MODULE_PARM_DESC(reacquire_locks, "release and reacquire locks/irq/preempt between iterations");
    67	
    68	static bool touch_softlockup;
    69	module_param(touch_softlockup, bool, 0600);
    70	MODULE_PARM_DESC(touch_softlockup, "touch soft-lockup watchdog between iterations");
    71	
    72	static bool touch_hardlockup;
    73	module_param(touch_hardlockup, bool, 0600);
    74	MODULE_PARM_DESC(touch_hardlockup, "touch hard-lockup watchdog between iterations");
    75	
    76	static bool call_cond_resched;
    77	module_param(call_cond_resched, bool, 0600);
    78	MODULE_PARM_DESC(call_cond_resched, "call cond_resched() between iterations");
    79	
    80	static bool measure_lock_wait;
    81	module_param(measure_lock_wait, bool, 0400);
    82	MODULE_PARM_DESC(measure_lock_wait, "measure lock wait time");
    83	
    84	static unsigned long lock_wait_threshold = ULONG_MAX;
    85	module_param(lock_wait_threshold, ulong, 0400);
    86	MODULE_PARM_DESC(lock_wait_threshold, "print lock wait time longer than this in nanoseconds, default off");
    87	
    88	static bool test_disable_irq;
    89	module_param_named(disable_irq, test_disable_irq, bool, 0400);
    90	MODULE_PARM_DESC(disable_irq, "disable interrupts: generate hard-lockups");
    91	
    92	static bool disable_softirq;
    93	module_param(disable_softirq, bool, 0400);
    94	MODULE_PARM_DESC(disable_softirq, "disable bottom-half irq handlers");
    95	
    96	static bool disable_preempt;
    97	module_param(disable_preempt, bool, 0400);
    98	MODULE_PARM_DESC(disable_preempt, "disable preemption: generate soft-lockups");
    99	
   100	static bool lock_rcu;
   101	module_param(lock_rcu, bool, 0400);
   102	MODULE_PARM_DESC(lock_rcu, "grab rcu_read_lock: generate rcu stalls");
   103	
   104	static bool lock_mmap_sem;
   105	module_param(lock_mmap_sem, bool, 0400);
   106	MODULE_PARM_DESC(lock_mmap_sem, "lock mm->mmap_lock: block procfs interfaces");
   107	
   108	static unsigned long lock_rwsem_ptr;
   109	module_param_unsafe(lock_rwsem_ptr, ulong, 0400);
   110	MODULE_PARM_DESC(lock_rwsem_ptr, "lock rw_semaphore at address");
   111	
   112	static unsigned long lock_mutex_ptr;
   113	module_param_unsafe(lock_mutex_ptr, ulong, 0400);
   114	MODULE_PARM_DESC(lock_mutex_ptr, "lock mutex at address");
   115	
   116	static unsigned long lock_spinlock_ptr;
   117	module_param_unsafe(lock_spinlock_ptr, ulong, 0400);
   118	MODULE_PARM_DESC(lock_spinlock_ptr, "lock spinlock at address");
   119	
   120	static unsigned long lock_rwlock_ptr;
   121	module_param_unsafe(lock_rwlock_ptr, ulong, 0400);
   122	MODULE_PARM_DESC(lock_rwlock_ptr, "lock rwlock at address");
   123	
   124	static unsigned int alloc_pages_nr;
   125	module_param_unsafe(alloc_pages_nr, uint, 0600);
   126	MODULE_PARM_DESC(alloc_pages_nr, "allocate and free pages under locks");
   127	
   128	static unsigned int alloc_pages_order;
   129	module_param(alloc_pages_order, uint, 0400);
   130	MODULE_PARM_DESC(alloc_pages_order, "page order to allocate");
   131	
   132	static gfp_t alloc_pages_gfp = GFP_KERNEL;
 > 133	module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
   134	MODULE_PARM_DESC(alloc_pages_gfp, "allocate pages with this gfp_mask, default GFP_KERNEL");
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
