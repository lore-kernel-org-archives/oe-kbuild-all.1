Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15310F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 05:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687065730; x=1718601730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDo7zH6R3od1M/EGDwVcuWYWNzpXkmZ1gDk3i4KQia4=;
  b=G9syn9ZeYejw7DGMsm1ykgDZM1G/v0GcK0cFEKwlX7Pn723wk84gRAFu
   lg6WGQpwTZqHeys8vwJlIlFj2+3tNky55ukBUflPtkfyR4m7HK13LNelC
   E6b9OsThQu/T65xqCPnEtYYm5KOqRrxsULgzORgrqUFT8GGevzVH0LPEG
   3AnJV4gfWpGjgmOzBq8bP8azbqIBH7zbdPPe1YPoHclBnpDcXpT6ID4aG
   7ADhp6wMcXSsh/pabmxg1l7/G3e3ZroaDWqWtKRnDofMAEfe6vNHqWYuO
   oJlnxnSifNlDZ9IC6L7uMFZKqyuDdX1Ngb/lPg2xb75fi0kuMex8SJz4h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="356938668"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="356938668"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 22:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="783363623"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="783363623"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2023 22:22:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAkrU-0003Si-3B;
	Sun, 18 Jun 2023 05:22:04 +0000
Date: Sun, 18 Jun 2023 13:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 61/71]
 drivers/net/ethernet/intel/igc/igc_main.c:5420:9: error: implicit
 declaration of function 'pci_disable_ptm'; did you mean 'pci_disable_rom'?
Message-ID: <202306181325.6RXpGrr9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   87acf79f290bed063b819f50da30208e7d2a263a
commit: c074b9f5ab1ed5f73eb9cab7b1a3bcea36a1f1c5 [61/71] igc: Fix possible system crash when loading module
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230618/202306181325.6RXpGrr9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181325.6RXpGrr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181325.6RXpGrr9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_remove':
>> drivers/net/ethernet/intel/igc/igc_main.c:5420:9: error: implicit declaration of function 'pci_disable_ptm'; did you mean 'pci_disable_rom'? [-Werror=implicit-function-declaration]
    5420 |         pci_disable_ptm(pdev);
         |         ^~~~~~~~~~~~~~~
         |         pci_disable_rom
   cc1: some warnings being treated as errors


vim +5420 drivers/net/ethernet/intel/igc/igc_main.c

  5399	
  5400	/**
  5401	 * igc_remove - Device Removal Routine
  5402	 * @pdev: PCI device information struct
  5403	 *
  5404	 * igc_remove is called by the PCI subsystem to alert the driver
  5405	 * that it should release a PCI device.  This could be caused by a
  5406	 * Hot-Plug event, or because the driver is going to be removed from
  5407	 * memory.
  5408	 */
  5409	static void igc_remove(struct pci_dev *pdev)
  5410	{
  5411		struct net_device *netdev = pci_get_drvdata(pdev);
  5412		struct igc_adapter *adapter = netdev_priv(netdev);
  5413	
  5414		pm_runtime_get_noresume(&pdev->dev);
  5415	
  5416		igc_flush_nfc_rules(adapter);
  5417	
  5418		igc_ptp_stop(adapter);
  5419	
> 5420		pci_disable_ptm(pdev);
  5421		pci_clear_master(pdev);
  5422	
  5423		set_bit(__IGC_DOWN, &adapter->state);
  5424	
  5425		del_timer_sync(&adapter->watchdog_timer);
  5426		del_timer_sync(&adapter->phy_info_timer);
  5427	
  5428		cancel_work_sync(&adapter->reset_task);
  5429		cancel_work_sync(&adapter->watchdog_task);
  5430	
  5431		/* Release control of h/w to f/w.  If f/w is AMT enabled, this
  5432		 * would have already happened in close and is redundant.
  5433		 */
  5434		igc_release_hw_control(adapter);
  5435		unregister_netdev(netdev);
  5436	
  5437		igc_clear_interrupt_scheme(adapter);
  5438		pci_iounmap(pdev, adapter->io_addr);
  5439		pci_release_mem_regions(pdev);
  5440	
  5441		free_netdev(netdev);
  5442	
  5443		pci_disable_pcie_error_reporting(pdev);
  5444	
  5445		pci_disable_device(pdev);
  5446	}
  5447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
