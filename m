Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DDE187344
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727532683; cv=none; b=E1bw4059rlrObaF/uRBiDTt8V0gE63cPLaUlfHnds9qL/H1b75TjpZR/RTv8MmW0xinVnROVh+15FQ5d9wS+Ms/vPChBMpUvN4O/nK+8I+8U1skbJrGXUmzrPH2Kw9GA+BXAkNlDi1LzaFDiGoJE69jjaCn6533fDjf9aj/w2PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727532683; c=relaxed/simple;
	bh=ED2rovXM/VRY7PSOyQ0boNng3OIkqba7o1QwhBTRg4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GamVQ5/G14RMq7j6ukXNrHzcibUotMCxk3Y0c5ztxE3qYNUoKMv6UyEXh+Dn5ymRHfPZrx1Fd1LoZsiXs9c99E0sjx+QxZhXq0AVJKLdfG4sfO+eH8EdSMo8T89PUk9CYp/vR/N/Z4zxx5TJI1adXyDmvJgMFgm7u+MFdj+l9I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRM1f4b7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRM1f4b7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727532682; x=1759068682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ED2rovXM/VRY7PSOyQ0boNng3OIkqba7o1QwhBTRg4w=;
  b=XRM1f4b77eZ6VcnSxAnTg9+x0paA7llrYrb6Oignn0tCslnBOGOweP7l
   1PrYTK1J+A+P5hWEftoEt5m6ipWhFRXeOtAGClqYmXnHfVuyODIpEv0Rd
   PptqYfqnYALvRU2+4K4bSVzhAUK/w4AkksSurKhHQYYhUXe+cr3Z9MPGj
   2NoN5LvHiJ08Q5W+AlHsQqsmfpB5u895sy0u8CqCxRZwaCJTWffM3neRu
   acg0XR1/zhEgT9aYdIFeIb/9Hvg0+Von9TJs5S6fLlN5VfMC0eXapWXZH
   XcPqsrQY9C4utX0CqPiFHreJ2zCQ88toGOJU2KCxft/woO0zvXhrML6SH
   A==;
X-CSE-ConnectionGUID: +5QQeF3FT0WY0ST70RZsLw==
X-CSE-MsgGUID: OTjnQ7a8R+Cr5bNaP2092Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26829364"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26829364"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 07:11:18 -0700
X-CSE-ConnectionGUID: z9FbSCXCSq2h1Z6Og57d1Q==
X-CSE-MsgGUID: E+agTbXORDydOgn8PfAL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73139378"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 07:11:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYAE-000NJN-0s;
	Sat, 28 Sep 2024 14:11:14 +0000
Date: Sat, 28 Sep 2024 22:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 13/16788]
 drivers/base/power/domain.c:257:6: warning: no previous prototype for
 function 'pm_genpd_disable_clks'
Message-ID: <202409282235.sh5aezAF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 311faeaf28ab464f78586f417d5b7c6a8928c281 [13/16788] LF-4713-1 PM: domains: add pm domain clocks support
config: i386-buildonly-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282235.sh5aezAF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282235.sh5aezAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282235.sh5aezAF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:257:6: warning: no previous prototype for function 'pm_genpd_disable_clks' [-Wmissing-prototypes]
     257 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         |      ^
   drivers/base/power/domain.c:257:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     257 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         | ^
         | static 
>> drivers/base/power/domain.c:263:5: warning: no previous prototype for function 'pm_genpd_enable_clks' [-Wmissing-prototypes]
     263 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         |     ^
   drivers/base/power/domain.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     263 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         | ^
         | static 
   2 warnings generated.


vim +/pm_genpd_disable_clks +257 drivers/base/power/domain.c

   256	
 > 257	void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   258	{
   259		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0)
   260			clk_bulk_disable_unprepare(genpd->num_clks, genpd->clks);
   261	}
   262	
 > 263	int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   264	{
   265		int ret;
   266	
   267		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0) {
   268			ret = clk_bulk_prepare_enable(genpd->num_clks, genpd->clks);
   269			if (ret) {
   270				dev_err(&genpd->dev, "failed to enable clocks\n");
   271				return ret;
   272			}
   273		}
   274	
   275		return 0;
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
