Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDA018E25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552168; cv=none; b=aM+Dvzm6JOCO3s3jFx6eb5M6rCz9gfV97OEpfby5BlrBgPPUQiNgoIMk9prV+J29dWtOioKC9U4y3fVaqR4ov6XxRz5RJDvGU+LbiAram4gc29mki05wN+OCt8Kthdj2PKuaNpG/R6779/6NbbPaRoZUfHOAWAKXoW9qhOT48IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552168; c=relaxed/simple;
	bh=Eq0DkA0pXsl5rN760KIKRbhCGa2Zfyd0YpyBmMLoliU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rfx47q4l/G9faO0sN1Pr1w5cs7QCjHZPRy6KOKh/8vNakHG8R9vSRuf7k2t1AgVpyltRgb1Gl0SLQyUlXxp7iJd7Xps14UPnFWt4X2YRDvXYq1IwXuzksKY39VuXea8hXj1ptIEt099ZoZW9cI8KMEqj38mUbBgrLzj04AWE23U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alg3yVdc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alg3yVdc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737552167; x=1769088167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eq0DkA0pXsl5rN760KIKRbhCGa2Zfyd0YpyBmMLoliU=;
  b=alg3yVdcAzB6GmYTGYizL4R1vVvJPRqAm0E/j50+y8ZcsDn7kn8WXYrV
   FQWovYXX50Zj8Yfx3+ZD0n9eT7FGojWR9pjtkAtXbuBp0tOFaHIj8K3Im
   ehfGsr/sUA22knl0JulTF31sjc1kYWMdiMj58ZI6VYqHR7pKnxwrh39/Z
   Wcp/PWLXkzuoGP9rRUhhm2stXEWVFM8Uq6ZZM5zPtLbWgHQ7ISqw6ve8L
   gEQ99rHyl8JzximukDb6w7eid0Pg0FqDbcpi54NgsLsPsZXeVepKB37mR
   p8g+Iakz62FWEf5i7YBlS0UDEFNf07iQD4iE4jzAwgv5tBszHSaqYuccV
   g==;
X-CSE-ConnectionGUID: KrRKVaa7TBSMv/hhksPLnA==
X-CSE-MsgGUID: xc7krqrSR8G+kjkpkPqyhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48501687"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="48501687"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 05:21:58 -0800
X-CSE-ConnectionGUID: 4STFwjfGSESXvplsUcV30w==
X-CSE-MsgGUID: 6ELtfTLcQ+eYrDdIa5wDwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112120382"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 05:21:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taag5-000ZsD-2t;
	Wed, 22 Jan 2025 13:21:53 +0000
Date: Wed, 22 Jan 2025 21:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/net/ethernet/yunsilicon/xsc/net/main.c:2610:5: warning: no previous
 prototype for 'xsc_set_vf_link_state'
