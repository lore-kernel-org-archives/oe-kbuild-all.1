Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D5136D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 00:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693959858; x=1725495858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OhOtqiZbROeUTdk6jitqOfRkFyjZa36NDao/BhUl400=;
  b=dfA3JZx/YONJDyDkLqoiPXttqSdh2UDIBhJ5Qr2Zf/17brLyl6nJHFD4
   MRcbXruxuKUiOfMMjZyKqzOUxajGdzTDtzz68lHSQdMFeqkbguS7qbHR8
   mDsof8kHuCBCaM/M+kwdT0sZFA4QiCeIRHjA4ylFhwmhD55gJUUYXPY86
   0JIZZqH1JYO44skcaEHcq/fv5UHJ7XQ2V9PNFk3MFr6JhDbJU9zzcNv/7
   w4Az339NfhmW2TdrESBHgfRdLOOCzO+JQt84/kUwswKX7436/UdXiQn49
   b9maXSEUeQh2HjfGd6FAF9PZ0jcOAbW4UTV3ALK1sIzmuOI3eAfilShP5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="443323881"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="443323881"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 17:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811445924"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="811445924"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Sep 2023 17:24:15 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdgL7-0002Fz-2x;
	Wed, 06 Sep 2023 00:24:13 +0000
Date: Wed, 6 Sep 2023 08:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 11/12]
 kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';'
 before 'test_mode'
Message-ID: <202309060808.Rq0OEGna-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   62ff4173c524ef9189ddfbaa83996df524ef1305
commit: 4328f6314232c50e76707948f84cef1005cca47f [11/12] kthread: Provide a mechanism to control kthread sched_attr
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230906/202309060808.Rq0OEGna-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060808.Rq0OEGna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060808.Rq0OEGna-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kthread.h:6,
                    from kernel/trace/preemptirq_delay_test.c:14:
   kernel/trace/preemptirq_delay_test.c: In function 'preemptirq_run_test':
>> kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';' before 'test_mode'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                                                              ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:18:9: note: in expansion of macro '__kthread_param'
      18 |         __kthread_param(name, unsigned long, sched_policy);             \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:153:17: note: in expansion of macro 'kthread_run'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';' before 'test_mode'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                                                              ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:19:9: note: in expansion of macro '__kthread_param'
      19 |         __kthread_param(name, long, sched_nice);                        \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:153:17: note: in expansion of macro 'kthread_run'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';' before 'test_mode'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                                                              ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:20:9: note: in expansion of macro '__kthread_param'
      20 |         __kthread_param(name, unsigned long, sched_priority);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:153:17: note: in expansion of macro 'kthread_run'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';' before 'test_mode'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                                                              ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:21:9: note: in expansion of macro '__kthread_param'
      21 |         __kthread_param(name, unsigned long long, sched_runtime);       \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:153:17: note: in expansion of macro 'kthread_run'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';' before 'test_mode'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                                                              ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:22:9: note: in expansion of macro '__kthread_param'
      22 |         __kthread_param(name, unsigned long long, sched_deadline);      \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:153:17: note: in expansion of macro 'kthread_run'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';' before 'test_mode'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                                                              ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:23:9: note: in expansion of macro '__kthread_param'
      23 |         __kthread_param(name, unsigned long long, sched_period);        \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:153:17: note: in expansion of macro 'kthread_run'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';' before 'test_mode'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                                                              ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:24:9: note: in expansion of macro '__kthread_param'
      24 |         __kthread_param(name, unsigned long, sched_util_min);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:153:17: note: in expansion of macro 'kthread_run'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                 ^~~~~~~~~~~
>> kernel/trace/preemptirq_delay_test.c:153:62: error: expected ',' or ';' before 'test_mode'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                                                              ^~~~~~~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:15:9: note: in expansion of macro '___kthread_param'
      15 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:25:9: note: in expansion of macro '__kthread_param'
      25 |         __kthread_param(name, unsigned long, sched_util_max);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:81:9: note: in expansion of macro 'kthread_param'
      81 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:110:19: note: in expansion of macro 'kthread_create'
     110 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   kernel/trace/preemptirq_delay_test.c:153:17: note: in expansion of macro 'kthread_run'
     153 |         task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
         |                 ^~~~~~~~~~~


vim +153 kernel/trace/preemptirq_delay_test.c

f96e8577da1026 Joel Fernandes (Google  2018-07-12  146) 
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  147) static int preemptirq_run_test(void)
f96e8577da1026 Joel Fernandes (Google  2018-07-12  148) {
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  149) 	struct task_struct *task;
f96e8577da1026 Joel Fernandes (Google  2018-07-12  150) 
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  151) 	init_completion(&done);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  152) 
8b4adacad5d3ec Qais Yousef             2023-08-26 @153  	task =  kthread_run(preemptirq_delay_run, "%s_test", test_mode);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  154) 	if (IS_ERR(task))
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  155) 		return PTR_ERR(task);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  156) 	if (task) {
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  157) 		wait_for_completion(&done);
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  158) 		kthread_stop(task);
8b1fac2e73e84e Steven Rostedt (VMware  2020-05-10  159) 	}
d16a8c31077e75 Steven Rostedt (VMware  2020-05-06  160) 	return 0;
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  161) }
793937236d1ee0 Viktor Rosendahl (BMW   2019-10-09  162) 

:::::: The code at line 153 was first introduced by commit
:::::: 8b4adacad5d3ec5ee686b0abfd39c0a56e3bec5d treewide: Give kthraeds unique names

:::::: TO: Qais Yousef <qyousef@layalina.io>
:::::: CC: Qais Yousef <qyousef@layalina.io>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
