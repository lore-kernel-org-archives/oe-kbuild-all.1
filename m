Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF27918AE2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737544126; cv=none; b=F263oDmbUQKCghNQeGDwiRSTzY4fUpzOfBdjVs07UrnnIkWDhmMbmXpTMvbiHvHffJdDoDh2msuA6e6XPHThxiKgCWMQkkAkN8h5lgZ1NMgHEZc47GgxxYXmF8p6xU6owLAlLCuDXYLOQ/icf1E2FV/XDI6/pRN/sKkpbepIsH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737544126; c=relaxed/simple;
	bh=K5hA9etYh2c89hQgdpqoX9vAJ4JYPv1JrnZhZrthHPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oIPgB0dseHg/LERM9H5QVyQ/WieF+yvqdLM4hM/qP2R2br4gKLC9vyvMDJrPzrQ+tCFNUBqPbZ/NSysQsSxV5nuMR98M9JSd+pHWTnxb3fKIpHBFe3GSO4b7krIA3L6JCTE+cRtcxelAjx3l3J2/cr7uSqmCKDEB0k1JrfF/S5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3N0A4+Q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3N0A4+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737544123; x=1769080123;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K5hA9etYh2c89hQgdpqoX9vAJ4JYPv1JrnZhZrthHPE=;
  b=U3N0A4+QU73kSCC7bfu8VzvXimqfCJ9xJkIzZaZAcv2uYLbv1JY6zeXb
   9G8o8ED167rS21NdBuqURsEsSqlXrZl/aNVExOkHX9Da7g4w3C6UAnP0F
   4E9s1QHwf/wsTJeMgCghxszp6WzCWU4Q4xZeCIGjiFHqnOwXJ9uw/fih5
   199lC49YIT1MVCvRiYC+ijrxi50YRgP3ExKpNYbDb0aQevSz0+zktdl7L
   CzcUggCHCGIGJFEqU7QLGI1rgS/N6nDxM6qVK6IRYsEFeWjoFh+pU23ji
   dNX7eFcQiWO87Yi72D+SVEd6F7RLnXV+LquTbR11yj4X4azDeXWo4Znud
   w==;
X-CSE-ConnectionGUID: drVKCNzrQGmkeD3Ngqpmtg==
X-CSE-MsgGUID: Hsow4EaBRNChPnC+Z61img==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37692528"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37692528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 03:08:43 -0800
X-CSE-ConnectionGUID: JrzaAwZMQ5WUSYNi61FHTw==
X-CSE-MsgGUID: b84PVpRkR6ORxXrkHsY1Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="137955227"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jan 2025 03:08:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taYb8-000Zm7-1q;
	Wed, 22 Jan 2025 11:08:38 +0000
Date: Wed, 22 Jan 2025 19:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/net/ethernet/yunsilicon/xsc/net/main.c:197:6: warning: no previous
 prototype for 'xsc_eth_cq_error_event'
