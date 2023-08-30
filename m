Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE279F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 21:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693431261; x=1724967261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQ8BQCVGZNM3RvKkidTEC9yXZ3NnI6IEUdXHlrA7tdk=;
  b=H6mopT1NM8Y/pFppYTerWUIbwhYiAmY6GJLf6vx/an5U6Z9DSSI/r2IN
   XtAkorbiDc+yXehaP5d1xtknUjKIKLOCt6fnFoedR4JUYzvT3FJW6lXxr
   ePsGtrJBP+ilwLmb0blA8Xfbv8gaNTEr1FO8TNdzJTq9lDmH7jEbs6+8l
   wCiMhPtd2r9l/QWtScOj8d8PAcoPFNad2pOKVC46oa/KFibytz9lBBzQ2
   IhUMHD8wrhrJhYFXsFEpSiUtGfp17rlt6nfBULwXX2h+f8NC2VTlmT00O
   6kOTDLI5xtY6wLHlBJGKjYTNPSWOpBRkbg1BoGC63guVErmTZits79t4v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379505624"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="379505624"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 14:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="829373452"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="829373452"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Aug 2023 14:34:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbSpO-000AFJ-0a;
	Wed, 30 Aug 2023 21:34:18 +0000
Date: Thu, 31 Aug 2023 05:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 11/12] kernel/kthread.c:1540:5:
 error: conflicting types for 'param_set_sched_policy'; have 'int(const char
 *, const struct kernel_param *)'
