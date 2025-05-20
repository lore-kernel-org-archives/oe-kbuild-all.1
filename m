Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A4254AE3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737325; cv=none; b=DQPH80pBnl4JeAGTnTHjWUHhzzaXcyHlf38dov1Ng7FQFPFInsxbdrbncOoYqpUy/SP+OmkB+ZH7Sk3umxIo0ehLLbAyuTNEPJjlwNXzasg4l7Z1Aeu7XrtcvDR6BkipPphmKSJdyHO23NXdK+Dfr+qud/bY1KH/WsrwrciU8IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737325; c=relaxed/simple;
	bh=gedRGIT5Vg92eSJliNicFKQvXvF2FrbQu/01puHgJBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zdjx8YN6Gr5EdMoUAhB4Avt4YZEfskOika0ppZyEfqLXy0fSwY3xlx40cxaWEz1Zxf2amcr72LVs3W+1dc/v2hDLe426GU/rogpI5AHTcF3HmW/LKWLCC/dEDA1WOdB+F8dIFuopqV5tvYeg1PGk4fwvsJ93e7MEf6noS9gIFBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuM6u6RJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuM6u6RJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737325; x=1779273325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gedRGIT5Vg92eSJliNicFKQvXvF2FrbQu/01puHgJBw=;
  b=BuM6u6RJMzLKwd7e/wxhklz8uUJ8WEv4ZfZ0TAgDeJM6utLCUwWaCOo+
   Qrew4fkAdSxQ9GyZmLm9Cgzw0OBuAzH9YVJ11/7NyWypy3xO9W00cojtO
   lL+sRaKZ2DSozB6Gz6aSzZn//G0XGXCp6gjda/7mVcWRGi+yoyfJHiZhB
   4rKFLnbQeVeS+YGQs8f9xwBRHsrnRW6uZ06DyEbVAHefQbyecq3ZbIzNQ
   I/JgGmEsxEcb4I8QfsympfeRcOcGv/qnL6lpT8ax3M7wZA1LR2czsWYgC
   uIKkzpan5vyG5GGJD8jb6J6SIfnkQQ2Vw72ze8mDKNwj2pVqQjC8peVgI
   Q==;
X-CSE-ConnectionGUID: 9Qn8FFWfTKyGcJE31+3Kyw==
X-CSE-MsgGUID: 1pvdd4+TSgi0hniHjTocig==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49567332"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49567332"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:35:24 -0700
X-CSE-ConnectionGUID: yiNaYEjGQ0ySot3XQBrtXg==
X-CSE-MsgGUID: 8NFFosbjS1Oi1SPtCVrfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139533129"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2025 03:35:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHKJc-000MSG-0O;
	Tue, 20 May 2025 10:35:20 +0000
Date: Tue, 20 May 2025 18:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 08/11] bus: mhi: host: Add support for Bandwidth scale
Message-ID: <202505201854.76yTjUT0-lkp@intel.com>
References: <20250519-mhi_bw_up-v3-8-3acd4a17bbb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-mhi_bw_up-v3-8-3acd4a17bbb5@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fee3e843b309444f48157e2188efa6818bae85cf]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-Update-current-bus-speed-as-part-of-pci_pwrctrl_notify/20250519-175340
base:   fee3e843b309444f48157e2188efa6818bae85cf
patch link:    https://lore.kernel.org/r/20250519-mhi_bw_up-v3-8-3acd4a17bbb5%40oss.qualcomm.com
patch subject: [PATCH v3 08/11] bus: mhi: host: Add support for Bandwidth scale
config: m68k-randconfig-r132-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201854.76yTjUT0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201854.76yTjUT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201854.76yTjUT0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bus/mhi/host/init.c:532:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected int val @@     got restricted __le32 [usertype] @@
   drivers/bus/mhi/host/init.c:532:13: sparse:     expected int val
   drivers/bus/mhi/host/init.c:532:13: sparse:     got restricted __le32 [usertype]

vim +532 drivers/bus/mhi/host/init.c

   513	
   514	static int mhi_init_bw_scale(struct mhi_controller *mhi_cntrl,
   515				     int bw_scale_db)
   516	{
   517		struct device *dev = &mhi_cntrl->mhi_dev->dev;
   518		int ret, er_index, val;
   519		u32 bw_cfg_offset;
   520	
   521		ret = mhi_find_capability(mhi_cntrl, MHI_BW_SCALE_CAP_ID, &bw_cfg_offset);
   522		if (ret)
   523			return ret;
   524	
   525		er_index = mhi_get_er_index(mhi_cntrl, MHI_ER_BW_SCALE);
   526		if (er_index < 0)
   527			return er_index;
   528	
   529		bw_cfg_offset += MHI_BW_SCALE_CFG_OFFSET;
   530	
   531		/* Advertise host support */
 > 532		val = MHI_BW_SCALE_ENABLE(bw_scale_db, er_index);
   533	
   534		mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, bw_cfg_offset, val);
   535	
   536		dev_dbg(dev, "Bandwidth scaling setup complete with event ring: %d\n",
   537			er_index);
   538	
   539		return 0;
   540	}
   541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
