Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D872AF00
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 03:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531026; cv=none; b=Q/ASbjIlMFxYyIWvcsyrHiymIAYeSw+19aJ6+EE4x/WR35iXZKTwRyVnI1aagzGp/Mi94oJqeZIUoVT/BbSsVt38OpyLmcHV/hjsDnLX+7Qn9QKItRYRAaAGhBbvkdrLOIM6CFUwWysbFHFahNinza5J57eBU1T4vkhKvBKWiCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531026; c=relaxed/simple;
	bh=2Kf/Pq+HBmXFMTLZfJjLaKxyHhYRqgn4l5OYPVddUwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uLbvm+w5/mi0T/I37dQa8ZXEbfwTTldFIgAdYXIxgAki4gKLppOYJCv1EmYTKq0JtgN63zDypHCDfaETq7BarzywGXW2oJvNr0VHERRQJR1rNJ+rTWfSTeaugtukU+0tcJQb4wF31xka2RBMtf3CHN7kcMok5DRiAP9257Y3nGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaOiKHp6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaOiKHp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782531025; x=1814067025;
  h=date:from:to:cc:subject:message-id;
  bh=2Kf/Pq+HBmXFMTLZfJjLaKxyHhYRqgn4l5OYPVddUwo=;
  b=kaOiKHp6kdKw81Z/0aiIkjzHdTtb0Ysxe188bYTjPLVyJvXaip7DcOYj
   StYvQk2iTt98ys93DS38pZif94KulflRHzcETToHBtb89CS5kYn+jomkP
   mtzb8x8+Xido7PZLc3XegvirKP7I12stLedICaBUkj/W9Cx/B04K/JzXX
   muA3glDbdn2KFl3uDT7iGXUszL9xS1jyOlrNg1YbzyNiH5EHuDL+DZ8XY
   nzhnFuLLU6Lce3Ar/CB3huda1HdBYjCA9+HUgTThrzI+xg3hoPexbADf1
   tnqNEAMdCExdJMGKUKmm7pcP2zLZDllC3ccrw8fPNzqHy/Xhug0yPWRBo
   Q==;
X-CSE-ConnectionGUID: lEnNfuRHTUuqbugvjCTf1Q==
X-CSE-MsgGUID: XGppgIymQ2q7oVwjT1QzEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="108857633"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="108857633"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 20:30:22 -0700
X-CSE-ConnectionGUID: c6rwghq4RfWA7e1XfzWiAQ==
X-CSE-MsgGUID: S+hSj2VbQBKkI+K1+If5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="274678545"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2026 20:30:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdJkI-000000005b5-13nK;
	Sat, 27 Jun 2026 03:30:18 +0000
Date: Sat, 27 Jun 2026 11:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap-for-next 4/4]
 drivers/firmware/psci/psci_checker.c:213:1: warning: unused label
 'out_free_cpu_groups'
Message-ID: <202606271153.KZx1zvsB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux bitmap-for-next
head:   fb662c4cd25d89f78a447ce79be93765ad9d662d
commit: fb662c4cd25d89f78a447ce79be93765ad9d662d [4/4] psci: simplify hotplug_tests()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260627/202606271153.KZx1zvsB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606271153.KZx1zvsB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606271153.KZx1zvsB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/psci/psci_checker.c:213:1: warning: unused label 'out_free_cpu_groups' [-Wunused-label]
     213 | out_free_cpu_groups:
         | ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/out_free_cpu_groups +213 drivers/firmware/psci/psci_checker.c

7401056de5f8d4 drivers/firmware/psci_checker.c      Sudeep Holla  2018-07-25  184  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  185  static int hotplug_tests(void)
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  186  {
7401056de5f8d4 drivers/firmware/psci_checker.c      Sudeep Holla  2018-07-25  187  	int i, nb_cpu_group, err = -ENOMEM;
7401056de5f8d4 drivers/firmware/psci_checker.c      Sudeep Holla  2018-07-25  188  	cpumask_var_t offlined_cpus, *cpu_groups;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  189  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  190  	if (!alloc_cpumask_var(&offlined_cpus, GFP_KERNEL))
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  191  		return err;
7401056de5f8d4 drivers/firmware/psci_checker.c      Sudeep Holla  2018-07-25  192  
7401056de5f8d4 drivers/firmware/psci_checker.c      Sudeep Holla  2018-07-25  193  	nb_cpu_group = alloc_init_cpu_groups(&cpu_groups);
7401056de5f8d4 drivers/firmware/psci_checker.c      Sudeep Holla  2018-07-25  194  	if (nb_cpu_group < 0)
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  195  		goto out_free_cpus;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  196  	/*
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  197  	 * Of course the last CPU cannot be powered down and cpu_down() should
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  198  	 * refuse doing that.
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  199  	 */
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  200  	pr_info("Trying to turn off and on again all CPUs\n");
132330f8044c8e drivers/firmware/psci/psci_checker.c Gavin Shan    2020-06-30  201  	err = down_and_up_cpus(cpu_online_mask, offlined_cpus);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  202  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  203  	/*
dff4113d5e3753 drivers/firmware/psci_checker.c      Sudeep Holla  2018-01-10  204  	 * Take down CPUs by cpu group this time. When the last CPU is turned
dff4113d5e3753 drivers/firmware/psci_checker.c      Sudeep Holla  2018-01-10  205  	 * off, the cpu group itself should shut down.
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  206  	 */
dff4113d5e3753 drivers/firmware/psci_checker.c      Sudeep Holla  2018-01-10  207  	for (i = 0; i < nb_cpu_group; ++i) {
fb662c4cd25d89 drivers/firmware/psci/psci_checker.c Yury Norov    2026-05-28  208  		pr_info("Trying to turn off and on again group %d (CPUs %*pbl)\n",
fb662c4cd25d89 drivers/firmware/psci/psci_checker.c Yury Norov    2026-05-28  209  			i, cpumask_pr_args(cpu_groups[i]));
dff4113d5e3753 drivers/firmware/psci_checker.c      Sudeep Holla  2018-01-10  210  		err += down_and_up_cpus(cpu_groups[i], offlined_cpus);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  211  	}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  212  
dff4113d5e3753 drivers/firmware/psci_checker.c      Sudeep Holla  2018-01-10 @213  out_free_cpu_groups:
7401056de5f8d4 drivers/firmware/psci_checker.c      Sudeep Holla  2018-07-25  214  	free_cpu_groups(nb_cpu_group, &cpu_groups);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  215  out_free_cpus:
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  216  	free_cpumask_var(offlined_cpus);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  217  	return err;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  218  }
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky 2016-11-08  219  

:::::: The code at line 213 was first introduced by commit
:::::: dff4113d5e3753c23e8b5bb6818f5829ccd0d06a drivers: psci: remove cluster terminology and dependency on physical_package_id

:::::: TO: Sudeep Holla <Sudeep.Holla@arm.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