Message-ID: <202501221955.lCr3eThq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: 601fb01dc16f747534b866610743d95830b6655e [1834/1834] drivers: support for xsc drivers from Yunsilicon Technology
config: x86_64-randconfig-121-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221955.lCr3eThq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221955.lCr3eThq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221955.lCr3eThq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/yunsilicon/xsc/net/main.c:166:5: warning: no previous prototype for 'xsc_rx_alloc_page_cache' [-Wmissing-prototypes]
     166 | int xsc_rx_alloc_page_cache(struct xsc_rq *rq, int node, u8 log_init_sz)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:179:6: warning: no previous prototype for 'xsc_rx_free_page_cache' [-Wmissing-prototypes]
     179 | void xsc_rx_free_page_cache(struct xsc_rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:197:6: warning: no previous prototype for 'xsc_eth_cq_error_event' [-Wmissing-prototypes]
     197 | void xsc_eth_cq_error_event(struct xsc_core_cq *xcq, enum xsc_event event)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:211:6: warning: no previous prototype for 'xsc_eth_completion_event' [-Wmissing-prototypes]
     211 | void xsc_eth_completion_event(struct xsc_core_cq *xcq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:260:5: warning: no previous prototype for 'xsc_eth_create_cq' [-Wmissing-prototypes]
     260 | int xsc_eth_create_cq(struct xsc_core_device *xdev, struct xsc_core_cq *xcq,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:295:5: warning: no previous prototype for 'xsc_eth_destroy_cq' [-Wmissing-prototypes]
     295 | int xsc_eth_destroy_cq(struct xsc_core_device *xdev, struct xsc_cq *cq)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:333:6: warning: no previous prototype for 'xsc_eth_free_cq' [-Wmissing-prototypes]
     333 | void xsc_eth_free_cq(struct xsc_cq *cq)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:338:5: warning: no previous prototype for 'xsc_eth_create_rss_qp_rqs' [-Wmissing-prototypes]
     338 | int xsc_eth_create_rss_qp_rqs(struct xsc_core_device *xdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:359:6: warning: no previous prototype for 'xsc_eth_qp_event' [-Wmissing-prototypes]
     359 | void xsc_eth_qp_event(struct xsc_core_qp *qp, int type)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:389:5: warning: no previous prototype for 'xsc_eth_create_qp_rq' [-Wmissing-prototypes]
     389 | int xsc_eth_create_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:416:5: warning: no previous prototype for 'xsc_eth_destroy_qp_rq' [-Wmissing-prototypes]
     416 | int xsc_eth_destroy_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:469:5: warning: no previous prototype for 'xsc_eth_create_qp_sq' [-Wmissing-prototypes]
     469 | int xsc_eth_create_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:488:5: warning: no previous prototype for 'xsc_eth_modify_qp_sq' [-Wmissing-prototypes]
     488 | int xsc_eth_modify_qp_sq(struct xsc_core_device *xdev, struct xsc_modify_raw_qp_mbox_in *in)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:506:5: warning: no previous prototype for 'xsc_eth_destroy_qp_sq' [-Wmissing-prototypes]
     506 | int xsc_eth_destroy_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:750:5: warning: no previous prototype for 'xsc_eth_set_hw_mtu' [-Wmissing-prototypes]
     750 | int xsc_eth_set_hw_mtu(struct xsc_core_device *dev, u16 mtu, u16 rx_buf_sz)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:775:5: warning: no previous prototype for 'xsc_eth_get_mac' [-Wmissing-prototypes]
     775 | int xsc_eth_get_mac(struct xsc_core_device *dev, char *mac)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:806:5: warning: no previous prototype for 'xsc_eth_modify_qps_channel' [-Wmissing-prototypes]
     806 | int xsc_eth_modify_qps_channel(struct xsc_adapter *adapter, struct xsc_channel *c)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:828:5: warning: no previous prototype for 'xsc_eth_modify_qps' [-Wmissing-prototypes]
     828 | int xsc_eth_modify_qps(struct xsc_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:845:5: warning: no previous prototype for 'xsc_rx_get_linear_frag_sz' [-Wmissing-prototypes]
     845 | u32 xsc_rx_get_linear_frag_sz(u32 mtu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:852:6: warning: no previous prototype for 'xsc_rx_is_linear_skb' [-Wmissing-prototypes]
     852 | bool xsc_rx_is_linear_skb(u32 mtu)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:1316:5: warning: no previous prototype for 'xsc_eth_open_channel' [-Wmissing-prototypes]
    1316 | int xsc_eth_open_channel(struct xsc_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1528:5: warning: no previous prototype for 'xsc_eth_open_channels' [-Wmissing-prototypes]
    1528 | int xsc_eth_open_channels(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:1640:6: warning: no previous prototype for 'xsc_eth_activate_channel' [-Wmissing-prototypes]
    1640 | void xsc_eth_activate_channel(struct xsc_channel *c)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1646:6: warning: no previous prototype for 'xsc_eth_deactivate_channel' [-Wmissing-prototypes]
    1646 | void xsc_eth_deactivate_channel(struct xsc_channel *c)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1692:6: warning: no previous prototype for 'xsc_eth_activate_priv_channels' [-Wmissing-prototypes]
    1692 | void xsc_eth_activate_priv_channels(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1707:6: warning: no previous prototype for 'xsc_eth_deactivate_priv_channels' [-Wmissing-prototypes]
    1707 | void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1850:5: warning: no previous prototype for 'xsc_eth_change_link_status' [-Wmissing-prototypes]
    1850 | int xsc_eth_change_link_status(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1907:6: warning: no previous prototype for 'xsc_eth_event_handler' [-Wmissing-prototypes]
    1907 | void xsc_eth_event_handler(void *arg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1915:5: warning: no previous prototype for 'xsc_eth_enable_nic_hca' [-Wmissing-prototypes]
    1915 | int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:1977:5: warning: no previous prototype for 'xsc_eth_disable_nic_hca' [-Wmissing-prototypes]
    1977 | int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2010:6: warning: no previous prototype for 'xsc_eth_rss_params_change' [-Wmissing-prototypes]
    2010 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2318:6: warning: no previous prototype for 'xsc_build_default_indir_rqt' [-Wmissing-prototypes]
    2318 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2416:5: warning: no previous prototype for 'xsc_eth_nic_mtu_changed' [-Wmissing-prototypes]
    2416 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2479:5: warning: no previous prototype for 'xsc_set_vf_mac' [-Wmissing-prototypes]
    2479 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2496:5: warning: no previous prototype for 'xsc_get_vf_config' [-Wmissing-prototypes]
    2496 | int xsc_get_vf_config(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2512:5: warning: no previous prototype for 'set_feature_rxcsum' [-Wmissing-prototypes]
    2512 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2564:5: warning: no previous prototype for 'xsc_eth_set_features' [-Wmissing-prototypes]
    2564 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2581:5: warning: no previous prototype for 'xsc_select_queue' [-Wmissing-prototypes]
    2581 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c: In function 'xsc_get_phys_port_name':
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2628:28: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
    2628 |                 if (!pdev->physfn)
         |                            ^~~~~~
         |                            is_physfn
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2630:49: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
    2630 |                 pf_xdev = pci_get_drvdata(pdev->physfn);
         |                                                 ^~~~~~
         |                                                 is_physfn
   drivers/net/ethernet/yunsilicon/xsc/net/main.c: At top level:
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2769:24: warning: no previous prototype for 'xsc_tirc_get_default_config' [-Wmissing-prototypes]
    2769 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2774:6: warning: no previous prototype for 'xsc_build_rss_params' [-Wmissing-prototypes]
    2774 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2792:6: warning: no previous prototype for 'xsc_eth_build_nic_params' [-Wmissing-prototypes]
    2792 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2814:6: warning: no previous prototype for 'xsc_eth_build_nic_netdev' [-Wmissing-prototypes]
    2814 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2885:5: warning: no previous prototype for 'xsc_eth_create_xdev_resources' [-Wmissing-prototypes]
    2885 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2906:5: warning: no previous prototype for 'xsc_eth_init_nic_rx' [-Wmissing-prototypes]
    2906 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ctrl.c:302:6: warning: no previous prototype for 'xsc_eth_ctrl_fini' [-Wmissing-prototypes]
     302 | void xsc_eth_ctrl_fini(void)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ctrl.c:307:5: warning: no previous prototype for 'xsc_eth_ctrl_init' [-Wmissing-prototypes]
     307 | int xsc_eth_ctrl_init(void)
         |     ^~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_tx.c:30:5: warning: no previous prototype for 'xsc_tx_get_gso_ihs' [-Wmissing-prototypes]
      30 | u16 xsc_tx_get_gso_ihs(struct xsc_sq *sq, struct sk_buff *skb)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_tx.c:51:6: warning: no previous prototype for 'xsc_txwqe_build_cseg_csum' [-Wmissing-prototypes]
      51 | void xsc_txwqe_build_cseg_csum(struct xsc_sq *sq,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_tx.c:219:6: warning: no previous prototype for 'xsc_txwqe_complete' [-Wmissing-prototypes]
     219 | void xsc_txwqe_complete(struct xsc_sq *sq, struct sk_buff *skb,
         |      ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_rx.c:478:6: warning: no previous prototype for 'xsc_page_dma_unmap' [-Wmissing-prototypes]
     478 | void xsc_page_dma_unmap(struct xsc_rq *rq, struct xsc_dma_info *dma_info)
         |      ^~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:124:5: warning: no previous prototype for 'xsc_priv_flags_num' [-Wmissing-prototypes]
     124 | int xsc_priv_flags_num(void)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:129:13: warning: no previous prototype for 'xsc_priv_flags_name' [-Wmissing-prototypes]
     129 | const char *xsc_priv_flags_name(int flag)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:155:5: warning: no previous prototype for 'xsc_set_priv_flags' [-Wmissing-prototypes]
     155 | int xsc_set_priv_flags(struct net_device *dev, u32 pflags)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:254:5: warning: no previous prototype for 'xsc_get_priv_flags' [-Wmissing-prototypes]
     254 | u32 xsc_get_priv_flags(struct net_device *dev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:736:5: warning: no previous prototype for 'xsc_get_rxnfc' [-Wmissing-prototypes]
     736 | int xsc_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *info, u32 *rule_locs)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:759:5: warning: no previous prototype for 'xsc_set_rxnfc' [-Wmissing-prototypes]
     759 | int xsc_set_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:788:5: warning: no previous prototype for 'xsc_get_rxfh' [-Wmissing-prototypes]
     788 | int xsc_get_rxfh(struct net_device *netdev, u32 *indir, u8 *key, u8 *hfunc)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:807:5: warning: no previous prototype for 'xsc_set_rxfh' [-Wmissing-prototypes]
     807 | int xsc_set_rxfh(struct net_device *dev, const u32 *indir, const u8 *key, const u8 hfunc)
         |     ^~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:136:4: warning: no previous prototype for 'xsc_devid_to_pcie_no' [-Wmissing-prototypes]
     136 | u8 xsc_devid_to_pcie_no(int dev_id)
         |    ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/main.c:288:5: warning: no previous prototype for 'xsc_priv_init' [-Wmissing-prototypes]
     288 | int xsc_priv_init(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/main.c:302:5: warning: no previous prototype for 'xsc_dev_res_init' [-Wmissing-prototypes]
     302 | int xsc_dev_res_init(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:321:6: warning: no previous prototype for 'xsc_dev_res_cleanup' [-Wmissing-prototypes]
     321 | void xsc_dev_res_cleanup(struct xsc_core_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:327:6: warning: no previous prototype for 'xsc_init_reg_addr' [-Wmissing-prototypes]
     327 | void xsc_init_reg_addr(struct xsc_core_device *dev)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:518:5: warning: no previous prototype for 'xsc_reset_function_resource' [-Wmissing-prototypes]
     518 | int xsc_reset_function_resource(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: In function 'xsc_init_once':
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:612:33: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
     612 |                 if (!dev->pdev->physfn) {
         |                                 ^~~~~~
         |                                 is_physfn
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: At top level:
>> drivers/net/ethernet/yunsilicon/xsc/pci/main.c:718:5: warning: no previous prototype for 'xsc_load_one' [-Wmissing-prototypes]
     718 | int xsc_load_one(struct xsc_core_device *dev, bool boot)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:796:5: warning: no previous prototype for 'xsc_unload_one' [-Wmissing-prototypes]
     796 | int xsc_unload_one(struct xsc_core_device *dev, bool cleanup)
         |     ^~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:59:5: warning: no previous prototype for 'xsc_cmd_create_lag' [-Wmissing-prototypes]
      59 | int xsc_cmd_create_lag(struct xsc_lag *ldev, u8 flags)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:130:5: warning: no previous prototype for 'xsc_cmd_modify_lag' [-Wmissing-prototypes]
     130 | int xsc_cmd_modify_lag(struct xsc_lag *ldev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:167:5: warning: no previous prototype for 'xsc_cmd_destroy_lag' [-Wmissing-prototypes]
     167 | int xsc_cmd_destroy_lag(struct xsc_lag *ldev, u8 bond_flags)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:292:6: warning: no previous prototype for 'xsc_activate_lag' [-Wmissing-prototypes]
     292 | void xsc_activate_lag(struct xsc_lag *ldev, u8 flags)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:310:6: warning: no previous prototype for 'xsc_modify_lag' [-Wmissing-prototypes]
     310 | void xsc_modify_lag(struct xsc_lag *ldev)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:500:5: warning: no previous prototype for 'xsc_lag_dev_get_netdev_idx' [-Wmissing-prototypes]
     500 | int xsc_lag_dev_get_netdev_idx(struct xsc_lag *ldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:512:22: warning: no previous prototype for 'bond_lag_hash_type' [-Wmissing-prototypes]
     512 | enum netdev_lag_hash bond_lag_hash_type(struct bonding *bond)
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:723:6: warning: no previous prototype for 'xsc_esw_multipath_prereq' [-Wmissing-prototypes]
     723 | bool xsc_esw_multipath_prereq(struct xsc_core_device *xdev0,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:734:6: warning: no previous prototype for 'xsc_lag_multipath_check_prereq' [-Wmissing-prototypes]
     734 | bool xsc_lag_multipath_check_prereq(struct xsc_lag *ldev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:976:28: warning: no previous prototype for 'xsc_lag_init_fib_work' [-Wmissing-prototypes]
     976 | struct xsc_fib_event_work *xsc_lag_init_fib_work(struct xsc_lag *ldev, unsigned long event)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:990:5: warning: no previous prototype for 'xsc_lag_fib_event' [-Wmissing-prototypes]
     990 | int xsc_lag_fib_event(struct notifier_block *nb,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1063:5: warning: no previous prototype for 'xsc_lag_mp_init' [-Wmissing-prototypes]
    1063 | int xsc_lag_mp_init(struct xsc_lag *ldev)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1091:5: warning: no previous prototype for '__xsc_lag_add_xdev' [-Wmissing-prototypes]
    1091 | int __xsc_lag_add_xdev(struct xsc_core_device *xdev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1141:6: warning: no previous prototype for 'xsc_lag_dev_add_pf' [-Wmissing-prototypes]
    1141 | void xsc_lag_dev_add_pf(struct xsc_lag *ldev,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1156:6: warning: no previous prototype for 'xsc_lag_update_trackers' [-Wmissing-prototypes]
    1156 | void xsc_lag_update_trackers(struct xsc_lag *ldev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1224:6: warning: no previous prototype for 'xsc_lag_dev_remove_pf' [-Wmissing-prototypes]
    1224 | void xsc_lag_dev_remove_pf(struct xsc_lag *ldev, struct xsc_core_device *xdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1240:6: warning: no previous prototype for 'xsc_lag_mp_cleanup' [-Wmissing-prototypes]
    1240 | void xsc_lag_mp_cleanup(struct xsc_lag *ldev)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1251:6: warning: no previous prototype for 'xsc_lag_dev_free' [-Wmissing-prototypes]
    1251 | void xsc_lag_dev_free(struct kref *ref)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1265:6: warning: no previous prototype for 'xsc_lag_dev_put' [-Wmissing-prototypes]
    1265 | void xsc_lag_dev_put(struct xsc_lag *ldev)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1285:6: warning: no previous prototype for 'xsc_lag_dev_remove_xdev' [-Wmissing-prototypes]
    1285 | void xsc_lag_dev_remove_xdev(struct xsc_lag *ldev, struct xsc_core_device *xdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1303:6: warning: no previous prototype for '__xsc_lag_remove_xdev' [-Wmissing-prototypes]
    1303 | void __xsc_lag_remove_xdev(struct xsc_core_device *xdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c:255:5: warning: no previous prototype for 'noop_pre' [-Wmissing-prototypes]
     255 | int noop_pre(struct kprobe *p, struct pt_regs *regs) { return 0; }
         |     ^~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c:264:5: warning: no previous prototype for 'find_kallsyms_lookup_name' [-Wmissing-prototypes]
     264 | int find_kallsyms_lookup_name(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c:310:5: warning: no previous prototype for 'xsc_pci_ctrl_exec_ioctl' [-Wmissing-prototypes]
     310 | int xsc_pci_ctrl_exec_ioctl(struct xsc_core_device *xdev, void *in, int in_size, void *out,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:721:5: warning: no previous prototype for 'xsc_request_irq_for_cmdq' [-Wmissing-prototypes]
     721 | int xsc_request_irq_for_cmdq(struct xsc_core_device *dev, u8 vecidx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:734:6: warning: no previous prototype for 'xsc_free_irq_for_cmdq' [-Wmissing-prototypes]
     734 | void xsc_free_irq_for_cmdq(struct xsc_core_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:756:5: warning: no previous prototype for 'xsc_request_irq_for_event' [-Wmissing-prototypes]
     756 | int xsc_request_irq_for_event(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:767:6: warning: no previous prototype for 'xsc_free_irq_for_event' [-Wmissing-prototypes]
     767 | void xsc_free_irq_for_event(struct xsc_core_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:773:5: warning: no previous prototype for 'xsc_cmd_enable_msix' [-Wmissing-prototypes]
     773 | int xsc_cmd_enable_msix(struct xsc_core_device *xdev)
         |     ^~~~~~~~~~~~~~~~~~~
..


vim +/xsc_eth_cq_error_event +197 drivers/net/ethernet/yunsilicon/xsc/net/main.c

   165	
 > 166	int xsc_rx_alloc_page_cache(struct xsc_rq *rq, int node, u8 log_init_sz)
   167	{
   168		struct xsc_page_cache *cache = &rq->page_cache;
   169	
   170		cache->sz = 1 << log_init_sz;
   171		cache->page_cache = kvzalloc_node(cache->sz * sizeof(*cache->page_cache),
   172						  GFP_KERNEL, node);
   173		if (!cache->page_cache)
   174			return -ENOMEM;
   175	
   176		return 0;
   177	}
   178	
   179	void xsc_rx_free_page_cache(struct xsc_rq *rq)
   180	{
   181		struct xsc_page_cache *cache = &rq->page_cache;
   182		u32 i;
   183	
   184		for (i = cache->head; i != cache->tail; i = (i + 1) & (cache->sz - 1)) {
   185			struct xsc_dma_info *dma_info = &cache->page_cache[i];
   186	
   187			xsc_page_release_dynamic(rq, dma_info, false);
   188		}
   189		kvfree(cache->page_cache);
   190	}
   191	
   192	int xsc_eth_reset(struct xsc_core_device *dev)
   193	{
   194		return 0;
   195	}
   196	
 > 197	void xsc_eth_cq_error_event(struct xsc_core_cq *xcq, enum xsc_event event)
   198	{
   199		struct xsc_cq *xsc_cq = container_of(xcq, struct xsc_cq, xcq);
   200		struct xsc_core_device *xdev = xsc_cq->xdev;
   201	
   202		if (event != XSC_EVENT_TYPE_CQ_ERROR) {
   203			xsc_core_err(xdev, "Unexpected event type %d on CQ %06x\n",
   204				     event, xcq->cqn);
   205			return;
   206		}
   207	
   208		xsc_core_err(xdev, "Eth catch CQ ERROR：%x, cqn: %d\n", event, xcq->cqn);
   209	}
   210	
 > 211	void xsc_eth_completion_event(struct xsc_core_cq *xcq)
   212	{
   213		struct xsc_cq *cq = container_of(xcq, struct xsc_cq, xcq);
   214		struct xsc_core_device *xdev = cq->xdev;
   215		struct xsc_rq *rq = NULL;
   216	
   217		if (unlikely(!cq->channel)) {
   218			xsc_core_warn(xdev, "cq%d->channel is null\n", xcq->cqn);
   219			return;
   220		}
   221	
   222		rq = &cq->channel->qp.rq[0];
   223	
   224		set_bit(XSC_CHANNEL_NAPI_SCHED, &cq->channel->flags);
   225		cq->channel->stats->events++;
   226		cq->channel->stats->poll = 0;
   227		if (cq->rx)
   228			cq->channel->rx_int = 1;
   229		else
   230			cq->channel->rx_int = 0;
   231	
   232		if (!test_bit(XSC_ETH_RQ_STATE_ENABLED, &rq->state))
   233			xsc_core_warn(xdev, "ch%d_cq%d, napi_flag=0x%lx\n",
   234				      cq->channel->chl_idx, xcq->cqn, cq->napi->state);
   235	
   236		napi_schedule(cq->napi);
   237	}
   238	
   239	static inline int xsc_cmd_destroy_cq(struct xsc_core_device *dev, struct xsc_core_cq *xcq)
   240	{
   241		struct xsc_destroy_cq_mbox_in in;
   242		struct xsc_destroy_cq_mbox_out out;
   243		int err;
   244	
   245		memset(&in, 0, sizeof(in));
   246		memset(&out, 0, sizeof(out));
   247		in.hdr.opcode = cpu_to_be16(XSC_CMD_OP_DESTROY_CQ);
   248		in.cqn = cpu_to_be32(xcq->cqn);
   249		err = xsc_cmd_exec(dev, &in, sizeof(in), &out, sizeof(out));
   250		if (err || out.hdr.status) {
   251			xsc_core_err(dev, "failed to destroy cq, err=%d out.status=%u\n",
   252				     err, out.hdr.status);
   253			return -ENOEXEC;
   254		}
   255	
   256		xcq->cqn = 0;
   257		return 0;
   258	}
   259	
   260	int xsc_eth_create_cq(struct xsc_core_device *xdev, struct xsc_core_cq *xcq,
   261			      struct xsc_create_cq_mbox_in *in, int insize)
   262	{
   263		int err, ret = -1;
   264		struct xsc_cq_table *table = &xdev->dev_res->cq_table;
   265		struct xsc_create_cq_mbox_out out;
   266	
   267		in->hdr.opcode = cpu_to_be16(XSC_CMD_OP_CREATE_CQ);
   268		ret = xsc_cmd_exec(xdev, in, insize, &out, sizeof(out));
   269		if (ret || out.hdr.status) {
   270			xsc_core_err(xdev, "failed to create cq, err=%d out.status=%u\n",
   271				     ret, out.hdr.status);
   272			return -ENOEXEC;
   273		}
   274	
   275		xcq->cqn = be32_to_cpu(out.cqn) & 0xffffff;
   276		xcq->cons_index = 0;
   277		xcq->arm_sn = 0;
   278		atomic_set(&xcq->refcount, 1);
   279		init_completion(&xcq->free);
   280	
   281		spin_lock_irq(&table->lock);
   282		ret = radix_tree_insert(&table->tree, xcq->cqn, xcq);
   283		spin_unlock_irq(&table->lock);
   284		if (ret)
   285			goto err_insert_cq;
   286		return 0;
   287	
   288	err_insert_cq:
   289		err = xsc_cmd_destroy_cq(xdev, xcq);
   290		if (err)
   291			xsc_core_warn(xdev, "failed to destroy cqn=%d, err=%d\n", xcq->cqn, err);
   292		return ret;
   293	}
   294	
   295	int xsc_eth_destroy_cq(struct xsc_core_device *xdev, struct xsc_cq *cq)
   296	{
   297		struct xsc_cq_table *table = &xdev->dev_res->cq_table;
   298		struct xsc_core_cq *tmp;
   299		int err;
   300	
   301		spin_lock_irq(&table->lock);
   302		tmp = radix_tree_delete(&table->tree, cq->xcq.cqn);
   303		spin_unlock_irq(&table->lock);
   304		if (!tmp) {
   305			err = -ENOENT;
   306			goto err_delete_cq;
   307		}
   308	
   309		if (tmp != &cq->xcq) {
   310			err = -EINVAL;
   311			goto err_delete_cq;
   312		}
   313	
   314		err = xsc_cmd_destroy_cq(xdev, &cq->xcq);
   315		if (err)
   316			goto err_destroy_cq;
   317	
   318		if (atomic_dec_and_test(&cq->xcq.refcount))
   319			complete(&cq->xcq.free);
   320		wait_for_completion(&cq->xcq.free);
   321		return 0;
   322	
   323	err_destroy_cq:
   324		xsc_core_warn(xdev, "failed to destroy cqn=%d, err=%d\n",
   325			      cq->xcq.cqn, err);
   326		return err;
   327	err_delete_cq:
   328		xsc_core_warn(xdev, "cqn=%d not found in tree, err=%d\n",
   329			      cq->xcq.cqn, err);
   330		return err;
   331	}
   332	
 > 333	void xsc_eth_free_cq(struct xsc_cq *cq)
   334	{
   335		xsc_eth_wq_destroy(&cq->wq_ctrl);
   336	}
   337	
   338	int xsc_eth_create_rss_qp_rqs(struct xsc_core_device *xdev,
   339				      struct xsc_create_multiqp_mbox_in *in,
   340				      int insize,
   341				      int *prqn_base)
   342	{
   343		int ret;
   344		struct xsc_create_multiqp_mbox_out out;
   345	
   346		in->hdr.opcode = cpu_to_be16(XSC_CMD_OP_CREATE_MULTI_QP);
   347		ret = xsc_cmd_exec(xdev, in, insize, &out, sizeof(out));
   348		if (ret || out.hdr.status) {
   349			xsc_core_err(xdev,
   350				     "failed to create rss rq, qp_num=%d, type=%d, err=%d out.status=%u\n",
   351				     in->qp_num, in->qp_type, ret, out.hdr.status);
   352			return -ENOEXEC;
   353		}
   354	
   355		*prqn_base = be32_to_cpu(out.qpn_base) & 0xffffff;
   356		return 0;
   357	}
   358	
 > 359	void xsc_eth_qp_event(struct xsc_core_qp *qp, int type)
   360	{
   361		struct xsc_rq *rq;
   362		struct xsc_sq *sq;
   363		struct xsc_core_device *xdev;
   364	
   365		if (qp->eth_queue_type == XSC_RES_RQ) {
   366			rq = container_of(qp, struct xsc_rq, cqp);
   367			xdev = rq->cq.xdev;
   368		} else if (qp->eth_queue_type == XSC_RES_SQ) {
   369			sq = container_of(qp, struct xsc_sq, cqp);
   370			xdev = sq->cq.xdev;
   371		} else {
   372			pr_err("%s:Unknown eth qp type %d\n", __func__, type);
   373			return;
   374		}
   375	
   376		switch (type) {
   377		case XSC_EVENT_TYPE_WQ_CATAS_ERROR:
   378		case XSC_EVENT_TYPE_WQ_INVAL_REQ_ERROR:
   379		case XSC_EVENT_TYPE_WQ_ACCESS_ERROR:
   380			xsc_core_err(xdev, "%s:Async event %x on QP %d\n", __func__, type, qp->qpn);
   381			break;
   382		default:
   383			xsc_core_err(xdev, "%s: Unexpected event type %d on QP %d\n",
   384				     __func__, type, qp->qpn);
   385			return;
   386		}
   387	}
   388	
 > 389	int xsc_eth_create_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq,
   390				 struct xsc_create_qp_mbox_in *in, int insize)
   391	{
   392		int ret = -1;
   393		struct xsc_create_qp_mbox_out out;
   394	
   395		in->hdr.opcode = cpu_to_be16(XSC_CMD_OP_CREATE_QP);
   396		ret = xsc_cmd_exec(xdev, in, insize, &out, sizeof(out));
   397		if (ret || out.hdr.status) {
   398			xsc_core_err(xdev, "failed to create rq, err=%d out.status=%u\n",
   399				     ret, out.hdr.status);
   400			return -ENOEXEC;
   401		}
   402	
   403		prq->rqn = be32_to_cpu(out.qpn) & 0xffffff;
   404		prq->cqp.event = xsc_eth_qp_event;
   405		prq->cqp.eth_queue_type = XSC_RES_RQ;
   406	
   407		ret = create_resource_common(xdev, &prq->cqp);
   408		if (ret) {
   409			xsc_core_err(xdev, "%s:error qp:%d errno:%d\n", __func__, prq->rqn, ret);
   410			return ret;
   411		}
   412	
   413		return 0;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
