Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590A197A67
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730970907; cv=none; b=u5dBbmHN9Zr4vYSx3efFg3jaOpGBlv4dwAgTUV/pdD0OdL9HZpK3S9kR1rRkP61bOvdKlwo8ZGEKCpsmPja9OL4vUeFaDgYxszY2Z2lvEDzUz8Uibd0PKBDM8JtsFDeDcRSsBv9COcBtNCMz69qRRm+xJBs1rfiJvktHaceql8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730970907; c=relaxed/simple;
	bh=1ZhxUQw4Y9uZOsdAp5UizljuLMTB2RIRkoSX/ckMHXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/iBeJoucyPCEM4aUcy45aH1zAy7yVR7eDCh5VEVOMRVpg+iSmZQh9ButP7ZXKBGf1iDDgCcuWTissUKczx2/Hop9fm8v1QwsQq8QqvKrKoWN9igv0tu18NPmbQe+RTSY30HgmolTXAFQQbzohNe6YCsQCSxgMtPT+VzXRrpS58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sgb8mQTh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sgb8mQTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730970905; x=1762506905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZhxUQw4Y9uZOsdAp5UizljuLMTB2RIRkoSX/ckMHXA=;
  b=Sgb8mQTh+TFwiv/LLETcn3Few9w9gac+OpKI52/ro+bYRuRUp7cjHXIZ
   QM0S3wE1l5mqtPsv4ax1N8Gi2UQJi3yA9z8M7beDmqWHcWgWnmaiXvvXI
   PcdOuChbpkSrBSX/Ms9P8OtjaNX2iIP5wtD6aSqPuYOB36WWX12CCHdRd
   JtGNpXsxJSzqKaeqrI248KvWG+poae1OIdw3DfmTS5f54d3znb+ir7dE7
   cggrsvK5ZddkknEdc5RT1FazyUFd02UGoAyyicaeHYuHUMZgRLMM5eXeJ
   wd3emXAO/JLvo/EGCxdgAlybaHeOaoLl+24kgEsDAtPPTP/bxmFAlKPpe
   w==;
X-CSE-ConnectionGUID: fd4TyeeRTSaOQ0cyK3pydw==
X-CSE-MsgGUID: mPHo4/8rS+OvPdszmCL8Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42181593"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="42181593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 01:15:05 -0800
X-CSE-ConnectionGUID: 8dxEl9c3RWis7zbhaNNMpg==
X-CSE-MsgGUID: sv5a3m2VQwOc/Ny03lCL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85186510"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2024 01:15:04 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ybW-000q2g-0X;
	Thu, 07 Nov 2024 09:15:02 +0000
Date: Thu, 7 Nov 2024 17:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/tick-sched 3/3] kernel/time/timer_migration.c:1081:
 undefined reference to `get_jiffies_update'
Message-ID: <202411071752.erfmXqoQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/tick-sched
head:   f0e253cdae796b8b09c2724389ef5d1fee9048c1
commit: f0e253cdae796b8b09c2724389ef5d1fee9048c1 [3/3] tick-sched: Replace jiffie readout with idle_entrytime
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241107/202411071752.erfmXqoQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071752.erfmXqoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071752.erfmXqoQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `tmigr_handle_remote':
>> kernel/time/timer_migration.c:1081: undefined reference to `get_jiffies_update'
   ld: vmlinux.o: in function `tmigr_requires_handle_remote':
   kernel/time/timer_migration.c:1167: undefined reference to `get_jiffies_update'


vim +1081 kernel/time/timer_migration.c

7ee988770326fc Anna-Maria Behnsen  2024-02-22  1049  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1050  /**
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1051   * tmigr_handle_remote() - Handle global timers of remote idle CPUs
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1052   *
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1053   * Called from the timer soft interrupt with interrupts enabled.
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1054   */
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1055  void tmigr_handle_remote(void)
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1056  {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1057  	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1058  	struct tmigr_remote_data data;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1059  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1060  	if (tmigr_is_not_available(tmc))
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1061  		return;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1062  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1063  	data.childmask = tmc->childmask;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1064  	data.firstexp = KTIME_MAX;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1065  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1066  	/*
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1067  	 * NOTE: This is a doubled check because the migrator test will be done
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1068  	 * in tmigr_handle_remote_up() anyway. Keep this check to speed up the
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1069  	 * return when nothing has to be done.
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1070  	 */
f55acb1e44f3d4 Frederic Weisbecker 2024-03-19  1071  	if (!tmigr_check_migrator(tmc->tmgroup, tmc->childmask)) {
f55acb1e44f3d4 Frederic Weisbecker 2024-03-19  1072  		/*
f55acb1e44f3d4 Frederic Weisbecker 2024-03-19  1073  		 * If this CPU was an idle migrator, make sure to clear its wakeup
f55acb1e44f3d4 Frederic Weisbecker 2024-03-19  1074  		 * value so it won't chase timers that have already expired elsewhere.
f55acb1e44f3d4 Frederic Weisbecker 2024-03-19  1075  		 * This avoids endless requeue from tmigr_new_timer().
f55acb1e44f3d4 Frederic Weisbecker 2024-03-19  1076  		 */
f55acb1e44f3d4 Frederic Weisbecker 2024-03-19  1077  		if (READ_ONCE(tmc->wakeup) == KTIME_MAX)
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1078  			return;
f55acb1e44f3d4 Frederic Weisbecker 2024-03-19  1079  	}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1080  
7ee988770326fc Anna-Maria Behnsen  2024-02-22 @1081  	data.now = get_jiffies_update(&data.basej);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1082  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1083  	/*
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1084  	 * Update @tmc->wakeup only at the end and do not reset @tmc->wakeup to
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1085  	 * KTIME_MAX. Even if tmc->lock is not held during the whole remote
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1086  	 * handling, tmc->wakeup is fine to be stale as it is called in
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1087  	 * interrupt context and tick_nohz_next_event() is executed in interrupt
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1088  	 * exit path only after processing the last pending interrupt.
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1089  	 */
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1090  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1091  	__walk_groups(&tmigr_handle_remote_up, &data, tmc);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1092  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1093  	raw_spin_lock_irq(&tmc->lock);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1094  	WRITE_ONCE(tmc->wakeup, data.firstexp);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1095  	raw_spin_unlock_irq(&tmc->lock);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1096  }
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1097  

:::::: The code at line 1081 was first introduced by commit
:::::: 7ee988770326fca440472200c3eb58935fe712f6 timers: Implement the hierarchical pull model

:::::: TO: Anna-Maria Behnsen <anna-maria@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
