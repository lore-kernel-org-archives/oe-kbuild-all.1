Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73FB21A45E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717964; cv=none; b=lDiBDZUFudghOB7ixsK0ShV/zOF2S+bEhD4rvuQ2R15MFJ3JMFPiGuJRKr0W9DsD/UVGh8h3hvqTrqaCokXQWMmnbOw2QYyFRmZy7AWwhqnOs8WWhQ32C8JOmCm1v/CaT3WF9DHMnTwryoQwe5bT45Qd//jHgDIQfYBjRF2kdJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717964; c=relaxed/simple;
	bh=LocUNaxUCdhxaptlNVpZuIPhx/xWiQoNZRYg8O3Afh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0CLhdKt0jysBu3MYOk0FNuRiURTWpTxB/H7Jvql0u9UeJjnNIc+bTMbfb841ABlUB1kmLItGZC69L1iHrlR3E8arhFBi3uXhJdPNLXRooYnN4/3bpIRZ9Pex266MFvkxEzoRZ9Tx3IewNV7zHXLDDPwpZoVSGQIdF8XQAw8dfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxqIaoBF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxqIaoBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734717963; x=1766253963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LocUNaxUCdhxaptlNVpZuIPhx/xWiQoNZRYg8O3Afh8=;
  b=kxqIaoBF5p0SoN617o05vojDjf0QVwcCWPiY4ECrHpfzVkoVg+FnA2Co
   n5ePayEUM4I6XV6ldodFjt3U0/8mFBOQY/tD1nl9xqWnjnhNZxs67z+YP
   mb3c7cHPY1zMY/ahulH8jr1/EcnzB/8uHpv3/hbm4Tuqcm0WK4QvoVZOp
   CLFEpYfKrLrh2a/DJbpq3txheeT4/f10gk4LQuR+nAR3SyehvHCNrtdJQ
   EBKSUrCwMdzTUXRKoH4eI8rTaCcWh+dS0csTklIbTYMRwLmvZHwTKe4j9
   pf9S6veW8RTIa7meHtBzWD1WKDC2jSUpqClPrHFrh4HVrgkr67DDtOC+6
   w==;
X-CSE-ConnectionGUID: 7TxYSq9gTR69Zyj824Cryw==
X-CSE-MsgGUID: bOUEVOuUQAiTG6e/FjUlXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46282298"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="46282298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:05:59 -0800
X-CSE-ConnectionGUID: z2aDPhBHRQ2Y8T3AV5YZfA==
X-CSE-MsgGUID: FJTIqSlASeKDcEFr5WT1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="99098853"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 10:05:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOhNr-0001WI-1F;
	Fri, 20 Dec 2024 18:05:55 +0000
Date: Sat, 21 Dec 2024 02:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:dev 25/30] kernel/time/hrtimer.c:1229:42: error:
 'migration_base' undeclared; did you mean 'is_migration_base'?
Message-ID: <202412210218.00cDkmMB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   54c05449fb97c1414c85c6e2e58a7d0c53827acd
commit: fe2e53971593e84616d31630458d80398e18fbcf [25/30] EXP hrtimers: Force migrate away hrtimers queued after CPUHP_AP_HRTIMERS_DYING
config: i386-buildonly-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210218.00cDkmMB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210218.00cDkmMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210218.00cDkmMB-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:125:35: warning: initialized field overwritten [-Woverride-init]
     125 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:125:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:126:35: warning: initialized field overwritten [-Woverride-init]
     126 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:126:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:127:35: warning: initialized field overwritten [-Woverride-init]
     127 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:127:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:324,
                    from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   kernel/time/hrtimer.c: In function 'enqueue_hrtimer_offline':
>> kernel/time/hrtimer.c:1229:42: error: 'migration_base' undeclared (first use in this function); did you mean 'is_migration_base'?
    1229 |                 WRITE_ONCE(timer->base, &migration_base);
         |                                          ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   kernel/time/hrtimer.c:1229:17: note: in expansion of macro 'WRITE_ONCE'
    1229 |                 WRITE_ONCE(timer->base, &migration_base);
         |                 ^~~~~~~~~~
   kernel/time/hrtimer.c:1229:42: note: each undeclared identifier is reported only once for each function it appears in
    1229 |                 WRITE_ONCE(timer->base, &migration_base);
         |                                          ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   kernel/time/hrtimer.c:1229:17: note: in expansion of macro 'WRITE_ONCE'
    1229 |                 WRITE_ONCE(timer->base, &migration_base);
         |                 ^~~~~~~~~~


vim +1229 kernel/time/hrtimer.c

  1206	
  1207	/*
  1208	 * If the current CPU is offline and timers have been already
  1209	 * migrated away, make sure not to enqueue locally and perform
  1210	 * a remote retrigger as a last resort.
  1211	 */
  1212	static void enqueue_hrtimer_offline(struct hrtimer *timer,
  1213					    struct hrtimer_clock_base *base,
  1214					    const enum hrtimer_mode mode)
  1215	{
  1216		struct hrtimer_cpu_base *new_cpu_base, *old_cpu_base, *this_cpu_base;
  1217		struct hrtimer_clock_base *new_base;
  1218		int cpu;
  1219	
  1220		old_cpu_base = base->cpu_base;
  1221		this_cpu_base = this_cpu_ptr(&hrtimer_bases);
  1222	
  1223		if (old_cpu_base == this_cpu_base || !old_cpu_base->online) {
  1224			WARN_ON_ONCE(hrtimer_callback_running(timer));
  1225			cpu = cpumask_any_and(cpu_online_mask,
  1226					      housekeeping_cpumask(HK_TYPE_TIMER));
  1227			new_cpu_base = &per_cpu(hrtimer_bases, cpu);
  1228			new_base = &new_cpu_base->clock_base[base->index];
> 1229			WRITE_ONCE(timer->base, &migration_base);
  1230			raw_spin_unlock(&old_cpu_base->lock);
  1231			raw_spin_lock(&new_cpu_base->lock);
  1232			WRITE_ONCE(timer->base, new_base);
  1233		} else {
  1234			new_base = base;
  1235			new_cpu_base = new_base->cpu_base;
  1236			cpu = new_cpu_base->cpu;
  1237		}
  1238	
  1239		if (enqueue_hrtimer(timer, new_base, mode))
  1240			smp_call_function_single_async(cpu, &new_cpu_base->csd);
  1241	}
  1242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
