Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AC138DC8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945219; cv=none; b=fadrb3SMfwlKWVZZzT7Iu8E+V4cS8P8Qk5crW20oEqTWjNxi0WAH1TxEfHy0S+ABFfLR+4LlJPIEI7bxx/A0aHeFa6WBMlTn/EVCm8X5ABZaZEOKx5r5oD6GkWAS4/jjbM56gavZd0Z69hqRIR8oReXYFt35sSoOxfQ/3biKpI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945219; c=relaxed/simple;
	bh=QR61TTIpA6XNDAWy71H9zfsohzYJdSKPpTKISBa3KyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UR93GPs0XKfHpaRUXCdyXfb11YFdUHYQlw6LNElKnV3eFo60ExZ8MUUA+5pdpnP9MELHJ+KX0amNlVsdNfmBjzTKXqgAwdDV7id3cd0rbNBLNQn+IlagGgoqS/qrjrPNPTje4lMkAGZoQmFxuzVmyi5L+kz3IJeHy73H9FbOdPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2v5IYAg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2v5IYAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712945217; x=1744481217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QR61TTIpA6XNDAWy71H9zfsohzYJdSKPpTKISBa3KyM=;
  b=D2v5IYAgu6SYkENsGR6f3AzZ4Au4Ljv0z+YuoioPiS01KHDC52IwtMWe
   tIijVRnmXwelR2/1hL4+yiKvG9inI76VR5M6vMnn8dRWPydg3IBXUE05b
   U8Uk5v67/RuVvL73LNeTunBrhIh3CL+dYeO49bJgUPRYzwQm+hWL3d8oZ
   S8ifAJ4a/RU4Q65TPPYn5TOND0Ig7xgHQN15OqlB4nOJPhuXi7GwSH3pI
   GO5iQnS4T41cbJPshH3p3BXsndrujYfUnvHkVe3xN+MPXJiCtpToidcWX
   CJWmDJgenp/sIMPHwVdzJa+IC+N5V8CmAe996a5EbVbcaiHoGsWimkGXc
   Q==;
X-CSE-ConnectionGUID: 22QCSZFnT0K22Q3l0U9b3w==
X-CSE-MsgGUID: V3JT70MLTUKRjAeg19NWHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12193875"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="12193875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 11:06:56 -0700
X-CSE-ConnectionGUID: Ji0Ax/ctQKCLO0dRDrdfsw==
X-CSE-MsgGUID: 1YECWilqRoW6whNftMcAlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="26100527"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2024 11:06:51 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvLIV-0000Se-0G;
	Fri, 12 Apr 2024 18:06:47 +0000
Date: Sat, 13 Apr 2024 02:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4794/4795]
 drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:65:5: warning: no previous
 prototype for 'ne6x_hw_init'
