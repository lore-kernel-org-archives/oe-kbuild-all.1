Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C4101E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463326; x=1726999326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NrA11k6XQGHpbbQSCtznplV4MaC+3hqLs9QHx04hauc=;
  b=KtfvLHuDoMmoQVXGWjhbKiB9DOup8HOASt1iDuf8si4lCys9Yd/ZSgwy
   Pc8ioyCaUGqcI8tzw9OXBOlMWkA5p0zrGXLTjRWx3wBXr3m+ykicAOPtZ
   3M7cqyc0/XoqkepEa1QqPWInhVM9zEm3BQsX0XnSGXVwDBqI8ln7WnmaM
   wM7uRupNmy/8Mur/HSGojnc+JfRJqtuXv6vwnImjlSj9cpwx/mFc7BIvy
   A9Wn9XIwn+Qcm2tOjEhLQ4gshB8frnWj1jf41m8bEH5FF1KwbNPfIEHe7
   ECGo58o/59GkGx+vCmIder2DPNUnlO1nRi/xmTv9O10fYMb5lQVLYWMIF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360392537"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="360392537"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 03:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="818080244"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="818080244"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2023 03:02:02 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjzSZ-000289-2o;
	Sat, 23 Sep 2023 10:01:59 +0000
Date: Sat, 23 Sep 2023 18:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Shravya Kumbham <shravya.kumbham@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 790/1367]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2592:5: warning: no
 previous declaration for 'axienet_ethtools_sset_count'
Message-ID: <202309231741.AkWzWwIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   2c6eef04c4fd6ede2f4de2437f5760da8e84ace2
commit: 32dd9901bb3d800af86b0ac388fd034cf46e0277 [790/1367] net: xilinx: Ethtool statistics support
config: i386-buildonly-randconfig-006-20230923 (https://download.01.org/0day-ci/archive/20230923/202309231741.AkWzWwIP-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231741.AkWzWwIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231741.AkWzWwIP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2592:5: warning: no previous declaration for 'axienet_ethtools_sset_count' [-Wmissing-declarations]
    int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2615:6: warning: no previous declaration for 'axienet_ethtools_get_stats' [-Wmissing-declarations]
    void axienet_ethtools_get_stats(struct net_device *ndev,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2642:6: warning: no previous declaration for 'axienet_ethtools_strings' [-Wmissing-declarations]
    void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
         ^~~~~~~~~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests/wiki
