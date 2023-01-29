Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0FF15B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 02:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674960607; x=1706496607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=doxV5brD4WXUlkEwbHkmS2EH9JFHVIxKm5A4Lru2B70=;
  b=buMxJ/dV0SP+dnBWprgtrxFt3qqmY6mmiwIXi4/32ibEZAgaabB9DMRA
   7CWVgexFN5BHxflw8qECasz4qlnuwoAMyLFLX1LjZ5ITBgKJEFq9oLxr8
   XLoLHFMTSU/9uM5O3uqOs5t7XTVGQg5YiSpyB1WnCTxxdA1CVA6w5Di5c
   hBAA3qjJMCXRLqHqSdGw97/0lsk7rYpa/GgNnyV6cZ/uSDryVhN3Y3p6L
   EK7bMJcsVqU47Dij7giMzX2awjUAqEnZu6azcPBoCLrySKs49sSVHKWe8
   wODoVfIGg/NKIEeUJPXigRL8in8CDlqycfe+dbQ4zeqXo8cF4Qr+DVPxb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="307006671"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="307006671"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 18:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="657040899"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="657040899"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2023 18:50:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLxlb-0001NP-2F;
	Sun, 29 Jan 2023 02:50:03 +0000
Date: Sun, 29 Jan 2023 10:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: Shravya Kumbham <shravya.kumbham@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>
Subject: [xilinx-xlnx:master 12130/14332]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2650:5: warning: no
 previous prototype for 'axienet_ethtools_sset_count'
Message-ID: <202301291046.6aAzSO4R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shravya,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   f9c8e14ae03c937a79e1c904d004d80a0db3647e
commit: 0605a36e057480f3a83ae401e7ff59739da78e82 [12130/14332] net: xilinx: Ethtool statistics support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291046.6aAzSO4R-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/0605a36e057480f3a83ae401e7ff59739da78e82
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 0605a36e057480f3a83ae401e7ff59739da78e82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/ethernet/xilinx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/bitops.h:36,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
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
https://github.com/intel/lkp-tests