Message-ID: <202404130200.0NwPZ4HH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   558c543a4922b18465988bff2cf2b5b5da40fa20
commit: a2c658ef2d2295021c7bbf4a0cac290e17dcb50d [4794/4795] driver: fix build errors for Chengdu BeiZhongWangXin N5/N6 Network Card drivers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240413/202404130200.0NwPZ4HH-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130200.0NwPZ4HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130200.0NwPZ4HH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:65:5: warning: no previous prototype for 'ne6x_hw_init' [-Wmissing-prototypes]
      65 | int ne6x_hw_init(struct ne6x_hw *hw)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:89:5: warning: no previous prototype for 'ne6x_aq_get_phy_capabilities' [-Wmissing-prototypes]
      89 | int ne6x_aq_get_phy_capabilities(struct ne6x_adapter *adpt, bool is_up, bool get_hw_stats)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:141:5: warning: no previous prototype for 'ne6x_aq_get_vf_link_status' [-Wmissing-prototypes]
     141 | int ne6x_aq_get_vf_link_status(struct ne6x_adapter *adpt, bool is_up)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:213:6: warning: no previous prototype for 'ne6x_print_link_message' [-Wmissing-prototypes]
     213 | void ne6x_print_link_message(struct ne6x_adapter *adpt, bool isup)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:494:5: warning: no previous prototype for 'ne6x_pf_init' [-Wmissing-prototypes]
     494 | int ne6x_pf_init(struct ne6x_pf *pf)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:737:6: warning: no previous prototype for 'ne6x_clean_tx_ring' [-Wmissing-prototypes]
     737 | void ne6x_clean_tx_ring(struct ne6x_ring *tx_ring)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:767:6: warning: no previous prototype for 'ne6x_clean_rx_ring' [-Wmissing-prototypes]
     767 | void ne6x_clean_rx_ring(struct ne6x_ring *rx_ring)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:849:6: warning: no previous prototype for 'ne6x_free_rx_resources' [-Wmissing-prototypes]
     849 | void ne6x_free_rx_resources(struct ne6x_ring *rx_ring)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:874:6: warning: no previous prototype for 'ne6x_free_tx_resources' [-Wmissing-prototypes]
     874 | void ne6x_free_tx_resources(struct ne6x_ring *tx_ring)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:886:6: warning: no previous prototype for 'ne6x_free_cq_resources' [-Wmissing-prototypes]
     886 | void ne6x_free_cq_resources(struct ne6x_ring *cq_ring)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c: In function 'ne6x_update_pf_stats':
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1252:13: warning: variable 'tx_force_wb' set but not used [-Wunused-but-set-variable]
    1252 |         u64 tx_force_wb;
         |             ^~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1242:32: warning: variable 'oes' set but not used [-Wunused-but-set-variable]
    1242 |         struct ne6x_eth_stats *oes;
         |                                ^~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1240:35: warning: variable 'ons' set but not used [-Wunused-but-set-variable]
    1240 |         struct rtnl_link_stats64 *ons;
         |                                   ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c: At top level:
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:1847:5: warning: no previous prototype for 'ne6x_link_speed_to_rate' [-Wmissing-prototypes]
    1847 | int ne6x_link_speed_to_rate(int link_speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2058:5: warning: no previous prototype for 'ne6x_set_vf_port_vlan' [-Wmissing-prototypes]
    2058 | int ne6x_set_vf_port_vlan(struct net_device *netdev, int vf_id, u16 vlan_id,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2210:27: warning: initialized field overwritten [-Woverride-init]
    2210 |         .ndo_tx_timeout = ne6x_tx_timeout,
         |                           ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2210:27: note: (near initialization for 'ne6x_netdev_ops.ndo_tx_timeout')
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2214:29: warning: initialized field overwritten [-Woverride-init]
    2214 |         .ndo_set_features = ne6x_set_features,
         |                             ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2214:29: note: (near initialization for 'ne6x_netdev_ops.ndo_set_features')
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2696:6: warning: no previous prototype for 'ne6x_adjust_adpt_port_max_queue' [-Wmissing-prototypes]
    2696 | void ne6x_adjust_adpt_port_max_queue(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2917:5: warning: no previous prototype for 'ne6x_adpt_release' [-Wmissing-prototypes]
    2917 | int ne6x_adpt_release(struct ne6x_adapter *adpt)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:3075:12: warning: no previous prototype for 'ne6x_init_module' [-Wmissing-prototypes]
    3075 | int __init ne6x_init_module(void)
         |            ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:3096:13: warning: no previous prototype for 'ne6x_exit_module' [-Wmissing-prototypes]
    3096 | void __exit ne6x_exit_module(void)
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c: In function 'ne6x_config_netdev':
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2375:43: warning: '%d' directive writing between 1 and 5 bytes into a region of size between 1 and 7 [-Wformat-overflow=]
    2375 |                 sprintf(name, "enP%dp%ds0f%d",
         |                                           ^~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2375:31: note: directive argument in the range [0, 65535]
    2375 |                 sprintf(name, "enP%dp%ds0f%d",
         |                               ^~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2375:17: note: 'sprintf' output between 11 and 21 bytes into a destination of size 16
    2375 |                 sprintf(name, "enP%dp%ds0f%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2376 |                         pf->hw.bus.domain_num, pf->hw.bus.bus_num, adpt->idx);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:1615:32: warning: initialized field overwritten [-Woverride-init]
    1615 |         .self_test           = ne6x_diag_test,
         |                                ^~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:1615:32: note: (near initialization for 'ne6x_ethtool_ops.self_test')
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c: In function 'ne6x_get_strings':
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:426:47: warning: '%s' directive output may be truncated writing up to 215 bytes into a region of size 32 [-Wformat-truncation=]
     426 |                 snprintf(p, ETH_GSTRING_LEN, "%s", ne6x_gstrings_priv_flags[i].name);
         |                                               ^~
   In function 'ne6x_get_priv_flag_strings',
       inlined from 'ne6x_get_strings' at drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:441:3:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:426:17: note: 'snprintf' output between 1 and 216 bytes into a destination of size 32
     426 |                 snprintf(p, ETH_GSTRING_LEN, "%s", ne6x_gstrings_priv_flags[i].name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_procfs.c:66:9: warning: no previous prototype for 'ne6x_proc_i2c_read' [-Wmissing-prototypes]
      66 | ssize_t ne6x_proc_i2c_read(struct file *filp, char __user *buf, size_t count, loff_t *ppos)
         |         ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:258:5: warning: no previous prototype for 'ne6x_adpt_request_irq_msix' [-Wmissing-prototypes]
     258 | int ne6x_adpt_request_irq_msix(struct ne6x_adapter *adpt, char *basename)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:340:5: warning: no previous prototype for 'ne6x_adpt_request_irq_intx' [-Wmissing-prototypes]
     340 | int ne6x_adpt_request_irq_intx(struct ne6x_adapter *adpt, char *basename)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_interrupt.c:607:13: warning: no previous prototype for 'ne6x_msix_clean_vf_mbx' [-Wmissing-prototypes]
     607 | irqreturn_t ne6x_msix_clean_vf_mbx(int irq, void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:463:6: warning: no previous prototype for 'ne6x_reg_lock' [-Wmissing-prototypes]
     463 | void ne6x_reg_lock(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:468:6: warning: no previous prototype for 'ne6x_reg_unlock' [-Wmissing-prototypes]
     468 | void ne6x_reg_unlock(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:507:5: warning: no previous prototype for 'ne6x_reg_axi_read' [-Wmissing-prototypes]
     507 | u32 ne6x_reg_axi_read(struct ne6x_pf *pf, u32 offset)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:521:6: warning: no previous prototype for 'ne6x_reg_axi_write' [-Wmissing-prototypes]
     521 | void ne6x_reg_axi_write(struct ne6x_pf *pf, u32 offset, u32 value)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:530:5: warning: no previous prototype for '_reg_apb_read' [-Wmissing-prototypes]
     530 | u32 _reg_apb_read(struct ne6x_pf *pf, u64 offset)
         |     ^~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:546:6: warning: no previous prototype for '_reg_apb_write' [-Wmissing-prototypes]
     546 | void _reg_apb_write(struct ne6x_pf *pf, u64 offset, u32 value)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:561:5: warning: no previous prototype for '_ne6x_reg_perform' [-Wmissing-prototypes]
     561 | int _ne6x_reg_perform(struct ne6x_pf *pf, u32 *data, u32 *pbuf, u32 len, u32 retlen)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:608:5: warning: no previous prototype for 'ne6x_reg_perform' [-Wmissing-prototypes]
     608 | int ne6x_reg_perform(struct ne6x_pf *pf, u32 *data, u32 *pbuf, u32 len, u32 retlen)
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:846:5: warning: no previous prototype for 'ne6x_reg_table_update' [-Wmissing-prototypes]
     846 | int ne6x_reg_table_update(struct ne6x_pf *pf, enum ne6x_reg_table table,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1058:5: warning: no previous prototype for 'ne6x_reg_mem_read' [-Wmissing-prototypes]
    1058 | int ne6x_reg_mem_read(struct ne6x_pf *pf, u32 addr, void *pbuf, u32 size)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1082:5: warning: no previous prototype for 'ne6x_reg_mem_write' [-Wmissing-prototypes]
    1082 | int ne6x_reg_mem_write(struct ne6x_pf *pf, u32 addr, void *pbuf, u32 size)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1253:5: warning: no previous prototype for 'ne6x_reg_set_user_data_template' [-Wmissing-prototypes]
    1253 | int ne6x_reg_set_user_data_template(struct ne6x_pf *pf, enum np_user_data type, u32 data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1274:5: warning: no previous prototype for 'ne6x_reg_get_user_data_template' [-Wmissing-prototypes]
    1274 | int ne6x_reg_get_user_data_template(struct ne6x_pf *pf, enum np_user_data type, u32 *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1391:6: warning: no previous prototype for 'ne6x_reg_send' [-Wmissing-prototypes]
    1391 | void ne6x_reg_send(struct ne6x_pf *pf, u32 cmd, u32 *data, u32 size)
         |      ^~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_reg.c:1417:5: warning: no previous prototype for 'ne6x_reg_polling' [-Wmissing-prototypes]
    1417 | int ne6x_reg_polling(struct ne6x_pf *pf, u32 cmd, u32 *data, u32 buf_size,
         |     ^~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:22:6: warning: no previous prototype for 'ext_toeplitz_key' [-Wmissing-prototypes]
      22 | void ext_toeplitz_key(const unsigned char *key, unsigned char *ext_key)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:73:6: warning: no previous prototype for 'ne6x_dev_crc32_init' [-Wmissing-prototypes]
      73 | void ne6x_dev_crc32_init(u32 poly, u32 *table)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:106:5: warning: no previous prototype for 'ne6x_dev_spd_verify' [-Wmissing-prototypes]
     106 | int ne6x_dev_spd_verify(struct ne6x_dev_eeprom_info *spd_info)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:115:5: warning: no previous prototype for 'ne6x_dev_get_eeprom' [-Wmissing-prototypes]
     115 | int ne6x_dev_get_eeprom(struct ne6x_pf *pf)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:341:6: warning: no previous prototype for 'ne6x_dev_update_status' [-Wmissing-prototypes]
     341 | void ne6x_dev_update_status(struct ne6x_pf *pf, struct ne6x_port_info *port, bool is_up)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:396:5: warning: no previous prototype for 'ne6x_dev_get_speed' [-Wmissing-prototypes]
     396 | int ne6x_dev_get_speed(struct ne6x_adapter *adpt, u32 *speed)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:1046:5: warning: no previous prototype for 'ne6x_dev_set_mac_inloop' [-Wmissing-prototypes]
    1046 | int ne6x_dev_set_mac_inloop(struct ne6x_adapter *adpt, int enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:1097:6: warning: no previous prototype for 'ne6x_dev_transform_vf_stat_format' [-Wmissing-prototypes]
    1097 | void ne6x_dev_transform_vf_stat_format(u32 *stat_arr, struct vf_stat *stat)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:1312:5: warning: no previous prototype for 'ne6x_dev_proto_recv' [-Wmissing-prototypes]
    1312 | int ne6x_dev_proto_recv(struct sk_buff *skb, struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_dev.c:1328:5: warning: no previous prototype for 'ne6x_dev_proto_send' [-Wmissing-prototypes]
    1328 | int ne6x_dev_proto_send(struct net_device *netdev, char *buf, int len)
         |     ^~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:13:6: warning: no previous prototype for 'ne6x_clear_vf_status' [-Wmissing-prototypes]
      13 | void ne6x_clear_vf_status(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:23:6: warning: no previous prototype for 'ne6x_mbx_deinit_snapshot' [-Wmissing-prototypes]
      23 | void ne6x_mbx_deinit_snapshot(struct ne6x_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:32:5: warning: no previous prototype for 'ne6x_mbx_init_snapshot' [-Wmissing-prototypes]
      32 | int ne6x_mbx_init_snapshot(struct ne6x_hw *hw, u16 vf_count)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:57:5: warning: no previous prototype for 'ne6x_status_to_errno' [-Wmissing-prototypes]
      57 | int ne6x_status_to_errno(int err)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:65:6: warning: no previous prototype for 'ne6x_set_vf_state_qs_dis' [-Wmissing-prototypes]
      65 | void ne6x_set_vf_state_qs_dis(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:77:6: warning: no previous prototype for 'ne6x_is_reset_in_progress' [-Wmissing-prototypes]
      77 | bool ne6x_is_reset_in_progress(unsigned long *state)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:85:6: warning: no previous prototype for 'ne6x_adpt_close_vf' [-Wmissing-prototypes]
      85 | void ne6x_adpt_close_vf(struct ne6x_adapter *adpt, u16 vf_id)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:165:5: warning: no previous prototype for 'ne6x_adpt_release_vf' [-Wmissing-prototypes]
     165 | int ne6x_adpt_release_vf(struct ne6x_adapter *adpt, u16 vf_id)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:245:6: warning: no previous prototype for 'ne6x_free_vfs' [-Wmissing-prototypes]
     245 | void ne6x_free_vfs(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:370:6: warning: no previous prototype for 'ne6x_vc_set_default_allowlist' [-Wmissing-prototypes]
     370 | void ne6x_vc_set_default_allowlist(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:394:6: warning: no previous prototype for 'ne6x_send_init_mbx_mesg' [-Wmissing-prototypes]
     394 | void ne6x_send_init_mbx_mesg(struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:489:22: warning: no previous prototype for 'ne6x_adpt_setup_vf' [-Wmissing-prototypes]
     489 | struct ne6x_adapter *ne6x_adpt_setup_vf(struct ne6x_pf *pf, u16 vf_id, u16 num_vfs)
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: In function 'ne6x_init_vf_adpt_res':
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:526:24: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
     526 |         struct device *dev;
         |                        ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: At top level:
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:939:5: warning: no previous prototype for 'ne6x_sdk_send_msg_to_vf' [-Wmissing-prototypes]
     939 | int ne6x_sdk_send_msg_to_vf(struct ne6x_hw *hw, u16 vfid, u32 v_opcode,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1321:5: warning: no previous prototype for 'ne6x_conv_link_speed_to_virtchnl' [-Wmissing-prototypes]
    1321 | u32 ne6x_conv_link_speed_to_virtchnl(bool adv_link_support, u16 link_speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1357:6: warning: no previous prototype for 'ne6x_vc_notify_vf_link_state' [-Wmissing-prototypes]
    1357 | void ne6x_vc_notify_vf_link_state(struct ne6x_vf *vf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1441:6: warning: no previous prototype for 'ne6x_reset_vf' [-Wmissing-prototypes]
    1441 | bool ne6x_reset_vf(struct ne6x_vf *vf, bool is_vflr)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: In function 'ne6x_vc_reset_vf_msg':
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:1844:36: warning: variable 'vc_ether_addr' set but not used [-Wunused-but-set-variable]
    1844 |         struct virtchnl_ether_addr vc_ether_addr;
         |                                    ^~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c: At top level:
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_virtchnl_pf.c:2238:5: warning: no previous prototype for 'ne6x_set_vf_bw_for_max_vpnum' [-Wmissing-prototypes]
    2238 | int ne6x_set_vf_bw_for_max_vpnum(struct ne6x_pf *pf, int vf_id, int max_tx_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_arfs.c:19:5: warning: no previous prototype for 'ne6x_dev_add_fster_rules' [-Wmissing-prototypes]
      19 | int ne6x_dev_add_fster_rules(struct ne6x_adapter *adpt, struct ne6x_fster_fltr *input, bool is_tun)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_arfs.c:63:5: warning: no previous prototype for 'ne6x_dev_del_fster_rules' [-Wmissing-prototypes]
      63 | int ne6x_dev_del_fster_rules(struct ne6x_adapter *adpt, struct ne6x_fster_fltr *input, bool is_tun)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_arfs.c:168:5: warning: no previous prototype for 'ne6x_arfs_add_flow_rules' [-Wmissing-prototypes]
     168 | int ne6x_arfs_add_flow_rules(struct ne6x_adapter *adpt, struct hlist_head *add_list_head)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_arfs.c:196:5: warning: no previous prototype for 'ne6x_arfs_del_flow_rules' [-Wmissing-prototypes]
     196 | int ne6x_arfs_del_flow_rules(struct ne6x_adapter *adpt,  struct hlist_head *del_list_head)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_arfs.c:399:5: warning: no previous prototype for 'ne6x_get_irq_num' [-Wmissing-prototypes]
     399 | int ne6x_get_irq_num(struct ne6x_pf *pf, int idx)
         |     ^~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:70:7: warning: no previous prototype for 'my_strtok' [-Wmissing-prototypes]
      70 | char *my_strtok(char *p_in_string, char *p_in_delimit, char **pp_out_ret)
         |       ^~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:105:5: warning: no previous prototype for 'my_isdigit' [-Wmissing-prototypes]
     105 | int my_isdigit(char in_char)
         |     ^~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:113:5: warning: no previous prototype for 'my_atoi' [-Wmissing-prototypes]
     113 | int my_atoi(char *p_in_string)
         |     ^~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:142:6: warning: no previous prototype for 'ne6x_dbg_show_queue' [-Wmissing-prototypes]
     142 | void ne6x_dbg_show_queue(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:234:6: warning: no previous prototype for 'ne6x_dbg_show_ring' [-Wmissing-prototypes]
     234 | void ne6x_dbg_show_ring(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:314:6: warning: no previous prototype for 'ne6x_dbg_show_txtail' [-Wmissing-prototypes]
     314 | void ne6x_dbg_show_txtail(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:338:6: warning: no previous prototype for 'ne6x_dbg_show_txq' [-Wmissing-prototypes]
     338 | void ne6x_dbg_show_txq(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:363:6: warning: no previous prototype for 'ne6x_dbg_show_rxq' [-Wmissing-prototypes]
     363 | void ne6x_dbg_show_rxq(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:388:6: warning: no previous prototype for 'ne6x_dbg_show_cq' [-Wmissing-prototypes]
     388 | void ne6x_dbg_show_cq(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:413:6: warning: no previous prototype for 'ne6x_dbg_clean_queue' [-Wmissing-prototypes]
     413 | void ne6x_dbg_clean_queue(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:448:6: warning: no previous prototype for 'ne6x_dbg_show_txring' [-Wmissing-prototypes]
     448 | void ne6x_dbg_show_txring(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:496:6: warning: no previous prototype for 'ne6x_dbg_show_rxring' [-Wmissing-prototypes]
     496 | void ne6x_dbg_show_rxring(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:544:6: warning: no previous prototype for 'ne6x_dbg_show_cqring' [-Wmissing-prototypes]
     544 | void ne6x_dbg_show_cqring(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:587:6: warning: no previous prototype for 'ne6x_dbg_show_txdesc_states' [-Wmissing-prototypes]
     587 | void ne6x_dbg_show_txdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:654:6: warning: no previous prototype for 'ne6x_dbg_show_rxdesc_states' [-Wmissing-prototypes]
     654 | void ne6x_dbg_show_rxdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:701:6: warning: no previous prototype for 'ne6x_dbg_show_cqdesc_states' [-Wmissing-prototypes]
     701 | void ne6x_dbg_show_cqdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:757:6: warning: no previous prototype for 'ne6x_dbg_show_arfs_cnt' [-Wmissing-prototypes]
     757 | void ne6x_dbg_show_arfs_cnt(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:783:6: warning: no previous prototype for 'ne6x_dbg_apb_read' [-Wmissing-prototypes]
     783 | void ne6x_dbg_apb_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:801:6: warning: no previous prototype for 'ne6x_dbg_apb_write' [-Wmissing-prototypes]
     801 | void ne6x_dbg_apb_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:819:6: warning: no previous prototype for 'ne6x_dbg_mem_read' [-Wmissing-prototypes]
     819 | void ne6x_dbg_mem_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:858:6: warning: no previous prototype for 'ne6x_dbg_mem_write' [-Wmissing-prototypes]
     858 | void ne6x_dbg_mem_write(struct ne6x_pf *pf, char *cmd_buf, int count) {}
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:860:6: warning: no previous prototype for 'ne6x_dbg_templ_help' [-Wmissing-prototypes]
     860 | void ne6x_dbg_templ_help(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:880:6: warning: no previous prototype for 'ne6x_dbg_templ_read' [-Wmissing-prototypes]
     880 | void ne6x_dbg_templ_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:897:6: warning: no previous prototype for 'ne6x_dbg_templ_write' [-Wmissing-prototypes]
     897 | void ne6x_dbg_templ_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:914:6: warning: no previous prototype for 'ne6x_dbg_soc_read' [-Wmissing-prototypes]
     914 | void ne6x_dbg_soc_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:930:6: warning: no previous prototype for 'ne6x_dbg_soc_write' [-Wmissing-prototypes]
     930 | void ne6x_dbg_soc_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:946:6: warning: no previous prototype for 'ne6x_dbg_tab_read' [-Wmissing-prototypes]
     946 | void ne6x_dbg_tab_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1010:6: warning: no previous prototype for 'ne6x_dbg_set_mac_to_eeprom' [-Wmissing-prototypes]
    1010 | void ne6x_dbg_set_mac_to_eeprom(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1054:6: warning: no previous prototype for 'ne6x_dbg_get_mac' [-Wmissing-prototypes]
    1054 | void ne6x_dbg_get_mac(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1085:6: warning: no previous prototype for 'ne6x_dbg_set_dev_type_to_eeprom' [-Wmissing-prototypes]
    1085 | void ne6x_dbg_set_dev_type_to_eeprom(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1145:6: warning: no previous prototype for 'ne6x_dbg_tab_write' [-Wmissing-prototypes]
    1145 | void ne6x_dbg_tab_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1205:6: warning: no previous prototype for 'ne6x_dbg_tab_insert' [-Wmissing-prototypes]
    1205 | void ne6x_dbg_tab_insert(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1276:6: warning: no previous prototype for 'ne6x_dbg_tab_delete' [-Wmissing-prototypes]
    1276 | void ne6x_dbg_tab_delete(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1330:6: warning: no previous prototype for 'ne6x_dbg_tab_search' [-Wmissing-prototypes]
    1330 | void ne6x_dbg_tab_search(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1402:6: warning: no previous prototype for 'ne6x_dbg_get_fru_info' [-Wmissing-prototypes]
    1402 | void ne6x_dbg_get_fru_info(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1433:5: warning: no previous prototype for 'getparam' [-Wmissing-prototypes]
    1433 | u32 getparam(char *cmd_buf, u32 *param, int max_cnt)
         |     ^~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1490:6: warning: no previous prototype for 'GetNextArg' [-Wmissing-prototypes]
    1490 | void GetNextArg(char **Args, char *buffer)
         |      ^~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1501:6: warning: no previous prototype for 'ne6x_dbg_show_pcie_drop_counter' [-Wmissing-prototypes]
    1501 | void ne6x_dbg_show_pcie_drop_counter(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1512:6: warning: no previous prototype for 'ne6x_dbg_clr_table' [-Wmissing-prototypes]
    1512 | void ne6x_dbg_clr_table(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: In function 'ne6x_dbg_clr_table':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1514:27: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
    1514 |         u32 table_id = 0, cnt;
         |                           ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: At top level:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1521:6: warning: no previous prototype for 'ne6x_dbg_set_hw_flag_eeprom' [-Wmissing-prototypes]
    1521 | void ne6x_dbg_set_hw_flag_eeprom(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1544:6: warning: no previous prototype for 'ne6x_dbg_erase_norflash' [-Wmissing-prototypes]
    1544 | void ne6x_dbg_erase_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1562:6: warning: no previous prototype for 'ne6x_dbg_write_norflash' [-Wmissing-prototypes]
    1562 | void ne6x_dbg_write_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1605:6: warning: no previous prototype for 'ne6x_dbg_read_norflash' [-Wmissing-prototypes]
    1605 | void ne6x_dbg_read_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1632:6: warning: no previous prototype for 'ne6x_dbg_meter_write' [-Wmissing-prototypes]
    1632 | void ne6x_dbg_meter_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:2007:6: warning: no previous prototype for 'ne6x_dbg_update_adpt_speed' [-Wmissing-prototypes]
    2007 | void ne6x_dbg_update_adpt_speed(struct ne6x_adapter *adpt, u32 speed, u32 lane_mode) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: In function 'ne6x_dbg_info_pnsn_read':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1852:23: warning: 'sprintf' argument 3 overlaps destination object '<unknown>' [-Wrestrict]
    1852 |                 len = sprintf(name, "%s[PN] Part number: %s\n", name, pru_pn);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1856:23: warning: 'sprintf' argument 3 overlaps destination object '<unknown>' [-Wrestrict]
    1856 |                 len = sprintf(name, "%s[SN] Serial number: %s\n", name, pru_sn);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +/ne6x_hw_init +65 drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c

c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   64  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  @65  int ne6x_hw_init(struct ne6x_hw *hw)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   66  {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   67  	int cpu_num = num_online_cpus();
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   68  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   69  	/* max phy_port */
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   70  	hw->pf_port = ne6x_dev_get_port_num(hw->back);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   71  	/* expect vp queue */
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   72  	hw->expect_vp = NE6X_MAX_VP_NUM / hw->pf_port;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   73  	/* actal max vp queue */
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   74  	hw->max_queue = min_t(int, cpu_num, hw->expect_vp);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   75  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   76  	hw->port_info = devm_kzalloc(ne6x_hw_to_dev(hw), sizeof(*hw->port_info), GFP_KERNEL);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   77  	if (!hw->port_info)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   78  		return -EIO;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   79  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   80  	/* set the back pointer to HW */
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   81  	hw->port_info->hw = hw;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   82  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   83  	if (!is_valid_ether_addr(hw->port_info->mac.perm_addr))
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   84  		eth_random_addr(hw->port_info->mac.perm_addr);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   85  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   86  	return 0;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   87  }
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   88  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  @89  int ne6x_aq_get_phy_capabilities(struct ne6x_adapter *adpt, bool is_up, bool get_hw_stats)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   90  {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   91  	struct ne6x_port_info *port_info = adpt->port_info;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   92  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   93  	/* read link states */
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   94  	if (get_hw_stats)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   95  		ne6x_dev_get_link_status(adpt, &port_info->link_status);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   96  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   97  	if (is_up) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   98  		if (port_info->link_status.link) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08   99  			port_info->phy.link_info.link_info |= NE6X_AQ_LINK_UP;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  100  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  101  			switch (port_info->link_status.speed) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  102  			case NE6X_LINK_SPEED_10GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  103  				port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_10GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  104  				port_info->phy.link_info.link_speed = NE6X_LINK_SPEED_10GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  105  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  106  			case NE6X_LINK_SPEED_25GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  107  				port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_25GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  108  				port_info->phy.link_info.link_speed = NE6X_LINK_SPEED_25GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  109  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  110  			case NE6X_LINK_SPEED_40GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  111  				port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_40GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  112  				port_info->phy.link_info.link_speed = NE6X_LINK_SPEED_40GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  113  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  114  			case NE6X_LINK_SPEED_100GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  115  				port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_100GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  116  				port_info->phy.link_info.link_speed = NE6X_LINK_SPEED_100GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  117  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  118  			case NE6X_LINK_SPEED_200GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  119  				port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_200GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  120  				port_info->phy.link_info.link_speed = NE6X_LINK_SPEED_200GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  121  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  122  			default:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  123  				dev_info(&adpt->back->pdev->dev, "WARNING: Unrecognized link_speed (0x%x).\n",
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  124  					 NE6X_LINK_SPEED_UNKNOWN);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  125  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  126  			}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  127  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  128  			port_info->phy.media_type = NE6X_MEDIA_FIBER;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  129  			return 0;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  130  		}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  131  	}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  132  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  133  	port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_UNKNOWN;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  134  	port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_UNKNOWN;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  135  	port_info->phy.media_type             = NE6X_MEDIA_UNKNOWN;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  136  	port_info->phy.link_info.link_info   &= ~NE6X_AQ_LINK_UP;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  137  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  138  	return 0;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  139  }
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  140  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08 @141  int ne6x_aq_get_vf_link_status(struct ne6x_adapter *adpt, bool is_up)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  142  {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  143  	struct ne6x_pf *pf = adpt->back;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  144  	struct ne6x_adapter *pf_adpt = pf->adpt[(adpt->port_info->lport >= pf->hw.pf_port) ?
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  145  					 (pf->hw.pf_port - 1) : adpt->port_info->lport];
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  146  	struct ne6x_link_info *pf_link_status = &pf_adpt->port_info->link_status;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  147  	struct ne6x_port_info *vf_port_info = adpt->port_info;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  148  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  149  	if (is_up) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  150  		if (pf_link_status->link) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  151  			vf_port_info->phy.link_info.link_info |= NE6X_AQ_LINK_UP;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  152  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  153  			switch (pf_link_status->speed) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  154  			case NE6X_LINK_SPEED_10GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  155  				vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_10GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  156  				vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_10GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  157  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  158  			case NE6X_LINK_SPEED_25GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  159  				vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_25GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  160  				vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_25GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  161  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  162  			case NE6X_LINK_SPEED_40GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  163  				vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_40GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  164  				vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_40GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  165  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  166  			case NE6X_LINK_SPEED_100GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  167  				vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_100GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  168  				vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_100GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  169  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  170  			case NE6X_LINK_SPEED_200GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  171  				vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_200GBASE;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  172  				vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_200GB;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  173  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  174  			default:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  175  				dev_info(&adpt->back->pdev->dev, "WARNING: Unrecognized link_speed (0x%x).\n",
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  176  					 NE6X_LINK_SPEED_UNKNOWN);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  177  				break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  178  			}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  179  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  180  			vf_port_info->phy.media_type = NE6X_MEDIA_FIBER;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  181  			return 0;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  182  		}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  183  	}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  184  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  185  	vf_port_info->phy.link_info.phy_type_low = NE6X_PHY_TYPE_UNKNOWN;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  186  	vf_port_info->phy.link_info.link_speed   = NE6X_LINK_SPEED_UNKNOWN;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  187  	vf_port_info->phy.media_type             = NE6X_MEDIA_UNKNOWN;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  188  	vf_port_info->phy.link_info.link_info   &= ~NE6X_AQ_LINK_UP;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  189  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  190  	return 0;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  191  }
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  192  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  193  static void ne6x_adpt_link_event(struct ne6x_adapter *adpt, bool link_up)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  194  {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  195  	if (!adpt)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  196  		return;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  197  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  198  	if (test_bit(NE6X_ADPT_DOWN, adpt->comm.state) || !adpt->netdev)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  199  		return;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  200  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  201  	if (link_up == netif_carrier_ok(adpt->netdev))
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  202  		return;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  203  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  204  	if (link_up) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  205  		netif_carrier_on(adpt->netdev);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  206  		netif_tx_wake_all_queues(adpt->netdev);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  207  	} else {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  208  		netif_carrier_off(adpt->netdev);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  209  		netif_tx_stop_all_queues(adpt->netdev);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  210  	}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  211  }
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  212  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08 @213  void ne6x_print_link_message(struct ne6x_adapter *adpt, bool isup)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  214  {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  215  	char *speed = "Unknown ";
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  216  	char *an = "False";
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  217  	u16 new_speed;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  218  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  219  	if (isup)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  220  		new_speed = adpt->port_info->phy.link_info.link_speed;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  221  	else
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  222  		new_speed = NE6X_LINK_SPEED_UNKNOWN;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  223  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  224  	if (adpt->current_isup == isup && adpt->current_speed == new_speed)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  225  		return;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  226  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  227  	adpt->current_isup = isup;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  228  	adpt->current_speed = new_speed;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  229  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  230  	if (!isup) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  231  		netdev_info(adpt->netdev, "NIC Link is Down\n");
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  232  		return;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  233  	}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  234  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  235  	switch (adpt->port_info->phy.link_info.link_speed) {
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  236  	case NE6X_LINK_SPEED_40GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  237  		speed = "40 G";
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  238  		break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  239  	case NE6X_LINK_SPEED_100GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  240  		speed = "100 G";
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  241  		break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  242  	case NE6X_LINK_SPEED_10GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  243  		speed = "10 G";
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  244  		break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  245  	case NE6X_LINK_SPEED_25GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  246  		speed = "25 G";
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  247  		break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  248  	case NE6X_LINK_SPEED_200GB:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  249  		speed = "200 G";
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  250  		break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  251  	default:
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  252  		break;
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  253  	}
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  254  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  255  	if (adpt->port_info->phy.link_info.an_info)
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  256  		an = "True";
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  257  
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  258  	netdev_info(adpt->netdev, "NIC Link is Up, %sbps Full Duplex, Autoneg: %s\n", speed, an);
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  259  }
c783f7daed8739 xiaohuihui-bzwx-kj 2024-04-08  260  

:::::: The code at line 65 was first introduced by commit
:::::: c783f7daed8739b9497e40656bc220d2d17c9c10 drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver

:::::: TO: xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>
:::::: CC: xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
