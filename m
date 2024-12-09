Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32CB189B81
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718986; cv=none; b=PViR4l/GsnFqXEDXftZOxj/q3yOaIRicUvexFdG+9OpjksfvrnKs59jAjkwm7ZL3uee1cIqUWEoekM/57D6DoP+9KJ/oY0fEXBkKuZbHPCO0SlVWI8oHO09cZI+BYrzNDJLvYC5zZw1h9uxtuUEXfrhEiUbVjcR49hMYrwHbMUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718986; c=relaxed/simple;
	bh=3dgyZGR6oAaSXv2796yh8VLbZ0wr0kngvAW6rWIaq9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPmBt2h5jDMvYsyW/J1U1FWiWe6iYQu1ml7Wi8i94cAXXwkreSNlfGLmA20M+7ZSIsliRnYZB9dP2DnA5ap9WCGIuDn0bzGUxKJjUu02loLHKgOm6QKlkgoKgCE9mXjgggTCmGjrqY/BJrPpFJMB32UPGDQMhtwyAt6SjZczngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2BeGkrP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2BeGkrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718984; x=1765254984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dgyZGR6oAaSXv2796yh8VLbZ0wr0kngvAW6rWIaq9k=;
  b=K2BeGkrPYR5hhzSP23d0P+Fz3bsMWNEBH6aP/kXdfji8CLQwvuFDcXK3
   7g8awpArniN4sQP/nGR+QNiXgNAVWGxgqxnjG4EBrbW4AfExGrlnmBV7k
   YxVnAxNAvXNvCMd1CM5wJUZ1X5dAJzW9AK4HH+i/wtyqKQe1aF3Dzncy5
   avBMY2C99SkzaEFo4yV4KvSlK9E0b1AYr90ZIKSgLKDtLkPYKVhmIPlgA
   Uvxq73jCGY//5yUTvpNa2dvdGKwFSBFH+6ggCDx4deOzLPbj7urEC2clt
   p9zAaw+Ji60n/lg4OV4zANRn73/lvdmymIb29Q9U/nBoqEkz4bBd2tVVP
   w==;
X-CSE-ConnectionGUID: VIikWd3TTleQ0mmgJ680rg==
X-CSE-MsgGUID: XSRUsjURQ9+rCgrepp5DEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51415684"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51415684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:36:24 -0800
X-CSE-ConnectionGUID: SVlsqhCNSxmI3a3sHtWSJA==
X-CSE-MsgGUID: ByzIWqASTMeRpsESrY62+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99907497"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2024 20:36:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVVM-0003sv-2C;
	Mon, 09 Dec 2024 04:36:20 +0000
Date: Mon, 9 Dec 2024 12:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Xin <tianx@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544]
 drivers/net/ethernet/yunsilicon/xsc/net/main.c:2823:10: error: no member
 named 'dcbnl_ops' in 'struct net_device'
Message-ID: <202412080904.AHKBbuKD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c8dbb3a6e214ad66d5d6099bf76e1f1c6eefc06f
commit: 7a77845c9768ccddbaa26a0fafe594aa756559d2 [2544/2544] drivers: update Yunsilicon driver to version 2406_rc16.2
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241208/202412080904.AHKBbuKD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080904.AHKBbuKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080904.AHKBbuKD-lkp@intel.com/

