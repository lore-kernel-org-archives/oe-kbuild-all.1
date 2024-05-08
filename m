Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454AC393
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 22:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715208643; cv=none; b=Scpw4B0M+Ye97kr+eiRcAZU3ZrdZzpT/fN0XeuYRvhLeCcPiTzbzOYGrGas6DdmtZQZnZU6S3p2vEZTJAt9KsSMHtYY2qpD+341FRtynr0Bskl+7QarGjSMMbGM9a/E7CgREbA4717y6v0obO1K0zbZQMIOYIpHtwXT3Uxh9LPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715208643; c=relaxed/simple;
	bh=meof/oqn0caApgmsl+6iqgibcTQje56z16FKfdCSwwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVde6267vtaQpJy+c9uz7L2nl3l0nI4zR/4xTJDeBXcIrX/ICs7a8RL2I+CTYwy4b9EJivvAOmK3MgtBaf0FsJ4NbZfkgG9tTB0L8Tl2Ydno1fuByz20YCsQGKOUHyVWsiYthGw8sHpyDP7nJmyKSWmvX/msSnivz0u/hG3xOS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JO6cZGkn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JO6cZGkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715208641; x=1746744641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=meof/oqn0caApgmsl+6iqgibcTQje56z16FKfdCSwwg=;
  b=JO6cZGknq+UWV+U36nGfwECWbFczgD8zyK14fUSWzosiHnALirgjXSK9
   ZUIwbUB8xHC283Ii2ZuBSlPOEhYHRe1umkHonWw5JioUq3acoTgGf9C+8
   lnaes3XBovjbqd8KazSKLwfTbKHAeVPsjNH5c48KyMLLFkhwUmslWtA8w
   04E+GICOzu/8yQJLg5hEsIIfLHp0QqH4DQBuY0YPcPj8V20Q9IK9sZJJm
   fBXo7X8sZ5qHjmAVFbOqRrPJ63L5vT7TdBaqxdgHtzbT1SdzrD/AA+xUd
   /ZYM8xKnY+XSymIyAdGNKK3dJNKcz1Zz2o6we58yHYIAtQgmEKcW5dBlS
   Q==;
X-CSE-ConnectionGUID: xgAfPwPeQAmsaqNPXmzDZA==
X-CSE-MsgGUID: ILpv83avQzanYt9V+YztQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10968563"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="10968563"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 15:50:40 -0700
X-CSE-ConnectionGUID: ytTGYIvdSuKOLfdE6oSIlw==
X-CSE-MsgGUID: oCEt4iboSlufcQ+iMMrvlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="28919521"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2024 15:50:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4q7Q-0004Bg-1o;
	Wed, 08 May 2024 22:50:36 +0000
Date: Thu, 9 May 2024 06:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, tianx <tianx@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7634/9457]
 drivers/net/ethernet/yunsilicon/xsc/net/main.c:2628:28: error: 'struct
 pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
Message-ID: <202405090620.ipiUsJT5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8c0dfc8b996502f065bb072eb44f2ef912277805
commit: 601fb01dc16f747534b866610743d95830b6655e [7634/9457] drivers: support for xsc drivers from Yunsilicon Technology
config: x86_64-randconfig-076-20240509 (https://download.01.org/0day-ci/archive/20240509/202405090620.ipiUsJT5-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405090620.ipiUsJT5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405090620.ipiUsJT5-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:389:5: warning: no previous prototype for 'xsc_eth_create_qp_rq' [-Wmissing-prototypes]
     389 | int xsc_eth_create_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:416:5: warning: no previous prototype for 'xsc_eth_destroy_qp_rq' [-Wmissing-prototypes]
     416 | int xsc_eth_destroy_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:469:5: warning: no previous prototype for 'xsc_eth_create_qp_sq' [-Wmissing-prototypes]
     469 | int xsc_eth_create_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:488:5: warning: no previous prototype for 'xsc_eth_modify_qp_sq' [-Wmissing-prototypes]
     488 | int xsc_eth_modify_qp_sq(struct xsc_core_device *xdev, struct xsc_modify_raw_qp_mbox_in *in)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:506:5: warning: no previous prototype for 'xsc_eth_destroy_qp_sq' [-Wmissing-prototypes]
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
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1316:5: warning: no previous prototype for 'xsc_eth_open_channel' [-Wmissing-prototypes]
    1316 | int xsc_eth_open_channel(struct xsc_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1528:5: warning: no previous prototype for 'xsc_eth_open_channels' [-Wmissing-prototypes]
    1528 | int xsc_eth_open_channels(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1640:6: warning: no previous prototype for 'xsc_eth_activate_channel' [-Wmissing-prototypes]
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
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1977:5: warning: no previous prototype for 'xsc_eth_disable_nic_hca' [-Wmissing-prototypes]
    1977 | int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2010:6: warning: no previous prototype for 'xsc_eth_rss_params_change' [-Wmissing-prototypes]
    2010 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2318:6: warning: no previous prototype for 'xsc_build_default_indir_rqt' [-Wmissing-prototypes]
    2318 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2416:5: warning: no previous prototype for 'xsc_eth_nic_mtu_changed' [-Wmissing-prototypes]
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
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2581:5: warning: no previous prototype for 'xsc_select_queue' [-Wmissing-prototypes]
    2581 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c: In function 'xsc_get_phys_port_name':
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2628:28: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
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
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2885:5: warning: no previous prototype for 'xsc_eth_create_xdev_resources' [-Wmissing-prototypes]
    2885 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2906:5: warning: no previous prototype for 'xsc_eth_init_nic_rx' [-Wmissing-prototypes]
    2906 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~


vim +2628 drivers/net/ethernet/yunsilicon/xsc/net/main.c

  2614	
  2615	static int xsc_get_phys_port_name(struct net_device *dev,
  2616					  char *buf, size_t len)
  2617	{
  2618		struct xsc_adapter *adapter = netdev_priv(dev);
  2619		struct xsc_core_device *xdev = adapter->xdev;
  2620		struct xsc_core_device *pf_xdev;
  2621		struct net_device *pf_netdev;
  2622		struct pci_dev *pdev = xdev->pdev;
  2623		int ret = len;
  2624	
  2625		if (!pdev)
  2626			return -EOPNOTSUPP;
  2627		if (!xsc_core_is_pf(xdev)) {
> 2628			if (!pdev->physfn)
  2629				return -EOPNOTSUPP;
  2630			pf_xdev = pci_get_drvdata(pdev->physfn);
  2631			if (!pf_xdev || !pf_xdev->netdev)
  2632				return -EOPNOTSUPP;
  2633			pf_netdev = (struct net_device *)pf_xdev->netdev;
  2634			ret = snprintf(buf, len, "%s_%d",
  2635				       pf_netdev->name, xdev->vf_id);
  2636		} else {
  2637			return -EOPNOTSUPP;
  2638		}
  2639		if (ret >= len)
  2640			return -EOPNOTSUPP;
  2641	
  2642		return 0;
  2643	}
  2644	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
