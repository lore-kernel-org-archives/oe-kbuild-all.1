Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C025A1FA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 19:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yr+N3XbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697311538; x=1728847538;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5xGzUMKEIjd4kmkpm2Yw9eGeJupmA8kFe0x53fYkz14=;
  b=Yr+N3XbAJNp+0PQNUXcGbt8MYVHCHepC70/g7+396gBHAnOkxER1EF/k
   U4nHoa2u1ArRCWYWHzEElh1g2tCetw3WwhPetFcmLsbx7LzfP3K355xPv
   DveIbKW+KFUqGPZS25P+C0D2/H9d1E6sbZQ5lDO880mYdHjlJ7GZN01Fy
   sQ/Ayq3UdFVZYgwz0JBZpT9q05GIPUEeouQXz7HRqEHa9Q73jk4DpUBAy
   ZwR5AeFnrHjlFg3nfcUL+2JEArl7bJOEHALSfU9hq4hCA123vzLeCDSHJ
   mpd7ukqvtmZv9kISdRCNJlGNLt/j+qrBxG5mJfaPz18ZNxl8sWMhF6CRo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375696283"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375696283"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 12:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="845875438"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="845875438"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2023 12:25:28 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrkGM-0006Z9-1X
	for oe-kbuild-all@lists.linux.dev;
	Sat, 14 Oct 2023 19:25:26 +0000
Date: Sun, 15 Oct 2023 03:24:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_t 14278/30000]
 drivers/cpuidle/cpuidle.c:598:27: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202310150330.38bM2G2h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 02f88aaaac53929e0cf4fe50f807cdea4b9e224d [14278/30000] ANDROID: GKI: Export symbols arm_cpuidle_suspend, cpuidle_dev and cpuidle_register_governor
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231015/202310150330.38bM2G2h-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150330.38bM2G2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150330.38bM2G2h-lkp@intel.com/

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
