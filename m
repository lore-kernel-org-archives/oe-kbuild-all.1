Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977023F8C2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 23:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckZbw+uQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701818103; x=1733354103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fyEqkoN9jYQ9KXmQ8JaAehrza7KHx7QxJyfOT9Djmio=;
  b=ckZbw+uQ5VgUDwNTqYf9+89sg0mJrCB+NwRPiiy9+YQEvYEMEaLTqyaH
   HPhz8GL4+OSOkXLAc3W2O3twd9m4UKa8xgOrKRC4SnCVY60z/2M6sYtnr
   gJOfSTosAhIcAZBanPYotD0O8lZO36SgpBW5kkFb9RhhYMzXuwi9GwU6G
   crrAI2yVJK5vQWsNpz50UGscCu9ydZVp4XGMyFX42az+6ypzGoak9wy03
   KRGk3tkz0FPl2iYEkqrYLSkoDgTUXadwQAegYWvOSTGmSuZXwODuopN6W
   004Y1IjcfBCrx59iim+4MYYyMAhxYqDrnF7RiVUuJzgN46lI9JexkqPJb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391143334"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="391143334"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747402149"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="747402149"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 15:14:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAecy-0009rK-0h;
	Tue, 05 Dec 2023 23:14:56 +0000
Date: Wed, 6 Dec 2023 07:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/pushpull 30/32]
 kernel/time/timer_migration.c:1529 tmigr_cpu_online() warn: unsigned 'ret'
 is never less than zero.
Message-ID: <202312060700.eMx860Ek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/pushpull
head:   c5f729902c462bd2f9153641aebe042bbb5f9ede
commit: f7012466efc3b7e5a3220e702ada7e51245caf20 [30/32] timers: Implement the hierarchical pull model
config: x86_64-randconfig-161-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060700.eMx860Ek-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060700.eMx860Ek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060700.eMx860Ek-lkp@intel.com/

smatch warnings:
kernel/time/timer_migration.c:1529 tmigr_cpu_online() warn: unsigned 'ret' is never less than zero.

vim +/ret +1529 kernel/time/timer_migration.c

  1518	
  1519	static int tmigr_cpu_online(unsigned int cpu)
  1520	{
  1521		struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
  1522		unsigned int ret;
  1523	
  1524		/* First online attempt? Initialize CPU data */
  1525		if (!tmc->tmgroup) {
  1526			raw_spin_lock_init(&tmc->lock);
  1527	
  1528			ret = tmigr_add_cpu(cpu);
> 1529			if (ret < 0)
  1530				return ret;
  1531	
  1532			if (tmc->childmask == 0)
  1533				return -EINVAL;
  1534	
  1535			timerqueue_init(&tmc->cpuevt.nextevt);
  1536			tmc->cpuevt.nextevt.expires = KTIME_MAX;
  1537			tmc->cpuevt.ignore = true;
  1538			tmc->cpuevt.cpu = cpu;
  1539	
  1540			tmc->remote = false;
  1541			WRITE_ONCE(tmc->wakeup, KTIME_MAX);
  1542		}
  1543		raw_spin_lock_irq(&tmc->lock);
  1544		if (timer_base_is_idle())
  1545			tmc->idle = true;
  1546		else
  1547			__tmigr_cpu_activate(tmc);
  1548		tmc->online = true;
  1549		raw_spin_unlock_irq(&tmc->lock);
  1550		return 0;
  1551	}
  1552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
