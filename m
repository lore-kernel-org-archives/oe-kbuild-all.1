Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1B43C7A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786395539; cv=none; b=uKrpkRRi3Z4sfWsryry0Rp/5fGgRFMjXCvX6aK5p74JGFgJuu/uVA79EgT31EYKHQqtbnbNMbxjSBDi/ishz6kBK/oMMu5GRvvjgqK+840u3EGpinclTbSvYo3kbiX3yHcwyday83Xeymr+qF0IJ4k/E7t6k9cPkk2KLAs06caI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786395539; c=relaxed/simple;
	bh=GTAoUdn/NpsXerRfh/pcIsouX05hMpAPrGW1Y46uUts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nQyULW3pcOr1AaDKkIb45EEbW4ZwgxBawTCvnJ+7NbCFCbGZtAkh5wqKWI6BcgVv5tWQl3ppTbpecrTg1evTFBKVX55GVA2wU9ZH4NG2K32y0vKzk/ztRsZ0RSftoBovYvnCBsYY96kv8Up0GxsYhows40JtGV8xTIiPFrUxIUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTAL1INe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTAL1INe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786395536; x=1817931536;
  h=date:from:to:cc:subject:message-id;
  bh=GTAoUdn/NpsXerRfh/pcIsouX05hMpAPrGW1Y46uUts=;
  b=ZTAL1INeDDH3cnX0PA2Grpd4pBxlgxvkVs2vEpiwTj5y0WybhEpPUtUZ
   1T4YDCIykfuMRgPXGTGXbYU+sNV4Sf7dBmw37NgFyx05W5ALuDIO2XYZt
   TzL2zaGHKNjubU4P2x/dv+iKrj3lVo3gmtZiad7PwzdWDh2GTVDbpmZtI
   2FcYtLW5b2p0s1MaDUBDK1X/d83iNSvwGwPO97USf8tA0ZeP6c+fTg9af
   qtvwE3Tz9EM+9MBBCZ/dUe4QLoeO5qERLBRmVFOCz9sTF6ZRNHEOYcl74
   uKPcJvvpFh+A64eeZR1qV7kB3ID40CD5UwiuS8e04/lewRyduo1O0IoHd
   w==;
X-CSE-ConnectionGUID: 0DUFH5X4RDuC3FSIYo4lCg==
X-CSE-MsgGUID: HFxwn0OUS7qVu5Lx6Zjyrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90803713"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="90803713"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 13:58:56 -0700
X-CSE-ConnectionGUID: V0lOEFEEQNSPG8s1sn8j7g==
X-CSE-MsgGUID: z8bcE7iFSiCFpbxlbb+v9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="266633487"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Aug 2026 13:58:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtX5A-00000000NjS-1RMZ;
	Mon, 10 Aug 2026 20:58:52 +0000
Date: Tue, 11 Aug 2026 04:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2026.03.24a 22/31]
 kernel/rcu/hazptrtorture.c:508:7: error: implicit declaration of function
 'torture_sched_setaffinity'; did you mean 'torture_sched_set_normal'?
