Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6983238DC50
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 05:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786599611; cv=none; b=aiQzmLhuFnK+wyoFfrFnnUgwmiQ7ICniONC2zgAQQA0Xkn0dYsVcHlpSjBybbwLQVRg1iQm8XFAPjWgoPRmTSBMA7NGlQlukVXlfFg5T/TtZH6dOTSFGu0n1Fa+uBND0pc3zoXcYOYBCHn2mT0ZF36FqE6zRb7A6Z/BdsuLJO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786599611; c=relaxed/simple;
	bh=4FRRfkv8eZZNtoHhFKtS48tslmNbEW8l1NcZFLOVyT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YiiTRfB2UODrq/5DlFG5aReGUuUWeK3wZwmdBi0j6SJAQuKMgTmPnZED7VBSZofh0D5fADKOnUcHGkRts45jLNrL/5XT7ZJRCwvrMLwzfhcqNN8Hb8CPvYWijkfLy9OwfOU2s79dcWf1t4BkUBeHRpdPsIBc+k3rMo4KC+oNhZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTx49wWp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTx49wWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786599610; x=1818135610;
  h=date:from:to:cc:subject:message-id;
  bh=4FRRfkv8eZZNtoHhFKtS48tslmNbEW8l1NcZFLOVyT0=;
  b=CTx49wWp4w/3tZ3gla8fBGHzPCIq/yNFbiZn7xV8iLmHB/7++iIuXQLk
   e0nhaF47fzMkH3sSN0e26AMti4wcl6CWgvXfPqk2dUj4bBRgVWvhKuWer
   DU2C8wl5kpDTWmXKQAaBHR+fukGczT43jy0S9gmyIm7UmQUuER8vDCZ8h
   FvyNgqK6KXAe7V3UhwzcmWla4IlWu1kMB45CxGobgOe5ZBeEIxwNcufgV
   Vl0J3vrdD+Tcv3yliNcmqvd8DiktAvrjcLY5AOWIqny6qxF4r5BeGP8hB
   XjX7MT41lC9K4eMOXrj/uqjZp4RWT/BBLir7GF/rVKEjHPA4a36OutZt6
   w==;
X-CSE-ConnectionGUID: sxgHo/UoQpGKBzP8dJkVgQ==
X-CSE-MsgGUID: WXo3XJjiTCivzyfSwmL52A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98680433"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98680433"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 22:40:09 -0700
X-CSE-ConnectionGUID: fApE+1hsS7GuLCqp7cmsGg==
X-CSE-MsgGUID: jOzhiA/6Rmu2slsKdFSekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="264425066"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 22:40:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuOAf-00000000Sws-0vRv;
	Thu, 13 Aug 2026 05:40:05 +0000
Date: Thu, 13 Aug 2026 13:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:non-rcu/next 39/40]
 include/linux/hrtimer.h:355:16: sparse: sparse: incorrect type in return
 expression (different modifiers)
Message-ID: <202608131347.dXTHYsI1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux non-rcu/next
head:   e39a12053df0951120ff6283177e0d5179feda45
commit: c3d1cae06fc1ad9b6948fa0ca8a93415607ea8b1 [39/40] hrtimer: Mark the hrtimer_sleeper structure's ->task field __private
config: arc-randconfig-r132-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131347.dXTHYsI1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131347.dXTHYsI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131347.dXTHYsI1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/time/sleep_timeout.c: note: in included file (through include/linux/alarmtimer.h, include/linux/posix-timers.h, include/linux/sched/signal.h):
>> include/linux/hrtimer.h:355:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct task_struct * @@     got struct task_struct [noderef] * @@
   include/linux/hrtimer.h:355:16: sparse:     expected struct task_struct *
   include/linux/hrtimer.h:355:16: sparse:     got struct task_struct [noderef] *
>> include/linux/hrtimer.h:355:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct task_struct * @@     got struct task_struct [noderef] * @@
   include/linux/hrtimer.h:355:16: sparse:     expected struct task_struct *
   include/linux/hrtimer.h:355:16: sparse:     got struct task_struct [noderef] *
--
   kernel/time/hrtimer.c: note: in included file:
>> include/linux/hrtimer.h:355:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct task_struct * @@     got struct task_struct [noderef] * @@
   include/linux/hrtimer.h:355:16: sparse:     expected struct task_struct *
   include/linux/hrtimer.h:355:16: sparse:     got struct task_struct [noderef] *
>> include/linux/hrtimer.h:359:9: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct task_struct [noderef] *volatile @@     got struct task_struct *t @@
   include/linux/hrtimer.h:359:9: sparse:     expected struct task_struct [noderef] *volatile
   include/linux/hrtimer.h:359:9: sparse:     got struct task_struct *t
>> include/linux/hrtimer.h:359:9: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct task_struct [noderef] *volatile @@     got struct task_struct *t @@
   include/linux/hrtimer.h:359:9: sparse:     expected struct task_struct [noderef] *volatile
   include/linux/hrtimer.h:359:9: sparse:     got struct task_struct *t
>> include/linux/hrtimer.h:359:9: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct task_struct [noderef] *volatile @@     got struct task_struct *t @@
   include/linux/hrtimer.h:359:9: sparse:     expected struct task_struct [noderef] *volatile
   include/linux/hrtimer.h:359:9: sparse:     got struct task_struct *t
>> include/linux/hrtimer.h:355:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct task_struct * @@     got struct task_struct [noderef] * @@
   include/linux/hrtimer.h:355:16: sparse:     expected struct task_struct *
   include/linux/hrtimer.h:355:16: sparse:     got struct task_struct [noderef] *
>> include/linux/hrtimer.h:355:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct task_struct * @@     got struct task_struct [noderef] * @@
   include/linux/hrtimer.h:355:16: sparse:     expected struct task_struct *
   include/linux/hrtimer.h:355:16: sparse:     got struct task_struct [noderef] *
>> include/linux/hrtimer.h:355:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct task_struct * @@     got struct task_struct [noderef] * @@
   include/linux/hrtimer.h:355:16: sparse:     expected struct task_struct *
   include/linux/hrtimer.h:355:16: sparse:     got struct task_struct [noderef] *

vim +355 include/linux/hrtimer.h

   341	
   342	extern int nanosleep_copyout(struct restart_block *, struct timespec64 *);
   343	extern long hrtimer_nanosleep(ktime_t rqtp, const enum hrtimer_mode mode,
   344				      const clockid_t clockid);
   345	
   346	extern int schedule_hrtimeout_range(ktime_t *expires, u64 delta,
   347					    const enum hrtimer_mode mode);
   348	extern int schedule_hrtimeout_range_clock(ktime_t *expires,
   349						  u64 delta,
   350						  const enum hrtimer_mode mode,
   351						  clockid_t clock_id);
   352	extern int schedule_hrtimeout(ktime_t *expires, const enum hrtimer_mode mode);
   353	static inline struct task_struct *hrtimer_sleeper_task_get(struct hrtimer_sleeper *sl)
   354	{
 > 355		return READ_ONCE(ACCESS_PRIVATE(sl, task));
   356	}
   357	static inline void hrtimer_sleeper_task_set(struct hrtimer_sleeper *sl, struct task_struct *t)
   358	{
 > 359		WRITE_ONCE(ACCESS_PRIVATE(sl, task), t);
   360	}
   361	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
