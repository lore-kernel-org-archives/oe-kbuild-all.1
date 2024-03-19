Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141FD364D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710888355; cv=none; b=ClKKGCgSV1jL1gNNTyV4Lt5XhUXPBdU2ABV/LqQMaSW4Iwz+8rw831ULkxqDT0fBEcYRUs3SqUjfkHm4rQCMdxCdDeYQ/0uFkfcVScpD9f4cehWaEIKGNAjfa6YjnzFkaINznDoqDMwc+BClESdxC63dlzEGPpekB61NYxJ043w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710888355; c=relaxed/simple;
	bh=8x2r7ma7In0AXBsAc5sDC9QJGf3zZC9hrQzF8gjw3xM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JgFvjvBv6B45gkCDRYDOEDQFt9+2WZ1+nl49HL9JihZbXozv6wJnvEh5sC5cSELo9uRHoJNOlq/G8+11dtVK4pM0NdnNXVyjDkKnZlOAwNw5i2B2TIUSPFan4hZxdNqgQ1b41N+Rw0rJuvQNeazatxzdfsX60ohHubf3J34fY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rv7kByt4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rv7kByt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710888353; x=1742424353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8x2r7ma7In0AXBsAc5sDC9QJGf3zZC9hrQzF8gjw3xM=;
  b=Rv7kByt4tqt/FcFQUl5DIB9wXGKURB7DT3+MxFGA9JEUyzeVITJpDoV6
   9pldoI9Ln1KIoBjeRze80MedY/MXEJX+uUpMW+XV4/vAwKqIktTMbCFg5
   Tbj8eQMkf4p8nZvp41fBVqRQPrGovATV1ugCpi1U2VI40ANhGZTUPAroM
   ik6gk2z+G+5nKBMX1Mbi3AQduvFlBs+SJeoSNXP3igHBXjEKL06O3RgaY
   QmNU7FUevVHwgW9XXskHcHfqGpZxV9QruQmExU/xTOm75BuFVLnSrs7pV
   FngNCyIM+GkFouKfNNNdiGX/VktbnpzrEL41iVKJFCvAPGxq17M//OJKc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9612012"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="9612012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 15:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="14034146"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2024 15:45:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmiDM-000I8j-35;
	Tue, 19 Mar 2024 22:45:48 +0000
Date: Wed, 20 Mar 2024 06:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, tianx <tianx@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28734/30000]
 drivers/infiniband/hw/xsc/mem.c:21:5: warning: no previous prototype for
 'xsc_find_chunk_cont_0'
