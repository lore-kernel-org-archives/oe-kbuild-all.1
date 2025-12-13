Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C2A41C72
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765613909; cv=none; b=fmVORcNnfBiBxkxr+UOhVTEjOBKlQmMyQVgGUTI7FXcNk5Lu6h+vcdpTQevK22ALYacoxJaIsDNoiP8xtWXR9EQ4BeiIUYz89e92Esf1u5xC6jti1KHFTgLP11kTxlCWU+qwARaA7JFgS3WRON3+2TayV4xeJL6UMKY/X3RtTxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765613909; c=relaxed/simple;
	bh=1mRKJPpTTWefL8LbfW3tH7TZoruSjo5unbxMmqv3gI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeG1udA6Cv7zUXhjM1gJketIiUpSQnplhjPt4q6KdYvp1B+qtEyWaS3tmkC6uxE+bgOuVK8wmlFYrSs4sRFPHfV3r1CixH5cqXSldnq1UqYKsn2UGTpVc8TQXnafZMhcvhOzByRNE+TW653RCvKv/taTCFKEstnRRqTM+pXH3+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdX2xaLx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdX2xaLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765613906; x=1797149906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1mRKJPpTTWefL8LbfW3tH7TZoruSjo5unbxMmqv3gI8=;
  b=LdX2xaLxoOKUN637UVZF6UaRlOMnchu88GtoF52kCEx1M5978GnuaRDK
   52MFsiH61EDisJqq627cxxkKAQqQyANxhQ04lWX/OHNwTEql/4quLCTZC
   b2eoOQgWCID4fv9YlHezrKO/WVRLiUOSEOku5ytcyXWArsfVw1lj/CC48
   OkxZm2vNPtzl+kTlp2oBGQR4qQlpRAeJxrDc9i23VVzLIJeEKydNIv52I
   17ga5abui9Hf6swzsnbalVagWttRW/8N9XX5bpePSWSi3aBpvlfjHx4ZJ
   MYPVHRDMXHgd486F0p7TT0lTRtUOcqan0R04C18ZXhaTxjw3xecPM3KC4
   A==;
X-CSE-ConnectionGUID: i6qEaFiwT8i6ibJtONkzZA==
X-CSE-MsgGUID: lVmV5Dv/Te2oqlh1M68aNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="90255753"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="90255753"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:18:18 -0800
X-CSE-ConnectionGUID: p8nMWPqoQCm1VtrunxK6MQ==
X-CSE-MsgGUID: ccj2cGB3QqCcf9P3nwriow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="202201988"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 00:18:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKpS-000000007IL-0ti3;
	Sat, 13 Dec 2025 08:18:14 +0000
Date: Sat, 13 Dec 2025 16:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 0/11]
 drivers/net/ethernet/bzwx/nce/comm/txrx.c:554:6: warning: no previous
 prototype for 'ne6x_alloc_rx_buffers'
