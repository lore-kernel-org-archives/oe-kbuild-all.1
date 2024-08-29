Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C0A4A18
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 02:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724900024; cv=none; b=fpZ7C+D0ejple49p47yHUQbKyOZYkbmHw1mBQAyw9FOoDAVl2xgetoGGrU1ubrf7CBzg/LCV/lOZBEsVl+S4bL2ZZQTmr49+SZRbH3iHje41HfXJBQWM4GOWoGEi7uR3knvBEC4cRD05xp8PUeK6vvZ2t2pYogqvskf1ytSf/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724900024; c=relaxed/simple;
	bh=8IRd3Gd9KRzmPq7vvoRigOfH6JNokBIGagrsQaZElIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVdnDFTZIhLIQQh2TEzw49l75/1to+cViRv1QS8r9+aN8PeM5+v/C9Y76C9yhUutH0ZqxFz6LHgccHW53aJi8HHHE/1NmmqgipF+OdCNUqfXv3myLbmqrq9noUOQjXC45F18APJZ97mJg4QV1wvcBiTJddMTz4o0e9omplp6TAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIH32xzJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIH32xzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724900023; x=1756436023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8IRd3Gd9KRzmPq7vvoRigOfH6JNokBIGagrsQaZElIc=;
  b=oIH32xzJBU+9bCIPKMgu6VkXjp/EPnqeBD51VmkrZtMuae2p6RpJ+Ua/
   Q8YDo7xFkIZ64JuKN6Jczu/9OXc69/mGqEzJxznQjovF069WKQsx/mZXb
   9CrTF96knYWuX4QdYIPw70ZdBTUj2CqcxEpD4xlgMAdFwh/cB3r5cu/FR
   yyinv8K9TjFMCMKvVuxfmVo61+Is5W0bh+Ny+svkFv44xbnROtq7xzOGN
   8NknHv0SBcuaxQFLpsB0/V0MKOw0wj8wb9H0eSyka5vBt1QkTEWlHtjZb
   3HDRhEqA5yES/cDMSOCmKbg3H0Ffd3ElP4D+0FYk43TWIXbGUcxFm6wr2
   A==;
X-CSE-ConnectionGUID: Aj9OQ4X6S/WFhoJAi4w96g==
X-CSE-MsgGUID: ZeP72EUbQlKDdrNsO37vJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23627164"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23627164"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 19:53:42 -0700
X-CSE-ConnectionGUID: 7KCJ1DGwQJm5yR5Ur1KD2w==
X-CSE-MsgGUID: LMMwmW7oTwaHdQD+CZncvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="63116055"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2024 19:53:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjVI1-000LbC-2O;
	Thu, 29 Aug 2024 02:53:37 +0000
Date: Thu, 29 Aug 2024 10:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: liangshuang <liangshuang@eswincomputing.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 16/24] drivers/mmc/host/sdhci-of-eswin.c:370:6:
 sparse: sparse: symbol 'eswin_sdhci_set_uhs_signaling' was not declared.
 Should it be static?
Message-ID: <202408291054.uX7ZUOgq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: 239db6075712d8dcff9f649b3d66c1148ff0cee8 [16/24] drivers: mmc: Add ESWIN mmc drivers
config: sparc64-randconfig-r131-20240829 (https://download.01.org/0day-ci/archive/20240829/202408291054.uX7ZUOgq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240829/202408291054.uX7ZUOgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291054.uX7ZUOgq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/sdhci-of-eswin.c:370:6: sparse: sparse: symbol 'eswin_sdhci_set_uhs_signaling' was not declared. Should it be static?

vim +/eswin_sdhci_set_uhs_signaling +370 drivers/mmc/host/sdhci-of-eswin.c

   369	
 > 370	void eswin_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
   371	{
   372		u32 val;
   373		u32 status;
   374		u32 timeout = 0;
   375		u16 ctrl_2;
   376	
   377		ctrl_2 = sdhci_readw(host, SDHCI_HOST_CONTROL2);
   378		/* Select Bus Speed Mode for host */
   379		ctrl_2 &= ~SDHCI_CTRL_UHS_MASK;
   380		if ((timing == MMC_TIMING_MMC_HS200) ||
   381		    (timing == MMC_TIMING_UHS_SDR104))
   382			ctrl_2 |= SDHCI_CTRL_UHS_SDR104;
   383		else if (timing == MMC_TIMING_UHS_SDR12)
   384			ctrl_2 |= SDHCI_CTRL_UHS_SDR12;
   385		else if (timing == MMC_TIMING_UHS_SDR25)
   386			ctrl_2 |= SDHCI_CTRL_UHS_SDR25;
   387		else if (timing == MMC_TIMING_UHS_SDR50)
   388			ctrl_2 |= SDHCI_CTRL_UHS_SDR50;
   389		else if ((timing == MMC_TIMING_UHS_DDR50) ||
   390			 (timing == MMC_TIMING_MMC_DDR52))
   391			ctrl_2 |= SDHCI_CTRL_UHS_DDR50;
   392		else if (timing == MMC_TIMING_MMC_HS400)
   393			ctrl_2 |= ESWIN_SDHCI_CTRL_HS400; /* Non-standard */
   394		sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL2);
   395	
   396	
   397		/*
   398		 * here need make dll locked when in hs400 at 200MHz
   399		 */
   400		if ((timing == MMC_TIMING_MMC_HS400) && (host->clock == 200000000)) {
   401			eswin_sdhci_disable_card_clk(host);
   402	
   403			val = sdhci_readl(host, VENDOR_AT_CTRL_R);
   404			val &= ~(LATENCY_LT_MASK << LATENCY_LT_BIT_OFFSET);
   405			val |= (LATENCY_LT_3 << LATENCY_LT_MASK);
   406			sdhci_writel(host, val, VENDOR_AT_CTRL_R);
   407	
   408			sdhci_writeb(host, 0x23, PHY_DLL_CNFG1_R);
   409			sdhci_writeb(host, 0x02, PHY_DLL_CNFG2_R);
   410			sdhci_writeb(host, 0x60, PHY_DLLDL_CNFG_R);
   411			sdhci_writeb(host, 0x00, PHY_DLL_OFFST_R);
   412			sdhci_writew(host, 0xffff, PHY_DLLBT_CNFG_R);
   413	
   414			eswin_sdhci_enable_card_clk(host);
   415			sdhci_writeb(host, DLL_ENABEL, PHY_DLL_CTRL_R);
   416			udelay(100);
   417	
   418			while (1) {
   419				status = sdhci_readb(host, PHY_DLL_STATUS_R);
   420				if (status & DLL_LOCK_STS) {
   421					pr_debug("%s: locked status:0x%x\n", mmc_hostname(host->mmc), status);
   422					break;
   423				}
   424				timeout++;
   425				udelay(100);
   426				if (timeout > 10000) {
   427					pr_err("%s: DLL lock failed!status:0x%x\n",
   428						mmc_hostname(host->mmc), status);
   429					return;
   430				}
   431			}
   432	
   433			status = sdhci_readb(host, PHY_DLL_STATUS_R);
   434			if (status & DLL_ERROR_STS) {
   435				pr_err("%s: DLL lock failed!err_status:0x%x\n",
   436					mmc_hostname(host->mmc), status);
   437			} else {
   438				pr_debug("%s: DLL lock is success\n", mmc_hostname(host->mmc));
   439			}
   440		}
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