Message-ID: <202403200656.0AcS5LRj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   efcbd7d2c09d823eef22dff4bce44d8712ca50c4
commit: 23b8024ef459f8b615c223df6175ea17c6b50c48 [28734/30000] drivers: update yunsilicon drivers to version 1.1.0.375
config: x86_64-openeuler_defconfig-OLK-5.10-func (https://download.01.org/0day-ci/archive/20240320/202403200656.0AcS5LRj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403200656.0AcS5LRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403200656.0AcS5LRj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/xsc/mem.c:21:5: warning: no previous prototype for 'xsc_find_chunk_cont_0' [-Wmissing-prototypes]
      21 | int xsc_find_chunk_cont_0(struct xsc_pa_chunk *chunk,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/mem.c: In function 'xsc_find_chunk_cont_0':
>> drivers/infiniband/hw/xsc/mem.c:25:9: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
      25 |         const static int max_count =  sizeof(int) << 3;
         |         ^~~~~
   drivers/infiniband/hw/xsc/mem.c: At top level:
   drivers/infiniband/hw/xsc/mem.c:193:6: warning: no previous prototype for '__xsc_ib_cont_pages' [-Wmissing-prototypes]
     193 | void __xsc_ib_cont_pages(struct ib_umem *umem, u64 addr,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/mem.c:259:6: warning: no previous prototype for '__xsc_ib_populate_pas' [-Wmissing-prototypes]
     259 | void __xsc_ib_populate_pas(struct xsc_ib_dev *dev, struct ib_umem *umem,
         |      ^~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:166:5: warning: no previous prototype for 'xsc_rx_alloc_page_cache' [-Wmissing-prototypes]
     166 | int xsc_rx_alloc_page_cache(struct xsc_rq *rq, int node, u8 log_init_sz)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:179:6: warning: no previous prototype for 'xsc_rx_free_page_cache' [-Wmissing-prototypes]
     179 | void xsc_rx_free_page_cache(struct xsc_rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:197:6: warning: no previous prototype for 'xsc_eth_cq_error_event' [-Wmissing-prototypes]
     197 | void xsc_eth_cq_error_event(struct xsc_core_cq *xcq, enum xsc_event event)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:211:6: warning: no previous prototype for 'xsc_eth_completion_event' [-Wmissing-prototypes]
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
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:845:5: warning: no previous prototype for 'xsc_rx_get_linear_frag_sz' [-Wmissing-prototypes]
     845 | u32 xsc_rx_get_linear_frag_sz(u32 mtu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:852:6: warning: no previous prototype for 'xsc_rx_is_linear_skb' [-Wmissing-prototypes]
     852 | bool xsc_rx_is_linear_skb(u32 mtu)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1316:5: warning: no previous prototype for 'xsc_eth_open_channel' [-Wmissing-prototypes]
    1316 | int xsc_eth_open_channel(struct xsc_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1527:5: warning: no previous prototype for 'xsc_eth_open_channels' [-Wmissing-prototypes]
    1527 | int xsc_eth_open_channels(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1639:6: warning: no previous prototype for 'xsc_eth_activate_channel' [-Wmissing-prototypes]
    1639 | void xsc_eth_activate_channel(struct xsc_channel *c)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1645:6: warning: no previous prototype for 'xsc_eth_deactivate_channel' [-Wmissing-prototypes]
    1645 | void xsc_eth_deactivate_channel(struct xsc_channel *c)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1691:6: warning: no previous prototype for 'xsc_eth_activate_priv_channels' [-Wmissing-prototypes]
    1691 | void xsc_eth_activate_priv_channels(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1706:6: warning: no previous prototype for 'xsc_eth_deactivate_priv_channels' [-Wmissing-prototypes]
    1706 | void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:1849:5: warning: no previous prototype for 'xsc_eth_change_link_status' [-Wmissing-prototypes]
    1849 | int xsc_eth_change_link_status(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1906:6: warning: no previous prototype for 'xsc_eth_event_handler' [-Wmissing-prototypes]
    1906 | void xsc_eth_event_handler(void *arg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1914:5: warning: no previous prototype for 'xsc_eth_enable_nic_hca' [-Wmissing-prototypes]
    1914 | int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1976:5: warning: no previous prototype for 'xsc_eth_disable_nic_hca' [-Wmissing-prototypes]
    1976 | int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2009:6: warning: no previous prototype for 'xsc_eth_rss_params_change' [-Wmissing-prototypes]
    2009 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2319:6: warning: no previous prototype for 'xsc_build_default_indir_rqt' [-Wmissing-prototypes]
    2319 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2417:5: warning: no previous prototype for 'xsc_eth_nic_mtu_changed' [-Wmissing-prototypes]
    2417 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2480:5: warning: no previous prototype for 'xsc_set_vf_mac' [-Wmissing-prototypes]
    2480 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         |     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2497:5: warning: no previous prototype for 'xsc_get_vf_config' [-Wmissing-prototypes]
    2497 | int xsc_get_vf_config(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2513:5: warning: no previous prototype for 'set_feature_rxcsum' [-Wmissing-prototypes]
    2513 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2565:5: warning: no previous prototype for 'xsc_eth_set_features' [-Wmissing-prototypes]
    2565 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2582:5: warning: no previous prototype for 'xsc_select_queue' [-Wmissing-prototypes]
    2582 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2771:24: warning: no previous prototype for 'xsc_tirc_get_default_config' [-Wmissing-prototypes]
    2771 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2776:6: warning: no previous prototype for 'xsc_build_rss_params' [-Wmissing-prototypes]
    2776 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2794:6: warning: no previous prototype for 'xsc_eth_build_nic_params' [-Wmissing-prototypes]
    2794 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2816:6: warning: no previous prototype for 'xsc_eth_build_nic_netdev' [-Wmissing-prototypes]
    2816 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2887:5: warning: no previous prototype for 'xsc_eth_create_xdev_resources' [-Wmissing-prototypes]
    2887 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2908:5: warning: no previous prototype for 'xsc_eth_init_nic_rx' [-Wmissing-prototypes]
    2908 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_dcbnl.c: In function 'xsc_dcbnl_setbuffer':
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_dcbnl.c:968:13: warning: variable 'prio2buffer' set but not used [-Wunused-but-set-variable]
     968 |         u8 *prio2buffer = NULL;
         |             ^~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_dcbnl.c:967:14: warning: variable 'buffer_size' set but not used [-Wunused-but-set-variable]
     967 |         u32 *buffer_size = NULL;
         |              ^~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_dcbnl.c: In function 'xsc_dcbnl_ieee_setpfc':
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_dcbnl.c:350:29: warning: 'curr_pfc_en' is used uninitialized [-Wuninitialized]
     350 |                 curr_pfc_en |= cee_cfg->pfc_setting[i] << i;
         |                             ^~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_dcbnl.c:327:12: note: 'curr_pfc_en' was declared here
     327 |         u8 curr_pfc_en;
         |            ^~~~~~~~~~~
--
>> drivers/net/ethernet/yunsilicon/xsc/pci/main.c:136:4: warning: no previous prototype for 'xsc_devid_to_pcie_no' [-Wmissing-prototypes]
     136 | u8 xsc_devid_to_pcie_no(int dev_id)
         |    ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:288:5: warning: no previous prototype for 'xsc_priv_init' [-Wmissing-prototypes]
     288 | int xsc_priv_init(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:302:5: warning: no previous prototype for 'xsc_dev_res_init' [-Wmissing-prototypes]
     302 | int xsc_dev_res_init(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:321:6: warning: no previous prototype for 'xsc_dev_res_cleanup' [-Wmissing-prototypes]
     321 | void xsc_dev_res_cleanup(struct xsc_core_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:327:6: warning: no previous prototype for 'xsc_init_reg_addr' [-Wmissing-prototypes]
     327 | void xsc_init_reg_addr(struct xsc_core_device *dev)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:519:5: warning: no previous prototype for 'xsc_reset_function_resource' [-Wmissing-prototypes]
     519 | int xsc_reset_function_resource(struct xsc_core_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:719:5: warning: no previous prototype for 'xsc_load_one' [-Wmissing-prototypes]
     719 | int xsc_load_one(struct xsc_core_device *dev, bool boot)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:801:5: warning: no previous prototype for 'xsc_unload_one' [-Wmissing-prototypes]
     801 | int xsc_unload_one(struct xsc_core_device *dev, bool cleanup)
         |     ^~~~~~~~~~~~~~
--
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c:255:5: warning: no previous prototype for 'noop_pre' [-Wmissing-prototypes]
     255 | int noop_pre(struct kprobe *p, struct pt_regs *regs) { return 0; }
         |     ^~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c:264:5: warning: no previous prototype for 'find_kallsyms_lookup_name' [-Wmissing-prototypes]
     264 | int find_kallsyms_lookup_name(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c:310:5: warning: no previous prototype for 'xsc_pci_ctrl_exec_ioctl' [-Wmissing-prototypes]
     310 | int xsc_pci_ctrl_exec_ioctl(struct xsc_core_device *xdev, void *in, int in_size, void *out,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/xsc_find_chunk_cont_0 +21 drivers/infiniband/hw/xsc/mem.c

    20	
  > 21	int xsc_find_chunk_cont_0(struct xsc_pa_chunk *chunk,
    22				  int is_first,
    23				  int is_last)
    24	{
  > 25		const static int max_count =  sizeof(int) << 3;
    26		dma_addr_t pa, end_pa;
    27		u64 va, end_va;
    28		size_t length;
    29		int start_count, end_count;
    30		int va_start_count, va_end_count;
    31	
    32		pa = chunk->pa;
    33		va = chunk->va;
    34		length = chunk->length;
    35		end_pa = pa + length;
    36		end_va = va + length;
    37		start_count = max_count;
    38		end_count = max_count;
    39	
    40		if (!is_first) {
    41			start_count = xsc_count_trailing_zeros((unsigned long)pa);
    42			va_start_count = xsc_count_trailing_zeros(va);
    43			start_count = min_t(int, start_count, va_start_count);
    44		}
    45	
    46		if (!is_last) {
    47			end_count = xsc_count_trailing_zeros((unsigned long)end_pa);
    48			va_end_count = xsc_count_trailing_zeros(end_va);
    49			end_count = min_t(int, end_count, va_end_count);
    50		}
    51	
    52		return start_count > end_count ? end_count : start_count;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
