Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09950A72
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713021701; cv=none; b=UR96hYb+OCzycg7ev16qiCWQr+/mCZyzANmvZ7BNtr8ul/aySm/8lx7hnJVp9icJY8CGkmdgPmhbskOcDZGxtQwhB/Z/JlIjouKEn8eOuegLhFxp7G/lJpRm98aMLBHEoqaK4a8n0yUB27A1QdSextSUYsNm9mE7iO4btObsa/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713021701; c=relaxed/simple;
	bh=8o8wNfZiqOllySCSWtYP+XxlD5uyFLJ9aL1m25Daj3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkOxVcXcV5UrL4WJ+UP76D2NIbmy9MjbPA8MN86l4nWVjUeQ/zkc2ak5BOCaUNuyvhmgNqkgvH6fGWN6f5IeA9rNX7JSyvnTqjpmXDO2eZmpaycvf5E5sxQmNXZiSYA/S7y0i9oJ9wIj4cbcjkzhPvJtP3KTj7s442Yo+/SJWbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzBQQby1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzBQQby1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713021698; x=1744557698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8o8wNfZiqOllySCSWtYP+XxlD5uyFLJ9aL1m25Daj3E=;
  b=AzBQQby14Cuv1DDjWCiDxhkm9ZsCkXVy82Kvv5AS3+XokUuucK4DorjT
   b/SfrzS7ouhc7xRSoxaZekRKUdanyyANO64oAl1Hs5ffAGiam2/aU3K99
   J2Z2ghFFul0vJviDD7kxIRI2VciOzF5htZfHa+TkibLxPz+1APJ/DpWDG
   LW3SMvryJrN9inZ9SJkbbrC3/mAnDlGDSViGmxCwLQcY+TWI43m6tCBiN
   mJbvYWkm6u0TcwBPBdmEs5HEXD7Vjmn0dOZkeWGktNYknpWbzjEBzwLyN
   S/fXLQPuqVst7jSEIst+mm9gZxYXnbR/866NVJgwjza/BGu3ir5uIArXN
   A==;
X-CSE-ConnectionGUID: LxJo4owQTUuZlAWucHMaFQ==
X-CSE-MsgGUID: dHcOfpyCRnq3NwfWoc2bOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8590042"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="8590042"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 08:21:38 -0700
X-CSE-ConnectionGUID: rqsUbnUXSb2DaUHeJfsuvA==
X-CSE-MsgGUID: xyGj0ufZQ3uX29IREOJrZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="21486591"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Apr 2024 08:21:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvfCA-0002mc-0f;
	Sat, 13 Apr 2024 15:21:34 +0000
Date: Sat, 13 Apr 2024 23:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 6340/30000]
 drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2437:26: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202404132358.tVVjLv9W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4134526a9cfd552230ec7a66a1738a9066d9a0c6
