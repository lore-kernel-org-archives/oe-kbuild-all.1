Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20518C05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 21:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692997762; x=1724533762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O6pZEOuZ6X3T2zi3mh63ZK/yxXvRm5yiouZyl7txwdI=;
  b=PSk8IGrhpwYfVdzLO82nPok7TdH0TPOi9AR1Z95xJQPWZ+yiZkJUyd1X
   hrzQNH35BR4Vz9F1QVMq8JnxRFxmrNMHU+0N3Jq167DXtCPGPnSji0w+9
   LfIUB4K/ob44eA4PKdh5B/ZbD/9pNR0/DUroWS6rREJvSPgEp5kZSvJZj
   x6JG34UqIAlV3YAzHii0f1KgS1DCaprouNkMT3sw2wOwwGOU3LNWsf8Xt
   31vJKe5cerVqrIDa234FCIBCLrscQ7y0MRnmSfV6z4w+3KrXF0zIQn4DX
   RT10AIzn4BkuWbWmOt67Zf711iAGgCEJ50pl8cl1hze+B85rVG/Ln+sQz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359801104"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="359801104"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 14:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068361304"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="1068361304"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2023 14:09:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZe3S-00040H-0R;
	Fri, 25 Aug 2023 21:09:18 +0000
Date: Sat, 26 Aug 2023 05:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [ulfh-mmc:next 109/110] drivers/mmc/host/atmel-mci.c:238: warning:
 Function parameter or member 'dma_filter' not described in
 'mci_platform_data'
Message-ID: <202308260547.zLisWjP8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   98ac9e4fc07f101c435f1ab6b395b6245b096a68
commit: d2c6d518c21d73d96616e08a19eccd4642f4bafa [109/110] mmc: atmel-mci: move atmel MCI header file
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230826/202308260547.zLisWjP8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260547.zLisWjP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260547.zLisWjP8-lkp@intel.com/

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
