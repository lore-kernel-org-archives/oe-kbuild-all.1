Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A99463
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 06:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IohyyjpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696920907; x=1728456907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbHYI/vZr1I8uqbA0qt7Lc9MvDjmovrQMxIeHwWqscM=;
  b=IohyyjpG1SJ3PU9EVwaOhoiAZKBG6m5Xq3HCbwsfSPf9fR0ilmUnJvbP
   Q21JI3aM1+S45tFP1ttyFSoH8RQlqebYwviqrzZWztqPL3y852uqVDL5d
   rHoNZdNGm4dpAMzSipqd3AcOceB1NLuu9iNgqDml3CieTsLED3XpPg2T6
   ZFgedXpiEaFCbve5ItV69rBMFhx8FUYCpMwauwTbB3Qi+T/sIRD1EMrKs
   XEh6mHtI0fFQ4PupF5Z21gkcARKEWpZLFlGycEvQXnao4J8uNgQepLWdq
   fSWjpaFxFmG3sR9oJGbJYz1ff0EFdG1cF0PvCVYYOZtZQzVd8/7154aAk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="470587888"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="470587888"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 23:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="729975343"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="729975343"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Oct 2023 23:55:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq6dy-00007U-1v;
	Tue, 10 Oct 2023 06:55:02 +0000
Date: Tue, 10 Oct 2023 14:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14239/30000]
 drivers/cpuidle/cpuidle.c:598:27: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202310101431.eQxBgn6M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   5759bbcc0d24a0f84f9021cf06f02a08c4e739fe
commit: 02f88aaaac53929e0cf4fe50f807cdea4b9e224d [14239/30000] ANDROID: GKI: Export symbols arm_cpuidle_suspend, cpuidle_dev and cpuidle_register_governor
config: i386-randconfig-062-20231001 (https://download.01.org/0day-ci/archive/20231010/202310101431.eQxBgn6M-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101431.eQxBgn6M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101431.eQxBgn6M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpuidle/cpuidle.c:598:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct cpuidle_device * @@
   drivers/cpuidle/cpuidle.c:598:27: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   drivers/cpuidle/cpuidle.c:598:27: sparse:     got struct cpuidle_device *
   drivers/cpuidle/cpuidle.c:630:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct cpuidle_device * @@
   drivers/cpuidle/cpuidle.c:630:27: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   drivers/cpuidle/cpuidle.c:630:27: sparse:     got struct cpuidle_device *

vim +598 drivers/cpuidle/cpuidle.c

4f86d3a8e29720 Len Brown      2007-10-03  584  
1c192d047a0ddc Daniel Lezcano 2013-04-23  585  /**
4c637b2175a0dc Daniel Lezcano 2013-04-23  586   * cpuidle_unregister: unregister a driver and the devices. This function
4c637b2175a0dc Daniel Lezcano 2013-04-23  587   * can be used only if the driver has been previously registered through
4c637b2175a0dc Daniel Lezcano 2013-04-23  588   * the cpuidle_register function.
4c637b2175a0dc Daniel Lezcano 2013-04-23  589   *
4c637b2175a0dc Daniel Lezcano 2013-04-23  590   * @drv: a valid pointer to a struct cpuidle_driver
4c637b2175a0dc Daniel Lezcano 2013-04-23  591   */
4c637b2175a0dc Daniel Lezcano 2013-04-23  592  void cpuidle_unregister(struct cpuidle_driver *drv)
4c637b2175a0dc Daniel Lezcano 2013-04-23  593  {
4c637b2175a0dc Daniel Lezcano 2013-04-23  594  	int cpu;
4c637b2175a0dc Daniel Lezcano 2013-04-23  595  	struct cpuidle_device *device;
4c637b2175a0dc Daniel Lezcano 2013-04-23  596  
82467a5a885ddd Daniel Lezcano 2013-06-07  597  	for_each_cpu(cpu, drv->cpumask) {
4c637b2175a0dc Daniel Lezcano 2013-04-23 @598  		device = &per_cpu(cpuidle_dev, cpu);
4c637b2175a0dc Daniel Lezcano 2013-04-23  599  		cpuidle_unregister_device(device);
4c637b2175a0dc Daniel Lezcano 2013-04-23  600  	}
4c637b2175a0dc Daniel Lezcano 2013-04-23  601  
4c637b2175a0dc Daniel Lezcano 2013-04-23  602  	cpuidle_unregister_driver(drv);
4c637b2175a0dc Daniel Lezcano 2013-04-23  603  }
4c637b2175a0dc Daniel Lezcano 2013-04-23  604  EXPORT_SYMBOL_GPL(cpuidle_unregister);
4c637b2175a0dc Daniel Lezcano 2013-04-23  605  

:::::: The code at line 598 was first introduced by commit
:::::: 4c637b2175a0dc65d533494225525c6c82d73293 cpuidle: make a single register function for all

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