commit: 5110b9f48a67483d9b1b0946acb251a3c9fbee73 [6340/30000] Huawei BMA: Adding Huawei BMA driver: host_veth_drv
config: x86_64-randconfig-122-20240413 (https://download.01.org/0day-ci/archive/20240413/202404132358.tVVjLv9W-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404132358.tVVjLv9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404132358.tVVjLv9W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:88:23: sparse: sparse: symbol 'g_bspveth_dev' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:394:5: sparse: sparse: symbol 'bspveth_setup_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:443:6: sparse: sparse: symbol 'bspveth_free_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:485:5: sparse: sparse: symbol 'bspveth_setup_all_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:554:6: sparse: sparse: symbol 'bspveth_free_all_tx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:571:5: sparse: sparse: symbol 'veth_alloc_one_rx_skb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:616:5: sparse: sparse: symbol 'veth_refill_rxskb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:654:5: sparse: sparse: symbol 'bspveth_setup_rx_skb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:685:6: sparse: sparse: symbol 'bspveth_free_rx_skb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:718:5: sparse: sparse: symbol 'bspveth_setup_all_rx_skb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:746:6: sparse: sparse: symbol 'bspveth_free_all_rx_skb' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:758:5: sparse: sparse: symbol 'bspveth_setup_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:809:6: sparse: sparse: symbol 'bspveth_free_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:841:5: sparse: sparse: symbol 'bspveth_setup_all_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:908:6: sparse: sparse: symbol 'bspveth_free_all_rx_resources' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:926:5: sparse: sparse: symbol 'bspveth_dev_install' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:961:5: sparse: sparse: symbol 'bspveth_dev_uninstall' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1046:5: sparse: sparse: symbol 'veth_config' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1063:6: sparse: sparse: symbol 'bspveth_initstatis' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1088:5: sparse: sparse: symbol 'veth_ioctl' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1093:25: sparse: sparse: symbol 'veth_stats' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1098:5: sparse: sparse: symbol 'veth_mac_set' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1234:6: sparse: sparse: symbol 'veth_netdev_func_init' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1268:5: sparse: sparse: symbol 'veth_send_one_pkt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1544:6: sparse: sparse: symbol 'veth_skbtrtimer_do' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1591:6: sparse: sparse: symbol 'veth_netdev_exit' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1628:5: sparse: sparse: symbol 'veth_netdev_init' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1719:6: sparse: sparse: symbol 'veth_dma_tx_timer_do_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1769:5: sparse: sparse: symbol 'dmacmp_err_deal' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1806:5: sparse: sparse: symbol 'veth_check_dma_status' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1834:5: sparse: sparse: symbol '__check_dmacmp_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1906:5: sparse: sparse: symbol '__checkspace_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:1987:5: sparse: sparse: symbol '__make_dmalistbd_h2b_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2091:5: sparse: sparse: symbol '__make_dmalistbd_b2h_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2194:5: sparse: sparse: symbol '__start_dmalist_H' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2240:5: sparse: sparse: symbol 'check_dma_queue_fault' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2388:6: sparse: sparse: symbol 'bspveth_host_exit_H' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2437:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c:2402:5: sparse: sparse: symbol 'bspveth_host_init_H' was not declared. Should it be static?

vim +/__iomem +2437 drivers/net/ethernet/huawei/bma/veth_drv/veth_hb.c

  2401	
  2402	s32 bspveth_host_init_H(void)
  2403	{
  2404		int ret = 0;
  2405		struct bma_priv_data_s *bma_priv = NULL;
  2406	
  2407		ret = bma_intf_register_type(TYPE_VETH, 0, INTR_ENABLE,
  2408					     (void **)&bma_priv);
  2409		if (ret) {
  2410			ret = -1;
  2411			goto failed;
  2412		}
  2413	
  2414		if (!bma_priv) {
  2415			VETH_LOG(DLOG_ERROR, "bma_priv is NULL\n");
  2416			return -1;
  2417		}
  2418	
  2419		VETH_LOG(DLOG_DEBUG,
  2420			 "bma_intf_register_type pdev = %p, veth_swap_addr = %p, ",
  2421			 bma_priv->specific.veth.pdev,
  2422			 bma_priv->specific.veth.veth_swap_addr);
  2423	
  2424		VETH_LOG(DLOG_DEBUG,
  2425			 "veth_swap_len = 0x%lx, veth_swap_phy_addr = 0x%lx\n",
  2426			 bma_priv->specific.veth.veth_swap_len,
  2427			 bma_priv->specific.veth.veth_swap_phy_addr);
  2428	
  2429		g_bspveth_dev.bma_priv = bma_priv;
  2430		g_bspveth_dev.ppcidev = bma_priv->specific.veth.pdev;
  2431	
  2432		/*bspveth_dev.phostrtc_p = (u8 *)bar1_base;*/
  2433		/*bspveth_dev.phostrtc_v = (u8 *)bar1_remap;*/
  2434		g_bspveth_dev.pshmpool_p =
  2435				(u8 *)bma_priv->specific.veth.veth_swap_phy_addr;
  2436		g_bspveth_dev.pshmpool_v =
> 2437				(u8 *)bma_priv->specific.veth.veth_swap_addr;
  2438		g_bspveth_dev.shmpoolsize = bma_priv->specific.veth.veth_swap_len;
  2439	
  2440		VETH_LOG(DLOG_DEBUG, "bspveth host init H OK\n");
  2441	
  2442		return BSP_OK;
  2443	
  2444	failed:
  2445		return ret;
  2446	}
  2447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
