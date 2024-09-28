Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21912157490
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727521336; cv=none; b=OZ2E7rXY0b4VivyP5fujn9IdaQn+RrbhU2wJ87Ov1H1qqRUMkAiSYoOg0CVLXmbZ4znmfqiY8sXsekWJywckB/slobPXX1Q0mR5kv15ZJcF+vnSL2l3WjnJpgakbrNaskxLnkcR4hQdeNtdB3ht7GPz6ZSjqrPkXrQLa1R6fFck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727521336; c=relaxed/simple;
	bh=VbnYjbdQk5zKMkZNg/wplcY/vJfwgEJo7DkHzAwYOPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1G2VBUZCdOPItsUSxuWGm2MU7bY90jJVAOwntwnYtYeyM6X+2XYtXC+TCQ9wbSvqLBMSAyg4YP46wK8vwm98erD0QOeJhL3i4xdghcauXcWTgXFczdk19WF2ISmYQg8l2KZsexaIc7PbbinVBdlmVD9OLB7VyWmrXUjPnV7KXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ejed0zWV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ejed0zWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727521334; x=1759057334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VbnYjbdQk5zKMkZNg/wplcY/vJfwgEJo7DkHzAwYOPQ=;
  b=Ejed0zWVcf/21jxpBH+LB0AruXN5KHLMa05WZZUOKO6czsQR8Cjjpvk6
   Kp8UMzyPXf/rFFfhONZWpnuwk2K5NCLpJ7UREEEfNUjAV8bHsuzfz+kgh
   rgiWAUKcajhOwOmwB1ho0bp6g9iW+rPUTMJBPAgDi6/Ifi2slNomrZZTR
   MP7/JyupkQtWU+XHkKR4uhrwOO0hXVG/ZSoldq9wd8QPD/Ez89ScmUWkx
   CSQm7mXNG8oiPiMP+WibEOIfLmyXZVFNS93PgNoplWHOGyAn3QgRZJjX2
   2Yg6oj4MSssXim/+8YlRuvpU5mYj6Z8onL47BShVnW0LUqvzRKwy2c6NV
   g==;
X-CSE-ConnectionGUID: ERfRUpheSpCQ7A7kA6rOKg==
X-CSE-MsgGUID: UaXev7wyQEuszDYDvh047A==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30451527"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30451527"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:02:13 -0700
X-CSE-ConnectionGUID: 8Ko3OqLST1Wf/eZs6E9pnw==
X-CSE-MsgGUID: Z9G29misTn+7G0XbazWULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77576979"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2024 04:02:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVDG-000NCT-1e;
	Sat, 28 Sep 2024 11:02:10 +0000
Date: Sat, 28 Sep 2024 19:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 13/16788]
 drivers/base/power/domain.c:257:6: warning: no previous prototype for
 'pm_genpd_disable_clks'
Message-ID: <202409281837.Kgba1zax-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281837.Kgba1zax-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281837.Kgba1zax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281837.Kgba1zax-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:257:6: warning: no previous prototype for 'pm_genpd_disable_clks' [-Wmissing-prototypes]
     257 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/base/power/domain.c:263:5: warning: no previous prototype for 'pm_genpd_enable_clks' [-Wmissing-prototypes]
     263 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/base/power/domain.c:1194: warning: Function parameter or member 'need_disable_clk' not described in 'genpd_sync_power_off'
>> drivers/base/power/domain.c:1260: warning: Function parameter or member 'pd_was_on' not described in 'genpd_sync_power_on'


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
