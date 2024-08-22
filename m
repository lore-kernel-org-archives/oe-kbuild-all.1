Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7C0249ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 02:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724294597; cv=none; b=Y8b70/WYu1sNTqui87pwUmqU1YsRuQ2+9eqRtcl55NffZ6Jy1fQWktfNt3O83lUiwN6bCVjTSFRV58KgXOlAlfUMcsnMqi7QCl4u3+tu96suFdiNJDow9UFGPKlfEolsl6oxujfHufV9WPYglvHfCfYdgDyrHUAvy8JXdQkmg+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724294597; c=relaxed/simple;
	bh=l2FX4ASzp2szJxpz78yuEICuX0LsNGlLD+a/73CmeSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsaX2aX3+piJEYTT1TC9pHoA/ro5CqsprlqNa7v0mWrux35cUI6exBAJt0NyjFr7Wd8+27OwVIoaGhGR/Dr6hRwWNMYNuLm82/MUmhxunCT681EDY5BE2fri83WZnOaEHb4NR5aIHxjtkrqYWW8Llh8OnD+pvnCff50lV0whcsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PieF4biJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PieF4biJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724294596; x=1755830596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l2FX4ASzp2szJxpz78yuEICuX0LsNGlLD+a/73CmeSo=;
  b=PieF4biJVUKjuKz1JmlC7AiQjI95X2Z0j2zMlSzmgxKtmcXzVluXeIu/
   Jm4Q8XiPOSC6MtM7bGFiLwW9GPO9DIF1jhqvvndaoaBKFCWdz5xFYZ9rv
   fBvihA+KwDLYLtd9EBSXnjKbx50YPrahPNGTwdG26Z52y+QibzTaSlSQd
   /2RcJSgMXrPSB4Swv7Yj+c8buvYrlOsKahManvIitUP8TyOmFZUKH1+Y1
   vsTbujaMbWeO46ZJUbsLRjo43t7mxw9fCLU1hrFBLyljNYfSaeRxP/W9c
   2wSW6AXlVzIJ2U8+mB48fr6aZLEqaD6EoLm451n6ACKuHCAUy+bxD9A8R
   w==;
X-CSE-ConnectionGUID: hlSqCDm3QHGY88aqYmV1BQ==
X-CSE-MsgGUID: 8+UkNN6GREmBZh8ssEC/zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26483209"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="26483209"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 19:43:15 -0700
X-CSE-ConnectionGUID: UvcXbx0NQ1WpVnOe/ybUqw==
X-CSE-MsgGUID: HObgLCYwQkSWwHPj5C1j+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="66110474"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2024 19:43:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgxn5-000CBq-2B;
	Thu, 22 Aug 2024 02:43:11 +0000
Date: Thu, 22 Aug 2024 10:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Wojciech Drewek <wojciech.drewek@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v10 06/14] iavf: add initial
 framework for registering PTP clock
Message-ID: <202408221033.bFLUjYKU-lkp@intel.com>
References: <20240821121539.374343-7-wojciech.drewek@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821121539.374343-7-wojciech.drewek@intel.com>

Hi Wojciech,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Wojciech-Drewek/virtchnl-add-support-for-enabling-PTP-on-iAVF/20240821-202156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20240821121539.374343-7-wojciech.drewek%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v10 06/14] iavf: add initial framework for registering PTP clock
config: i386-buildonly-randconfig-002-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221033.bFLUjYKU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221033.bFLUjYKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221033.bFLUjYKU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_remove':
>> drivers/net/ethernet/intel/iavf/iavf_main.c:5480: undefined reference to `iavf_ptp_release'
   ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_init_config_adapter':
>> drivers/net/ethernet/intel/iavf/iavf_main.c:2839: undefined reference to `iavf_ptp_init'
   ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_configure_queues':
>> drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:409: undefined reference to `iavf_ptp_cap_supported'
   ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_virtchnl_completion':
>> drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:2504: undefined reference to `iavf_ptp_process_caps'
   ld: net/core/net-sysfs.o: in function `netdev_queue_update_kobjects':
   net/core/net-sysfs.c:1852: undefined reference to `dql_group'
   ld: net/core/net-sysfs.o: in function `netdev_queue_add_kobject':
   net/core/net-sysfs.c:1792: undefined reference to `dql_group'


