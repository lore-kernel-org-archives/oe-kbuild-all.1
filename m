Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF218C924
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391650; cv=none; b=YdZ7IhsOqEItsIZLuIfGV26wmd38LeK0QJbpP+fx4+OsuzHz813+BonvYooRwH3f0qSc8gDp06e1Y30/29zEqkgepUWs7hALoUZL0aQTG1xcsra6PVbCm7mB5lNY9CbZmGg2BK0rbgpS8zgr3yC94wCNyENqQesdI7uMnffU+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391650; c=relaxed/simple;
	bh=YhoMCA9TvYqWKrOv9t43YooyguplUNSkT2l3nIFDGa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EU6yqLyEVLy1dNzMJcvkVnao9EHL7cIYr3mpzlop9i5DS/9+f1mTtjolPvD1NTA1FKVlQvbtbrWJ4G9N+AETY1A354UOz0MrIab6owQGIgNuK6smcO/1Tk2GJSw7H8am0K8cbQ//luyw6m0leYDQ2sHbZydtGU97yzKCQtOAx7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJzPf8B5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJzPf8B5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740391648; x=1771927648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhoMCA9TvYqWKrOv9t43YooyguplUNSkT2l3nIFDGa8=;
  b=WJzPf8B5Ky1jHLzABRSmR2Ro8/a2KtmO5wx9U7/6PoSR3ReRMJNAFqMI
   4R42wj7vXVZ1C4A401lVSWx7l+i/AqdfpHWE5inETRNuE0tpjY4/C8a2F
   S/78uBGrTUGdzDBOwYqNi801H/62gbij3no3uVGoqaz+7Ogsk79cd8Usi
   nAQY9DcLd0Bp8UqptyiEZ5cGIiPvkrXoTknkAIflwtHizuOhKCiKG8aRO
   ssVZJ4/6UgH4TFwDNhj5FLt3zkJYWqdKuWcFoWMRyl3vrBcVs3wdQOV/t
   IL0XYWBYqi33lWoOSQc2g0107wR98dghE7QB5dRZptRCB8qrapyKYRjoP
   w==;
X-CSE-ConnectionGUID: sfDmj8uLTT+v2iBbvehPuQ==
X-CSE-MsgGUID: CHmX4zn8S1qPLv2VA/fKCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="28736968"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="28736968"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:07:28 -0800
X-CSE-ConnectionGUID: eVJykmziQbSOCjArXeH1Kg==
X-CSE-MsgGUID: XaqysoxVQ0eAmO0uOCD7Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116513261"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2025 02:07:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmVMy-00089U-1i;
	Mon, 24 Feb 2025 10:07:24 +0000
Date: Mon, 24 Feb 2025 18:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [ulfh-pm:rockchip 4/4]
 drivers/pmdomain/rockchip/pm-domains.c:575:undefined reference to
 `arm_smccc_1_1_get_conduit'
Message-ID: <202502241736.7ilfo582-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git rockchip
head:   61eeb9678789644f118eff608d9031b5de4f719d
commit: 61eeb9678789644f118eff608d9031b5de4f719d [4/4] pmdomain: rockchip: Check if SMC could be handled by TA
config: powerpc-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241736.7ilfo582-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241736.7ilfo582-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241736.7ilfo582-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/pmdomain/rockchip/pm-domains.o: in function `rockchip_do_pmu_set_power_domain':
>> drivers/pmdomain/rockchip/pm-domains.c:575:(.text+0x1c9c): undefined reference to `arm_smccc_1_1_get_conduit'


vim +575 drivers/pmdomain/rockchip/pm-domains.c

   537	
   538	static void rockchip_do_pmu_set_power_domain(struct rockchip_pm_domain *pd,
   539						     bool on)
   540	{
   541		struct rockchip_pmu *pmu = pd->pmu;
   542		struct generic_pm_domain *genpd = &pd->genpd;
   543		u32 pd_pwr_offset = pd->info->pwr_offset;
   544		bool is_on, is_mem_on = false;
   545		struct arm_smccc_res res;
   546	
   547		if (pd->info->pwr_mask == 0)
   548			return;
   549	
   550		if (on && pd->info->mem_status_mask)
   551			is_mem_on = rockchip_pmu_domain_is_mem_on(pd);
   552	
   553		if (pd->info->pwr_w_mask)
   554			regmap_write(pmu->regmap, pmu->info->pwr_offset + pd_pwr_offset,
   555				     on ? pd->info->pwr_w_mask :
   556				     (pd->info->pwr_mask | pd->info->pwr_w_mask));
   557		else
   558			regmap_update_bits(pmu->regmap, pmu->info->pwr_offset + pd_pwr_offset,
   559					   pd->info->pwr_mask, on ? 0 : -1U);
   560	
   561		wmb();
   562	
   563		if (is_mem_on && rockchip_pmu_domain_mem_reset(pd))
   564			return;
   565	
   566		if (readx_poll_timeout_atomic(rockchip_pmu_domain_is_on, pd, is_on,
   567					      is_on == on, 0, 10000)) {
   568			dev_err(pmu->dev,
   569				"failed to set domain '%s', val=%d\n",
   570				genpd->name, is_on);
   571			return;
   572		}
   573	
   574		/* Inform firmware to keep this pd on or off */
 > 575		if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_NONE)
   576			arm_smccc_smc(ROCKCHIP_SIP_SUSPEND_MODE, ROCKCHIP_SLEEP_PD_CONFIG,
   577					pmu->info->pwr_offset + pd_pwr_offset,
   578					pd->info->pwr_mask, on, 0, 0, 0, &res);
   579	}
   580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
