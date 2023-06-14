Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC7729A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686774828; x=1718310828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x4vnu0CwLyf2Q9EhzlInzRnxJnCCytOc1Vb/rhOgVuc=;
  b=dW3q61zfw1nhT2O/Ms5m8HuOAaqkf4i2uG6djZYVrAcqJgI3f5ZGgOtG
   phpGDgD74VenEZ9wsltyc9d8QbAzgfJfCBmaXneu6RSD/eKkecZ/erFFp
   vY73Rno/DqvFR0LFVApjyh28X+3sugUpLJuGTt7VZ5WTsj8QyFctxRin3
   o1m2SBDZvIsfwgmKviCr3S7LhjeiISLMXlA+C/rZJ6aP1UwtIPyo3gkPT
   go1+Tqq0qT7HF+S0+Bbs1nIanKQhVtKSRmBiinEga2GAYGpUSNu/hztiG
   xTDy/XE7Kt5I07tHFLyVj82PHYjeOw7zgYmPq2rFlZ93QJmOYmUmU3gRf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338363457"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="338363457"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 13:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777412874"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="777412874"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jun 2023 13:33:46 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9XBZ-00013V-2d;
	Wed, 14 Jun 2023 20:33:45 +0000
Date: Thu, 15 Jun 2023 04:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 15111/29850]
 drivers/cpuidle/cpuidle.c:598:27: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202306150412.HDoMlmBB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   7816e65d75d3e618bc0c54a22c9af5472c44d013
commit: 02f88aaaac53929e0cf4fe50f807cdea4b9e224d [15111/29850] ANDROID: GKI: Export symbols arm_cpuidle_suspend, cpuidle_dev and cpuidle_register_governor
config: i386-randconfig-s052-20230614 (https://download.01.org/0day-ci/archive/20230615/202306150412.HDoMlmBB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 02f88aaaac53929e0cf4fe50f807cdea4b9e224d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpuidle/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150412.HDoMlmBB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpuidle/cpuidle.c:598:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct cpuidle_device * @@
   drivers/cpuidle/cpuidle.c:598:27: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   drivers/cpuidle/cpuidle.c:598:27: sparse:     got struct cpuidle_device *
   drivers/cpuidle/cpuidle.c:630:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got struct cpuidle_device * @@
   drivers/cpuidle/cpuidle.c:630:27: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   drivers/cpuidle/cpuidle.c:630:27: sparse:     got struct cpuidle_device *
   In file included from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/clocksource.h:19,
                    from include/linux/clockchips.h:14,
                    from drivers/cpuidle/cpuidle.c:11:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1166:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1166 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1157:27: note: 'mem_section' declared here
    1157 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~

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
