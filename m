Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D937D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 05:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693026252; x=1724562252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Hid7uY9B18agEGwYxUMRd4J38FidlUUBc/JqqSvdb4=;
  b=bKqIDjOLC1DwX0LqPtN2U0hY/mD707bJ+GHtL3LeKO5XK8YJ/ptlWEXn
   QyhwWv13mAVRwWHtperU74eackLIQ0uTehnZT4ULOF5WcdV5QZbKN0ZQn
   M599rX060EHwliCsb0xmAXlazNHSFjasS/zb36o0kAV9a121d1K5qbcf9
   0fKZmuA6n4oYyweGm1uFz8866NHm4Ud8UshumjjkFlUoSOa872uMMXR4D
   7LKX7q0t0NkvgyvFNGTsv+lbvblgoB08K10dA6No9cMxGs8P93MK64eYH
   qDVm1S6BpDMQwIjHiWgRm4k3EZi+Hheb8dQBRntAputxrLiVRNVhWfIuL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="378631470"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="378631470"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 22:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="984322638"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="984322638"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2023 22:04:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZlSw-0004Mt-1G;
	Sat, 26 Aug 2023 05:04:07 +0000
Date: Sat, 26 Aug 2023 13:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 9/9]
 kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';'
 before 'task_name'
Message-ID: <202308261227.TeTnFnzT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   e586c67baa1c537a793f135e324cc56df2b6585b
commit: e586c67baa1c537a793f135e324cc56df2b6585b [9/9] kthread: Provide a mechanism to control kthread sched_attr
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308261227.TeTnFnzT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261227.TeTnFnzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261227.TeTnFnzT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:22,
                    from kernel/trace/preemptirq_delay_test.c:15:
   kernel/trace/preemptirq_delay_test.c: In function 'preemptirq_run_test':
>> kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';' before 'task_name'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:17:9: note: in expansion of macro '__kthread_param'
      17 |         __kthread_param(name, unsigned long, sched_policy);             \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:155:17: note: in expansion of macro 'kthread_run'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';' before 'task_name'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:18:9: note: in expansion of macro '__kthread_param'
      18 |         __kthread_param(name, long, sched_nice);                        \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:155:17: note: in expansion of macro 'kthread_run'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';' before 'task_name'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:19:9: note: in expansion of macro '__kthread_param'
      19 |         __kthread_param(name, unsigned long, sched_priority);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:155:17: note: in expansion of macro 'kthread_run'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';' before 'task_name'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:20:9: note: in expansion of macro '__kthread_param'
      20 |         __kthread_param(name, unsigned long long, sched_runtime);       \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:155:17: note: in expansion of macro 'kthread_run'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';' before 'task_name'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:21:9: note: in expansion of macro '__kthread_param'
      21 |         __kthread_param(name, unsigned long long, sched_deadline);      \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:155:17: note: in expansion of macro 'kthread_run'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';' before 'task_name'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:22:9: note: in expansion of macro '__kthread_param'
      22 |         __kthread_param(name, unsigned long long, sched_period);        \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:155:17: note: in expansion of macro 'kthread_run'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';' before 'task_name'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:23:9: note: in expansion of macro '__kthread_param'
      23 |         __kthread_param(name, unsigned long, sched_util_min);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:155:17: note: in expansion of macro 'kthread_run'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';' before 'task_name'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                                                         ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:24:9: note: in expansion of macro '__kthread_param'
      24 |         __kthread_param(name, unsigned long, sched_util_max);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:155:17: note: in expansion of macro 'kthread_run'
     155 |         task =  kthread_run(preemptirq_delay_run, NULL, task_name);
         |                 ^~~~~~~~~~~


vim +155 kernel/trace/preemptirq_delay_test.c

