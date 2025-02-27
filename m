Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C436225797
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740644799; cv=none; b=pMCB9+PfIyGMzTwWTOhzyMjv97uPx/z4N0a5Xe8kc34kypqUzqorXnar/CL0vsvf1TyYYP+Z0hSfk1L5/s6FqTTmH97iNJ5s5LUKcudbqUnXOTCCh/HqR66sOhJP2bLnrAmFU5aiifdQxNOlR7f4PIJdwHAz4R7RU6scV4ycjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740644799; c=relaxed/simple;
	bh=Bfsotl/g+K1sagBba/gfPIWuqgEuo6lc2qA2Yi1caEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RSElvwn7YzrwfTRN5Z4SGbjxyOWgg0Dk2bQ92gtwcNN4XnF8bP1aanurzUa8htqirO/LDTXIhCG+PoqefYN/q1gzzwm9Kld2DS3ic7IzWqFw+Iq+h+6FGIuHdnJahgJYV1Yy1m6UVTyLxcej7LATcjdJ2jkC1yZRrmtCCzLmtVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9S3H1L7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9S3H1L7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740644796; x=1772180796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bfsotl/g+K1sagBba/gfPIWuqgEuo6lc2qA2Yi1caEo=;
  b=d9S3H1L7pYGf3F4ql8HhkT0C+ks6ZvHLcGtNivjsJUqAJiI6HUx6Kyzp
   D4ga7PMiIbwu/+CUyqD2PLYhoG0D2wuy3Pud6q6PyJRV3V503HWHc3F6d
   LPNdIsgV5MnTwYJDeSSBjEGRe16SsIpu/yBvpjBAaMBSgXYmbwAlNdrj6
   T8BMCi/7OdRFGQSO0/q3gZZnp7U4eEFpdCnemGSLtVurKGGtz7d5YUqQd
   N4eegsceV8sgC2oLr5/dL/AWjCjj79qKrqCmkSFmiKcyA18QCj2t9sO5n
   3UX2S1PnwROg2jJdFvgxFcTiUNi14sCz6JDtEIZKbtjv/Dsf5f9VtEcpu
   w==;
X-CSE-ConnectionGUID: K1Q3mcgCRXm+UDNgwG6zOA==
X-CSE-MsgGUID: NHJB7IB8ThGqXwcR4Q4TqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41225080"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41225080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 00:26:36 -0800
X-CSE-ConnectionGUID: pr1VZOybSlKRo7Gtg48mIg==
X-CSE-MsgGUID: qmL+961KSG+OBUdpNCmbGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122203566"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Feb 2025 00:26:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnZDx-000D5m-2C;
	Thu, 27 Feb 2025 08:26:30 +0000
Date: Thu, 27 Feb 2025 16:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1334/1334] kernel/hung_task.c:148:7:
 error: use of undeclared identifier 'sysctl_hung_task_all_cpu_backtrace'
Message-ID: <202502271605.5iiFNfaf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guilherme,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   33c097cb0d6c8c1dcf8cde0f66b1c6c907ee2740
commit: 190aae97bcddbed131a203f829257b168f5058ce [1334/1334] kernel/hung_task.c: introduce sysctl to print all traces when a hung task is detected
config: x86_64-randconfig-103-20241218 (https://download.01.org/0day-ci/archive/20250227/202502271605.5iiFNfaf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271605.5iiFNfaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271605.5iiFNfaf-lkp@intel.com/

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
