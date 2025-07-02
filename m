Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7E2777F9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466251; cv=none; b=CiPjxYAdPFw5k/rwlKk+PkjjITUkQ6DbW3NhCL7eDLy0kqIeoJRhrnbf5prJHW+kcazN8wcR6fgknsfmE2kSa+5ERzTwJcYZZjYZXpShnz0Noom54AdV5cGZRrhrKde6d4W3rkrINXjsUSR/M00zaiuOnh/l9FoLRWKWPNZ0uP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466251; c=relaxed/simple;
	bh=nfcVMJazC+RNwARClxxS5YRxwkZw3+W8YYuTi+/LKXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PbiNL7c36EAZVuEWfN7rSLUXv0NP7jiN32tKBwqoxubCMS182JJeTeVqQ2SzA9KmsxhTyvqZBil1q75sdVYf2+cU+AUPPs8KRvy3mtm0LoLovI1w7Vv+uIhSaPSjju9jKNPnrJUITApFy1vac9fDQEDpObSuXjPSA7OPQmupaOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGTGiFnp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGTGiFnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751466250; x=1783002250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfcVMJazC+RNwARClxxS5YRxwkZw3+W8YYuTi+/LKXQ=;
  b=OGTGiFnpnHwd4dPYeD78YFUi/e+pXLiC+nQgzjTrYiD8IIe2HSHuciTd
   rQ+LIojx/DiMPc/uwOWtVRp8kmWtGRPWoZn6EJHd5tPNdRKsZ+os4jhoC
   10rliJ2M05o5y7zoS1Rddfe4VcbPk/y5TGRjCIeljfMJoU1JXPq27P66R
   YA9MpUBlSI406DLB9pnHWlQlHixNJZZWXO6lHwuTbRYBFXLCVx+6g2zA0
   wH0AKnXVpyXCNJPm9vjrjts4b4wYIUQB53mB2sqOJIs9zl+qsVWGs5uCc
   YiEtOoFSOSwD4hKBOZhj4nKBcSOqhEdDQ+EfM8hDWS0+1fOBoexPj3aN3
   w==;
X-CSE-ConnectionGUID: UDbFOFcmQHOKJgVPEpBwzA==
X-CSE-MsgGUID: 5LLAxwjDTBqhLNjy+sKrKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57545082"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57545082"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 07:24:10 -0700
X-CSE-ConnectionGUID: qBMIVQFfS6iDrlB8zD/8fQ==
X-CSE-MsgGUID: iM2Zs6cNQNO8/obH8EmsEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154648170"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2025 07:24:08 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWyNZ-0000IL-31;
	Wed, 02 Jul 2025 14:24:05 +0000
Date: Wed, 2 Jul 2025 16:23:46 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] kernel/hung_task.c:148:7:
 error: use of undeclared identifier 'sysctl_hung_task_all_cpu_backtrace'
Message-ID: <202507021631.OYJPyxwP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 190aae97bcddbed131a203f829257b168f5058ce [1605/1605] kernel/hung_task.c: introduce sysctl to print all traces when a hung task is detected
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507021631.OYJPyxwP-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021631.OYJPyxwP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021631.OYJPyxwP-lkp@intel.com/

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