vim +5480 drivers/net/ethernet/intel/iavf/iavf_main.c

  5410	
  5411	/**
  5412	 * iavf_remove - Device Removal Routine
  5413	 * @pdev: PCI device information struct
  5414	 *
  5415	 * iavf_remove is called by the PCI subsystem to alert the driver
  5416	 * that it should release a PCI device.  The could be caused by a
  5417	 * Hot-Plug event, or because the driver is going to be removed from
  5418	 * memory.
  5419	 **/
  5420	static void iavf_remove(struct pci_dev *pdev)
  5421	{
  5422		struct iavf_fdir_fltr *fdir, *fdirtmp;
  5423		struct iavf_vlan_filter *vlf, *vlftmp;
  5424		struct iavf_cloud_filter *cf, *cftmp;
  5425		struct iavf_adv_rss *rss, *rsstmp;
  5426		struct iavf_mac_filter *f, *ftmp;
  5427		struct iavf_adapter *adapter;
  5428		struct net_device *netdev;
  5429		struct iavf_hw *hw;
  5430	
  5431		/* Don't proceed with remove if netdev is already freed */
  5432		netdev = pci_get_drvdata(pdev);
  5433		if (!netdev)
  5434			return;
  5435	
  5436		adapter = iavf_pdev_to_adapter(pdev);
  5437		hw = &adapter->hw;
  5438	
  5439		if (test_and_set_bit(__IAVF_IN_REMOVE_TASK, &adapter->crit_section))
  5440			return;
  5441	
  5442		/* Wait until port initialization is complete.
  5443		 * There are flows where register/unregister netdev may race.
  5444		 */
  5445		while (1) {
  5446			mutex_lock(&adapter->crit_lock);
  5447			if (adapter->state == __IAVF_RUNNING ||
  5448			    adapter->state == __IAVF_DOWN ||
  5449			    adapter->state == __IAVF_INIT_FAILED) {
  5450				mutex_unlock(&adapter->crit_lock);
  5451				break;
  5452			}
  5453			/* Simply return if we already went through iavf_shutdown */
  5454			if (adapter->state == __IAVF_REMOVE) {
  5455				mutex_unlock(&adapter->crit_lock);
  5456				return;
  5457			}
  5458	
  5459			mutex_unlock(&adapter->crit_lock);
  5460			usleep_range(500, 1000);
  5461		}
  5462		cancel_delayed_work_sync(&adapter->watchdog_task);
  5463		cancel_work_sync(&adapter->finish_config);
  5464	
  5465		if (netdev->reg_state == NETREG_REGISTERED)
  5466			unregister_netdev(netdev);
  5467	
  5468		mutex_lock(&adapter->crit_lock);
  5469		dev_info(&adapter->pdev->dev, "Removing device\n");
  5470		iavf_change_state(adapter, __IAVF_REMOVE);
  5471	
  5472		iavf_request_reset(adapter);
  5473		msleep(50);
  5474		/* If the FW isn't responding, kick it once, but only once. */
  5475		if (!iavf_asq_done(hw)) {
  5476			iavf_request_reset(adapter);
  5477			msleep(50);
  5478		}
  5479	
> 5480		iavf_ptp_release(adapter);
  5481	
  5482		iavf_misc_irq_disable(adapter);
  5483		/* Shut down all the garbage mashers on the detention level */
  5484		cancel_work_sync(&adapter->reset_task);
  5485		cancel_delayed_work_sync(&adapter->watchdog_task);
  5486		cancel_work_sync(&adapter->adminq_task);
  5487	
  5488		adapter->aq_required = 0;
  5489		adapter->flags &= ~IAVF_FLAG_REINIT_ITR_NEEDED;
  5490	
  5491		iavf_free_all_tx_resources(adapter);
  5492		iavf_free_all_rx_resources(adapter);
  5493		iavf_free_misc_irq(adapter);
  5494		iavf_free_interrupt_scheme(adapter);
  5495	
  5496		iavf_free_rss(adapter);
  5497	
  5498		if (hw->aq.asq.count)
  5499			iavf_shutdown_adminq(hw);
  5500	
  5501		/* destroy the locks only once, here */
  5502		mutex_destroy(&hw->aq.arq_mutex);
  5503		mutex_destroy(&hw->aq.asq_mutex);
  5504		mutex_unlock(&adapter->crit_lock);
  5505		mutex_destroy(&adapter->crit_lock);
  5506	
  5507		iounmap(hw->hw_addr);
  5508		pci_release_regions(pdev);
  5509		kfree(adapter->vf_res);
  5510		spin_lock_bh(&adapter->mac_vlan_list_lock);
  5511		/* If we got removed before an up/down sequence, we've got a filter
  5512		 * hanging out there that we need to get rid of.
  5513		 */
  5514		list_for_each_entry_safe(f, ftmp, &adapter->mac_filter_list, list) {
  5515			list_del(&f->list);
  5516			kfree(f);
  5517		}
  5518		list_for_each_entry_safe(vlf, vlftmp, &adapter->vlan_filter_list,
  5519					 list) {
  5520			list_del(&vlf->list);
  5521			kfree(vlf);
  5522		}
  5523	
  5524		spin_unlock_bh(&adapter->mac_vlan_list_lock);
  5525	
  5526		spin_lock_bh(&adapter->cloud_filter_list_lock);
  5527		list_for_each_entry_safe(cf, cftmp, &adapter->cloud_filter_list, list) {
  5528			list_del(&cf->list);
  5529			kfree(cf);
  5530		}
  5531		spin_unlock_bh(&adapter->cloud_filter_list_lock);
  5532	
  5533		spin_lock_bh(&adapter->fdir_fltr_lock);
  5534		list_for_each_entry_safe(fdir, fdirtmp, &adapter->fdir_list_head, list) {
  5535			list_del(&fdir->list);
  5536			kfree(fdir);
  5537		}
  5538		spin_unlock_bh(&adapter->fdir_fltr_lock);
  5539	
  5540		spin_lock_bh(&adapter->adv_rss_lock);
  5541		list_for_each_entry_safe(rss, rsstmp, &adapter->adv_rss_list_head,
  5542					 list) {
  5543			list_del(&rss->list);
  5544			kfree(rss);
  5545		}
  5546		spin_unlock_bh(&adapter->adv_rss_lock);
  5547	
  5548		destroy_workqueue(adapter->wq);
  5549	
  5550		pci_set_drvdata(pdev, NULL);
  5551	
  5552		free_netdev(netdev);
  5553	
  5554		pci_disable_device(pdev);
  5555	}
  5556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
