Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21336ECE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705628687; cv=none; b=GxLoEpaRAjpLz3uQNLrPI20Qi4boyX+ryED23oemd2mv6JscsToxsdeVjk3pO0wOpmXyncdaT20IMZHLR3+SZwsCuiVHIwsOCqAL4dmfhKIZ+9ZsWQRz6FWaDordHYVQ/TsOvFKoh+RGueIRZpAZesnPyQg0Y2hRBadxDN48m1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705628687; c=relaxed/simple;
	bh=K5Uxt9mMy9PpfjffJrIFnvVsZy0rrA1cQHfo+rgVQgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Br+sZxx+rzxwG3a+PouPaZtZA7JkcIMF3nmErnidGUORwhOh4YttX5FN5i2q96vsdpLHVfcPwdUzYWAnS1fFyaLB1wKRYbEEtQoYwUkSIe9AXy4iUeKjn+lMZ9IbYVUaP1GaQ+961VLBX/DghdYk3e5p7iypIE8sdIuTntrsht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwdFsZvt; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwdFsZvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705628685; x=1737164685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5Uxt9mMy9PpfjffJrIFnvVsZy0rrA1cQHfo+rgVQgE=;
  b=WwdFsZvtdcXozZBvFe9TPw7NUS1RmnqqhXeoY215UzPO6AWUChL2yKfD
   W9bxv7Zh9r3L/0GR72YpanFKrHX6m+XTdaQi9D9OMwYPDL91jDy7NF9eB
   poh7l3VUgQejMoCDg/+a3RlYpfFeqFjr2V4/n7GNkz0ll4C3RzyKLb/aF
   2eZnav76O4nLg+Jqwad5kw7tHXMBRoF+ufNLvnzTiTZ3k6nornXQYXQit
   g8crSeOmDocv1oE/9Sw/YbCCSLb/9+MzWN39aZ55UgmOBqQauTnkF0Sa7
   nev4vl88EJ79+a8lvTs7emFFw9UEnhjoYgNn/mUS3MgG3iswl31au6WfT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="399504423"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="399504423"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 17:44:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="19268129"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jan 2024 17:44:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQdvx-0003Vc-1s;
	Fri, 19 Jan 2024 01:44:37 +0000
Date: Fri, 19 Jan 2024 09:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17532/21559] kernel/hung_task.c:148:7:
 error: use of undeclared identifier 'sysctl_hung_task_all_cpu_backtrace'
Message-ID: <202401190948.KPPQJXEa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8135318753544d6f8afa1f01a47c81fbccb59e39
commit: 190aae97bcddbed131a203f829257b168f5058ce [17532/21559] kernel/hung_task.c: introduce sysctl to print all traces when a hung task is detected
config: x86_64-buildonly-randconfig-003-20240112 (https://download.01.org/0day-ci/archive/20240119/202401190948.KPPQJXEa-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190948.KPPQJXEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190948.KPPQJXEa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/hung_task.c:148:7: error: use of undeclared identifier 'sysctl_hung_task_all_cpu_backtrace'
     148 |                 if (sysctl_hung_task_all_cpu_backtrace)
         |                     ^
   kernel/hung_task.c:235:5: warning: no previous prototype for function 'proc_dohung_task_timeout_secs' [-Wmissing-prototypes]
     235 | int proc_dohung_task_timeout_secs(struct ctl_table *table, int write,
         |     ^
   kernel/hung_task.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | int proc_dohung_task_timeout_secs(struct ctl_table *table, int write,
         | ^
         | static 
   1 warning and 1 error generated.


vim +/sysctl_hung_task_all_cpu_backtrace +148 kernel/hung_task.c

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
