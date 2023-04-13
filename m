Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1CB7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681397220; x=1712933220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lTYje+Mgrb1TxSE9CW3B+vwIFevuMocdLyklzrwcZTg=;
  b=U82V8FXRbjaZ1DLm4L+EQQ+YI3e3ei4AkVMlakPgjQgjptDVa03Ax4Zi
   4XRKM9cfWxMu/H4+qzy9aces42sbIQxPoBn1qjCEYD8cEEGKtY/GVuGMc
   yp9DAiyLTirU5YSfjJcC5rm/SQFdpwZuemxszT2F4kR8CyolHh7rM5imc
   w7re0SLoevm4BSrT8TpeJzhKqXjCNZoa8Nf5pR+IgY02RIyQbtRQK6pQV
   5UHAApG0iHzA9b0edWaW7r7xeHb7Z4thzhYUSeanipcwBWr3NUQiy2Jgl
   fJBMMFYGhVYXdf+2ZYoQCPzHwVKiFpnQjnGVpx5gmYKDO+leFtU7C+lM2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="407058653"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="407058653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 07:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="758720157"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="758720157"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2023 07:46:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmyDr-000YkZ-1G;
	Thu, 13 Apr 2023 14:46:51 +0000
Date: Thu, 13 Apr 2023 22:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Shravya Kumbham <shravya.kumbham@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 790/1065]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2592:5: warning: no
 previous prototype for 'axienet_ethtools_sset_count'
Message-ID: <202304132208.hbcIdpzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: 32dd9901bb3d800af86b0ac388fd034cf46e0277 [790/1065] net: xilinx: Ethtool statistics support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304132208.hbcIdpzQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/32dd9901bb3d800af86b0ac388fd034cf46e0277
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout 32dd9901bb3d800af86b0ac388fd034cf46e0277
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/net/ethernet/xilinx/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132208.hbcIdpzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2592:5: warning: no previous prototype for 'axienet_ethtools_sset_count' [-Wmissing-prototypes]
    2592 | int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2615:6: warning: no previous prototype for 'axienet_ethtools_get_stats' [-Wmissing-prototypes]
    2615 | void axienet_ethtools_get_stats(struct net_device *ndev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2642:6: warning: no previous prototype for 'axienet_ethtools_strings' [-Wmissing-prototypes]
    2642 | void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/axienet_ethtools_sset_count +2592 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  2582	
  2583	/**
  2584	 * axienet_ethtools_sset_count - Get number of strings that
  2585	 *				 get_strings will write.
  2586	 * @ndev:	Pointer to net_device structure
  2587	 * @sset:	Get the set strings
  2588	 *
  2589	 * Return: number of strings, on success, Non-zero error value on
  2590	 *	   failure.
  2591	 */
> 2592	int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
  2593	{
  2594		switch (sset) {
  2595		case ETH_SS_STATS:
  2596	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2597			return axienet_sset_count(ndev, sset);
  2598	#else
  2599			return AXIENET_ETHTOOLS_SSTATS_LEN;
  2600	#endif
  2601		default:
  2602			return -EOPNOTSUPP;
  2603		}
  2604	}
  2605	
  2606	/**
  2607	 * axienet_ethtools_get_stats - Get the extended statistics
  2608	 *				about the device.
  2609	 * @ndev:	Pointer to net_device structure
  2610	 * @stats:	Pointer to ethtool_stats structure
  2611	 * @data:	To store the statistics values
  2612	 *
  2613	 * Return: None.
  2614	 */
> 2615	void axienet_ethtools_get_stats(struct net_device *ndev,
  2616					struct ethtool_stats *stats,
  2617					u64 *data)
  2618	{
  2619		unsigned int i = 0;
  2620	
  2621		data[i++] = ndev->stats.tx_packets;
  2622		data[i++] = ndev->stats.rx_packets;
  2623		data[i++] = ndev->stats.tx_bytes;
  2624		data[i++] = ndev->stats.rx_bytes;
  2625		data[i++] = ndev->stats.tx_errors;
  2626		data[i++] = ndev->stats.rx_missed_errors + ndev->stats.rx_frame_errors;
  2627	
  2628	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2629		axienet_get_stats(ndev, stats, data);
  2630	#endif
  2631	}
  2632	
  2633	/**
  2634	 * axienet_ethtools_strings - Set of strings that describe
  2635	 *			 the requested objects.
  2636	 * @ndev:	Pointer to net_device structure
  2637	 * @sset:	Get the set strings
  2638	 * @data:	Data of Transmit and Receive statistics
  2639	 *
  2640	 * Return: None.
  2641	 */
> 2642	void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
  2643	{
  2644		int i;
  2645	
  2646		for (i = 0; i < AXIENET_ETHTOOLS_SSTATS_LEN; i++) {
  2647			if (sset == ETH_SS_STATS)
  2648				memcpy(data + i * ETH_GSTRING_LEN,
  2649				       axienet_get_ethtools_strings_stats[i].name,
  2650				       ETH_GSTRING_LEN);
  2651		}
  2652	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2653		axienet_strings(ndev, sset, data);
  2654	#endif
  2655	}
  2656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
