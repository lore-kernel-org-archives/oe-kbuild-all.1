Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700C3CAA57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172833; cv=none; b=kL2JwOwcRXYaeD0JDJ/tyhkehZSDa6sZ6J8KY4yICTQMU2HvRWpeIaC3t5aTJIYaXfUdvqjkMFAt8cG9YIdJ+5wIA7R0upiHaIiulsz9ETHxbt4/nNRUr0FO+ljHPaK6WhtXx66TREVC3b4zWNMggBLF5HLlDbkBQoRIKvGlEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172833; c=relaxed/simple;
	bh=IhooDPMCfP3ba/vnIV56QDU8wMJgpa/JFS+wKb3oGv0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qg0PWcEulVVGhj3W7XP2d2BFtoM2CawQ0OA1U9MhMkZgosk3b/5TEYZAkW8TBiksGQRZAvSRYwftJD2fkUDC6TUDabjmjhmiuv+RzOSzP0m5r1PebGwyekVeYafVsDbEh/2UM7IJHfo0DpRWICnsFQKzvSBVr4ojO9BOm0D0D+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVi/ZUki; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVi/ZUki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781172831; x=1812708831;
  h=date:from:to:cc:subject:message-id;
  bh=IhooDPMCfP3ba/vnIV56QDU8wMJgpa/JFS+wKb3oGv0=;
  b=WVi/ZUkiJJ654Q1NBnuGfST5VAEBKf2It4Y3F+t0zZoL575UI8PV3pbL
   F5AqN4kCv8R7guZpH8IyaqdfEu3QMOZufCSfntdw5oSWQ7SjbmvdndUHN
   t8PjEeR1qR8wmFzF7mb763I6q/B1lgs3tllZ7lN7VIASfmYrBZFFmcsIP
   d0vsHMUFRQOxriwIHP40l/aphFSI0jfHUu1CMAQFn1dQKgrUjSJX71hlJ
   H42N4sQPHfwsL/oRPZ6Jo1zRmclLCTU+IEHApCc/KXaL3WjLg1RuGyi+7
   z3cH+8B/o9zwKvRUDsYdaRhqTkZGigy1qJLMyzpaCMQS5yYCModfakeTE
   g==;
X-CSE-ConnectionGUID: VWw9I63sQ7GFCalvgfnWSA==
X-CSE-MsgGUID: 2phtGI2kS+mTLdXdzWrpkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82175244"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82175244"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 03:13:51 -0700
X-CSE-ConnectionGUID: 98E5DSzuR/KNmX8Bm5HTVA==
X-CSE-MsgGUID: AdM81or/Sv+GAljB3s0Ljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242013716"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jun 2026 03:13:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXcQ0-000000003zZ-0nm7;
	Thu, 11 Jun 2026 10:13:48 +0000
Date: Thu, 11 Jun 2026 12:13:23 +0200
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:next 12/12] drivers/pmdomain/core.c:36:23: warning:
 'genpd_provider_bus' defined but not used
Message-ID: <202606111231.dpbBwWC0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
head:   ea1ca762328194de780a8e92df0b2e41bf6eeed2
commit: ea1ca762328194de780a8e92df0b2e41bf6eeed2 [12/12] pmdomain: fix early domain registration
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260611/202606111231.dpbBwWC0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111231.dpbBwWC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111231.dpbBwWC0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:36:23: warning: 'genpd_provider_bus' defined but not used [-Wunused-variable]
      36 | static struct device *genpd_provider_bus;
         |                       ^~~~~~~~~~~~~~~~~~


vim +/genpd_provider_bus +36 drivers/pmdomain/core.c

31cb75077003ac Ulf Hansson  2025-07-01  34  
31cb75077003ac Ulf Hansson  2025-07-01  35  /* The parent for genpd_provider devices. */
a96e40f4afdcb5 Johan Hovold 2026-04-24 @36  static struct device *genpd_provider_bus;
31cb75077003ac Ulf Hansson  2025-07-01  37  

:::::: The code at line 36 was first introduced by commit
:::::: a96e40f4afdcb52a9c97a5465c964e010734d105 pmdomain: core: switch to dynamic root device

:::::: TO: Johan Hovold <johan@kernel.org>
:::::: CC: Ulf Hansson <ulfh@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
