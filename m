Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C1E2F2F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737286957; cv=none; b=H0VuDXFXMreUqIqYft5dfhAt5XHB3+9MO14PFxp22ayiZdRch6rZkanY9d5HpkuS8Pd8R5aq+WkciSZ0uRcFTSXKDxtdjTpYHcIViB1qp74K7gE0RbvlnD6JgsB3ANX9O2Z/YO6LpsT75MZkQcf17K24ubNpAn9KMPvhrvRJNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737286957; c=relaxed/simple;
	bh=uCZFDi6YYORCizSKNeUPFtU78jwn4DdcG1C5E4FZ9pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HKHHK/WqIxObAfJ6j1+zW9FPGCvFM3e/fWH2jT0x679I/ePHNgxFubUA81iQk/YxHf7xiYRSXjcLL/MgEE56sy4MRdf4Zqh30AgClD3vKxiCVivCsIOTE5Uw/o/W0bHTD/L8gjx2L6lXGB5BfW4X6lwvWIq4ZjBP4gCaVgWWn+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/5fjVN6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/5fjVN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737286956; x=1768822956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCZFDi6YYORCizSKNeUPFtU78jwn4DdcG1C5E4FZ9pU=;
  b=Y/5fjVN6wh+pY0+S2F+xlYFFKRMVVlMNHGmAjFhMtiwDwiVp3ehZygkD
   KjpmDuq50Qx9/IG6ov2OCm9Wcr9jCAd77XiWkHIZVKT8xw+RG76Tc3/kh
   i/H0t2qEYYPOnXPl/kZ6hdnjT/SHBN4KcgVtIIpjl56uDX7o2U8k599a6
   YHbyam1NZiwS9cSl5LQMdgC8itX4xkr3acFa2tbVdNEle7AMhqtAyFJOZ
   AhKE4lqoK5sdy+9d0oUeZQm7XCp1Wlp4pwEhmKR0DJNFldRgTBEpz/Brn
   vXUgxTnwNv0S55fqecRYYurnGoAKKVSYYX9NDqys4rmtLZ2of1z7sVC0W
   Q==;
X-CSE-ConnectionGUID: 8HEZII7tTJeDn0HHwgayIQ==
X-CSE-MsgGUID: D+/vSoWiRWGuruRhkfcnqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="49058995"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="49058995"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 03:42:35 -0800
X-CSE-ConnectionGUID: kLtgnOPFQ4mCAm5ZWIiLbA==
X-CSE-MsgGUID: iuHWq+06ToaWnrxhoCJVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="106070626"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jan 2025 03:42:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZThH-000VPH-0b;
	Sun, 19 Jan 2025 11:42:31 +0000
Date: Sun, 19 Jan 2025 19:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1334/1334] kernel/hung_task.c:148:7:
 error: use of undeclared identifier 'sysctl_hung_task_all_cpu_backtrace'
Message-ID: <202501191953.ABToUtr4-lkp@intel.com>
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
head:   52349611d09c6a9a2b558b3ce1cb1dca0d47dbe8
commit: 190aae97bcddbed131a203f829257b168f5058ce [1334/1334] kernel/hung_task.c: introduce sysctl to print all traces when a hung task is detected
config: x86_64-randconfig-103-20241218 (https://download.01.org/0day-ci/archive/20250119/202501191953.ABToUtr4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191953.ABToUtr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191953.ABToUtr4-lkp@intel.com/

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
