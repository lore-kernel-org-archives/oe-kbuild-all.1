Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E214432E6E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785879720; cv=none; b=N4KUFimYgxYwvAuogMA+DIRfUHnJZdOtRb+NFR74Eaj7tZI/ndANcSOLXJGZtaBbE2uX/e5N+zVybM8scx1qbC01ZoXk6NnUP//Pa1Z5tYQwrnDXBxBjxybaaT/7ztap651gR+ZfnjP+riXOvNcKBsiFFMm25rhXoIGt0Ge49aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785879720; c=relaxed/simple;
	bh=qL9Al0Ty6rEYR0KT77slUV3dtcXlU7i//R0wqlbk4v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBWcJtRBBQPxrG5fZsXJEHhDyJrnNGVHuk+hGuAdO3wNQmmOqxXY94BkgUE5q+iGXgIQir3aGq4GPIp21mPyNhTqDxqQzSfJFZ440eTiMOph5zEc1rttXeS0zcejaJ95zh8Z4aa493Ec6ADq5UNij4xyWAoWtoWjKqDhouiFfrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5nK2m/Y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5nK2m/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785879718; x=1817415718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qL9Al0Ty6rEYR0KT77slUV3dtcXlU7i//R0wqlbk4v0=;
  b=h5nK2m/Y+DA4kuiy5GXl/1Pjxg4AO9cj2Pk7Ox+xPyiOzLECzD40exwr
   Mwe+sYd5pzusriGrmGf6+RxYsxAzNru2cvWvuuQRQB274ukLpny4LEgVx
   jF2k0yyVSjzmDRJc8Yl0AliPA3+viYM5WYc21OfjT6PmvvRBKhE+T/Z0a
   GBd92TiNTDDhYsCSCK8K6neTCs2cOsqOHTKFjNTGYWTCM+VbbBBb4YX4V
   93s4/hsfPqTFiV8wxU+If1HzGHk+3IbXmiAKaOn03Nayu/5Jl//59+5S5
   oNhgbO4q04Tw9MTkPOxLjV4h25i+GJzDymqnXyLszhd6tuJKYtf6xuTOM
   A==;
X-CSE-ConnectionGUID: TG7rEID5QWKQLFwAJ2lKWg==
X-CSE-MsgGUID: M2sgQuyVREmqJsY89or3aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="109232801"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="109232801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:41:57 -0700
X-CSE-ConnectionGUID: nu0dPmN1Sye/G8bOqiqZkQ==
X-CSE-MsgGUID: 0E6/UIklT2SkAOHfsT+N5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="291564731"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2026 14:41:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrMtT-00000000Aom-3tYU;
	Tue, 04 Aug 2026 21:41:51 +0000
Date: Wed, 5 Aug 2026 05:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, akpm@linux-foundation.org,
	lance.yang@linux.dev, mhiramat@kernel.org, pmladek@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com, atomlin@atomlin.com, neelx@suse.com,
	sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com,
	nick.lange@gmail.com
Subject: Re: [PATCH v5] hung_task: Deduplicate identical hang reports using
 explicit blocker tracking
Message-ID: <202608050541.aDhk6r1x-lkp@intel.com>
References: <20260712202100.123934-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712202100.123934-1-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tip/sched/core linus/master kees/for-next/execve v7.2-rc6 next-20260804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/hung_task-Deduplicate-identical-hang-reports-using-explicit-blocker-tracking/20260804-194519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260712202100.123934-1-atomlin%40atomlin.com
patch subject: [PATCH v5] hung_task: Deduplicate identical hang reports using explicit blocker tracking
config: openrisc-randconfig-r071-20260805 (https://download.01.org/0day-ci/archive/20260805/202608050541.aDhk6r1x-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050541.aDhk6r1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050541.aDhk6r1x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/hung_task.c: In function 'check_hung_uninterruptible_tasks':
>> kernel/hung_task.c:337:14: warning: variable 'scan_completed' set but not used [-Wunused-but-set-variable]
     337 |         bool scan_completed = false;
         |              ^~~~~~~~~~~~~~


vim +/scan_completed +337 kernel/hung_task.c

   323	
   324	/*
   325	 * Check whether a TASK_UNINTERRUPTIBLE does not get woken up for
   326	 * a really long time. If that happens, print out a warning.
   327	 */
   328	static void check_hung_uninterruptible_tasks(unsigned long timeout)
   329	{
   330		int max_count = sysctl_hung_task_check_count;
   331		unsigned long last_break = jiffies;
   332		struct task_struct *g, *t;
   333		unsigned long this_round_count;
   334		int need_warning = sysctl_hung_task_warnings;
   335		unsigned long si_mask = hung_task_si_mask;
   336		unsigned int skip_show_task;
 > 337		bool scan_completed = false;
   338	#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
   339		unsigned long blocker;
   340		static int warnings_reset_value;
   341		unsigned long seen_blockers_mask = 0;
   342	#endif
   343	
   344		/*
   345		 * If the system crashed already then all bets are off,
   346		 * do not report extra hung tasks:
   347		 */
   348		if (test_taint(TAINT_DIE) || did_panic)
   349			return;
   350	
   351		this_round_count = 0;
   352		rcu_read_lock();
   353		for_each_process_thread(g, t) {
   354			if (!max_count--)
   355				goto unlock;
   356			if (time_after(jiffies, last_break + HUNG_TASK_LOCK_BREAK)) {
   357				if (!rcu_lock_break(g, t))
   358					goto unlock;
   359				last_break = jiffies;
   360			}
   361	
   362			if (task_is_hung(t, timeout)) {
   363				skip_show_task = t->hung_task_reported;
   364				/*
   365				 * Increment the global counter so that userspace could
   366				 * start migrating tasks ASAP. But count the current
   367				 * round separately because userspace could reset
   368				 * the global counter at any time.
   369				 */
   370				atomic_long_inc(&sysctl_hung_task_detect_count);
   371				this_round_count++;
   372	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