f96e8577da1026 Joel Fernandes (Google  2018-07-12  @15) #include <linux/module.h>
f96e8577da1026 Joel Fernandes (Google  2018-07-12   16) #include <linux/printk.h>
f96e8577da1026 Joel Fernandes (Google  2018-07-12   17) #include <linux/string.h>
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   18) #include <linux/sysfs.h>
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10   19) #include <linux/completion.h>
f96e8577da1026 Joel Fernandes (Google  2018-07-12   20) 
f96e8577da1026 Joel Fernandes (Google  2018-07-12   21) static ulong delay = 100;
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   22) static char test_mode[12] = "irq";
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   23) static uint burst_size = 1;
4b9091e1c1948d Song Chen               2021-01-28   24  static int  cpu_affinity = -1;
f96e8577da1026 Joel Fernandes (Google  2018-07-12   25) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   26) module_param_named(delay, delay, ulong, 0444);
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   27) module_param_string(test_mode, test_mode, 12, 0444);
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   28) module_param_named(burst_size, burst_size, uint, 0444);
4b9091e1c1948d Song Chen               2021-01-28   29  module_param_named(cpu_affinity, cpu_affinity, int, 0444);
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   30) MODULE_PARM_DESC(delay, "Period in microseconds (100 us default)");
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   31) MODULE_PARM_DESC(test_mode, "Mode of the test such as preempt, irq, or alternate (default irq)");
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   32) MODULE_PARM_DESC(burst_size, "The size of a burst (default 1)");
4b9091e1c1948d Song Chen               2021-01-28   33  MODULE_PARM_DESC(cpu_affinity, "Cpu num test is running on");
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   34) 
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10   35) static struct completion done;
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10   36) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   37) #define MIN(x, y) ((x) < (y) ? (x) : (y))
f96e8577da1026 Joel Fernandes (Google  2018-07-12   38) 
f96e8577da1026 Joel Fernandes (Google  2018-07-12   39) static void busy_wait(ulong time)
f96e8577da1026 Joel Fernandes (Google  2018-07-12   40) {
12ad0cb2123aed Steven Rostedt (VMware  2018-10-15   41) 	u64 start, end;
4b9091e1c1948d Song Chen               2021-01-28   42  
12ad0cb2123aed Steven Rostedt (VMware  2018-10-15   43) 	start = trace_clock_local();
4b9091e1c1948d Song Chen               2021-01-28   44  
f96e8577da1026 Joel Fernandes (Google  2018-07-12   45) 	do {
12ad0cb2123aed Steven Rostedt (VMware  2018-10-15   46) 		end = trace_clock_local();
f96e8577da1026 Joel Fernandes (Google  2018-07-12   47) 		if (kthread_should_stop())
f96e8577da1026 Joel Fernandes (Google  2018-07-12   48) 			break;
12ad0cb2123aed Steven Rostedt (VMware  2018-10-15   49) 	} while ((end - start) < (time * 1000));
f96e8577da1026 Joel Fernandes (Google  2018-07-12   50) }
f96e8577da1026 Joel Fernandes (Google  2018-07-12   51) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   52) static __always_inline void irqoff_test(void)
f96e8577da1026 Joel Fernandes (Google  2018-07-12   53) {
f96e8577da1026 Joel Fernandes (Google  2018-07-12   54) 	unsigned long flags;
4b9091e1c1948d Song Chen               2021-01-28   55  
f96e8577da1026 Joel Fernandes (Google  2018-07-12   56) 	local_irq_save(flags);
f96e8577da1026 Joel Fernandes (Google  2018-07-12   57) 	busy_wait(delay);
f96e8577da1026 Joel Fernandes (Google  2018-07-12   58) 	local_irq_restore(flags);
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   59) }
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   60) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   61) static __always_inline void preemptoff_test(void)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   62) {
f96e8577da1026 Joel Fernandes (Google  2018-07-12   63) 	preempt_disable();
f96e8577da1026 Joel Fernandes (Google  2018-07-12   64) 	busy_wait(delay);
f96e8577da1026 Joel Fernandes (Google  2018-07-12   65) 	preempt_enable();
f96e8577da1026 Joel Fernandes (Google  2018-07-12   66) }
f96e8577da1026 Joel Fernandes (Google  2018-07-12   67) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   68) static void execute_preemptirqtest(int idx)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   69) {
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   70) 	if (!strcmp(test_mode, "irq"))
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   71) 		irqoff_test();
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   72) 	else if (!strcmp(test_mode, "preempt"))
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   73) 		preemptoff_test();
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   74) 	else if (!strcmp(test_mode, "alternate")) {
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   75) 		if (idx % 2 == 0)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   76) 			irqoff_test();
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   77) 		else
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   78) 			preemptoff_test();
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   79) 	}
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   80) }
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   81) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   82) #define DECLARE_TESTFN(POSTFIX)				\
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   83) 	static void preemptirqtest_##POSTFIX(int idx)	\
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   84) 	{						\
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   85) 		execute_preemptirqtest(idx);		\
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   86) 	}						\
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   87) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   88) /*
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   89)  * We create 10 different functions, so that we can get 10 different
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   90)  * backtraces.
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   91)  */
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   92) DECLARE_TESTFN(0)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   93) DECLARE_TESTFN(1)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   94) DECLARE_TESTFN(2)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   95) DECLARE_TESTFN(3)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   96) DECLARE_TESTFN(4)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   97) DECLARE_TESTFN(5)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   98) DECLARE_TESTFN(6)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09   99) DECLARE_TESTFN(7)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  100) DECLARE_TESTFN(8)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  101) DECLARE_TESTFN(9)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  102) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  103) static void (*testfuncs[])(int)  = {
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  104) 	preemptirqtest_0,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  105) 	preemptirqtest_1,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  106) 	preemptirqtest_2,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  107) 	preemptirqtest_3,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  108) 	preemptirqtest_4,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  109) 	preemptirqtest_5,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  110) 	preemptirqtest_6,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  111) 	preemptirqtest_7,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  112) 	preemptirqtest_8,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  113) 	preemptirqtest_9,
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  114) };
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  115) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  116) #define NR_TEST_FUNCS ARRAY_SIZE(testfuncs)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  117) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  118) static int preemptirq_delay_run(void *data)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  119) {
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  120) 	int i;
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  121) 	int s = MIN(burst_size, NR_TEST_FUNCS);
4b9091e1c1948d Song Chen               2021-01-28  122  	struct cpumask cpu_mask;
4b9091e1c1948d Song Chen               2021-01-28  123  
4b9091e1c1948d Song Chen               2021-01-28  124  	if (cpu_affinity > -1) {
4b9091e1c1948d Song Chen               2021-01-28  125  		cpumask_clear(&cpu_mask);
4b9091e1c1948d Song Chen               2021-01-28  126  		cpumask_set_cpu(cpu_affinity, &cpu_mask);
4b9091e1c1948d Song Chen               2021-01-28  127  		if (set_cpus_allowed_ptr(current, &cpu_mask))
4b9091e1c1948d Song Chen               2021-01-28  128  			pr_err("cpu_affinity:%d, failed\n", cpu_affinity);
4b9091e1c1948d Song Chen               2021-01-28  129  	}
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  130) 
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  131) 	for (i = 0; i < s; i++)
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  132) 		(testfuncs[i])(i);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  133) 
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  134) 	complete(&done);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  135) 
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  136) 	set_current_state(TASK_INTERRUPTIBLE);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  137) 	while (!kthread_should_stop()) {
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  138) 		schedule();
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  139) 		set_current_state(TASK_INTERRUPTIBLE);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  140) 	}
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  141) 
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  142) 	__set_current_state(TASK_RUNNING);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  143) 
f96e8577da1026 Joel Fernandes (Google  2018-07-12  144) 	return 0;
f96e8577da1026 Joel Fernandes (Google  2018-07-12  145) }
f96e8577da1026 Joel Fernandes (Google  2018-07-12  146) 
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  147) static int preemptirq_run_test(void)
f96e8577da1026 Joel Fernandes (Google  2018-07-12  148) {
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  149) 	struct task_struct *task;
f96e8577da1026 Joel Fernandes (Google  2018-07-12  150) 	char task_name[50];
f96e8577da1026 Joel Fernandes (Google  2018-07-12  151) 
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  152) 	init_completion(&done);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  153) 
f96e8577da1026 Joel Fernandes (Google  2018-07-12  154) 	snprintf(task_name, sizeof(task_name), "%s_test", test_mode);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06 @155) 	task =  kthread_run(preemptirq_delay_run, NULL, task_name);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  156) 	if (IS_ERR(task))
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  157) 		return PTR_ERR(task);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  158) 	if (task) {
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  159) 		wait_for_completion(&done);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  160) 		kthread_stop(task);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  161) 	}
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  162) 	return 0;
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  163) }
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  164) 

:::::: The code at line 155 was first introduced by commit
:::::: d16a8c31077e75ecb9427fbfea59b74eed00f698 tracing: Wait for preempt irq delay thread to finish

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
