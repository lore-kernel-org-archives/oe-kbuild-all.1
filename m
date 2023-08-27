Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D31E33FB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 22:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693176725; x=1724712725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g6xabhTeOeL4F/+mnxS1MfLL74lCoSI+++0mW2yOu/U=;
  b=V5KHTTZxGWpJRseb9oJX2kB8/KgrCh2yj5r9LWzAngPVOzMG2E1AKL9v
   MbpW7S6Xbn3M0Vax+zq1/VSqBUHIiWaYSp7G/CH3epHO4WixE2yvsZGlu
   Y8+mn45gW1CW0PDvl2Ky0oG2P0UBdI5kzk3XUBSuM3d2XORKHZ/3Dl6Q3
   JbBm1tSiF261CS4TdyAcP39h7PJjfakpS+eMqAwd/T6eQJRYZ5FdJz/2e
   cK982oTdFGA7+qDAYkfC7UTvLHzpmDzEaBjzg3plIyfz+iN7m/F4mYLgL
   NalEk5EdlJ0Jm3QWDxs7amEiXsfdR5gFTx1MgStLhHcgRJWdFptGzfJ7v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372377907"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="372377907"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 15:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="852610142"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="852610142"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2023 15:52:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaObx-0006H9-05;
	Sun, 27 Aug 2023 22:52:01 +0000
Date: Mon, 28 Aug 2023 06:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 11/12]
 kernel/trace/preemptirq_delay_test.c:155:57: error: expected ',' or ';'
 before 'task_name'
Message-ID: <202308280627.EiDh9J9Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   2fb1bbc283d33b7edd57b0279c54d0250d91e9f3
commit: 51d86e5ab04ef58e95586730ea4dfa1c7aedb354 [11/12] kthread: Provide a mechanism to control kthread sched_attr
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230828/202308280627.EiDh9J9Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280627.EiDh9J9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280627.EiDh9J9Q-lkp@intel.com/

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