Message-ID: <202608110436.QhdFI1Er-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev.2026.03.24a
head:   8600e98cae614a9336f54a79ea5c152b14369076
commit: 16ad40d1089c5f212d7d87babc2376284f3bf244 [22/31] fixup! torture: Add a hazptrtorture.c stress test
config: sparc64-randconfig-002-20260811 (https://download.01.org/0day-ci/archive/20260811/202608110436.QhdFI1Er-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608110436.QhdFI1Er-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608110436.QhdFI1Er-lkp@intel.com/

Note: the paulmckrcu/dev.2026.03.24a HEAD 8600e98cae614a9336f54a79ea5c152b14369076 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/rcu/hazptrtorture.c: In function 'hazptr_torture_preempt':
>> kernel/rcu/hazptrtorture.c:508:7: error: implicit declaration of function 'torture_sched_setaffinity'; did you mean 'torture_sched_set_normal'? [-Werror=implicit-function-declaration]
      if (torture_sched_setaffinity(current->pid, cpumask_of(cpu), false))
          ^~~~~~~~~~~~~~~~~~~~~~~~~
          torture_sched_set_normal
   cc1: some warnings being treated as errors


vim +508 kernel/rcu/hazptrtorture.c

26cca1d546bd55 Paul E. McKenney 2026-03-24  491  
26cca1d546bd55 Paul E. McKenney 2026-03-24  492  // Randomly preempt online CPUs.
26cca1d546bd55 Paul E. McKenney 2026-03-24  493  static int hazptr_torture_preempt(void *unused)
26cca1d546bd55 Paul E. McKenney 2026-03-24  494  {
26cca1d546bd55 Paul E. McKenney 2026-03-24  495  	int cpu = -1;
26cca1d546bd55 Paul E. McKenney 2026-03-24  496  	DEFINE_TORTURE_RANDOM(rand);
26cca1d546bd55 Paul E. McKenney 2026-03-24  497  
26cca1d546bd55 Paul E. McKenney 2026-03-24  498  	schedule_timeout_idle(onoff_holdoff * HZ);
26cca1d546bd55 Paul E. McKenney 2026-03-24  499  	do {
26cca1d546bd55 Paul E. McKenney 2026-03-24  500  		// Wait for preempt_interval ms with up to 100us fuzz.
26cca1d546bd55 Paul E. McKenney 2026-03-24  501  		torture_hrtimeout_ms(preempt_interval, 100, &rand);
26cca1d546bd55 Paul E. McKenney 2026-03-24  502  		// Select online CPU.
26cca1d546bd55 Paul E. McKenney 2026-03-24  503  		cpu = cpumask_next(cpu, cpu_online_mask);
26cca1d546bd55 Paul E. McKenney 2026-03-24  504  		if (cpu >= nr_cpu_ids)
26cca1d546bd55 Paul E. McKenney 2026-03-24  505  			cpu = cpumask_next(-1, cpu_online_mask);
26cca1d546bd55 Paul E. McKenney 2026-03-24  506  		WARN_ON_ONCE(cpu >= nr_cpu_ids);
26cca1d546bd55 Paul E. McKenney 2026-03-24  507  		// Move to that CPU, if can't do so, retry later.
26cca1d546bd55 Paul E. McKenney 2026-03-24 @508  		if (torture_sched_setaffinity(current->pid, cpumask_of(cpu), false))
26cca1d546bd55 Paul E. McKenney 2026-03-24  509  			continue;
26cca1d546bd55 Paul E. McKenney 2026-03-24  510  		// Preempt at high-ish priority, then reset to normal.
26cca1d546bd55 Paul E. McKenney 2026-03-24  511  		sched_set_fifo(current);
26cca1d546bd55 Paul E. McKenney 2026-03-24  512  		torture_sched_setaffinity(current->pid, cpu_present_mask, true);
26cca1d546bd55 Paul E. McKenney 2026-03-24  513  		mdelay(preempt_duration);
26cca1d546bd55 Paul E. McKenney 2026-03-24  514  		sched_set_normal(current, 0);
26cca1d546bd55 Paul E. McKenney 2026-03-24  515  		stutter_wait("hazptr_torture_preempt");
26cca1d546bd55 Paul E. McKenney 2026-03-24  516  	} while (!torture_must_stop());
26cca1d546bd55 Paul E. McKenney 2026-03-24  517  	torture_kthread_stopping("hazptr_torture_preempt");
26cca1d546bd55 Paul E. McKenney 2026-03-24  518  	return 0;
26cca1d546bd55 Paul E. McKenney 2026-03-24  519  }
26cca1d546bd55 Paul E. McKenney 2026-03-24  520  

:::::: The code at line 508 was first introduced by commit
:::::: 26cca1d546bd557fdda0d8d6000dfcb80da759ab torture: Add a hazptrtorture.c stress test

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
