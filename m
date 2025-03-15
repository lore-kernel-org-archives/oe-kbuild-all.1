Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9517555
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 02:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742004718; cv=none; b=Y5NBMvx7zAOWQ6RlEqqlWGCe06m/V7Z06vH+iKbaQdtmZpZ3AYYckQWFqku4jW6RAnINaTzJHVqFxFJ61J9HhAkcGuMjVPUkS4M1MmE0M8JoNGaByTWjo2FALiKE6uUvXDDYw97b9mvkHBYWP5FT2su/uGdhsjfF3fQra3rpjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742004718; c=relaxed/simple;
	bh=gowls29+Qr2Q/pl5cxeE+NlIP806O0WePdVmbZherdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBO5SToCQBesZDL8NjO/9zSlfF4Jp3a6+LapBYKw+UiBqh8u8FGEeeX8wH5HRVmFM8FRnhVsInMBP9OYSeV/ebbFdPYx+1VVifxH97r3tS+vJzKJ3eOzbng3E+elc5D+0Y2m5wOlrUCVprJ8Vt7MFMV8tuHnJ3hen0/wa+MZgdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duCqU8rQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duCqU8rQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742004717; x=1773540717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gowls29+Qr2Q/pl5cxeE+NlIP806O0WePdVmbZherdE=;
  b=duCqU8rQi1GMNPPqUpwqFnMmauP0cMAN/jRuyYzVa6Tdq1eVd4eoO8Jd
   lJDBMAX4KiCnILs1Jh+rTMcqAYFct+8m9q/rH/eqT7P09t2CsuRuxQvo4
   dobiRgwwGcz3T7fXx+7CaRAs7XxOIQQqQd4eyoJWvWqOjx6SNl3ehQKcH
   U+fvGL3H9gdRgomVIhW3cQTNo/ETIYn077kLoO+wdG1fTpMkjJeSkszjv
   GMBwr9dIpXsuDkHfcPHzMzEFLvsa3kDaQSHm8IX17++HU3arBu9wppWwK
   3Aa5kl5F8MUby9sGb5UB7kyuxggt5NcFllzAvJzPghMchiWTL6kErIZ7i
   w==;
X-CSE-ConnectionGUID: FQsUFWicQd+5EEeJwesubw==
X-CSE-MsgGUID: t8+XVd8YTOqFnb4r0iMPsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="53380626"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="53380626"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 19:11:56 -0700
X-CSE-ConnectionGUID: gFTbA6DpSMikRxV2QV+taQ==
X-CSE-MsgGUID: PEjrDMm3RUm/LPJSbppPrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121938832"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2025 19:11:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttH0C-000AzD-2S;
	Sat, 15 Mar 2025 02:11:52 +0000
Date: Sat, 15 Mar 2025 10:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 07/10] bus: mhi: host: Add support for Bandwidth scale
Message-ID: <202503151036.eJjjGFDV-lkp@intel.com>
References: <20250313-mhi_bw_up-v2-7-869ca32170bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-mhi_bw_up-v2-7-869ca32170bf@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 80e54e84911a923c40d7bee33a34c1b4be148d7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-update-current-bus-speed-as-part-of-pci_bus_add_devices/20250313-195014
base:   80e54e84911a923c40d7bee33a34c1b4be148d7a
patch link:    https://lore.kernel.org/r/20250313-mhi_bw_up-v2-7-869ca32170bf%40oss.qualcomm.com
patch subject: [PATCH v2 07/10] bus: mhi: host: Add support for Bandwidth scale
config: alpha-randconfig-r122-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151036.eJjjGFDV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250315/202503151036.eJjjGFDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151036.eJjjGFDV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bus/mhi/host/init.c:535:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/bus/mhi/host/init.c:535:13: sparse:     expected unsigned int [usertype] val
   drivers/bus/mhi/host/init.c:535:13: sparse:     got restricted __le32 [usertype]
--
>> drivers/bus/mhi/host/main.c:1122:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] response @@     got restricted __le32 [usertype] @@
   drivers/bus/mhi/host/main.c:1122:18: sparse:     expected unsigned int [assigned] [usertype] response
   drivers/bus/mhi/host/main.c:1122:18: sparse:     got restricted __le32 [usertype]

vim +535 drivers/bus/mhi/host/init.c

   514	
   515	static int mhi_init_bw_scale(struct mhi_controller *mhi_cntrl,
   516				     int bw_scale_db)
   517	{
   518		struct device *dev = &mhi_cntrl->mhi_dev->dev;
   519		u32 bw_cfg_offset, val = 0;
   520		int ret, er_index;
   521	
   522		ret = mhi_get_capability_offset(mhi_cntrl, MHI_BW_SCALE_CAP_ID,
   523						&bw_cfg_offset);
   524		if (ret)
   525			return ret;
   526	
   527		/* No ER configured to support BW scale */
   528		er_index = mhi_get_er_index(mhi_cntrl, MHI_ER_BW_SCALE);
   529		if (er_index < 0)
   530			return er_index;
   531	
   532		bw_cfg_offset += MHI_BW_SCALE_CFG_OFFSET;
   533	
   534		/* advertise host support */
 > 535		val = MHI_BW_SCALE_ENABLE(bw_scale_db, er_index);
   536	
   537		mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, bw_cfg_offset, val);
   538	
   539		dev_dbg(dev, "Bandwidth scaling setup complete. Event ring:%d\n",
   540			er_index);
   541	
   542		return 0;
   543	}
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