Message-ID: <202308310531.ThpJnS7l-lkp@intel.com>
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
config: parisc64-allnoconfig (https://download.01.org/0day-ci/archive/20230831/202308310531.ThpJnS7l-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310531.ThpJnS7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310531.ThpJnS7l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kthread.c:16:
   include/linux/kthread.h:28:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      28 | extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:29:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      29 | extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:32:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      32 | extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:33:60: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      33 | extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
         |                                                            ^~~~~~~~~~~~
   include/linux/kthread.h:36:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      36 | extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:37:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      37 | extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:40:66: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      40 | extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
         |                                                                  ^~~~~~~~~~~~
   include/linux/kthread.h:41:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      41 | extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:44:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      44 | extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:45:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:48:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      48 | extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:49:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      49 | extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:52:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      52 | extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:53:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      53 | extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:56:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      56 | extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:57:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      57 | extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
>> kernel/kthread.c:1540:5: error: conflicting types for 'param_set_sched_policy'; have 'int(const char *, const struct kernel_param *)'
    1540 | int param_set_sched_policy(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:28:12: note: previous declaration of 'param_set_sched_policy' with type 'int(const char *, const struct kernel_param *)'
      28 | extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1544:5: error: conflicting types for 'param_get_sched_policy'; have 'int(char *, const struct kernel_param *)'
    1544 | int param_get_sched_policy(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:29:12: note: previous declaration of 'param_get_sched_policy' with type 'int(char *, const struct kernel_param *)'
      29 | extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1554:5: error: conflicting types for 'param_set_sched_nice'; have 'int(const char *, const struct kernel_param *)'
    1554 | int param_set_sched_nice(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:32:12: note: previous declaration of 'param_set_sched_nice' with type 'int(const char *, const struct kernel_param *)'
      32 | extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1558:5: error: conflicting types for 'param_get_sched_nice'; have 'int(char *, const struct kernel_param *)'
    1558 | int param_get_sched_nice(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:33:12: note: previous declaration of 'param_get_sched_nice' with type 'int(char *, const struct kernel_param *)'
      33 | extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1568:5: error: conflicting types for 'param_set_sched_priority'; have 'int(const char *, const struct kernel_param *)'
    1568 | int param_set_sched_priority(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:36:12: note: previous declaration of 'param_set_sched_priority' with type 'int(const char *, const struct kernel_param *)'
      36 | extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1572:5: error: conflicting types for 'param_get_sched_priority'; have 'int(char *, const struct kernel_param *)'
    1572 | int param_get_sched_priority(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:37:12: note: previous declaration of 'param_get_sched_priority' with type 'int(char *, const struct kernel_param *)'
      37 | extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1582:5: error: conflicting types for 'param_set_sched_runtime'; have 'int(const char *, const struct kernel_param *)'
    1582 | int param_set_sched_runtime(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:40:12: note: previous declaration of 'param_set_sched_runtime' with type 'int(const char *, const struct kernel_param *)'
      40 | extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1586:5: error: conflicting types for 'param_get_sched_runtime'; have 'int(char *, const struct kernel_param *)'
    1586 | int param_get_sched_runtime(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:41:12: note: previous declaration of 'param_get_sched_runtime' with type 'int(char *, const struct kernel_param *)'
      41 | extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1596:5: error: conflicting types for 'param_set_sched_deadline'; have 'int(const char *, const struct kernel_param *)'
    1596 | int param_set_sched_deadline(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:44:12: note: previous declaration of 'param_set_sched_deadline' with type 'int(const char *, const struct kernel_param *)'
      44 | extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1600:5: error: conflicting types for 'param_get_sched_deadline'; have 'int(char *, const struct kernel_param *)'
    1600 | int param_get_sched_deadline(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:45:12: note: previous declaration of 'param_get_sched_deadline' with type 'int(char *, const struct kernel_param *)'
      45 | extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1610:5: error: conflicting types for 'param_set_sched_period'; have 'int(const char *, const struct kernel_param *)'
    1610 | int param_set_sched_period(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:48:12: note: previous declaration of 'param_set_sched_period' with type 'int(const char *, const struct kernel_param *)'
      48 | extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1614:5: error: conflicting types for 'param_get_sched_period'; have 'int(char *, const struct kernel_param *)'
    1614 | int param_get_sched_period(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:49:12: note: previous declaration of 'param_get_sched_period' with type 'int(char *, const struct kernel_param *)'
      49 | extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1624:5: error: conflicting types for 'param_set_sched_util_min'; have 'int(const char *, const struct kernel_param *)'
    1624 | int param_set_sched_util_min(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:52:12: note: previous declaration of 'param_set_sched_util_min' with type 'int(const char *, const struct kernel_param *)'
      52 | extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1628:5: error: conflicting types for 'param_get_sched_util_min'; have 'int(char *, const struct kernel_param *)'
    1628 | int param_get_sched_util_min(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:53:12: note: previous declaration of 'param_get_sched_util_min' with type 'int(char *, const struct kernel_param *)'
      53 | extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1638:5: error: conflicting types for 'param_set_sched_util_max'; have 'int(const char *, const struct kernel_param *)'
    1638 | int param_set_sched_util_max(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:56:12: note: previous declaration of 'param_set_sched_util_max' with type 'int(const char *, const struct kernel_param *)'
      56 | extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1642:5: error: conflicting types for 'param_get_sched_util_max'; have 'int(char *, const struct kernel_param *)'
    1642 | int param_get_sched_util_max(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:57:12: note: previous declaration of 'param_get_sched_util_max' with type 'int(char *, const struct kernel_param *)'
      57 | extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/parisc/kernel/pdt.c:18:
   include/linux/kthread.h:28:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      28 | extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:29:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      29 | extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:32:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      32 | extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:33:60: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      33 | extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
         |                                                            ^~~~~~~~~~~~
   include/linux/kthread.h:36:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      36 | extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:37:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      37 | extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:40:66: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      40 | extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
         |                                                                  ^~~~~~~~~~~~
   include/linux/kthread.h:41:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      41 | extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:44:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      44 | extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:45:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:48:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      48 | extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:49:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      49 | extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:52:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      52 | extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:53:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      53 | extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:56:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      56 | extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:57:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      57 | extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   arch/parisc/kernel/pdt.c: In function 'pdt_initcall':
>> include/linux/kthread.h:10:9: error: implicit declaration of function '__module_param_call' [-Werror=implicit-function-declaration]
      10 |         __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
         |         ^~~~~~~~~~~~~~~~~~~
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
   arch/parisc/kernel/pdt.c:356:22: note: in expansion of macro 'kthread_run'
     356 |         kpdtd_task = kthread_run(pdt_mainloop, NULL, "kpdtd");
         |                      ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1540 kernel/kthread.c

  1536	
  1537	/*
  1538	 * Kthread sysfs params handling
  1539	 */
> 1540	int param_set_sched_policy(const char *val, const struct kernel_param *kp)
  1541	{
  1542		return param_set_ulong(val, kp);
  1543	}
> 1544	int param_get_sched_policy(char *buffer, const struct kernel_param *kp)
  1545	{
  1546		return param_get_ulong(buffer, kp);
  1547	}
  1548	const struct kernel_param_ops param_ops_sched_policy = {
  1549		.set = param_set_sched_policy,
  1550		.get = param_get_sched_policy
  1551	};
  1552	EXPORT_SYMBOL_GPL(param_ops_sched_policy);
  1553	
> 1554	int param_set_sched_nice(const char *val, const struct kernel_param *kp)
  1555	{
  1556		return param_set_long(val, kp);
  1557	}
> 1558	int param_get_sched_nice(char *buffer, const struct kernel_param *kp)
  1559	{
  1560		return param_get_long(buffer, kp);
  1561	}
  1562	const struct kernel_param_ops param_ops_sched_nice = {
  1563		.set = param_set_sched_nice,
  1564		.get = param_get_sched_nice
  1565	};
  1566	EXPORT_SYMBOL_GPL(param_ops_sched_nice);
  1567	
> 1568	int param_set_sched_priority(const char *val, const struct kernel_param *kp)
  1569	{
  1570		return param_set_ulong(val, kp);
  1571	}
> 1572	int param_get_sched_priority(char *buffer, const struct kernel_param *kp)
  1573	{
  1574		return param_get_ulong(buffer, kp);
  1575	}
  1576	const struct kernel_param_ops param_ops_sched_priority = {
  1577		.set = param_set_sched_priority,
  1578		.get = param_get_sched_priority
  1579	};
  1580	EXPORT_SYMBOL_GPL(param_ops_sched_priority);
  1581	
> 1582	int param_set_sched_runtime(const char *val, const struct kernel_param *kp)
  1583	{
  1584		return param_set_ullong(val, kp);
  1585	}
> 1586	int param_get_sched_runtime(char *buffer, const struct kernel_param *kp)
  1587	{
  1588		return param_get_ullong(buffer, kp);
  1589	}
  1590	const struct kernel_param_ops param_ops_sched_runtime = {
  1591		.set = param_set_sched_runtime,
  1592		.get = param_get_sched_runtime
  1593	};
  1594	EXPORT_SYMBOL_GPL(param_ops_sched_runtime);
  1595	
> 1596	int param_set_sched_deadline(const char *val, const struct kernel_param *kp)
  1597	{
  1598		return param_set_ullong(val, kp);
  1599	}
> 1600	int param_get_sched_deadline(char *buffer, const struct kernel_param *kp)
  1601	{
  1602		return param_get_ullong(buffer, kp);
  1603	}
  1604	const struct kernel_param_ops param_ops_sched_deadline = {
  1605		.set = param_set_sched_deadline,
  1606		.get = param_get_sched_deadline
  1607	};
  1608	EXPORT_SYMBOL_GPL(param_ops_sched_deadline);
  1609	
> 1610	int param_set_sched_period(const char *val, const struct kernel_param *kp)
  1611	{
  1612		return param_set_ullong(val, kp);
  1613	}
> 1614	int param_get_sched_period(char *buffer, const struct kernel_param *kp)
  1615	{
  1616		return param_get_ullong(buffer, kp);
  1617	}
  1618	const struct kernel_param_ops param_ops_sched_period = {
  1619		.set = param_set_sched_period,
  1620		.get = param_get_sched_period
  1621	};
  1622	EXPORT_SYMBOL_GPL(param_ops_sched_period);
  1623	
> 1624	int param_set_sched_util_min(const char *val, const struct kernel_param *kp)
  1625	{
  1626		return param_set_ulong(val, kp);
  1627	}
> 1628	int param_get_sched_util_min(char *buffer, const struct kernel_param *kp)
  1629	{
  1630		return param_get_ulong(buffer, kp);
  1631	}
  1632	const struct kernel_param_ops param_ops_sched_util_min = {
  1633		.set = param_set_sched_util_min,
  1634		.get = param_get_sched_util_min
  1635	};
  1636	EXPORT_SYMBOL_GPL(param_ops_sched_util_min);
  1637	
> 1638	int param_set_sched_util_max(const char *val, const struct kernel_param *kp)
  1639	{
  1640		return param_set_ulong(val, kp);
  1641	}
> 1642	int param_get_sched_util_max(char *buffer, const struct kernel_param *kp)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