All errors (new ones prefixed by >>):

         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1897:6: warning: no previous prototype for function 'xsc_eth_rss_params_change' [-Wmissing-prototypes]
    1897 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1897:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1897 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2206:6: warning: no previous prototype for function 'xsc_build_default_indir_rqt' [-Wmissing-prototypes]
    2206 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2206 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2295:5: warning: no previous prototype for function 'xsc_eth_nic_mtu_changed' [-Wmissing-prototypes]
    2295 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2295:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2295 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2365:5: warning: no previous prototype for function 'xsc_set_vf_mac' [-Wmissing-prototypes]
    2365 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2365:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2365 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2433:5: warning: no previous prototype for function 'xsc_get_vf_config' [-Wmissing-prototypes]
    2433 | int xsc_get_vf_config(struct net_device *dev,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2433:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2433 | int xsc_get_vf_config(struct net_device *dev,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2450:5: warning: no previous prototype for function 'xsc_set_vf_link_state' [-Wmissing-prototypes]
    2450 | int xsc_set_vf_link_state(struct net_device *dev, int vf,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2450:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2450 | int xsc_set_vf_link_state(struct net_device *dev, int vf,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2460:5: warning: no previous prototype for function 'set_feature_rxcsum' [-Wmissing-prototypes]
    2460 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2460:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2460 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2482:5: warning: no previous prototype for function 'set_feature_vlan_offload' [-Wmissing-prototypes]
    2482 | int set_feature_vlan_offload(struct net_device *netdev, bool enable)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2482:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2482 | int set_feature_vlan_offload(struct net_device *netdev, bool enable)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2534:5: warning: no previous prototype for function 'xsc_eth_set_features' [-Wmissing-prototypes]
    2534 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2534:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2534 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2561:5: warning: no previous prototype for function 'xsc_select_queue' [-Wmissing-prototypes]
    2561 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2561:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2561 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2570:10: warning: variable 'txq_ix' is uninitialized when used here [-Wuninitialized]
    2570 |                 return txq_ix;
         |                        ^~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2564:12: note: initialize the variable 'txq_ix' to silence this warning
    2564 |         int txq_ix, up = 0;
         |                   ^
         |                    = 0
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2763:24: warning: no previous prototype for function 'xsc_tirc_get_default_config' [-Wmissing-prototypes]
    2763 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         |                        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2763:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2763 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2768:6: warning: no previous prototype for function 'xsc_build_rss_params' [-Wmissing-prototypes]
    2768 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2768:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2768 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2786:6: warning: no previous prototype for function 'xsc_eth_build_nic_params' [-Wmissing-prototypes]
    2786 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2786:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2786 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2823:10: error: no member named 'dcbnl_ops' in 'struct net_device'
    2823 |         netdev->dcbnl_ops = &xsc_dcbnl_ops;
         |         ~~~~~~  ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2814:6: warning: no previous prototype for function 'xsc_eth_build_nic_netdev' [-Wmissing-prototypes]
    2814 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2814:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2814 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2880:5: warning: no previous prototype for function 'xsc_eth_create_xdev_resources' [-Wmissing-prototypes]
    2880 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2880:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2880 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2899:5: warning: no previous prototype for function 'xsc_eth_init_nic_rx' [-Wmissing-prototypes]
    2899 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2899:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2899 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3134:5: warning: no previous prototype for function 'xsc_net_reboot_event_handler' [-Wmissing-prototypes]
    3134 | int xsc_net_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3134:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3134 | int xsc_net_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
         | ^
         | static 
   52 warnings and 1 error generated.


vim +2823 drivers/net/ethernet/yunsilicon/xsc/net/main.c

d48b7d951d22f7f Wanrenyong 2023-10-27  2813  
d48b7d951d22f7f Wanrenyong 2023-10-27  2814  void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
d48b7d951d22f7f Wanrenyong 2023-10-27  2815  {
d48b7d951d22f7f Wanrenyong 2023-10-27  2816  	struct net_device *netdev = adapter->netdev;
d48b7d951d22f7f Wanrenyong 2023-10-27  2817  	struct xsc_core_device *xdev = adapter->xdev;
d48b7d951d22f7f Wanrenyong 2023-10-27  2818  
d48b7d951d22f7f Wanrenyong 2023-10-27  2819  	/* Set up network device as normal. */
d48b7d951d22f7f Wanrenyong 2023-10-27  2820  	netdev->priv_flags |= IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE;
d48b7d951d22f7f Wanrenyong 2023-10-27  2821  	netdev->netdev_ops = &xsc_netdev_ops;
d48b7d951d22f7f Wanrenyong 2023-10-27  2822  
d48b7d951d22f7f Wanrenyong 2023-10-27 @2823  	netdev->dcbnl_ops = &xsc_dcbnl_ops;
d48b7d951d22f7f Wanrenyong 2023-10-27  2824  	eth_set_ethtool_ops(netdev);
d48b7d951d22f7f Wanrenyong 2023-10-27  2825  
d48b7d951d22f7f Wanrenyong 2023-10-27  2826  	netdev->min_mtu = SW_MIN_MTU;
d48b7d951d22f7f Wanrenyong 2023-10-27  2827  	netdev->max_mtu = SW_MAX_MTU;
d48b7d951d22f7f Wanrenyong 2023-10-27  2828  	/*mtu - macheaderlen - ipheaderlen should be aligned in 8B*/
d48b7d951d22f7f Wanrenyong 2023-10-27  2829  	netdev->mtu = SW_DEFAULT_MTU;
d48b7d951d22f7f Wanrenyong 2023-10-27  2830  
d48b7d951d22f7f Wanrenyong 2023-10-27  2831  	netdev->vlan_features |= NETIF_F_SG;
d48b7d951d22f7f Wanrenyong 2023-10-27  2832  	netdev->vlan_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;//NETIF_F_HW_CSUM;
d48b7d951d22f7f Wanrenyong 2023-10-27  2833  	netdev->vlan_features |= NETIF_F_GRO;
d48b7d951d22f7f Wanrenyong 2023-10-27  2834  	netdev->vlan_features |= NETIF_F_TSO;//NETIF_F_TSO_ECN
d48b7d951d22f7f Wanrenyong 2023-10-27  2835  	netdev->vlan_features |= NETIF_F_TSO6;
d48b7d951d22f7f Wanrenyong 2023-10-27  2836  	//todo: enable rx csum
d48b7d951d22f7f Wanrenyong 2023-10-27  2837  	netdev->vlan_features |= NETIF_F_RXCSUM;
d48b7d951d22f7f Wanrenyong 2023-10-27  2838  	netdev->vlan_features |= NETIF_F_RXHASH;
d48b7d951d22f7f Wanrenyong 2023-10-27  2839  	netdev->vlan_features |= NETIF_F_GSO_PARTIAL;
d48b7d951d22f7f Wanrenyong 2023-10-27  2840  
d48b7d951d22f7f Wanrenyong 2023-10-27  2841  	netdev->hw_features = netdev->vlan_features;
23b8024ef459f8b tianx      2024-02-06  2842  	netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
7a77845c9768ccd Tian Xin   2024-11-06  2843  	netdev->hw_features |= NETIF_F_HW_VLAN_STAG_RX | NETIF_F_HW_VLAN_STAG_TX;
d48b7d951d22f7f Wanrenyong 2023-10-27  2844  
d48b7d951d22f7f Wanrenyong 2023-10-27  2845  	if (xsc_vxlan_allowed(xdev) || xsc_geneve_tx_allowed(xdev) ||
d48b7d951d22f7f Wanrenyong 2023-10-27  2846  	    xsc_any_tunnel_proto_supported(xdev)) {
d48b7d951d22f7f Wanrenyong 2023-10-27  2847  		netdev->hw_enc_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
d48b7d951d22f7f Wanrenyong 2023-10-27  2848  		netdev->hw_enc_features |= NETIF_F_TSO; //NETIF_F_TSO_ECN
d48b7d951d22f7f Wanrenyong 2023-10-27  2849  		netdev->hw_enc_features |= NETIF_F_TSO6;
d48b7d951d22f7f Wanrenyong 2023-10-27  2850  		netdev->hw_enc_features |= NETIF_F_GSO_PARTIAL;
d48b7d951d22f7f Wanrenyong 2023-10-27  2851  	}
d48b7d951d22f7f Wanrenyong 2023-10-27  2852  
d48b7d951d22f7f Wanrenyong 2023-10-27  2853  	netdev->features |= netdev->hw_features;
d48b7d951d22f7f Wanrenyong 2023-10-27  2854  	netdev->features |= NETIF_F_HIGHDMA;
d48b7d951d22f7f Wanrenyong 2023-10-27  2855  }
d48b7d951d22f7f Wanrenyong 2023-10-27  2856  

:::::: The code at line 2823 was first introduced by commit
:::::: d48b7d951d22f7f97d68ae7b580769827683d404 drivers: initial support for xsc drivers from Yunsilicon Technology

:::::: TO: Wanrenyong <wanry@yunsilicon.com>
:::::: CC: Wanrenyong <wanry@yunsilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
