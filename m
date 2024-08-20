Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FAC4595B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724144669; cv=none; b=Yxi3i1ugsA56nHYVJHo2OktQiAT0AUGsP6tX/AJAzAlDN8lnZesEUBJh3ZbE+zyE8+vn8GLAHDdQ7GOvbIYPKWGZtYrvnB/Rys2M8HJUL1hJ1NPtRMB/CtJrPGtxvZakwZfexbg3Q67G+Bldvk29hrS+mZJCtLk8hxwF2hTvhDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724144669; c=relaxed/simple;
	bh=WDqggpL4kAMziO8dKYV4BDPF/Tl2laAZD2TWQtnopYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQsoaEkS7Mgd8+yivR6ipcDxaeCEqoR8fu4PmWoojIvmj0mQ8fazuJZq7+wIrQGQBYZKtnp6BXdfKFFqsO1CkLgNENfheiszKu3yutXtD6cEzEP+UY3bAtEELeG6VyGq26fYgp+PPwHBgFH/EHxHWLCH+MaJRDqEKsB3htaAgz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBVgJg3N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBVgJg3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724144668; x=1755680668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WDqggpL4kAMziO8dKYV4BDPF/Tl2laAZD2TWQtnopYM=;
  b=DBVgJg3NzEd5bu3ztPUTrqHGfcpAtfotT7q0ScqAcJICmEyU0+HM1exR
   pswHq3UPR71SEG+mG6xQMwlwBOsGqykM1DA54f+s0fnzM/aUbpIW/jcqg
   fc/zjot/J3HSaTbcw4uLBGPVCTCdGxgLsV1a6B2Oq4XYis+M+MP6cPTKL
   AIHFxXzJQEVc087wQ7qkeGKopUZ7laAhDoaB4ptOzUkydd0pC0aLBJmdM
   UznAAk0uyCJxsHRwa7qalihG7EexlhBEXy6ACRaJENYFtrwAl6GQc3dl3
   DojICsu3aQFaHJyHv0ub5mT9bdQU/VT3Ki7ilubrK4Dh72x7xbuCUWZu2
   A==;
X-CSE-ConnectionGUID: WoJ0wcl6RjakWTl7HiBvKQ==
X-CSE-MsgGUID: crrjR+thQteI5+ay681hAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22238962"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="22238962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 02:04:27 -0700
X-CSE-ConnectionGUID: lxK0+Mm7TiOXeKiy3r8Wcw==
X-CSE-MsgGUID: xBvVyObrQJGA4483zrDC2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="60630933"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2024 02:04:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgKmt-0009wQ-2V;
	Tue, 20 Aug 2024 09:04:23 +0000
Date: Tue, 20 Aug 2024 17:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/3] pmdomain: ti_sci: add per-device latency
 constraint management
Message-ID: <202408201632.9qHLn6R2-lkp@intel.com>
References: <20240819-lpm-v6-10-constraints-pmdomain-v2-1-461325a6008f@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819-lpm-v6-10-constraints-pmdomain-v2-1-461325a6008f@baylibre.com>

Hi Kevin,

kernel test robot noticed the following build errors:

[auto build test ERROR on ad7eb1b6b92ee0c959a0a6ae846ddadd7a79ea64]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Hilman/pmdomain-ti_sci-add-per-device-latency-constraint-management/20240820-080207
base:   ad7eb1b6b92ee0c959a0a6ae846ddadd7a79ea64
patch link:    https://lore.kernel.org/r/20240819-lpm-v6-10-constraints-pmdomain-v2-1-461325a6008f%40baylibre.com
patch subject: [PATCH v2 1/3] pmdomain: ti_sci: add per-device latency constraint management
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240820/202408201632.9qHLn6R2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201632.9qHLn6R2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201632.9qHLn6R2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/ti/ti_sci_pm_domains.c: In function 'ti_sci_pd_set_lat_constraint':
>> drivers/pmdomain/ti/ti_sci_pm_domains.c:68:26: error: 'const struct ti_sci_ops' has no member named 'pm_ops'
      68 |         ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val, TISCI_MSG_CONSTRAINT_SET);
         |                          ^
>> drivers/pmdomain/ti/ti_sci_pm_domains.c:68:70: error: 'TISCI_MSG_CONSTRAINT_SET' undeclared (first use in this function)
      68 |         ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val, TISCI_MSG_CONSTRAINT_SET);
         |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/ti/ti_sci_pm_domains.c:68:70: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pmdomain/ti/ti_sci_pm_domains.c: In function 'ti_sci_pm_domain_probe':
   drivers/pmdomain/ti/ti_sci_pm_domains.c:236:61: error: 'const struct ti_sci_ops' has no member named 'pm_ops'
     236 |                                 if (pd_provider->ti_sci->ops.pm_ops.set_device_constraint &&
         |                                                             ^
   drivers/pmdomain/ti/ti_sci_pm_domains.c:237:61: error: 'const struct ti_sci_ops' has no member named 'pm_ops'
     237 |                                     pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
         |                                                             ^


vim +68 drivers/pmdomain/ti/ti_sci_pm_domains.c

    60	
    61	static int ti_sci_pd_set_lat_constraint(struct device *dev, s32 val)
    62	{
    63		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
    64		struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
    65		const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
    66		int ret;
    67	
  > 68		ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val, TISCI_MSG_CONSTRAINT_SET);
    69		if (ret)
    70			dev_err(dev, "ti_sci_pd: set latency constraint failed: ret=%d\n",
    71				ret);
    72		else
    73			dev_dbg(dev, "ti_sci_pd: ID:%d set latency constraint %d\n",
    74				pd->idx, val);
    75	
    76		return ret;
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
