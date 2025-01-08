Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D236010E4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 05:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736314852; cv=none; b=qM3yI4oxtjImSJBG42xSoGWdEAGLCxOKtekKyYTG/66tpzBfwrYp+NbT1MjUmQfLXHnnt69KYSNaw7w7hrf/ysgbMqxNw0aKovR5Yp0XaXnXXqrIb5elZpjcbDpKCm0hQc2ufom0N+N1G2FZxiqGOw7Ix69SnCI240DKHMqC+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736314852; c=relaxed/simple;
	bh=/L/Q30GP4HDPPjGPOhM49ao+wpNPF8RaBnej/L+If54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQVBk9ZrcmZsRRC6Ie8CgHEtYnpczq3JmFaBh0dtIaAPb8hwsB539OrAQa5BiqcmmqcSuhnkcO5ZvryTMV9wb+mfpV4bdthu/li5K0NaK3TbjmfX5wTs2dAH3bd3jGLUwv2lSL/R/SH7Sm5CbJZn5iQb9eN4phyAfu2HUGQ77ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X19BL2on; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X19BL2on"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736314851; x=1767850851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/L/Q30GP4HDPPjGPOhM49ao+wpNPF8RaBnej/L+If54=;
  b=X19BL2onM5QwbSokpkhQ26J+vgDp6W0b3RCO+zCdVquvCDvRK8fjW3gG
   CSnhvHUMr5u9cAHm3NKGME6oDzEeaQai9YQkQzykS4qd3CZ950auF3uk5
   bK0gXGTTj8SO4BSHLX85B1ZVJAJ4i7VGw0Nmi/on97xcdkPWIE2YUouJh
   JeIf/S2NdvrMikLRe9EMO4Ikc/Ae32WFF9fbrcZWfX/aI52HTfGXeD6Ir
   XEOND+/qI8Bs+TWkcRpHI61Ulsr80sRGF61ZolEVtfYEFT7yq4h8lDkZN
   AxP+3La83CRj7gpAuP9CMfBUjg3cmaSIpjiRCyUGYsffuf2xXmJyy02jd
   w==;
X-CSE-ConnectionGUID: JV0isH3XS9WKsEbgtxVE4g==
X-CSE-MsgGUID: ygsY5FE/SCa1hM+RyKmPCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36407436"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36407436"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 21:40:50 -0800
X-CSE-ConnectionGUID: B81hZP3zTA6rh+JZGWnawg==
X-CSE-MsgGUID: n9nwsctERTyB1e5tPtRGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="107973003"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Jan 2025 21:40:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVOoA-000Fet-1p;
	Wed, 08 Jan 2025 05:40:46 +0000
Date: Wed, 8 Jan 2025 13:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 6430/6768] drivers/watchdog/da9052_wdt.c:176:19:
 error: 'struct da9052' has no member named 'fault_log'
Message-ID: <202501081358.yYrHq3WR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4b9bf203da94fbeac75ed3116c84aa03e74578
commit: 651b5fde35d67a2f669d2c0f5e1b702cac3400b2 [6430/6768] watchdog: da9052_wdt: add support for bootstatus bits
config: x86_64-randconfig-005-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081358.yYrHq3WR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081358.yYrHq3WR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081358.yYrHq3WR-lkp@intel.com/

Note: the linux-next/master HEAD 7b4b9bf203da94fbeac75ed3116c84aa03e74578 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/watchdog/da9052_wdt.c: In function 'da9052_wdt_probe':
>> drivers/watchdog/da9052_wdt.c:176:19: error: 'struct da9052' has no member named 'fault_log'
     176 |         if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
         |                   ^~
   drivers/watchdog/da9052_wdt.c:178:19: error: 'struct da9052' has no member named 'fault_log'
     178 |         if (da9052->fault_log & DA9052_FAULTLOG_TEMPOVER)
         |                   ^~
   drivers/watchdog/da9052_wdt.c:180:19: error: 'struct da9052' has no member named 'fault_log'
     180 |         if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
         |                   ^~


vim +176 drivers/watchdog/da9052_wdt.c

   153	
   154	
   155	static int da9052_wdt_probe(struct platform_device *pdev)
   156	{
   157		struct device *dev = &pdev->dev;
   158		struct da9052 *da9052 = dev_get_drvdata(dev->parent);
   159		struct da9052_wdt_data *driver_data;
   160		struct watchdog_device *da9052_wdt;
   161		int ret;
   162	
   163		driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
   164		if (!driver_data)
   165			return -ENOMEM;
   166		driver_data->da9052 = da9052;
   167	
   168		da9052_wdt = &driver_data->wdt;
   169	
   170		da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
   171		da9052_wdt->info = &da9052_wdt_info;
   172		da9052_wdt->ops = &da9052_wdt_ops;
   173		da9052_wdt->parent = dev;
   174		watchdog_set_drvdata(da9052_wdt, driver_data);
   175	
 > 176		if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
   177			da9052_wdt->bootstatus |= WDIOF_CARDRESET;
   178		if (da9052->fault_log & DA9052_FAULTLOG_TEMPOVER)
   179			da9052_wdt->bootstatus |= WDIOF_OVERHEAT;
   180		if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
   181			da9052_wdt->bootstatus |= WDIOF_POWERUNDER;
   182	
   183		ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
   184					DA9052_CONTROLD_TWDSCALE, 0);
   185		if (ret < 0) {
   186			dev_err(dev, "Failed to disable watchdog bits, %d\n", ret);
   187			return ret;
   188		}
   189	
   190		return devm_watchdog_register_device(dev, &driver_data->wdt);
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
