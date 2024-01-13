Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599FB210E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHxRi+SZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705147963; x=1736683963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htSRrx3Z6jIH95XBN+/mlWqzWdgcadszrfUunR/bO8c=;
  b=PHxRi+SZPpIW9z3MukX3v821mUZp1B48T9aMToIEFp6mymsfScKIPryJ
   Jwq2nCchz9In0YQG0oCQkKx9vXZvBmQghY78A7NIHg27t4qQjm1I/Acq6
   +6JrFkXknUIK3iu6Ng87XqMdHfewj5dDNXrYXY1NGJ2avynCn9RwHdUE4
   FY+qW9nFohzZVyK1jsTFAWHNi1c6ntONzIfqW0JJkS6CbwZhaySiNL6Kb
   RccQ75B5QbQe7nwTbKuKabzuUQpU7tojcP4LQL8kpuqkdxyz1I9DOhIRj
   tEsh+Kt535CpRolFrwr6TU1+6r8Wk0aIJOX3DjgVhXJzHOTBdGeJQbT8G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="17977241"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="17977241"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 04:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="1030189294"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="1030189294"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2024 04:12:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOcsQ-000ASG-1L;
	Sat, 13 Jan 2024 12:12:38 +0000
Date: Sat, 13 Jan 2024 20:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17532/21544] kernel/hung_task.c:148:21:
 error: 'sysctl_hung_task_all_cpu_backtrace' undeclared; did you mean
 'sysctl_hardlockup_all_cpu_backtrace'?
Message-ID: <202401132003.DRCyIvsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 190aae97bcddbed131a203f829257b168f5058ce [17532/21544] kernel/hung_task.c: introduce sysctl to print all traces when a hung task is detected
config: x86_64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240113/202401132003.DRCyIvsT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401132003.DRCyIvsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401132003.DRCyIvsT-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/hung_task.c: In function 'check_hung_task':
>> kernel/hung_task.c:148:21: error: 'sysctl_hung_task_all_cpu_backtrace' undeclared (first use in this function); did you mean 'sysctl_hardlockup_all_cpu_backtrace'?
     148 |                 if (sysctl_hung_task_all_cpu_backtrace)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     sysctl_hardlockup_all_cpu_backtrace
   kernel/hung_task.c:148:21: note: each undeclared identifier is reported only once for each function it appears in
   kernel/hung_task.c: At top level:
   kernel/hung_task.c:235:5: warning: no previous prototype for 'proc_dohung_task_timeout_secs' [-Wmissing-prototypes]
     235 | int proc_dohung_task_timeout_secs(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +148 kernel/hung_task.c

    94	
    95	static void check_hung_task(struct task_struct *t, unsigned long timeout)
    96	{
    97		unsigned long switch_count = t->nvcsw + t->nivcsw;
    98	
    99		/*
   100		 * Ensure the task is not frozen.
   101		 * Also, skip vfork and any other user process that freezer should skip.
   102		 */
   103		if (unlikely(t->flags & (PF_FROZEN | PF_FREEZER_SKIP)))
   104		    return;
   105	
   106		/*
   107		 * When a freshly created task is scheduled once, changes its state to
   108		 * TASK_UNINTERRUPTIBLE without having ever been switched out once, it
   109		 * musn't be checked.
   110		 */
   111		if (unlikely(!switch_count))
   112			return;
   113	
   114		if (switch_count != t->last_switch_count) {
   115			t->last_switch_count = switch_count;
   116			t->last_switch_time = jiffies;
   117			return;
   118		}
   119		if (time_is_after_jiffies(t->last_switch_time + timeout * HZ))
   120			return;
   121	
   122		trace_sched_process_hang(t);
   123	
   124		if (sysctl_hung_task_panic) {
   125			console_verbose();
   126			hung_task_show_lock = true;
   127			hung_task_call_panic = true;
   128		}
   129	
   130		/*
   131		 * Ok, the task did not get scheduled for more than 2 minutes,
   132		 * complain:
   133		 */
   134		if (sysctl_hung_task_warnings) {
   135			if (sysctl_hung_task_warnings > 0)
   136				sysctl_hung_task_warnings--;
   137			pr_err("INFO: task %s:%d blocked for more than %ld seconds.\n",
   138				t->comm, t->pid, timeout);
   139			pr_err("      %s %s %.*s\n",
   140				print_tainted(), init_utsname()->release,
   141				(int)strcspn(init_utsname()->version, " "),
   142				init_utsname()->version);
   143			pr_err("\"echo 0 > /proc/sys/kernel/hung_task_timeout_secs\""
   144				" disables this message.\n");
   145			sched_show_task(t);
   146			hung_task_show_lock = true;
   147	
 > 148			if (sysctl_hung_task_all_cpu_backtrace)
   149				hung_task_show_all_bt = true;
   150		}
   151	
   152		touch_nmi_watchdog();
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
