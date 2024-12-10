Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4889B185920
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822101; cv=none; b=IN+QfYcgzM32BVhLLKanFwfJbCcwUi/aUuyc6HyDfIkkGhgxNn87Y5G12VB1nhiT47uUrd2hGvKg7ltVX8x0MetiVC2x22ekHiTtR+taa+xoTxo8kLduWY4u1CDCycOQaj+8UaXrpxtJ5zkoNnCFiDaNWh0UmV14feNU2zWjVM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822101; c=relaxed/simple;
	bh=DQqporSEqBDBt0Hma4gLo8sMC5I4P9TbjCaeUkHG2TI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGokU2+RIzNgAP5T/Pi5tVE6ibrIJCkGPsMMu8gTQTv6e6gXKZC66ywuYPoLeC95KVadbMVVcA1Eq7MsY5gHwqPrybXKPKkHkzpGreL+LsYTL7xM16w8zi3TVQ+Ys0Gm59tPcoAtwyZ9Ztk1ftQImXV1L0XW5K73fiH35SDh9BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFYWvYOJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFYWvYOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733822098; x=1765358098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQqporSEqBDBt0Hma4gLo8sMC5I4P9TbjCaeUkHG2TI=;
  b=AFYWvYOJgXUOxWT2E8faGpp7klQUkaIEzpMPHapqrQq85tO0VhROE9tD
   zJNkDR29GGq+gAxjXvoWj9MpsE/PfV4G7KJv9UmWTK8X9N8b/U3fYGYou
   QSGmQShp7pD2PcETbTI7NFz6Tx2eWaqwGhUeWuWotdst9CuY1WuqmdVTJ
   Eq7szHcNrItG1Q2PYdq9LO3I+8D8Mn+Ib2wMpPuP337khFCmsiAebHuZ1
   73QiSogKwqcte6zm1DweabJnr5JXLrltsDkSw3pEIyxA8QKmDlZ/fwMdj
   RB1LyvoMfAsC0P7IXZXg9oMLl+o0emQY8vIhPJbdO6sWx0Awz1KBYYo1E
   w==;
X-CSE-ConnectionGUID: U9pZQ9YpSt2x0MuLHcQ9nw==
X-CSE-MsgGUID: Mx8lD81ATPy3SdqdUVsX6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33485988"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33485988"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 01:14:58 -0800
X-CSE-ConnectionGUID: yo6dw5mIRSqB5Mki7BX/sg==
X-CSE-MsgGUID: YJilgC3+Ra6nGKdk9pIMzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95410031"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Dec 2024 01:14:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKwKT-0005JT-1z;
	Tue, 10 Dec 2024 09:14:53 +0000
Date: Tue, 10 Dec 2024 17:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Arinzon <darinzon@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Shay Agroskin <shayagr@amazon.com>
Subject: drivers/net/ethernet/amazon/ena/ena_netdev.c:77 ena_tx_timeout()
 warn: inconsistent indenting
Message-ID: <202412101739.umNl7yYu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: 071271f39ce833a3534d1fbd47174d1bed6d9326 net: ena: Add more information on TX timeouts
date:   10 months ago
config: arm-randconfig-r073-20241209 (https://download.01.org/0day-ci/archive/20241210/202412101739.umNl7yYu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101739.umNl7yYu-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/amazon/ena/ena_netdev.c:77 ena_tx_timeout() warn: inconsistent indenting

vim +77 drivers/net/ethernet/amazon/ena/ena_netdev.c

    47	
    48	static void ena_tx_timeout(struct net_device *dev, unsigned int txqueue)
    49	{
    50		enum ena_regs_reset_reason_types reset_reason = ENA_REGS_RESET_OS_NETDEV_WD;
    51		struct ena_adapter *adapter = netdev_priv(dev);
    52		unsigned int time_since_last_napi, threshold;
    53		struct ena_ring *tx_ring;
    54		int napi_scheduled;
    55	
    56		if (txqueue >= adapter->num_io_queues) {
    57			netdev_err(dev, "TX timeout on invalid queue %u\n", txqueue);
    58			goto schedule_reset;
    59		}
    60	
    61		threshold = jiffies_to_usecs(dev->watchdog_timeo);
    62		tx_ring = &adapter->tx_ring[txqueue];
    63	
    64		time_since_last_napi = jiffies_to_usecs(jiffies - tx_ring->tx_stats.last_napi_jiffies);
    65		napi_scheduled = !!(tx_ring->napi->state & NAPIF_STATE_SCHED);
    66	
    67		netdev_err(dev,
    68			   "TX q %d is paused for too long (threshold %u). Time since last napi %u usec. napi scheduled: %d\n",
    69			   txqueue,
    70			   threshold,
    71			   time_since_last_napi,
    72			   napi_scheduled);
    73	
    74		if (threshold < time_since_last_napi && napi_scheduled) {
    75			netdev_err(dev,
    76				   "napi handler hasn't been called for a long time but is scheduled\n");
  > 77				   reset_reason = ENA_REGS_RESET_SUSPECTED_POLL_STARVATION;
    78		}
    79	schedule_reset:
    80		/* Change the state of the device to trigger reset
    81		 * Check that we are not in the middle or a trigger already
    82		 */
    83		if (test_and_set_bit(ENA_FLAG_TRIGGER_RESET, &adapter->flags))
    84			return;
    85	
    86		ena_reset_device(adapter, reset_reason);
    87		ena_increase_stat(&adapter->dev_stats.tx_timeout, 1, &adapter->syncp);
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
