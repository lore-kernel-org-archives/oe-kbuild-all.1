Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A840A2627E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722298; cv=none; b=WWcWPiovcL7TfRCBe1rr46KyjgEc3b4ewOLHdWuV/4YWlRFd+5q47k8nYmdOtsUSReaJyCiOtVkqdV9nz79fsbFJVXaPn5CRPTrHyCTItplh0wYcr9FrXK+bEXyH6B6YwCSQ9TxrdWJttMvcFrU3KMISylU69yb38d2B3HCsopQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722298; c=relaxed/simple;
	bh=ntpqFFdhTBgfmCKMQvKNmZ9xrAwePOOQkzlNU1o0jls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jTPaBeDEqzN/XY+QvG4ztuXu6Wvb28wu6+Cf34RVN43c2DXliDuNifzHjp943eZ7WtA3LQvhSroDkL/N5BIaYlEL+S+9XmPYGI/6Iqw7bOziuESfpdez+OoRXrfQ8Wd4wZoRWDTnKrEudSDAcgtfiwndOOodf9rS5rwy378vVdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwSaeix3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwSaeix3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741722297; x=1773258297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntpqFFdhTBgfmCKMQvKNmZ9xrAwePOOQkzlNU1o0jls=;
  b=KwSaeix3OmXBaCakNwwMXnHamOh8YQXB7UDKcimIA8vWqYSs5ngcMRnJ
   hSbBRcUmopCbCbhPIPDF1DxJAYA+fLP0kr1iV3RUbR8uyCIeNizPvGPf3
   ArD30P8Z41Bb/YI+7kwmVwOn5yPi2sWALJHcdOWY9Pw39sVUtgHlhBRgE
   XIsfHHhD/rzmKh4qUrBKIKMVHhidTkuXt6c5lIhv8xuj8s4Gfbew+m5Ip
   RvZwNYETttU7oySaQDhGTnTl5ySDYeTOmbJZkM6zotrNu4XwMCkwrlRDe
   SJKKt2ciLL9ZH+Z5iuguFVsRFDrHeTIQKXdlFy1z9L3FDouz4wXp48JcS
   g==;
X-CSE-ConnectionGUID: +E07JQdmRwWp52fpnOldOQ==
X-CSE-MsgGUID: xcXqvVvVT2mEFGkpSdC9AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53773097"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="53773097"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 12:44:53 -0700
X-CSE-ConnectionGUID: jFYQPXvQTWOWHrKBQ6l7Cw==
X-CSE-MsgGUID: VxBfqszoTFWfD5ezcwpVxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125316012"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2025 12:44:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts5Wy-0007mu-2u;
	Tue, 11 Mar 2025 19:44:48 +0000
Date: Wed, 12 Mar 2025 03:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [watchdog-next:v6.15-rc1 1/9] drivers/watchdog/aspeed_wdt.c:257:25:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <202503120357.CvbUNHlI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://www.linux-watchdog.org/linux-watchdog-next.git v6.15-rc1
head:   594e1e368f09cea198f991ab122dd72ed559a383
commit: 5c03f9f4d36292150c14ebd90788c4d3273ed9dc [1/9] watchdog: aspeed: Update bootstatus handling
config: arm-randconfig-r122-20250311 (https://download.01.org/0day-ci/archive/20250312/202503120357.CvbUNHlI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250312/202503120357.CvbUNHlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120357.CvbUNHlI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/aspeed_wdt.c:257:25: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +257 drivers/watchdog/aspeed_wdt.c

   242	
   243	static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
   244						 struct aspeed_wdt *wdt)
   245	{
   246		const struct resource *res;
   247		struct aspeed_wdt_scu scu = wdt->cfg->scu;
   248		struct regmap *scu_base;
   249		u32 reset_mask_width;
   250		u32 reset_mask_shift;
   251		u32 idx = 0;
   252		u32 status;
   253		int ret;
   254	
   255		if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
   256			res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 > 257			idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
   258		}
   259	
   260		scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
   261		if (IS_ERR(scu_base)) {
   262			wdt->wdd.bootstatus = WDIOS_UNKNOWN;
   263			return;
   264		}
   265	
   266		ret = regmap_read(scu_base, scu.reset_status_reg, &status);
   267		if (ret) {
   268			wdt->wdd.bootstatus = WDIOS_UNKNOWN;
   269			return;
   270		}
   271	
   272		reset_mask_width = hweight32(scu.wdt_reset_mask);
   273		reset_mask_shift = scu.wdt_reset_mask_shift +
   274				   reset_mask_width * idx;
   275	
   276		if (status & (scu.wdt_reset_mask << reset_mask_shift))
   277			wdt->wdd.bootstatus = WDIOF_CARDRESET;
   278	
   279		/* clear wdt reset event flag */
   280		if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt") ||
   281		    of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-wdt")) {
   282			ret = regmap_read(scu_base, scu.reset_status_reg, &status);
   283			if (!ret) {
   284				status &= ~(scu.wdt_reset_mask << reset_mask_shift);
   285				regmap_write(scu_base, scu.reset_status_reg, status);
   286			}
   287		} else {
   288			regmap_write(scu_base, scu.reset_status_reg,
   289				     scu.wdt_reset_mask << reset_mask_shift);
   290		}
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
