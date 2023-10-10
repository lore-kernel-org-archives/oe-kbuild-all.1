Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5032C9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krk/HebR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696980593; x=1728516593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2vllLN8rPndHPxI/xkfhcTDRxNTYHq2VQ1nnFMokqj8=;
  b=krk/HebRTtO9FVSrhS1QgbNGElxsZ1IAkF9ShfKZWTNY6f1hD7w+vkWE
   8kE984dP6bzfGWabB1aODbD9qL9AG1MattHJ8YvA5NolodSEziW2izZ/J
   Q7IyI5XnQ2o4Os/OmgOq1ff6lDstuA+FAlig4nsMoF6Wz1LAurxvEGs9k
   TWfMTLuAlmY/Isl9zrLY6quLKii+g0m2lapk/gkE1IdJfOoPPXcKF+dJB
   8yllgqeWX5nPmZnmfsDsRuJhvUjgsVeuuGdLUGoiNLWtXfB6DMfrdyJv9
   RTf6Lm9zCKs3OGvspd8qy4ILFXJGoqy4o76KhNbpK+U11hkSqHNL5FLdT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6098275"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6098275"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 16:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788765041"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="788765041"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 16:29:38 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqMAS-0001Nc-2V;
	Tue, 10 Oct 2023 23:29:36 +0000
Date: Wed, 11 Oct 2023 07:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14239/30000]
 drivers/cpuidle/cpuidle.c:598:27: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202310110725.w2vqQvUl-lkp@intel.com>
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
config: i386-randconfig-062-20231001 (https://download.01.org/0day-ci/archive/20231011/202310110725.w2vqQvUl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110725.w2vqQvUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110725.w2vqQvUl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpuidle/cpuidle.c:598:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct cpuidle_device * @@
   drivers/cpuidle/cpuidle.c:598:27: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   drivers/cpuidle/cpuidle.c:598:27: sparse:     got struct cpuidle_device *
   drivers/cpuidle/cpuidle.c:630:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct cpuidle_device * @@
   drivers/cpuidle/cpuidle.c:630:27: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   drivers/cpuidle/cpuidle.c:630:27: sparse:     got struct cpuidle_device *

vim +598 drivers/cpuidle/cpuidle.c

4f86d3a8e297205 Len Brown      2007-10-03  584  
1c192d047a0ddc8 Daniel Lezcano 2013-04-23  585  /**
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  586   * cpuidle_unregister: unregister a driver and the devices. This function
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  587   * can be used only if the driver has been previously registered through
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  588   * the cpuidle_register function.
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  589   *
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  590   * @drv: a valid pointer to a struct cpuidle_driver
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  591   */
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  592  void cpuidle_unregister(struct cpuidle_driver *drv)
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  593  {
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  594  	int cpu;
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  595  	struct cpuidle_device *device;
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  596  
82467a5a885ddd9 Daniel Lezcano 2013-06-07  597  	for_each_cpu(cpu, drv->cpumask) {
4c637b2175a0dc6 Daniel Lezcano 2013-04-23 @598  		device = &per_cpu(cpuidle_dev, cpu);
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  599  		cpuidle_unregister_device(device);
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  600  	}
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  601  
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  602  	cpuidle_unregister_driver(drv);
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  603  }
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  604  EXPORT_SYMBOL_GPL(cpuidle_unregister);
4c637b2175a0dc6 Daniel Lezcano 2013-04-23  605  

:::::: The code at line 598 was first introduced by commit
:::::: 4c637b2175a0dc65d533494225525c6c82d73293 cpuidle: make a single register function for all

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
