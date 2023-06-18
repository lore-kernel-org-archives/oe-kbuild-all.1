Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB115AA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687075810; x=1718611810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPFw01sImwUirX+50RiagL8/v9TYQ1W7D7nI8cqagfQ=;
  b=ceaOoFnQIfx1pXdneGUvvLbVvf0dS3zhgQNs5/zdQhhqLNuAh9LSOnmn
   GqoBuTLddva+GPgBMkR1VOlSha4y8FI7rxfp3b4Vlkd43l+JAG9RWDDb2
   p7bfiEtIZLBnEKHmYwrnmWCBlh+MWaSMZvU41362gcix03D/jQ4R2Grfx
   8aLSRl5BWsXq8gS1wsRZXI6C5Jiikasz2gGqlkHXnrZQi+K8FWNOBsyJ0
   8wSoP4vBCy0O3VqAT3SkGg0baxvH75y7VmRJq+3G8HKITejBQvugNcP/O
   +oxqJ/SvthcJo8JU+5OjiW02gogU6Qfn4d8OPlNOPI3gtd6KWYKK7BjBe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="388384577"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="388384577"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 01:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="1043555457"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="1043555457"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2023 01:10:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAnU8-0003Yy-2g;
	Sun, 18 Jun 2023 08:10:08 +0000
Date: Sun, 18 Jun 2023 16:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 61/71]
 drivers/net/ethernet/intel/igc/igc_main.c:5420:2: error: implicit
 declaration of function 'pci_disable_ptm'
Message-ID: <202306181629.9IfRMfEn-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230618/202306181629.9IfRMfEn-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181629.9IfRMfEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181629.9IfRMfEn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/igc/igc_main.c:5420:2: error: implicit declaration of function 'pci_disable_ptm' [-Werror,-Wimplicit-function-declaration]
           pci_disable_ptm(pdev);
           ^
   drivers/net/ethernet/intel/igc/igc_main.c:5420:2: note: did you mean 'pci_disable_rom'?
   include/linux/pci.h:1247:6: note: 'pci_disable_rom' declared here
   void pci_disable_rom(struct pci_dev *pdev);
        ^
   1 error generated.


vim +/pci_disable_ptm +5420 drivers/net/ethernet/intel/igc/igc_main.c

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
