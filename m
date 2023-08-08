Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC8171C2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 21:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691529497; x=1723065497;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UdCNwhS0tvWJ8GeeeFa7qYhqzfGuZGLjDjG4xF/V4Yg=;
  b=n94/BrSwpqOzfg96b77vq8DUPDWQdvpCsz4MlmzJCdRd+E+Ts/183C4J
   F4LGNtXvo7TTyE0kMIuuEXLZ4epQzoGckiUnMG6h8qFSxiDLpCPoQ7H7D
   djLZpZPMvftEsHI1CDsDWNCcCClTCa1fk1Cj2sRgBNm4Lrddvwza0vEDp
   HL1IKHOjaU+74YNj/aFN4UoSuIFeXFWS0rq29I3E0fH9rx0aDZyruQhFF
   S5FT/fADnupr/2+HamCQVUbezXyTtBQRNtx1i8O6LlQHcsBEL6KkPlrXV
   bdsr7GIhEo9gGoa43G2xB/1f1yfej57u8nJuKrdg8slUoe8VB9I7Kf3Vz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361075997"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="361075997"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 14:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708431236"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="708431236"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Aug 2023 14:18:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTU5m-0005dE-2e
	for oe-kbuild-all@lists.linux.dev;
	Tue, 08 Aug 2023 21:18:14 +0000
Date: Wed, 9 Aug 2023 05:18:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 14806/30000]
 drivers/cpuidle/cpuidle.c:598:27: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202308090518.6XkDOWCf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: 02f88aaaac53929e0cf4fe50f807cdea4b9e224d [14806/30000] ANDROID: GKI: Export symbols arm_cpuidle_suspend, cpuidle_dev and cpuidle_register_governor
config: x86_64-randconfig-r071-20230807 (https://download.01.org/0day-ci/archive/20230809/202308090518.6XkDOWCf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090518.6XkDOWCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090518.6XkDOWCf-lkp@intel.com/

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
