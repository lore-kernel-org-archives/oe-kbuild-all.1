Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0620E15A5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 01:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693617844; x=1725153844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tckHgtpwnQNcacjW4qfssKjLmK7UZmRr5r8lIDbiAwo=;
  b=S7lVcWe62227U7ygygJBs72Tv+sBi7Lzhj+EjYFsi+JL4upue/YdoQEv
   Fc6Yxby3Via+lxye07Jn9TucD/wLZr1ZV3/5kWh8tZrntM3rOnH1gIR2x
   s8WC+p1xh271EClnFnhLS99MWZ/1VXN6cVNBePwr7NpTiD9xHMK3q5CbJ
   2xc9owBVTAn4vCrRGNOGhLynAkk93dZ5Pd963JpuiJsia4ti3hMfX8uWk
   RFuwRvj7bTvlhuoiqGGnQzXMzFpGvBWNBXHCNly/b1Q1BHe4WMkihPWkE
   Ylk0RpI7fiwngsFVc9EGf4QGX7O2+DhuWhmr/7GYYO9zHitf6MzDvEIF9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356650880"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="356650880"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 18:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883388683"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="883388683"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 18:24:03 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcFMl-0001p7-1m;
	Sat, 02 Sep 2023 01:23:59 +0000
Date: Sat, 2 Sep 2023 09:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: drivers/mmc/host/atmel-mci.c:238: warning: Function parameter or
 member 'dma_filter' not described in 'mci_platform_data'
Message-ID: <202309020937.C5S2sRnr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Balamanikandan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0468be89b3fa5b9249cee1097f1d50314950a2df
commit: d2c6d518c21d73d96616e08a19eccd4642f4bafa mmc: atmel-mci: move atmel MCI header file
date:   8 days ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230902/202309020937.C5S2sRnr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020937.C5S2sRnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020937.C5S2sRnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/atmel-mci.c:238: warning: Function parameter or member 'dma_filter' not described in 'mci_platform_data'


vim +238 drivers/mmc/host/atmel-mci.c

   228	
   229	/**
   230	 * struct mci_platform_data - board-specific MMC/SDcard configuration
   231	 * @dma_slave: DMA slave interface to use in data transfers.
   232	 * @slot: Per-slot configuration data.
   233	 */
   234	struct mci_platform_data {
   235		void			*dma_slave;
   236		dma_filter_fn		dma_filter;
   237		struct mci_slot_pdata	slot[ATMCI_MAX_NR_SLOTS];
 > 238	};
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
