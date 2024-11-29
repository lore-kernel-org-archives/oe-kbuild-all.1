Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F815746E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 06:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732861102; cv=none; b=BJsnbwWySjEb6C/3hv1/nFCYUpENG7+SkddNYIB/kxyHA79WkghZILL05EycgWy5gYoy4KA2axfxYUddNHFHd53jzgjPYkKfv/0So7uMVK8EnkglgTv6DJyC1HZ+iMRrapRF0HTBp+lhttDJqiJdhHHw0/kF8dM/MsVqeBLOxnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732861102; c=relaxed/simple;
	bh=WxpjQldJxswZJJ2TWRMT8rPTyvm9ml9McBhq7N2L0EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FVf5INhSvC9TKL2JVMCVb4dPhTxrXGktUnhwVdqMlFYCTuBkn3AV/MUGW4c1RHo8pk1yxRSH0b0qXGUxFyDcJx/nWYeO9IAbE1Xpla6Jk4adTj+CjTZ/pMZ4sQNjbBrx3cjfHbT6HzF1NJEuhw7S05/3EBqw/EYPYAAcWcJh1no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQvdapXT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQvdapXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732861101; x=1764397101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WxpjQldJxswZJJ2TWRMT8rPTyvm9ml9McBhq7N2L0EE=;
  b=dQvdapXTaApxeFHByOqODHKyOvPTBSn7sU2IYOQTsjxg16kf8QhOBYud
   7qTceUhiU03NRJzAWmPtGV+QCcj/dVeF9M566wb95L1ZIsTWg6/9Pj5Bq
   8Qqhz34KjTv/T5vCfgcH+H0aSUy4UDvdFCl68ak1Ltdgwaa9TxS3g7vQB
   iXMIHqLWNDWg/DxTNkZ6BhF05sY4txWF3Yn7++Ne3MHkxFD5AD3Ezpccs
   a5zy/0OFRweTOy7NuYIdeXftC2E9h/cS7C9pDbnHHvZkKr6vo5MNQXlDL
   V+rWhZ2NZfE/NFyXulezqJeKRpJNSaq4AWHG9sNvvh2oGFDr26bxzQRT2
   Q==;
X-CSE-ConnectionGUID: CIZ9FHdoSKaTacDMKvpPig==
X-CSE-MsgGUID: UyBOqXxIRn6Xm8fF28FlEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33033114"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33033114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:18:18 -0800
X-CSE-ConnectionGUID: XaEfN1cHT2Spap/KeXqXag==
X-CSE-MsgGUID: SnrKxRjESYeVci7bc8mfHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="96830664"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2024 22:18:16 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGuKT-00003n-26;
	Fri, 29 Nov 2024 06:18:13 +0000
Date: Fri, 29 Nov 2024 14:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Arinzon <darinzon@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Shay Agroskin <shayagr@amazon.com>
Subject: drivers/net/ethernet/amazon/ena/ena_netdev.c:77 ena_tx_timeout()
 warn: inconsistent indenting
Message-ID: <202411291414.wG3ruDV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7af08b57bcb9ebf78675c50069c54125c0a8b795
commit: 071271f39ce833a3534d1fbd47174d1bed6d9326 net: ena: Add more information on TX timeouts
date:   10 months ago
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241129/202411291414.wG3ruDV0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291414.wG3ruDV0-lkp@intel.com/

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
