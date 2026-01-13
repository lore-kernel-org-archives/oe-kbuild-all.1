Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A03876DD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298035; cv=none; b=WlkQDTKptWruJuz00p4jc0JY+6r8AStdyfohnP/lep/+xU9BQiWCTMsRXxChTBsFAYfi8hvYtoeqaMFR5wIedyX7gqBqRORpymdetHkPC56JJIVQX6FK6XZ1gJ8ZnbI8JLz4gibFb4vqEOrKR2FemNqf+5BzG5s/IrwhVPzmHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298035; c=relaxed/simple;
	bh=CNuGIUFztIb4h8IG4nFE+bT9Z3v0HwLyngelJ6YNbG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=THY4OGlXqKlK0be3aUQZVsLf5oaKjtHSsXUvbbvMx2zOG0nWiS0nhL8leKq9iNsFbYdzHpU98EWMkG2Nwh+Rdc7R3h2kGlw/KWqhZ+mQPegjpqkNH/FbTOdBqnGNZT7JLKNdsrzzaK9HIDVDcNzwaMZUQlEVSDufYPfaarFgjIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmzDDHdK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmzDDHdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298034; x=1799834034;
  h=date:from:to:cc:subject:message-id;
  bh=CNuGIUFztIb4h8IG4nFE+bT9Z3v0HwLyngelJ6YNbG4=;
  b=gmzDDHdKkAplSfCGA7OF2B1mU46ShzWeIcYIsqst48PtFpT1qT/hx65B
   TdqfLn38iCSnPv34AXp4Op2JGTuDH0ClN3azAseSaWvSbtrLrfd9xTMTS
   T3KP7XulPm9ruLNnowWdT2ACx5pE7pCrrr3yToPvGkiIlIJOFjE3MJ15P
   p6FYGN8+l4lYtO7gAGwzcc8K+2hb7vGDbYGBV5F5WwiOInWyNi/uhB8Vy
   E6HvEaewY3AGFmS8e8LLbRtAIOeNofdoEJnZu/1BLVQbYDHxKZsQt1nqw
   AmjC6zJqh7vcQb7+H891HoKsBBTOkJXUCCA0tfIPKfhyw4bj2iZqqzKLF
   w==;
X-CSE-ConnectionGUID: JSqNrmMqRkq2V3uEz8JpKA==
X-CSE-MsgGUID: 5yhuYUbLQEaQsO5Zp23kMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69488546"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69488546"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:53:53 -0800
X-CSE-ConnectionGUID: cgbBHHaSTNKA+Rw49SdMfQ==
X-CSE-MsgGUID: PJ1qUKv9Qlu5AvhukP3uuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204424275"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2026 01:53:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfb5x-00000000EZM-0DIC;
	Tue, 13 Jan 2026 09:53:49 +0000
Date: Tue, 13 Jan 2026 17:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 33/33]
 kernel/sched/rt.c:1846:21: error: implicit declaration of function
 'task_is_pushable'; did you mean 'task_is_runnable'?
Message-ID: <202601131720.kHjB5BXI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   a18faab7e7d04a637603ae34a4cc2376cd10b8eb
commit: f77e294987675cc8ef143bb52667ff0025416d73 [33/33] ANDROID: sched: Fix rt/dl load balancing via chain level balance
config: i386-randconfig-015-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131720.kHjB5BXI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131720.kHjB5BXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131720.kHjB5BXI-lkp@intel.com/

Note: the android-common/android17-6.18 HEAD a18faab7e7d04a637603ae34a4cc2376cd10b8eb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c: In function 'pick_highest_pushable_task':
>> kernel/sched/rt.c:1846:21: error: implicit declaration of function 'task_is_pushable'; did you mean 'task_is_runnable'? [-Wimplicit-function-declaration]
    1846 |                 if (task_is_pushable(rq, p, cpu) == 1)
         |                     ^~~~~~~~~~~~~~~~
         |                     task_is_runnable
   kernel/sched/rt.c: In function 'push_rt_task':
>> kernel/sched/rt.c:2231:9: error: implicit declaration of function 'move_queued_task_locked' [-Wimplicit-function-declaration]
    2231 |         move_queued_task_locked(rq, lowest_rq, next_task);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/sched/core.c: In function 'push_cpu_stop':
>> kernel/sched/core.c:2787:17: error: implicit declaration of function 'move_queued_task_locked'; did you mean 'move_queued_task'? [-Wimplicit-function-declaration]
    2787 |                 move_queued_task_locked(rq, lowest_rq, p);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 move_queued_task

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +1846 kernel/sched/rt.c

  1832	
  1833	/*
  1834	 * Return the highest pushable rq's task, which is suitable to be executed
  1835	 * on the CPU, NULL otherwise
  1836	 */
  1837	struct task_struct *pick_highest_pushable_task(struct rq *rq, int cpu)
  1838	{
  1839		struct plist_head *head = &rq->rt.pushable_tasks;
  1840		struct task_struct *p;
  1841	
  1842		if (!has_pushable_tasks(rq))
  1843			return NULL;
  1844	
  1845		plist_for_each_entry(p, head, pushable_tasks) {
> 1846			if (task_is_pushable(rq, p, cpu) == 1)
  1847				return p;
  1848		}
  1849	
  1850		return NULL;
  1851	}
  1852	EXPORT_SYMBOL_GPL(pick_highest_pushable_task);
  1853	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
