Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BCD1474A2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728841401; cv=none; b=bJqYKDVWm9oTCWjA80UVkWYbLWxvrdF23TfTWK1SSXH93KM67ZbdP6XvyiqcxgGQVCJkBpJOKwTbWLaQ+rCPcMKOBU+NnSgoclw3l+HzgjpjNv27ii6K6Aa0/fl7HVcVz5T1vQRhsdrYBPTa6j6fB7r0uacj5RNC1GpHaMSXFsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728841401; c=relaxed/simple;
	bh=xGiMYNzQyYWYizOA9WyieVAfnmrBLjxVDxs/6MUUF48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAMUV6wClY/MQs/WkdpAjDOsoYV9kt1Nuw6z/O0W8we+qXHHdDEK6v8W2Y0mX25Aai1kbM4xUiMnePMUg5Nz4yVJ+aKmfUC9uFczKrcJkMh7u+3tYg7OoDC7+xyNkBCEc3DxGwZJltnRp4xSMHKs9Tm84gk+v1sRGDnL8IaIZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI+oz8ih; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI+oz8ih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728841400; x=1760377400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xGiMYNzQyYWYizOA9WyieVAfnmrBLjxVDxs/6MUUF48=;
  b=QI+oz8ihtuFym6sF0kOmswL5RaTbIVjkGeXFH7Gp+KiTb6gx1rkcHqe9
   SdgIUvuk6QiVhdiWmeMvvFaOfZtMCtqFEqLftIgfESsLfZfnGBhzqE7X0
   MruDUwXGekIyDUaAWd+Y+w6/s5C61dv4zpjZ0A5/WmhkwY4J/XEnSBcYq
   MRUNGnUIhUbAwmQvw7XHzB856CYAPcNUDSVp6NxYRfbiKjJD9xqJmF9lZ
   FtHif7cCMyMd+VODQGNPSRsvprYNrA7r6iMPey5pAnsGkj8q/+mVMHlSZ
   tZveFhyj2TgTWss+JKfaumQ4KwfmrsLvcxq2wWJLjyU54u9O0loAic9Iu
   g==;
X-CSE-ConnectionGUID: O+zkh9UaSaKnsi69huxtRQ==
X-CSE-MsgGUID: N9O8MRMmQrC4p5bW3Aa10g==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39573659"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="39573659"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 10:41:02 -0700
X-CSE-ConnectionGUID: bKnxKePpQtOufg/R7RqHkg==
X-CSE-MsgGUID: A1vYY1XcRh2BC6bReMPLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="77231816"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Oct 2024 10:41:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t02aP-000EaF-1l;
	Sun, 13 Oct 2024 17:40:57 +0000
Date: Mon, 14 Oct 2024 01:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 2/6]
 drivers/net/ethernet/ti/icssg_prueth.c:1887:3: warning: add explicit braces
 to avoid dangling else
Message-ID: <202410140141.tGLzteaD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi MD,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: da449d8c3cf600b0346a6696e1e3cc431422e765 [2/6] net: ti: icssg-prueth: Fix multicast filtering in MAC mode
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241014/202410140141.tGLzteaD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410140141.tGLzteaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410140141.tGLzteaD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/icssg_prueth.c:12:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1775:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg_prueth.c:813:5: warning: no previous prototype for function 'prueth_tx_ts_cookie_get' [-Wmissing-prototypes]
     813 | int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
         |     ^
   drivers/net/ethernet/ti/icssg_prueth.c:813:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     813 | int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
         | ^
         | static 
>> drivers/net/ethernet/ti/icssg_prueth.c:1887:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
    1887 |                 else
         |                 ^
   7 warnings generated.


vim +1887 drivers/net/ethernet/ti/icssg_prueth.c

  1857	
  1858	/**
  1859	 * emac_ndo_stop - EMAC device stop
  1860	 * @ndev: network adapter device
  1861	 *
  1862	 * Called when system wants to stop or down the interface.
  1863	 */
  1864	static int emac_ndo_stop(struct net_device *ndev)
  1865	{
  1866		struct prueth_emac *emac = netdev_priv(ndev);
  1867		struct prueth *prueth = emac->prueth;
  1868		int rx_flow = PRUETH_RX_FLOW_DATA;
  1869		int max_rx_flows;
  1870		int ret, i;
  1871	
  1872		/* inform the upper layers. */
  1873		netif_tx_stop_all_queues(ndev);
  1874	
  1875		/* block packets from wire */
  1876		if (ndev->phydev)
  1877			phy_stop(ndev->phydev);
  1878	
  1879		if (prueth->num_emacs_initialized == 1) {
  1880			icssg_class_disable(prueth->miig_rt, ICSS_SLICE0);
  1881			icssg_class_disable(prueth->miig_rt, ICSS_SLICE1);
  1882		}
  1883	
  1884		if (!prueth->is_switch_mode)
  1885			if (prueth->is_hsr_offload_mode)
  1886				__dev_mc_unsync(ndev, icssg_prueth_hsr_del_mcast);
> 1887			else
  1888				__dev_mc_unsync(ndev, icssg_prueth_del_mcast);
  1889	
  1890		__hw_addr_init(&emac->mcast_list);
  1891	
  1892		atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
  1893		/* ensure new tdown_cnt value is visible */
  1894		smp_mb__after_atomic();
  1895		/* tear down and disable UDMA channels */
  1896		reinit_completion(&emac->tdown_complete);
  1897		for (i = 0; i < emac->tx_ch_num; i++)
  1898			k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
  1899	
  1900		ret = wait_for_completion_timeout(&emac->tdown_complete,
  1901						  msecs_to_jiffies(1000));
  1902		if (!ret)
  1903			netdev_err(ndev, "tx teardown timeout\n");
  1904	
  1905		prueth_reset_tx_chan(emac, emac->tx_ch_num, true);
  1906		for (i = 0; i < emac->tx_ch_num; i++) {
  1907			napi_disable(&emac->tx_chns[i].napi_tx);
  1908			hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
  1909		}
  1910	
  1911		max_rx_flows = PRUETH_MAX_RX_FLOWS;
  1912		k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
  1913	
  1914		prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, true);
  1915	
  1916		prueth_destroy_xdp_rxqs(emac);
  1917	
  1918		napi_disable(&emac->napi_rx);
  1919		hrtimer_cancel(&emac->rx_hrtimer);
  1920	
  1921		cancel_work_sync(&emac->rx_mode_work);
  1922	
  1923		if (prueth->num_emacs_initialized == 1) {
  1924			icss_iep_exit(emac->iep);
  1925			/* stop PRUs */
  1926			if (prueth->emac[ICSS_SLICE0])
  1927				prueth_emac_stop(prueth->emac[ICSS_SLICE0]);
  1928			if (prueth->emac[ICSS_SLICE1])
  1929				prueth_emac_stop(prueth->emac[ICSS_SLICE1]);
  1930		}
  1931	
  1932		/* Destroying the queued work in ndo_stop() */
  1933		cancel_delayed_work_sync(&emac->stats_work);
  1934	
  1935		free_irq(emac->tx_ts_irq, emac);
  1936	
  1937		free_irq(emac->rx_chns.irq[rx_flow], emac);
  1938		prueth_ndev_del_tx_napi(emac, emac->tx_ch_num);
  1939		prueth_cleanup_tx_chns(emac);
  1940	
  1941		prueth_cleanup_rx_chns(emac, &emac->rx_chns, max_rx_flows);
  1942		prueth_cleanup_tx_chns(emac);
  1943	
  1944		prueth->num_emacs_initialized--;
  1945	
  1946		return 0;
  1947	}
  1948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
