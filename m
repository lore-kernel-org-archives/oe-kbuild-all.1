Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F3C8D2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 05:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWjnrWn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699422138; x=1730958138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjYwAsT+jwfLKm32Z6zK9YEznBaDLdquSpEKzuu+QGI=;
  b=aWjnrWn/Zx41wbpL39dTM82LRRHG+K/sLtTtwTqoDpcuQPQUu3+IVex8
   nkPIv8jnzGIsPTJ4i9IOmdxO3cx40Uy/FQ8jlJkbQN3/LnzyAg4vI2QA6
   VHTs8IQXaTFrszYHJzEKer1c01qRPpQXJT2NFiAOZKFVv/vxi+MyrbEYx
   PhYdxN4g0OG0NlUwFHfrC9cFO+abVt2ZS9kupnTtJZgrX1wkSGkR22oyl
   kOsWC24EZx9pr9s7PrC4f9zYS6hRT6VjYeGooeVKfYA33nmQjazzWGWr4
   A6zGvArbn0WuBS9OHYXEPx8uZNG3eZ2ciVRotPKxhivG51iMRq7zp6A/y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2709874"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="2709874"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 21:42:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797906852"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="797906852"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Nov 2023 21:42:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bKP-0007hr-2X;
	Wed, 08 Nov 2023 05:42:13 +0000
Date: Wed, 8 Nov 2023 13:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 17/19] kernel/sched/debug.c:922:63: error:
 'struct rt_rq' has no member named 'rt_throttled'
Message-ID: <202311081204.OMVM5oxp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   4a97a4d025f6984a0ae7bb2c21ab09a52d4c1c6a
commit: 9a351a777960a04abb61fbaf95213ce67693b024 [17/19] sched/rt: Remove default bandwidth control
config: powerpc64-randconfig-001-20231108 (https://download.01.org/0day-ci/archive/20231108/202311081204.OMVM5oxp-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081204.OMVM5oxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081204.OMVM5oxp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c: In function 'debugfs_fair_server_init':
   kernel/sched/debug.c:529:50: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
     529 |                 snprintf(buf, sizeof(buf), "cpu%ld", cpu);
         |                                                ~~^   ~~~
         |                                                  |   |
         |                                                  |   unsigned int
         |                                                  long int
         |                                                %d
   kernel/sched/debug.c:532:61: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     532 |                 debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &fair_server_runtime_fops);
         |                                                             ^
   kernel/sched/debug.c:533:60: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     533 |                 debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &fair_server_period_fops);
         |                                                            ^
   kernel/sched/debug.c:534:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     534 |                 debugfs_create_file("defer", 0644, d_cpu, (void *) cpu, &fair_server_defer_fops);
         |                                                           ^
   kernel/sched/debug.c: In function 'print_rt_rq':
>> kernel/sched/debug.c:922:63: error: 'struct rt_rq' has no member named 'rt_throttled'
     922 |         SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
         |                                                               ^~
   kernel/sched/debug.c:17:31: note: in definition of macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:929:9: note: in expansion of macro 'P'
     929 |         P(rt_throttled);
         |         ^
   In file included from include/linux/kernel.h:30,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
>> kernel/sched/debug.c:922:63: error: 'struct rt_rq' has no member named 'rt_throttled'
     922 |         SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
         |                                                               ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/debug.c:19:17: note: in expansion of macro 'pr_cont'
      19 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:922:9: note: in expansion of macro 'SEQ_printf'
     922 |         SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
         |         ^~~~~~~~~~
   kernel/sched/debug.c:929:9: note: in expansion of macro 'P'
     929 |         P(rt_throttled);
         |         ^
>> kernel/sched/debug.c:926:66: error: 'struct rt_rq' has no member named 'rt_time'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                                  ^~
   kernel/sched/debug.c:17:31: note: in definition of macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:926:52: note: in expansion of macro 'SPLIT_NS'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                    ^~~~~~~~
   kernel/sched/debug.c:930:9: note: in expansion of macro 'PN'
     930 |         PN(rt_time);
         |         ^~
