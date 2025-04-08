Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E844199237
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 02:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744079772; cv=none; b=J9DSBn42s9KPT+7F9Fy69O9QLbasN8dFn2jkwKSU89q3/tbIx8diPDQr754Wwp5FaYltWl1FpYU6+mbu99ti7rpFx2vTh3nKG65kbNArSTTWr0W0FtMDBO/cIrcHybzee4+XIzQKhcEQy612o25JafVLvZBpij0P+k2d79GwzAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744079772; c=relaxed/simple;
	bh=bYGEueQYT5xih9HxXx4qIjH7YK+u9DYDBj59GWWzXYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCMn305MxGAlhbf0d6j+3HHCxjpZXgtkny7Th4o1BOHrL6//cMzFk//iAVB2v2/EOpVgQuKcbniL2jXmEd5yus8N8tBrVNB9wSVE2HsAV2Sv56fAdtWhqauYfBCulCCbhwduoif9VC5crc2gSWGQ9zd4nNu2wY19UFZWC66ul9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ejr9TdS/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ejr9TdS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744079771; x=1775615771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYGEueQYT5xih9HxXx4qIjH7YK+u9DYDBj59GWWzXYU=;
  b=Ejr9TdS/P2SQFkxOuv9q9yDeskedDXXcb/HNz99FM/pSYDvfVAWF/Bt6
   Vs+Bs5Dcdlj/MjzEwKGdTiquGIk+i2qNF1aImSxBjhk34beAWaNfdJ3J6
   oaw8yJMulVbJrh69TyUl85zvb0RzMwmEVvTZnI3B/cxdS+lXfjnyuuoG/
   +KJOoCtM/s5kWBGNgJNbuo5hdOOt04vQ+mWyS74UmEqxdlijQQKHX4EPI
   1drCPSobINLxTgJdMiUSFNfkj0oIo0hP8kC688UbNCziC4G4pCq813X0f
   kD4aEKOSF1K4HIdIOK50NJGlHBrKVIIsV+xOkqFc/lPOlTrin4nDgtmh5
   g==;
X-CSE-ConnectionGUID: n7mqIxlmToOL2EJQg23ApA==
X-CSE-MsgGUID: EHz2+ATGT+6C5SxuscOQqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70869196"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="70869196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:36:10 -0700
X-CSE-ConnectionGUID: jj/6RRQDTLGSg/xTH8riig==
X-CSE-MsgGUID: ZeL+ib/jS36miQex5qGh/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="127885145"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Apr 2025 19:36:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1yoo-00041v-1b;
	Tue, 08 Apr 2025 02:36:06 +0000
Date: Tue, 8 Apr 2025 10:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1334/1334] kernel/hung_task.c:148:7:
 error: use of undeclared identifier 'sysctl_hung_task_all_cpu_backtrace'
Message-ID: <202504081025.oeT4D3sO-lkp@intel.com>
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
head:   3191c9e4e7c581bfe0a40ee198ffcbd5c3dea53e
commit: 190aae97bcddbed131a203f829257b168f5058ce [1334/1334] kernel/hung_task.c: introduce sysctl to print all traces when a hung task is detected
config: x86_64-randconfig-103-20241218 (https://download.01.org/0day-ci/archive/20250408/202504081025.oeT4D3sO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081025.oeT4D3sO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081025.oeT4D3sO-lkp@intel.com/

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