Message-ID: <202512131625.1bjbt8Se-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   691fd54204b78715418b027529c23d3a9eca9456
commit: b720e864f9c6fe26c6f7ab01738fe9257bfe2a1b [0/11] anolis: drivers/bzwx: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131625.1bjbt8Se-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131625.1bjbt8Se-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131625.1bjbt8Se-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:554:6: warning: no previous prototype for 'ne6x_alloc_rx_buffers' [-Wmissing-prototypes]
     554 | bool ne6x_alloc_rx_buffers(struct ne6x_ring *rx_ring, u16 cleaned_count)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1117:6: warning: no previous prototype for 'ne6x_unmap_and_free_tx_resource' [-Wmissing-prototypes]
    1117 | void ne6x_unmap_and_free_tx_resource(struct ne6x_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1142:5: warning: no previous prototype for 'ne6x_fill_jumbo_sgl' [-Wmissing-prototypes]
    1142 | int ne6x_fill_jumbo_sgl(struct ne6x_ring *tx_ring, struct sk_buff *skb)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1242:6: warning: no previous prototype for 'ne6x_fill_tx_desc' [-Wmissing-prototypes]
    1242 | void ne6x_fill_tx_desc(struct ne6x_tx_desc *tx_desc, u8 vp, dma_addr_t tag_dma,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:1261:6: warning: no previous prototype for 'ne6x_fill_tx_priv_tag' [-Wmissing-prototypes]
    1261 | void ne6x_fill_tx_priv_tag(struct ne6x_ring *tx_ring, struct ne6x_tx_tag *tx_tag,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1276:6: warning: no previous prototype for 'ne6x_xmit_jumbo' [-Wmissing-prototypes]
    1276 | void ne6x_xmit_jumbo(struct ne6x_ring *tx_ring, struct ne6x_tx_buf *first,
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1366:6: warning: no previous prototype for 'ne6x_xmit_simple' [-Wmissing-prototypes]
    1366 | void ne6x_xmit_simple(struct ne6x_ring *tx_ring, struct ne6x_tx_buf *first,
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c: In function 'ne6x_xmit_simple':
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1380:16: warning: variable 'mss' set but not used [-Wunused-but-set-variable]
    1380 |         __le64 mss = 0;
         |                ^~~
   drivers/net/ethernet/bzwx/nce/comm/txrx.c:1371:40: warning: variable 'first_desc' set but not used [-Wunused-but-set-variable]
    1371 |         struct ne6x_tx_desc *tx_desc, *first_desc;
         |                                        ^~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:67:5: warning: no previous prototype for 'ne6x_hw_init' [-Wmissing-prototypes]
      67 | int ne6x_hw_init(struct ne6x_hw *hw)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:91:5: warning: no previous prototype for 'ne6x_aq_get_phy_capabilities' [-Wmissing-prototypes]
      91 | int ne6x_aq_get_phy_capabilities(struct ne6x_adapter *adpt, bool is_up, bool get_hw_stats)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:143:5: warning: no previous prototype for 'ne6x_aq_get_vf_link_status' [-Wmissing-prototypes]
     143 | int ne6x_aq_get_vf_link_status(struct ne6x_adapter *adpt, bool is_up)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:215:6: warning: no previous prototype for 'ne6x_print_link_message' [-Wmissing-prototypes]
     215 | void ne6x_print_link_message(struct ne6x_adapter *adpt, bool isup)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:496:5: warning: no previous prototype for 'ne6x_pf_init' [-Wmissing-prototypes]
     496 | int ne6x_pf_init(struct ne6x_pf *pf)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:739:6: warning: no previous prototype for 'ne6x_clean_tx_ring' [-Wmissing-prototypes]
     739 | void ne6x_clean_tx_ring(struct ne6x_ring *tx_ring)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:769:6: warning: no previous prototype for 'ne6x_clean_rx_ring' [-Wmissing-prototypes]
     769 | void ne6x_clean_rx_ring(struct ne6x_ring *rx_ring)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:851:6: warning: no previous prototype for 'ne6x_free_rx_resources' [-Wmissing-prototypes]
     851 | void ne6x_free_rx_resources(struct ne6x_ring *rx_ring)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:876:6: warning: no previous prototype for 'ne6x_free_tx_resources' [-Wmissing-prototypes]
     876 | void ne6x_free_tx_resources(struct ne6x_ring *tx_ring)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:888:6: warning: no previous prototype for 'ne6x_free_cq_resources' [-Wmissing-prototypes]
     888 | void ne6x_free_cq_resources(struct ne6x_ring *cq_ring)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c: In function 'ne6x_update_pf_stats':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1254:13: warning: variable 'tx_force_wb' set but not used [-Wunused-but-set-variable]
    1254 |         u64 tx_force_wb;
         |             ^~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1244:32: warning: variable 'oes' set but not used [-Wunused-but-set-variable]
    1244 |         struct ne6x_eth_stats *oes;
         |                                ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1242:35: warning: variable 'ons' set but not used [-Wunused-but-set-variable]
    1242 |         struct rtnl_link_stats64 *ons;
         |                                   ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c: At top level:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1851:5: warning: no previous prototype for 'ne6x_link_speed_to_rate' [-Wmissing-prototypes]
    1851 | int ne6x_link_speed_to_rate(int link_speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2062:5: warning: no previous prototype for 'ne6x_set_vf_port_vlan' [-Wmissing-prototypes]
    2062 | int ne6x_set_vf_port_vlan(struct net_device *netdev, int vf_id, u16 vlan_id,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2216:27: warning: initialized field overwritten [-Woverride-init]
    2216 |         .ndo_tx_timeout = ne6x_tx_timeout,
         |                           ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2216:27: note: (near initialization for 'ne6x_netdev_ops.ndo_tx_timeout')
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2220:29: warning: initialized field overwritten [-Woverride-init]
    2220 |         .ndo_set_features = ne6x_set_features,
         |                             ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2220:29: note: (near initialization for 'ne6x_netdev_ops.ndo_set_features')
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2702:6: warning: no previous prototype for 'ne6x_adjust_adpt_port_max_queue' [-Wmissing-prototypes]
    2702 | void ne6x_adjust_adpt_port_max_queue(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2923:5: warning: no previous prototype for 'ne6x_adpt_release' [-Wmissing-prototypes]
    2923 | int ne6x_adpt_release(struct ne6x_adapter *adpt)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:3081:12: warning: no previous prototype for 'ne6x_init_module' [-Wmissing-prototypes]
    3081 | int __init ne6x_init_module(void)
         |            ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:3102:13: warning: no previous prototype for 'ne6x_exit_module' [-Wmissing-prototypes]
    3102 | void __exit ne6x_exit_module(void)
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c: In function 'ne6x_config_netdev':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2381:43: warning: '%d' directive writing between 1 and 5 bytes into a region of size between 1 and 7 [-Wformat-overflow=]
    2381 |                 sprintf(name, "enP%dp%ds0f%d",
         |                                           ^~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2381:31: note: directive argument in the range [0, 65535]
    2381 |                 sprintf(name, "enP%dp%ds0f%d",
         |                               ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2381:17: note: 'sprintf' output between 11 and 21 bytes into a destination of size 16
    2381 |                 sprintf(name, "enP%dp%ds0f%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2382 |                         pf->hw.bus.domain_num, pf->hw.bus.bus_num, adpt->idx);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:258:5: warning: no previous prototype for 'ne6x_adpt_request_irq_msix' [-Wmissing-prototypes]
     258 | int ne6x_adpt_request_irq_msix(struct ne6x_adapter *adpt, char *basename)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:340:5: warning: no previous prototype for 'ne6x_adpt_request_irq_intx' [-Wmissing-prototypes]
     340 | int ne6x_adpt_request_irq_intx(struct ne6x_adapter *adpt, char *basename)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:607:13: warning: no previous prototype for 'ne6x_msix_clean_vf_mbx' [-Wmissing-prototypes]
     607 | irqreturn_t ne6x_msix_clean_vf_mbx(int irq, void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:463:6: warning: no previous prototype for 'ne6x_reg_lock' [-Wmissing-prototypes]
     463 | void ne6x_reg_lock(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:468:6: warning: no previous prototype for 'ne6x_reg_unlock' [-Wmissing-prototypes]
     468 | void ne6x_reg_unlock(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:507:5: warning: no previous prototype for 'ne6x_reg_axi_read' [-Wmissing-prototypes]
     507 | u32 ne6x_reg_axi_read(struct ne6x_pf *pf, u32 offset)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:521:6: warning: no previous prototype for 'ne6x_reg_axi_write' [-Wmissing-prototypes]
     521 | void ne6x_reg_axi_write(struct ne6x_pf *pf, u32 offset, u32 value)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:530:5: warning: no previous prototype for '_reg_apb_read' [-Wmissing-prototypes]
     530 | u32 _reg_apb_read(struct ne6x_pf *pf, u64 offset)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:546:6: warning: no previous prototype for '_reg_apb_write' [-Wmissing-prototypes]
     546 | void _reg_apb_write(struct ne6x_pf *pf, u64 offset, u32 value)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:561:5: warning: no previous prototype for '_ne6x_reg_perform' [-Wmissing-prototypes]
     561 | int _ne6x_reg_perform(struct ne6x_pf *pf, u32 *data, u32 *pbuf, u32 len, u32 retlen)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:608:5: warning: no previous prototype for 'ne6x_reg_perform' [-Wmissing-prototypes]
     608 | int ne6x_reg_perform(struct ne6x_pf *pf, u32 *data, u32 *pbuf, u32 len, u32 retlen)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:846:5: warning: no previous prototype for 'ne6x_reg_table_update' [-Wmissing-prototypes]
     846 | int ne6x_reg_table_update(struct ne6x_pf *pf, enum ne6x_reg_table table,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1058:5: warning: no previous prototype for 'ne6x_reg_mem_read' [-Wmissing-prototypes]
    1058 | int ne6x_reg_mem_read(struct ne6x_pf *pf, u32 addr, void *pbuf, u32 size)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1082:5: warning: no previous prototype for 'ne6x_reg_mem_write' [-Wmissing-prototypes]
    1082 | int ne6x_reg_mem_write(struct ne6x_pf *pf, u32 addr, void *pbuf, u32 size)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1253:5: warning: no previous prototype for 'ne6x_reg_set_user_data_template' [-Wmissing-prototypes]
    1253 | int ne6x_reg_set_user_data_template(struct ne6x_pf *pf, enum np_user_data type, u32 data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1274:5: warning: no previous prototype for 'ne6x_reg_get_user_data_template' [-Wmissing-prototypes]
    1274 | int ne6x_reg_get_user_data_template(struct ne6x_pf *pf, enum np_user_data type, u32 *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1391:6: warning: no previous prototype for 'ne6x_reg_send' [-Wmissing-prototypes]
    1391 | void ne6x_reg_send(struct ne6x_pf *pf, u32 cmd, u32 *data, u32 size)
         |      ^~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1417:5: warning: no previous prototype for 'ne6x_reg_polling' [-Wmissing-prototypes]
    1417 | int ne6x_reg_polling(struct ne6x_pf *pf, u32 cmd, u32 *data, u32 buf_size,
         |     ^~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:22:6: warning: no previous prototype for 'ext_toeplitz_key' [-Wmissing-prototypes]
      22 | void ext_toeplitz_key(const unsigned char *key, unsigned char *ext_key)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:73:6: warning: no previous prototype for 'ne6x_dev_crc32_init' [-Wmissing-prototypes]
      73 | void ne6x_dev_crc32_init(u32 poly, u32 *table)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:106:5: warning: no previous prototype for 'ne6x_dev_spd_verify' [-Wmissing-prototypes]
     106 | int ne6x_dev_spd_verify(struct ne6x_dev_eeprom_info *spd_info)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:115:5: warning: no previous prototype for 'ne6x_dev_get_eeprom' [-Wmissing-prototypes]
     115 | int ne6x_dev_get_eeprom(struct ne6x_pf *pf)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:341:6: warning: no previous prototype for 'ne6x_dev_update_status' [-Wmissing-prototypes]
     341 | void ne6x_dev_update_status(struct ne6x_pf *pf, struct ne6x_port_info *port, bool is_up)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:396:5: warning: no previous prototype for 'ne6x_dev_get_speed' [-Wmissing-prototypes]
     396 | int ne6x_dev_get_speed(struct ne6x_adapter *adpt, u32 *speed)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:1046:5: warning: no previous prototype for 'ne6x_dev_set_mac_inloop' [-Wmissing-prototypes]
    1046 | int ne6x_dev_set_mac_inloop(struct ne6x_adapter *adpt, int enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:1097:6: warning: no previous prototype for 'ne6x_dev_transform_vf_stat_format' [-Wmissing-prototypes]
    1097 | void ne6x_dev_transform_vf_stat_format(u32 *stat_arr, struct vf_stat *stat)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:1312:5: warning: no previous prototype for 'ne6x_dev_proto_recv' [-Wmissing-prototypes]
    1312 | int ne6x_dev_proto_recv(struct sk_buff *skb, struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:1328:5: warning: no previous prototype for 'ne6x_dev_proto_send' [-Wmissing-prototypes]
    1328 | int ne6x_dev_proto_send(struct net_device *netdev, char *buf, int len)
         |     ^~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:11:6: warning: no previous prototype for 'ne6x_clear_vf_status' [-Wmissing-prototypes]
      11 | void ne6x_clear_vf_status(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:21:6: warning: no previous prototype for 'ne6x_mbx_deinit_snapshot' [-Wmissing-prototypes]
      21 | void ne6x_mbx_deinit_snapshot(struct ne6x_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:30:5: warning: no previous prototype for 'ne6x_mbx_init_snapshot' [-Wmissing-prototypes]
      30 | int ne6x_mbx_init_snapshot(struct ne6x_hw *hw, u16 vf_count)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:55:5: warning: no previous prototype for 'ne6x_status_to_errno' [-Wmissing-prototypes]
      55 | int ne6x_status_to_errno(int err)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:63:6: warning: no previous prototype for 'ne6x_set_vf_state_qs_dis' [-Wmissing-prototypes]
      63 | void ne6x_set_vf_state_qs_dis(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:75:6: warning: no previous prototype for 'ne6x_is_reset_in_progress' [-Wmissing-prototypes]
      75 | bool ne6x_is_reset_in_progress(unsigned long *state)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:83:6: warning: no previous prototype for 'ne6x_adpt_close_vf' [-Wmissing-prototypes]
      83 | void ne6x_adpt_close_vf(struct ne6x_adapter *adpt, u16 vf_id)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:163:5: warning: no previous prototype for 'ne6x_adpt_release_vf' [-Wmissing-prototypes]
     163 | int ne6x_adpt_release_vf(struct ne6x_adapter *adpt, u16 vf_id)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:243:6: warning: no previous prototype for 'ne6x_free_vfs' [-Wmissing-prototypes]
     243 | void ne6x_free_vfs(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:368:6: warning: no previous prototype for 'ne6x_vc_set_default_allowlist' [-Wmissing-prototypes]
     368 | void ne6x_vc_set_default_allowlist(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:392:6: warning: no previous prototype for 'ne6x_send_init_mbx_mesg' [-Wmissing-prototypes]
     392 | void ne6x_send_init_mbx_mesg(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:487:22: warning: no previous prototype for 'ne6x_adpt_setup_vf' [-Wmissing-prototypes]
     487 | struct ne6x_adapter *ne6x_adpt_setup_vf(struct ne6x_pf *pf, u16 vf_id, u16 num_vfs)
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: In function 'ne6x_init_vf_adpt_res':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:524:24: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
     524 |         struct device *dev;
         |                        ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: At top level:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:937:5: warning: no previous prototype for 'ne6x_sdk_send_msg_to_vf' [-Wmissing-prototypes]
     937 | int ne6x_sdk_send_msg_to_vf(struct ne6x_hw *hw, u16 vfid, u32 v_opcode,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1319:5: warning: no previous prototype for 'ne6x_conv_link_speed_to_virtchnl' [-Wmissing-prototypes]
    1319 | u32 ne6x_conv_link_speed_to_virtchnl(bool adv_link_support, u16 link_speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1355:6: warning: no previous prototype for 'ne6x_vc_notify_vf_link_state' [-Wmissing-prototypes]
    1355 | void ne6x_vc_notify_vf_link_state(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1439:6: warning: no previous prototype for 'ne6x_reset_vf' [-Wmissing-prototypes]
    1439 | bool ne6x_reset_vf(struct ne6x_vf *vf, bool is_vflr)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: In function 'ne6x_vc_reset_vf_msg':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1842:36: warning: variable 'vc_ether_addr' set but not used [-Wunused-but-set-variable]
    1842 |         struct virtchnl_ether_addr vc_ether_addr;
         |                                    ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: At top level:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:2236:5: warning: no previous prototype for 'ne6x_set_vf_bw_for_max_vpnum' [-Wmissing-prototypes]
    2236 | int ne6x_set_vf_bw_for_max_vpnum(struct ne6x_pf *pf, int vf_id, int max_tx_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_debugfs.c:11:6: warning: no previous prototype for 'ne6xvf_showqueue' [-Wmissing-prototypes]
      11 | void ne6xvf_showqueue(struct ne6xvf_adapter *pf)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_debugfs.c:66:6: warning: no previous prototype for 'ne6xvf_showring' [-Wmissing-prototypes]
      66 | void ne6xvf_showring(struct ne6xvf_adapter *pf)
         |      ^~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:441: warning: Function parameter or member 'kernel_coal' not described in 'ne6xvf_get_coalesce'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:441: warning: Function parameter or member 'extack' not described in 'ne6xvf_get_coalesce'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:596: warning: Function parameter or member 'info' not described in 'ne6xvf_set_rxnfc'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:596: warning: Excess function parameter 'cmd' description in 'ne6xvf_set_rxnfc'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:620: warning: expecting prototype for iavf_get_rxnfc(). Prototype was for ne6xvf_get_rxnfc() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:659: warning: expecting prototype for iavf_get_rxfh_indir_size(). Prototype was for ne6xvf_get_rxfh_indir_size() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:739: warning: Function parameter or member 'channels' not described in 'ne6xvf_get_channels'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:739: warning: expecting prototype for iavf_get_channels(). Prototype was for ne6xvf_get_channels() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:762: warning: Function parameter or member 'channels' not described in 'ne6xvf_set_channels'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:762: warning: Excess function parameter 'ch' description in 'ne6xvf_set_channels'
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:72: warning: Function parameter or member 'adapter' not described in 'nce_get_vsi_stats_struct'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:72: warning: Excess function parameter 'vsi' description in 'nce_get_vsi_stats_struct'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:84: warning: Function parameter or member 'adapter' not described in 'ne6xvf_update_pf_stats'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:84: warning: expecting prototype for nce_update_pf_stats(). Prototype was for ne6xvf_update_pf_stats() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2325: warning: expecting prototype for nce_set_features(). Prototype was for ne6xvf_set_features() instead
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2440: warning: expecting prototype for nce_fix_features(). Prototype was for ne6xvf_fix_features() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2582: warning: Function parameter or member 'adapter' not described in 'ne6xvf_find_vlan'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2582: warning: Excess function parameter 'vsi' description in 'ne6xvf_find_vlan'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2602: warning: expecting prototype for ne6xvf_add_vlan(). Prototype was for ne6xvf_add_vlan_list() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2630: warning: expecting prototype for ne6xvf_del_vlan(). Prototype was for ne6xvf_del_vlan_list() instead


vim +/ne6x_alloc_rx_buffers +554 drivers/net/ethernet/bzwx/nce/comm/txrx.c

   553	
 > 554	bool ne6x_alloc_rx_buffers(struct ne6x_ring *rx_ring, u16 cleaned_count)
   555	{
   556		u16 ntu = rx_ring->next_to_use;
   557		union ne6x_rx_desc *rx_desc;
   558		struct ne6x_rx_buf *bi;
   559	
   560		/* do nothing if no valid netdev defined */
   561		if (!rx_ring->netdev || !cleaned_count)
   562			return false;
   563	
   564		rx_desc = NE6X_RX_DESC(rx_ring, ntu);
   565		bi = &rx_ring->rx_buf[ntu];
   566	
   567		do {
   568			if (!ne6x_alloc_mapped_page(rx_ring, bi))
   569				goto no_buffers;
   570	
   571			/* sync the buffer for use by the device */
   572			dma_sync_single_range_for_device(rx_ring->dev, bi->dma, bi->page_offset,
   573							 rx_ring->rx_buf_len, DMA_FROM_DEVICE);
   574	
   575			/* Refresh the desc even if buffer_addrs didn't change
   576			 * because each write-back erases this info.
   577			 */
   578			rx_desc->wb.u.val = 0;
   579			rx_desc->w.buffer_mop_addr = cpu_to_le64(bi->dma + bi->page_offset);
   580			rx_desc->w.buffer_sop_addr = 0;
   581			rx_desc->w.mop_mem_len = rx_ring->rx_buf_len;
   582			rx_desc->wb.pkt_len = 0;
   583			rx_desc->w.vp = rx_ring->reg_idx;
   584	
   585			rx_desc++;
   586			bi++;
   587			ntu++;
   588			if (unlikely(ntu == rx_ring->count)) {
   589				rx_desc = NE6X_RX_DESC(rx_ring, 0);
   590				bi = rx_ring->rx_buf;
   591				ntu = 0;
   592			}
   593	
   594			/* clear the status bits for the next_to_use descriptor */
   595			rx_desc->wb.u.val = 0;
   596	
   597			cleaned_count--;
   598		} while (cleaned_count);
   599	
   600		if (rx_ring->next_to_use != ntu)
   601			ne6x_release_rx_desc(rx_ring, ntu);
   602	
   603		return false;
   604	
   605	no_buffers:
   606		if (rx_ring->next_to_use != ntu)
   607			ne6x_release_rx_desc(rx_ring, ntu);
   608	
   609		/* make sure to come back via polling to try again after
   610		 * allocation failure
   611		 */
   612		return true;
   613	}
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
