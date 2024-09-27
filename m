Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47C15A87A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727439500; cv=none; b=PV/paKeRH9NbqIyw4xKXql4sLGO4Q2rNMaTyWng8pn1cD3h/GuyRxMckECHPwi/nZzI40iUTcExTxEyZRo5FSpKXn+JtXxEULn9zAjU8bz1Svaa7vjWcq+fCB1d4rHQiiuSxF283y5zCtdqBGRDCjL7Oak4pou9Fp4+mY7vIhUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727439500; c=relaxed/simple;
	bh=qFE0jJgmYgGHVNqvG0IfzpgH+z/Q5Bn0CbMDoEas1Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p67AS1ZO+tKg7rHFbgXMkV6ZHTcGJWwjF2SnnypvD/qHXwGxadQJVmWs210vWDtZDvoOgzFFgBd6lDDBoiGLMmgKWEkExW7l5UapVmEwzDVEHsUkto4vkHWyk9IGYoRMfyxRRaakS0BESCSe9hbz2PQpL48OHbbm0rZqyut73hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N323xUJ2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N323xUJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727439499; x=1758975499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFE0jJgmYgGHVNqvG0IfzpgH+z/Q5Bn0CbMDoEas1Ww=;
  b=N323xUJ28wWXRPdjYat7naDI9Vx2MVHJV39blgO+P0XWnakdtRlC1UI2
   AD9zU71PRRxVnXxFnNJ7S47kXcqd592z91dA5dWoWrE24SLM/y9VZYNZ0
   s0q89JaHMIDdaYyPt1jYgmAkVGWKkZaFxGtJEKxZTTaG311wOhXAiFBx4
   7kWb7p0glaCFGo0XqYE/LD+j/Qx0sjHKiZOkfOJcaxFlKu1dKIWREGn+0
   CzYGhpBlkqqH4OOg/6qfz0/LZsQeXRLgwxeupw2rDdn1P4KFUxF2ptXPQ
   Mcmym0xXNT39hj7SiYZNf2a0ueYh+kI3ftV+wfpCLX7yzqH/smE+mHH0r
   A==;
X-CSE-ConnectionGUID: b19wW+jQTyu9Dn5GGEDbIQ==
X-CSE-MsgGUID: 9P6OU9Q5Tx6p9/zAxaNGSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26048913"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26048913"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 05:18:18 -0700
X-CSE-ConnectionGUID: 6GPGR4xyQjmd0FRNKjZp1Q==
X-CSE-MsgGUID: r92l/+iYSf66xnKYEDhU+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77354217"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2024 05:18:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su9vI-000Lsz-1V;
	Fri, 27 Sep 2024 12:18:12 +0000
Date: Fri, 27 Sep 2024 20:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Shravya Kumbham <shravya.kumbham@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 582/1001]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2613:5: warning: no
 previous prototype for 'axienet_ethtools_sset_count'
Message-ID: <202409272015.MBMSOG1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 830720cbc502457a805dbedf1ebb8b60999f8028 [582/1001] net: xilinx: Ethtool statistics support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409272015.MBMSOG1Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272015.MBMSOG1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272015.MBMSOG1Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2613:5: warning: no previous prototype for 'axienet_ethtools_sset_count' [-Wmissing-prototypes]
    2613 | int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2636:6: warning: no previous prototype for 'axienet_ethtools_get_stats' [-Wmissing-prototypes]
    2636 | void axienet_ethtools_get_stats(struct net_device *ndev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2663:6: warning: no previous prototype for 'axienet_ethtools_strings' [-Wmissing-prototypes]
    2663 | void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/axienet_ethtools_sset_count +2613 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  2603	
  2604	/**
  2605	 * axienet_ethtools_sset_count - Get number of strings that
  2606	 *				 get_strings will write.
  2607	 * @ndev:	Pointer to net_device structure
  2608	 * @sset:	Get the set strings
  2609	 *
  2610	 * Return: number of strings, on success, Non-zero error value on
  2611	 *	   failure.
  2612	 */
> 2613	int axienet_ethtools_sset_count(struct net_device *ndev, int sset)
  2614	{
  2615		switch (sset) {
  2616		case ETH_SS_STATS:
  2617	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2618			return axienet_sset_count(ndev, sset);
  2619	#else
  2620			return AXIENET_ETHTOOLS_SSTATS_LEN;
  2621	#endif
  2622		default:
  2623			return -EOPNOTSUPP;
  2624		}
  2625	}
  2626	
  2627	/**
  2628	 * axienet_ethtools_get_stats - Get the extended statistics
  2629	 *				about the device.
  2630	 * @ndev:	Pointer to net_device structure
  2631	 * @stats:	Pointer to ethtool_stats structure
  2632	 * @data:	To store the statistics values
  2633	 *
  2634	 * Return: None.
  2635	 */
> 2636	void axienet_ethtools_get_stats(struct net_device *ndev,
  2637					struct ethtool_stats *stats,
  2638					u64 *data)
  2639	{
  2640		unsigned int i = 0;
  2641	
  2642		data[i++] = ndev->stats.tx_packets;
  2643		data[i++] = ndev->stats.rx_packets;
  2644		data[i++] = ndev->stats.tx_bytes;
  2645		data[i++] = ndev->stats.rx_bytes;
  2646		data[i++] = ndev->stats.tx_errors;
  2647		data[i++] = ndev->stats.rx_missed_errors + ndev->stats.rx_frame_errors;
  2648	
  2649	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2650		axienet_get_stats(ndev, stats, data);
  2651	#endif
  2652	}
  2653	
  2654	/**
  2655	 * axienet_ethtools_strings - Set of strings that describe
  2656	 *			 the requested objects.
  2657	 * @ndev:	Pointer to net_device structure
  2658	 * @sset:	Get the set strings
  2659	 * @data:	Data of Transmit and Receive statistics
  2660	 *
  2661	 * Return: None.
  2662	 */
> 2663	void axienet_ethtools_strings(struct net_device *ndev, u32 sset, u8 *data)
  2664	{
  2665		int i;
  2666	
  2667		for (i = 0; i < AXIENET_ETHTOOLS_SSTATS_LEN; i++) {
  2668			if (sset == ETH_SS_STATS)
  2669				memcpy(data + i * ETH_GSTRING_LEN,
  2670				       axienet_get_ethtools_strings_stats[i].name,
  2671				       ETH_GSTRING_LEN);
  2672		}
  2673	#ifdef CONFIG_AXIENET_HAS_MCDMA
  2674		axienet_strings(ndev, sset, data);
  2675	#endif
  2676	}
  2677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
