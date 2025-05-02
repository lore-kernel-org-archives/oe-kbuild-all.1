Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80779D2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746208348; cv=none; b=eR+/10JUF3agFzX9JgAIrsvIYlBh0ev7590Iin770CcBdzoGiBJDh/km8amGtGcsww9z1Go38X8So0k5fl6e6oZRk5pZjirHVvvR/TjoYAMs8+5VaiZtyXCnDX5JjEstbHa5aQK4c3/LMPK62jFupFLhPZlgdRp8UOKnAZ9jL3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746208348; c=relaxed/simple;
	bh=CHs3tX3XeAwL4F1e2sf6Hh3AuLdB/42qLxvDde6M/9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1sA1/IVZiJqD941BT4OU6bX8ztdClTDOAHwZnC0gK992YWK6nZ/IARq5ywJDh39jKZxttEirj5YF0JhnNVYQyGCDXK5EP3ZDsOmk+Io2P+JHfpTBS7Wu3tI1yDNhwF9F9ol/NEoE8e6pLmghj4mMGNJR5Fsr2G//SMEYiozfdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbyEl0mv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbyEl0mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746208346; x=1777744346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CHs3tX3XeAwL4F1e2sf6Hh3AuLdB/42qLxvDde6M/9A=;
  b=lbyEl0mvVo4tSauX1ioeNEqDMRgscNGZ48fOCDWaOFzHsDrcfOqMwcSA
   y5+hu30rVRO91d3OXUa9viAsKcXQIFCk0V8EDrROt3eksuPvJapWBMHre
   rF1dBysa6pnkfOx4C56Rl91fwyRLar9YJj4GKm+dq5V+zzDcOsalJokQE
   3FobOKYnZhciC05MX7ujQPIEpTjJLcmt+Y8eg01Jr3X4Ix9kVoah2DTW0
   hOO71g0EJ8AcROsXPYlTr2jAzT8QPshEcWOZOcZj2wuKUTQJzhGH41PvX
   GBKLQX5pkqypcfF73Ih8SIBy/icuKdESUwF/wcIZGLXJh2NuglAUYyu6+
   Q==;
X-CSE-ConnectionGUID: gl4mKZVGTxivjuapcWEICw==
X-CSE-MsgGUID: H4QYSy+gQ1uDMcKGNiqUPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47782785"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="47782785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 10:52:25 -0700
X-CSE-ConnectionGUID: Fgk8waMQTgSG6FEpLyu/nw==
X-CSE-MsgGUID: XDDFIMGOQ6mVCvQNi8uTow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="138712800"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2025 10:52:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAuYf-0004vx-2n;
	Fri, 02 May 2025 17:52:21 +0000
Date: Sat, 3 May 2025 01:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Lin <robelin@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <202505022356.kttNgKzZ-lkp@intel.com>
References: <20250502043727.396896-2-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502043727.396896-2-robelin@nvidia.com>

Hi Robert,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on linus/master v6.15-rc4]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Lin/clocksource-drivers-timer-tegra186-add-WDIOC_GETTIMELEFT-support/20250502-123914
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250502043727.396896-2-robelin%40nvidia.com
patch subject: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
config: arm-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505022356.kttNgKzZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505022356.kttNgKzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505022356.kttNgKzZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
>> drivers/clocksource/timer-tegra186.c:282: undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: drivers/clocksource/timer-tegra186.c:290: undefined reference to `__aeabi_uldivmod'


vim +282 drivers/clocksource/timer-tegra186.c

   241	
   242	static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
   243	{
   244		struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
   245		u32 expiration, val;
   246		u64 timeleft;
   247	
   248		if (!watchdog_active(&wdt->base)) {
   249			/* return zero if the watchdog timer is not activated. */
   250			return 0;
   251		}
   252	
   253		/*
   254		 * Reset occurs on the fifth expiration of the
   255		 * watchdog timer and so when the watchdog timer is configured,
   256		 * the actual value programmed into the counter is 1/5 of the
   257		 * timeout value. Once the counter reaches 0, expiration count
   258		 * will be increased by 1 and the down counter restarts.
   259		 * Hence to get the time left before system reset we must
   260		 * combine 2 parts:
   261		 * 1. value of the current down counter
   262		 * 2. (number of counter expirations remaining) * (timeout/5)
   263		 */
   264	
   265		/* Get the current number of counter expirations. Should be a
   266		 * value between 0 and 4
   267		 */
   268		val = readl_relaxed(wdt->regs + WDTSR);
   269		expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
   270		if (WARN_ON(expiration > 4))
   271			return 0;
   272	
   273		/* Get the current counter value in microsecond. */
   274		val = readl_relaxed(wdt->tmr->regs + TMRSR);
   275		timeleft = FIELD_GET(TMRSR_PCV, val);
   276	
   277		/*
   278		 * Calculate the time remaining by adding the time for the
   279		 * counter value to the time of the counter expirations that
   280		 * remain.
   281		 */
 > 282		timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
   283	
   284		/*
   285		 * Convert the current counter value to seconds,
   286		 * rounding up to the nearest second. Cast u64 to
   287		 * u32 under the assumption that no overflow happens
   288		 * when coverting to seconds.
   289		 */
 > 290		timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
   291	
   292		if (WARN_ON(timeleft > U32_MAX))
   293			return U32_MAX;
   294	
   295		return lower_32_bits(timeleft);
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
