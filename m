Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9714D1A2872
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 21:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954175; cv=none; b=LuzCj/sB8mrYxkkPeQwAoSalAO3v3WYm2xToIpUPXHbdCfFVM8Ttd3TLqU7C8OO2sc/Zqv8KeJbBemn8cETcyeLg1tuFDX6jXifE9gHQl3CCHwHTjAgaKv2744cE2CnfoGxz5X+M8pb7gp+Rr4OcLOcWlhnpdTQlyL3mdQGo/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954175; c=relaxed/simple;
	bh=Zc/bWJCPZ+Br76mIhqKb/NSsjK7whpAzJAsp1043lCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUk8pZXaru555QVPkZIQoSvr+gx5Mn4mVeo/tRrKuj2s4d6iYIpRcNArHjq6sTQmmlWJ5RfnvlLFegLwzWuhIgslLKMFwQ/ZHfQ510xP6HedxCgPScUOjcEnUHSMWyntrIjGAE9vEfOdtaMWEbEUrRLU0WJLKSI8EeG5YBTRR9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDpqPtRo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDpqPtRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733954174; x=1765490174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zc/bWJCPZ+Br76mIhqKb/NSsjK7whpAzJAsp1043lCU=;
  b=HDpqPtRo4qwDbuUkd3MCAfqb3ec84/PubIUduFtV1JRR19F2Co45ZiRj
   43ZRPM/mSQ6uIaJy/7KHNmR7KRjfkNatHD4RFSW69ABcP/CweQNVNAr1e
   QxZQZkwQ5kXDq6LTjLTJwezmMc0fZ3nmwU9tOpjG6auym1fsGeeJTNecy
   DT74LUIIZdq4d+ExMb5e/LKJs+Wh9QApTjxe3sRh7A7lgxvTCBgeTyQRs
   BG6p5UXtOPzMn5AIm1QqreIoIr3kUYqCT47pqCY78pQXv9mRuxrL+voYX
   SODlaNrbSJo+K17Or3nSi/C1RrVnoK2c8Tt6Kr4mhKvZdAaKci2xBGWuh
   Q==;
X-CSE-ConnectionGUID: IL+BR0ACQjamAorrtCD9KA==
X-CSE-MsgGUID: Co8rlxoBTRmqj5+RpokClw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34272976"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34272976"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 13:56:11 -0800
X-CSE-ConnectionGUID: bJ1NPTCkQkmXuswp43HF3g==
X-CSE-MsgGUID: ufel+08ET8GUEfuNocY9RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="96473426"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2024 13:56:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLUgh-00078D-15;
	Wed, 11 Dec 2024 21:56:07 +0000
Date: Thu, 12 Dec 2024 05:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 0/219] kernel/hung_task.c:148:7: error:
 use of undeclared identifier 'sysctl_hung_task_all_cpu_backtrace'
Message-ID: <202412120546.1VT9HCPP-lkp@intel.com>
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
head:   faa52e40c08916893e09ba030e616f92e4fc020b
commit: 190aae97bcddbed131a203f829257b168f5058ce [0/219] kernel/hung_task.c: introduce sysctl to print all traces when a hung task is detected
config: x86_64-buildonly-randconfig-003-20240112 (https://download.01.org/0day-ci/archive/20241212/202412120546.1VT9HCPP-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120546.1VT9HCPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120546.1VT9HCPP-lkp@intel.com/

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
