Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF1CF9F6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 23:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696031050; x=1727567050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=el7C2pHdVNVqqw/3j7vkxp7IjQ9lavfSn3aQIMFCadM=;
  b=DFB0nhfVLm7dUxHqKijJSM8sKWSd2mhHu5n8+a6pGVTTrNxINV6yUpmR
   PpoVKxfBwj6vZl1lfVO6/S8d0OztArnH1nW1t+X4l/wRSFq/NGKTjBMtk
   Z7Iwe/MVpNgMNTbS7g42LzRmx7NT2NmBNtlbmnrXhmJ6HIgtaMO2XVYwA
   JeygmGRKzEBOU0bWoWjUDgSsxPa/77ekdgnPhW8cR/QGnsc0KF+UjePJr
   oiHKXqnbYFQudd/LthDL+6L7foPVtyJ8MRVAis17whC23FsOFlp+JY2DS
   Iaed+5KUYHyyASnDbmchagBURZEHs3RP100gpApcxUfsbTgjafFKABFOL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="379685230"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="379685230"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 16:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785236694"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="785236694"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Sep 2023 16:44:07 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmN9Q-0003QT-36;
	Fri, 29 Sep 2023 23:44:04 +0000
Date: Sat, 30 Sep 2023 07:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shravya Kumbham <shravya.kumbham@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>
Subject: [xilinx-xlnx:pr/146 12130/14527]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2650:5: warning: no
 previous prototype for 'axienet_ethtools_sset_count'
Message-ID: <202309300709.FXAJA8jo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: 0605a36e057480f3a83ae401e7ff59739da78e82 [12130/14527] net: xilinx: Ethtool statistics support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230930/202309300709.FXAJA8jo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300709.FXAJA8jo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300709.FXAJA8jo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:15,
                    from include/linux/clk.h:13,
                    from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:25:
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_create_tsheader':
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/spinlock.h:251:17: note: in expansion of macro 'typecheck'
     251 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:384:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     384 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1124:17: note: in expansion of macro 'spin_lock_irqsave'
    1124 |                 spin_lock_irqsave(&lp->ptp_tx_lock, flags);
         |                 ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: At top level:
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2650:5: warning: no previous prototype for 'axienet_ethtools_sset_count' [-Wmissing-prototypes]
    2650 | int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2673:6: warning: no previous prototype for 'axienet_ethtools_get_stats' [-Wmissing-prototypes]
    2673 | void axienet_ethtools_get_stats(struct net_device *ndev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2700:6: warning: no previous prototype for 'axienet_ethtools_strings' [-Wmissing-prototypes]
    2700 | void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_probe':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3232:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3232 |         bool slave = false;
         |         ^~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: At top level:
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1761:12: warning: 'axienet_open' defined but not used [-Wunused-function]
    1761 | static int axienet_open(struct net_device *ndev)
         |            ^~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1449:12: warning: 'axienet_start_xmit' defined but not used [-Wunused-function]
    1449 | static int axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/axienet_ethtools_sset_count +2650 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  2640	
  2641	/**
  2642	 * axienet_ethtools_sset_count - Get number of strings that
  2643	 *				 get_strings will write.
  2644	 * @ndev:	Pointer to net_device structure
  2645	 * @sset:	Get the set strings
  2646	 *
  2647	 * Return: number of strings, on success, Non-zero error value on
  2648	 *	   failure.
  2649	 */
> 2650	int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
  2651	{
  2652		switch (sset) {
  2653		case ETH_SS_STATS:
  2654	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2655			return axienet_sset_count(ndev, sset);
  2656	#else
  2657			return AXIENET_ETHTOOLS_SSTATS_LEN;
  2658	#endif
  2659		default:
  2660			return -EOPNOTSUPP;
  2661		}
  2662	}
  2663	
  2664	/**
  2665	 * axienet_ethtools_get_stats - Get the extended statistics
  2666	 *				about the device.
  2667	 * @ndev:	Pointer to net_device structure
  2668	 * @stats:	Pointer to ethtool_stats structure
  2669	 * @data:	To store the statistics values
  2670	 *
  2671	 * Return: None.
  2672	 */
> 2673	void axienet_ethtools_get_stats(struct net_device *ndev,
  2674					struct ethtool_stats *stats,
  2675					u64 *data)
  2676	{
  2677		unsigned int i = 0;
  2678	
  2679		data[i++] = ndev->stats.tx_packets;
  2680		data[i++] = ndev->stats.rx_packets;
  2681		data[i++] = ndev->stats.tx_bytes;
  2682		data[i++] = ndev->stats.rx_bytes;
  2683		data[i++] = ndev->stats.tx_errors;
  2684		data[i++] = ndev->stats.rx_missed_errors + ndev->stats.rx_frame_errors;
  2685	
  2686	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2687		axienet_get_stats(ndev, stats, data);
  2688	#endif
  2689	}
  2690	
  2691	/**
  2692	 * axienet_ethtools_strings - Set of strings that describe
  2693	 *			 the requested objects.
  2694	 * @ndev:	Pointer to net_device structure
  2695	 * @sset:	Get the set strings
  2696	 * @data:	Data of Transmit and Receive statistics
  2697	 *
  2698	 * Return: None.
  2699	 */
> 2700	void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
  2701	{
  2702		int i;
  2703	
  2704		for (i = 0; i < AXIENET_ETHTOOLS_SSTATS_LEN; i++) {
  2705			if (sset == ETH_SS_STATS)
  2706				memcpy(data + i * ETH_GSTRING_LEN,
  2707				       axienet_get_ethtools_strings_stats[i].name,
  2708				       ETH_GSTRING_LEN);
  2709		}
  2710	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2711		axienet_strings(ndev, sset, data);
  2712	#endif
  2713	}
  2714	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
