Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1B91DE4F6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751902559; cv=none; b=Xp9sPLn45WKzSWSONrplx/S1KXAGqKZzNBdKWIxuLRkThIfpjmbqXx563lMmkPAPunZwO108bPRmI9NltNjD9Ont6332WIC/DVYvsjikMVSdmhBtYPP9Kjs49xsv6JiVSKLFKuo2Eawym0o8fsimEd4SysIKxBb0oe7MOUMFZbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751902559; c=relaxed/simple;
	bh=04XrOVJieQP24oLS5S2Gd9f1rA77D/0miegTHpLm2s8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t6t7l4oA5Er5JqEZeNMuEWyqbA+6Z+wRrMvjHJdD94ACjgFFotrDEJkVWnfwDeNcX0IAtGxLTruo+QUzw33YlaT35GpWDMoS3BOoS29yv6odMKhhGwnYnwAs4PzRgal4he9RJrIgZCQuJdZGM3iQPmYgCbK4swoRXMQhVCB0yTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nl4d1cn2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nl4d1cn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751902558; x=1783438558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04XrOVJieQP24oLS5S2Gd9f1rA77D/0miegTHpLm2s8=;
  b=Nl4d1cn2RRkEcVHPjudNAYCkKmC0u86N2TN4CRr55ZcQ0f+BfTscG6vh
   dzQhuT24coE6zH+8p9yCxKPmvT4WJIkBuLzRFTW3a3pkVdMfCfxVZspOH
   +bi/7JPwEvk1PANx8jrJfWNCvVHwQnd6JtNFkoFxPg5iJpIQx90GgUR/M
   CkOzZHsFsGZBv/0sMBDrwXGZlrs/csfBbyZGSXywJQz4BT7je4swyxPqa
   z1TXSjNgtkdow0l1Iy81K4Bz02z+Msdzi7Mm0iSzI2JExpd9r8cXxCTtD
   Q6z8BCflz2uNqXkIhMrVVBWdWYkr1mH7/Nx1nDUzAhx1rUE7SWKLfwyf5
   g==;
X-CSE-ConnectionGUID: 55AuKAprT4eZgZxEKcBI2w==
X-CSE-MsgGUID: Gp+lDbn3RpurkVIbkEXUGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57896676"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="57896676"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 08:35:56 -0700
X-CSE-ConnectionGUID: lOBiJgryQ9uvITXN1aksdw==
X-CSE-MsgGUID: 1N+uQ/dAQnu6T2j96UKElg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="186268488"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2025 08:35:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYnsn-0000Un-1O;
	Mon, 07 Jul 2025 15:35:53 +0000
Date: Mon, 7 Jul 2025 23:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: [sudeep-holla:for-next/scmi/updates 5/6]
 drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend' undeclared
 here (not in a function)
Message-ID: <202507072359.Hfy79Adu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/scmi/updates
head:   2b051f8be2f4a2dec91e6bce12e515f2a17001bd
commit: f9a301ca0e82d0bb923cddde667c4a035b8a23e9 [5/6] firmware: arm_scmi: Add power management operations to SCMI bus
config: i386-buildonly-randconfig-006-20250707 (https://download.01.org/0day-ci/archive/20250707/202507072359.Hfy79Adu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507072359.Hfy79Adu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507072359.Hfy79Adu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:36,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/firmware/arm_scmi/bus.c:12:
>> drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend' undeclared here (not in a function)
     349 |         .suspend = pm_sleep_ptr(scmi_pm_suspend),
         |                                 ^~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/firmware/arm_scmi/bus.c:349:20: note: in expansion of macro 'pm_sleep_ptr'
     349 |         .suspend = pm_sleep_ptr(scmi_pm_suspend),
         |                    ^~~~~~~~~~~~
>> drivers/firmware/arm_scmi/bus.c:350:32: error: 'scmi_pm_resume' undeclared here (not in a function)
     350 |         .resume = pm_sleep_ptr(scmi_pm_resume),
         |                                ^~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/firmware/arm_scmi/bus.c:350:19: note: in expansion of macro 'pm_sleep_ptr'
     350 |         .resume = pm_sleep_ptr(scmi_pm_resume),
         |                   ^~~~~~~~~~~~


vim +/scmi_pm_suspend +349 drivers/firmware/arm_scmi/bus.c

   347	
   348	static const struct dev_pm_ops scmi_dev_pm_ops = {
 > 349		.suspend = pm_sleep_ptr(scmi_pm_suspend),
 > 350		.resume = pm_sleep_ptr(scmi_pm_resume),
   351	};
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