>> kernel/sched/debug.c:926:66: error: 'struct rt_rq' has no member named 'rt_time'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                                  ^~
   kernel/sched/debug.c:17:31: note: in definition of macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:926:52: note: in expansion of macro 'SPLIT_NS'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                    ^~~~~~~~
   kernel/sched/debug.c:930:9: note: in expansion of macro 'PN'
     930 |         PN(rt_time);
         |         ^~
>> kernel/sched/debug.c:926:66: error: 'struct rt_rq' has no member named 'rt_time'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/debug.c:19:17: note: in expansion of macro 'pr_cont'
      19 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:926:9: note: in expansion of macro 'SEQ_printf'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |         ^~~~~~~~~~
   kernel/sched/debug.c:926:52: note: in expansion of macro 'SPLIT_NS'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                    ^~~~~~~~
   kernel/sched/debug.c:930:9: note: in expansion of macro 'PN'
     930 |         PN(rt_time);
         |         ^~
>> kernel/sched/debug.c:926:66: error: 'struct rt_rq' has no member named 'rt_time'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/debug.c:19:17: note: in expansion of macro 'pr_cont'
      19 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:926:9: note: in expansion of macro 'SEQ_printf'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |         ^~~~~~~~~~
   kernel/sched/debug.c:926:52: note: in expansion of macro 'SPLIT_NS'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                    ^~~~~~~~
   kernel/sched/debug.c:930:9: note: in expansion of macro 'PN'
     930 |         PN(rt_time);
         |         ^~
>> kernel/sched/debug.c:926:66: error: 'struct rt_rq' has no member named 'rt_runtime'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                                  ^~
   kernel/sched/debug.c:17:31: note: in definition of macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:926:52: note: in expansion of macro 'SPLIT_NS'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                    ^~~~~~~~
   kernel/sched/debug.c:931:9: note: in expansion of macro 'PN'
     931 |         PN(rt_runtime);
         |         ^~
>> kernel/sched/debug.c:926:66: error: 'struct rt_rq' has no member named 'rt_runtime'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                                  ^~
   kernel/sched/debug.c:17:31: note: in definition of macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:926:52: note: in expansion of macro 'SPLIT_NS'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                    ^~~~~~~~
   kernel/sched/debug.c:931:9: note: in expansion of macro 'PN'
     931 |         PN(rt_runtime);
         |         ^~
>> kernel/sched/debug.c:926:66: error: 'struct rt_rq' has no member named 'rt_runtime'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/debug.c:19:17: note: in expansion of macro 'pr_cont'
      19 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:926:9: note: in expansion of macro 'SEQ_printf'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |         ^~~~~~~~~~
   kernel/sched/debug.c:926:52: note: in expansion of macro 'SPLIT_NS'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                    ^~~~~~~~
   kernel/sched/debug.c:931:9: note: in expansion of macro 'PN'
     931 |         PN(rt_runtime);
         |         ^~
>> kernel/sched/debug.c:926:66: error: 'struct rt_rq' has no member named 'rt_runtime'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/debug.c:19:17: note: in expansion of macro 'pr_cont'
      19 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:926:9: note: in expansion of macro 'SEQ_printf'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |         ^~~~~~~~~~
   kernel/sched/debug.c:926:52: note: in expansion of macro 'SPLIT_NS'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                    ^~~~~~~~
   kernel/sched/debug.c:931:9: note: in expansion of macro 'PN'
     931 |         PN(rt_runtime);
         |         ^~


vim +922 kernel/sched/debug.c

ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19  920  
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19  921  #define P(x) \
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19 @922  	SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
48365b38849fdb1 kernel/sched/debug.c Daniel Bristot de Oliveira 2017-06-26  923  #define PU(x) \
48365b38849fdb1 kernel/sched/debug.c Daniel Bristot de Oliveira 2017-06-26  924  	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(rt_rq->x))
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19  925  #define PN(x) \
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19 @926  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19  927  
48365b38849fdb1 kernel/sched/debug.c Daniel Bristot de Oliveira 2017-06-26  928  	PU(rt_nr_running);
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19  929  	P(rt_throttled);
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19  930  	PN(rt_time);
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19  931  	PN(rt_runtime);
ada18de2eb76961 kernel/sched_debug.c Peter Zijlstra             2008-06-19  932  

:::::: The code at line 922 was first introduced by commit
:::::: ada18de2eb76961a4d4847f63291744c9e7beec4 sched: debug: add some rt debug output

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