Message-ID: <202501222120.JRNKhp0f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: bcfb3e65a5707ca4caf593a33276f26b993ad71e [1834/1834] drivers: update Yunsilicon driver to version 2406_rc16
config: x86_64-randconfig-121-20250122 (https://download.01.org/0day-ci/archive/20250122/202501222120.JRNKhp0f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501222120.JRNKhp0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501222120.JRNKhp0f-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:201:6: warning: no previous prototype for 'xsc_eth_cq_error_event' [-Wmissing-prototypes]
     201 | void xsc_eth_cq_error_event(struct xsc_core_cq *xcq, enum xsc_event event)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:215:6: warning: no previous prototype for 'xsc_eth_completion_event' [-Wmissing-prototypes]
     215 | void xsc_eth_completion_event(struct xsc_core_cq *xcq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:262:5: warning: no previous prototype for 'xsc_eth_create_cq' [-Wmissing-prototypes]
     262 | int xsc_eth_create_cq(struct xsc_core_device *xdev, struct xsc_core_cq *xcq,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:297:5: warning: no previous prototype for 'xsc_eth_destroy_cq' [-Wmissing-prototypes]
     297 | int xsc_eth_destroy_cq(struct xsc_core_device *xdev, struct xsc_cq *cq)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:335:6: warning: no previous prototype for 'xsc_eth_free_cq' [-Wmissing-prototypes]
     335 | void xsc_eth_free_cq(struct xsc_cq *cq)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:340:5: warning: no previous prototype for 'xsc_eth_create_rss_qp_rqs' [-Wmissing-prototypes]
     340 | int xsc_eth_create_rss_qp_rqs(struct xsc_core_device *xdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:361:6: warning: no previous prototype for 'xsc_eth_qp_event' [-Wmissing-prototypes]
     361 | void xsc_eth_qp_event(struct xsc_core_qp *qp, int type)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:391:5: warning: no previous prototype for 'xsc_eth_create_qp_rq' [-Wmissing-prototypes]
     391 | int xsc_eth_create_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:418:5: warning: no previous prototype for 'xsc_eth_destroy_qp_rq' [-Wmissing-prototypes]
     418 | int xsc_eth_destroy_qp_rq(struct xsc_core_device *xdev, struct xsc_rq *prq)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:470:5: warning: no previous prototype for 'xsc_eth_create_qp_sq' [-Wmissing-prototypes]
     470 | int xsc_eth_create_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:489:5: warning: no previous prototype for 'xsc_eth_modify_qp_sq' [-Wmissing-prototypes]
     489 | int xsc_eth_modify_qp_sq(struct xsc_core_device *xdev, struct xsc_modify_raw_qp_mbox_in *in)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:507:5: warning: no previous prototype for 'xsc_eth_destroy_qp_sq' [-Wmissing-prototypes]
     507 | int xsc_eth_destroy_qp_sq(struct xsc_core_device *xdev, struct xsc_sq *psq)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:735:5: warning: no previous prototype for 'xsc_eth_set_hw_mtu' [-Wmissing-prototypes]
     735 | int xsc_eth_set_hw_mtu(struct xsc_core_device *dev, u16 mtu, u16 rx_buf_sz)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:760:5: warning: no previous prototype for 'xsc_eth_get_mac' [-Wmissing-prototypes]
     760 | int xsc_eth_get_mac(struct xsc_core_device *dev, char *mac)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:790:5: warning: no previous prototype for 'xsc_eth_modify_qps_channel' [-Wmissing-prototypes]
     790 | int xsc_eth_modify_qps_channel(struct xsc_adapter *adapter, struct xsc_channel *c)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:812:5: warning: no previous prototype for 'xsc_eth_modify_qps' [-Wmissing-prototypes]
     812 | int xsc_eth_modify_qps(struct xsc_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:829:5: warning: no previous prototype for 'xsc_rx_get_linear_frag_sz' [-Wmissing-prototypes]
     829 | u32 xsc_rx_get_linear_frag_sz(u32 mtu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:836:6: warning: no previous prototype for 'xsc_rx_is_linear_skb' [-Wmissing-prototypes]
     836 | bool xsc_rx_is_linear_skb(u32 mtu)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1313:5: warning: no previous prototype for 'xsc_eth_open_channel' [-Wmissing-prototypes]
    1313 | int xsc_eth_open_channel(struct xsc_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1526:5: warning: no previous prototype for 'xsc_eth_open_channels' [-Wmissing-prototypes]
    1526 | int xsc_eth_open_channels(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1638:6: warning: no previous prototype for 'xsc_eth_activate_channel' [-Wmissing-prototypes]
    1638 | void xsc_eth_activate_channel(struct xsc_channel *c)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1644:6: warning: no previous prototype for 'xsc_eth_deactivate_channel' [-Wmissing-prototypes]
    1644 | void xsc_eth_deactivate_channel(struct xsc_channel *c)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1690:6: warning: no previous prototype for 'xsc_eth_activate_priv_channels' [-Wmissing-prototypes]
    1690 | void xsc_eth_activate_priv_channels(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1705:6: warning: no previous prototype for 'xsc_eth_deactivate_priv_channels' [-Wmissing-prototypes]
    1705 | void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1864:5: warning: no previous prototype for 'xsc_eth_change_link_status' [-Wmissing-prototypes]
    1864 | int xsc_eth_change_link_status(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1927:6: warning: no previous prototype for 'xsc_eth_event_handler' [-Wmissing-prototypes]
    1927 | void xsc_eth_event_handler(void *arg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1935:5: warning: no previous prototype for 'xsc_eth_enable_nic_hca' [-Wmissing-prototypes]
    1935 | int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1999:5: warning: no previous prototype for 'xsc_eth_disable_nic_hca' [-Wmissing-prototypes]
    1999 | int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2029:6: warning: no previous prototype for 'xsc_eth_rss_params_change' [-Wmissing-prototypes]
    2029 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2357:6: warning: no previous prototype for 'xsc_build_default_indir_rqt' [-Wmissing-prototypes]
    2357 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2455:5: warning: no previous prototype for 'xsc_eth_nic_mtu_changed' [-Wmissing-prototypes]
    2455 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2525:5: warning: no previous prototype for 'xsc_set_vf_mac' [-Wmissing-prototypes]
    2525 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2593:5: warning: no previous prototype for 'xsc_get_vf_config' [-Wmissing-prototypes]
    2593 | int xsc_get_vf_config(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2610:5: warning: no previous prototype for 'xsc_set_vf_link_state' [-Wmissing-prototypes]
    2610 | int xsc_set_vf_link_state(struct net_device *dev, int vf,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2620:5: warning: no previous prototype for 'set_feature_rxcsum' [-Wmissing-prototypes]
    2620 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2642:5: warning: no previous prototype for 'set_feature_vlan_offload' [-Wmissing-prototypes]
    2642 | int set_feature_vlan_offload(struct net_device *netdev, bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2694:5: warning: no previous prototype for 'xsc_eth_set_features' [-Wmissing-prototypes]
    2694 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2757:5: warning: no previous prototype for 'xsc_select_queue' [-Wmissing-prototypes]
    2757 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c: In function 'xsc_get_phys_port_name':
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2805:28: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
    2805 |                 if (!pdev->physfn)
         |                            ^~~~~~
         |                            is_physfn
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2807:49: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
    2807 |                 pf_xdev = pci_get_drvdata(pdev->physfn);
         |                                                 ^~~~~~
         |                                                 is_physfn
   drivers/net/ethernet/yunsilicon/xsc/net/main.c: At top level:
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2966:24: warning: no previous prototype for 'xsc_tirc_get_default_config' [-Wmissing-prototypes]
    2966 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2971:6: warning: no previous prototype for 'xsc_build_rss_params' [-Wmissing-prototypes]
    2971 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2989:6: warning: no previous prototype for 'xsc_eth_build_nic_params' [-Wmissing-prototypes]
    2989 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3017:6: warning: no previous prototype for 'xsc_eth_build_nic_netdev' [-Wmissing-prototypes]
    3017 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3085:5: warning: no previous prototype for 'xsc_eth_create_xdev_resources' [-Wmissing-prototypes]
    3085 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3106:5: warning: no previous prototype for 'xsc_eth_init_nic_rx' [-Wmissing-prototypes]
    3106 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:3343:5: warning: no previous prototype for 'xsc_net_reboot_event_handler' [-Wmissing-prototypes]
    3343 | int xsc_net_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:182:5: warning: no previous prototype for 'xsc_priv_flags_num' [-Wmissing-prototypes]
     182 | int xsc_priv_flags_num(void)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:187:13: warning: no previous prototype for 'xsc_priv_flags_name' [-Wmissing-prototypes]
     187 | const char *xsc_priv_flags_name(int flag)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:213:5: warning: no previous prototype for 'xsc_set_priv_flags' [-Wmissing-prototypes]
     213 | int xsc_set_priv_flags(struct net_device *dev, u32 pflags)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:369:5: warning: no previous prototype for 'xsc_get_priv_flags' [-Wmissing-prototypes]
     369 | u32 xsc_get_priv_flags(struct net_device *dev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:849:5: warning: no previous prototype for 'xsc_get_rxnfc' [-Wmissing-prototypes]
     849 | int xsc_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *info, u32 *rule_locs)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:872:5: warning: no previous prototype for 'xsc_set_rxnfc' [-Wmissing-prototypes]
     872 | int xsc_set_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:901:5: warning: no previous prototype for 'xsc_get_rxfh' [-Wmissing-prototypes]
     901 | int xsc_get_rxfh(struct net_device *netdev, u32 *indir, u8 *key, u8 *hfunc)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:920:5: warning: no previous prototype for 'xsc_set_rxfh' [-Wmissing-prototypes]
     920 | int xsc_set_rxfh(struct net_device *dev, const u32 *indir, const u8 *key, const u8 hfunc)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:31:27: warning: 'pct_exp_name' defined but not used [-Wunused-const-variable=]
      31 | static const char * const pct_exp_name[] = {"N", "E" };
         |                           ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:30:27: warning: 'pp_tbl_dma_name' defined but not used [-Wunused-const-variable=]
      30 | static const char * const pp_tbl_dma_name[] = {"N", "D" };
         |                           ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:29:27: warning: 'anlt_fec_name' defined but not used [-Wunused-const-variable=]
      29 | static const char * const anlt_fec_name[] = {"N", "A" };
         |                           ^~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:28:27: warning: 'ma_xbar_name' defined but not used [-Wunused-const-variable=]
      28 | static const char * const ma_xbar_name[] = {"N", "X" };
         |                           ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:27:27: warning: 'rdma_icrc_name' defined but not used [-Wunused-const-variable=]
      27 | static const char * const rdma_icrc_name[] = {"N", "C" };
         |                           ^~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:26:27: warning: 'onchip_ft_name' defined but not used [-Wunused-const-variable=]
      26 | static const char * const onchip_ft_name[] = {"N", "O" };
         |                           ^~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:25:27: warning: 'hps_ddr_name' defined but not used [-Wunused-const-variable=]
      25 | static const char * const hps_ddr_name[] = {"1", "2", "4", "unknown"};
         |                           ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:24:27: warning: 'fpga_type_name' defined but not used [-Wunused-const-variable=]
      24 | static const char * const fpga_type_name[] = {"S", "L"};
         |                           ^~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_hw_comm.c: In function 'xsc_dcbx_hw_qos_cmdq':
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_hw_comm.c:47:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
      47 |         int err;
         |             ^~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_hw_comm.c: At top level:
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_hw_comm.c:104:5: warning: no previous prototype for 'xsc_hw_kernel_call' [-Wmissing-prototypes]
     104 | int xsc_hw_kernel_call(struct xsc_core_device *xdev, u16 opcode, void *req, void *rsp)
         |     ^~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:174:5: warning: no previous prototype for 'xsc_priv_init' [-Wmissing-prototypes]
     174 | int xsc_priv_init(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:188:5: warning: no previous prototype for 'xsc_dev_res_init' [-Wmissing-prototypes]
     188 | int xsc_dev_res_init(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:207:6: warning: no previous prototype for 'xsc_dev_res_cleanup' [-Wmissing-prototypes]
     207 | void xsc_dev_res_cleanup(struct xsc_core_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:213:6: warning: no previous prototype for 'xsc_init_reg_addr' [-Wmissing-prototypes]
     213 | void xsc_init_reg_addr(struct xsc_core_device *dev)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:400:5: warning: no previous prototype for 'xsc_reset_function_resource' [-Wmissing-prototypes]
     400 | int xsc_reset_function_resource(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:635:5: warning: no previous prototype for 'xsc_load_one' [-Wmissing-prototypes]
     635 | int xsc_load_one(struct xsc_core_device *dev, bool boot)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: In function 'xsc_load_one':
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:665:74: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
     665 |         if (!dev->reg_mr_via_cmdq && (xsc_core_is_pf(dev) || !dev->pdev->physfn)) {
         |                                                                          ^~~~~~
         |                                                                          is_physfn
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:711:74: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
     711 |         if (!dev->reg_mr_via_cmdq && (xsc_core_is_pf(dev) || !dev->pdev->physfn))
         |                                                                          ^~~~~~
         |                                                                          is_physfn
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: At top level:
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:726:5: warning: no previous prototype for 'xsc_unload_one' [-Wmissing-prototypes]
     726 | int xsc_unload_one(struct xsc_core_device *dev, bool cleanup)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: In function 'xsc_unload_one':
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:748:74: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
     748 |         if (!dev->reg_mr_via_cmdq && (xsc_core_is_pf(dev) || !dev->pdev->physfn))
         |                                                                          ^~~~~~
         |                                                                          is_physfn
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: At top level:
>> drivers/net/ethernet/yunsilicon/xsc/pci/main.c:856:5: warning: no previous prototype for 'xsc_pci_reboot_event_handler' [-Wmissing-prototypes]
     856 | int xsc_pci_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/yunsilicon/xsc/pci/mr.c:71:5: warning: no previous prototype for 'xsc_set_mpt_via_cmdq' [-Wmissing-prototypes]
      71 | int xsc_set_mpt_via_cmdq(struct xsc_core_device *dev, struct xsc_register_mr_mbox_in *in_cmd,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/mr.c:106:5: warning: no previous prototype for 'xsc_set_mtt_via_cmdq' [-Wmissing-prototypes]
     106 | int xsc_set_mtt_via_cmdq(struct xsc_core_device *dev, struct xsc_register_mr_mbox_in *in_cmd,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/mr.c:153:5: warning: no previous prototype for 'xsc_dereg_mr_via_cmdq' [-Wmissing-prototypes]
     153 | int xsc_dereg_mr_via_cmdq(struct xsc_core_device *dev,  struct xsc_register_mr_mbox_in *in_cmd)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/mr.c:170:5: warning: no previous prototype for 'xsc_reg_mr_via_cmdq' [-Wmissing-prototypes]
     170 | int xsc_reg_mr_via_cmdq(struct xsc_core_device *dev, struct xsc_register_mr_mbox_in *in)
         |     ^~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:29:6: warning: no previous prototype for 'xsc_board_lag_set' [-Wmissing-prototypes]
      29 | void xsc_board_lag_set(struct xsc_core_device *xdev,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:38:6: warning: no previous prototype for 'xsc_board_lag_reset' [-Wmissing-prototypes]
      38 | void xsc_board_lag_reset(u32 board_id)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:75:22: warning: no previous prototype for 'bond_lag_hash_type' [-Wmissing-prototypes]
      75 | enum netdev_lag_hash bond_lag_hash_type(struct bonding *bond)
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:123:5: warning: no previous prototype for 'xsc_cmd_create_lag' [-Wmissing-prototypes]
     123 | int xsc_cmd_create_lag(struct xsc_lag_event *entry)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:155:5: warning: no previous prototype for 'xsc_cmd_add_lag_member' [-Wmissing-prototypes]
     155 | int xsc_cmd_add_lag_member(struct xsc_lag_event *entry)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:188:5: warning: no previous prototype for 'xsc_cmd_remove_lag_member' [-Wmissing-prototypes]
     188 | int xsc_cmd_remove_lag_member(struct xsc_lag_event *entry)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:220:5: warning: no previous prototype for 'xsc_cmd_update_lag_member_status' [-Wmissing-prototypes]
     220 | int xsc_cmd_update_lag_member_status(struct xsc_lag_event *entry)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:249:5: warning: no previous prototype for 'xsc_cmd_update_lag_hash_type' [-Wmissing-prototypes]
     249 | int xsc_cmd_update_lag_hash_type(struct xsc_lag_event *entry)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:274:5: warning: no previous prototype for 'xsc_cmd_destroy_lag' [-Wmissing-prototypes]
     274 | int xsc_cmd_destroy_lag(struct xsc_lag_event *entry)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:320:6: warning: no previous prototype for 'xsc_create_lag' [-Wmissing-prototypes]
     320 | void xsc_create_lag(struct xsc_lag_event *entry)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:351:6: warning: no previous prototype for 'xsc_add_lag_member' [-Wmissing-prototypes]
     351 | void xsc_add_lag_member(struct xsc_lag_event *entry)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:379:6: warning: no previous prototype for 'xsc_remove_lag_member' [-Wmissing-prototypes]
     379 | void xsc_remove_lag_member(struct xsc_lag_event *entry)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:414:6: warning: no previous prototype for 'xsc_update_lag_member_status' [-Wmissing-prototypes]
     414 | void xsc_update_lag_member_status(struct xsc_lag_event *entry)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:434:6: warning: no previous prototype for 'xsc_update_lag_hash_type' [-Wmissing-prototypes]
     434 | void xsc_update_lag_hash_type(struct xsc_lag_event *entry)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:444:6: warning: no previous prototype for 'xsc_destroy_lag' [-Wmissing-prototypes]
     444 | void xsc_destroy_lag(struct xsc_lag_event *entry)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:605:6: warning: no previous prototype for 'pack_lag_create' [-Wmissing-prototypes]
     605 | void pack_lag_create(struct xsc_lag *lag,
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:638:6: warning: no previous prototype for 'pack_lag_add_member' [-Wmissing-prototypes]
     638 | void pack_lag_add_member(struct xsc_lag *lag,
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:683:6: warning: no previous prototype for 'pack_lag_remove_member' [-Wmissing-prototypes]
     683 | void pack_lag_remove_member(struct xsc_lag *lag,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:738:6: warning: no previous prototype for 'pack_lag_update_member_status' [-Wmissing-prototypes]
     738 | void pack_lag_update_member_status(struct xsc_lag *lag,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:766:6: warning: no previous prototype for 'pack_lag_update_hash_type' [-Wmissing-prototypes]
     766 | void pack_lag_update_hash_type(struct xsc_lag *lag,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:796:6: warning: no previous prototype for 'pack_lag_destroy' [-Wmissing-prototypes]
     796 | void pack_lag_destroy(struct xsc_lag *lag, struct xsc_core_device *xdev, bool no_wq)
         |      ^~~~~~~~~~~~~~~~


vim +/xsc_set_vf_link_state +2610 drivers/net/ethernet/yunsilicon/xsc/net/main.c

  2609	
> 2610	int xsc_set_vf_link_state(struct net_device *dev, int vf,
  2611				  int link_state)
  2612	{
  2613		struct xsc_adapter *adapter = netdev_priv(dev);
  2614		struct xsc_core_device *xdev = adapter->xdev;
  2615		struct xsc_eswitch *esw = xdev->priv.eswitch;
  2616	
  2617		return xsc_eswitch_set_vport_state(esw, vf + 1, link_state);
  2618	}
  2619	
  2620	int set_feature_rxcsum(struct net_device *netdev, bool enable)
  2621	{
  2622		struct xsc_adapter *adapter = netdev_priv(netdev);
  2623		struct xsc_core_device *xdev = adapter->xdev;
  2624		struct xsc_cmd_modify_nic_hca_mbox_in in = {};
  2625		struct xsc_cmd_modify_nic_hca_mbox_out out = {};
  2626		int err;
  2627	
  2628		in.hdr.opcode = cpu_to_be16(XSC_CMD_OP_MODIFY_NIC_HCA);
  2629		in.nic.caps_mask = cpu_to_be16(BIT(XSC_TBM_CAP_HASH_PPH));
  2630		in.nic.caps = cpu_to_be16(enable << XSC_TBM_CAP_HASH_PPH);
  2631	
  2632		err = xsc_cmd_exec(xdev, &in, sizeof(in), &out, sizeof(out));
  2633		if (err || out.hdr.status) {
  2634			netdev_err(netdev, "failed to change rxcsum=%d, err=%d, status=%d\n",
  2635				   enable, err, out.hdr.status);
  2636			return -ENOEXEC;
  2637		}
  2638	
  2639		return 0;
  2640	}
  2641	
> 2642	int set_feature_vlan_offload(struct net_device *netdev, bool enable)
  2643	{
  2644		int err = 0, i;
  2645		struct xsc_adapter *adapter = netdev_priv(netdev);
  2646		struct xsc_vport *evport = NULL;
  2647	
  2648		if (!enable) {
  2649			for (i = 0; i < adapter->xdev->priv.eswitch->num_vfs; i++) {
  2650				evport = xsc_eswitch_get_vport(adapter->xdev->priv.eswitch,
  2651							       i + 1);
  2652				if (evport && (evport->vlan_id || evport->vlan_qos)) {
  2653					evport->vlan_id = 0;
  2654					evport->vlan_qos = 0;
  2655					err = xsc_eswitch_set_vport_vlan(adapter->xdev->priv.eswitch,
  2656									 i + 1, evport->vlan_id,
  2657									 evport->vlan_qos,
  2658									 evport->vlan_proto);
  2659					if (err)
  2660						xsc_core_err(adapter->xdev, "fail to clear vf vlan offload vf=%d err=%d\n",
  2661							     i, err);
  2662				}
  2663			}
  2664		}
  2665	
  2666		return 0;
  2667	}
  2668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
