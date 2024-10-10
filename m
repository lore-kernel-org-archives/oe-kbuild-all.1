Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BB01CDFD4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595658; cv=none; b=BXk/ZEtDz2OyenOul6hGxXL5fZOueuUyo0XlJPGBa9381mAhhv9XPBee3EitBvdTtq2COZdHENI00wHYTlIIbYFEV+X4VzT2zehYbspMKROAwAaIC5jUkBdah8Xw/lVJjuYqLPCMsqW02PtPKHw2dJaVJA4OTxLAqlWtijpOdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595658; c=relaxed/simple;
	bh=cMjG2vAYtWdpt9XwYTmcmGJdVX1vdODwVNOaK1Qy7ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEppf10A+EZDLb3gLB0Ul7Q7ZRxvhuzb5I+YFhH4bHVP8m2afGPnITGplmnC9nHwC9xFABFF0b0zRsVqAILIyCt/rnkboF3ubnBEOD2Z1KbJGlEvHPj1xzyWOzO9ip1l/CNLOHXUXLa3630Dkgqa9bLwrADSP5NTjgCtqMYnLRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsI3Ef+4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsI3Ef+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728595656; x=1760131656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cMjG2vAYtWdpt9XwYTmcmGJdVX1vdODwVNOaK1Qy7ys=;
  b=LsI3Ef+436Sar0rWdWI40IBT+wjJPzIZ3CFPfSoFfxLnHZ6Kg1rFoetk
   9l8B7uEBTsfA2xAfh5JVA8GFObff9V8BfpczFz7hezCcGou2H9D1krWlv
   IG9pw6WYkUDFAAnolnTNvhPscucEmSs6r4Y4J+GUqqSaeHLuP35UQmSmI
   jslQ+TTSMOz2jtM2Ctbu6P6Hpnlbg2wIlyC4c6LuJTtynmwziw5hNPUx3
   5d6w40dQVaWq6wTBx7JjDS/8uu4M9WHOLDN3zcTYdxtRetWZcF/oeIsV2
   n8+I+85pY2FugcnHfZaagSRmwrTQWbYxERaaLVxuoOxuF1C2ccKWisy98
   A==;
X-CSE-ConnectionGUID: 3tcQiGpZR1mKXaf8/VcakQ==
X-CSE-MsgGUID: gVjAc47BR2qmx1I8uOeSUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31880258"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="31880258"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 14:27:35 -0700
X-CSE-ConnectionGUID: m/Qe04pbQXmzI9vZDNmzmA==
X-CSE-MsgGUID: C1HTkPzxRuGYni1dG0JDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76637765"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Oct 2024 14:27:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz0h2-000BI1-1k;
	Thu, 10 Oct 2024 21:27:32 +0000
Date: Fri, 11 Oct 2024 05:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mmc: suspend MMC also when unbinding
Message-ID: <202410110517.E2SBXURn-lkp@intel.com>
References: <20241007093447.33084-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007093447.33084-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc2 next-20241010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/mmc-suspend-MMC-also-when-unbinding/20241007-173705
base:   linus/master
patch link:    https://lore.kernel.org/r/20241007093447.33084-2-wsa%2Brenesas%40sang-engineering.com
patch subject: [RFC PATCH] mmc: suspend MMC also when unbinding
config: i386-randconfig-141-20241010 (https://download.01.org/0day-ci/archive/20241011/202410110517.E2SBXURn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110517.E2SBXURn-lkp@intel.com/

smatch warnings:
drivers/mmc/core/mmc.c:2124 _mmc_suspend() warn: inconsistent indenting

vim +2124 drivers/mmc/core/mmc.c

  2114	
  2115	static int _mmc_suspend(struct mmc_host *host, enum mmc_pm_reason reason)
  2116	{
  2117		int err = 0;
  2118		unsigned int notify_type = reason == MMC_PM_REASON_SUSPEND ?
  2119					   EXT_CSD_POWER_OFF_SHORT : EXT_CSD_POWER_OFF_LONG;
  2120		bool can_pwr_cycle_now = (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) ||
  2121					  ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND) &&
  2122					    reason == MMC_PM_REASON_SUSPEND);
  2123	
> 2124	pr_info("%s: suspend reason %d, can pwr cycle %d\n", mmc_hostname(host), reason, can_pwr_cycle_now);
  2125	
  2126		mmc_claim_host(host);
  2127	
  2128		if (mmc_card_suspended(host->card))
  2129			goto out;
  2130	
  2131		err = _mmc_flush_cache(host);
  2132		if (err)
  2133			goto out;
  2134	
  2135		/* Notify if pwr_cycle is possible or power gets cut because of shutdown */
  2136		if (mmc_can_poweroff_notify(host->card) &&
  2137		    (reason == MMC_PM_REASON_SHUTDOWN || can_pwr_cycle_now))
  2138			err = mmc_poweroff_notify(host->card, notify_type);
  2139		else if (mmc_can_sleep(host->card))
  2140			err = mmc_sleep(host);
  2141		else if (!mmc_host_is_spi(host))
  2142			err = mmc_deselect_cards(host);
  2143	
  2144		if (!err) {
  2145			mmc_power_off(host);
  2146			mmc_card_set_suspended(host->card);
  2147		}
  2148	out:
  2149		mmc_release_host(host);
  2150		return err;
  2151	}
  2152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
