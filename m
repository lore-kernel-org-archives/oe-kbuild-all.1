Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7805A37B3EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386279; cv=none; b=LfW3MEuoAPJfnR7PkUk+qotDBv8PM1+hm1443JauZW3j4mTebYuAWByrpiVlhl42C21pvAGojQ7GjipEyRenREUTESP6MyZG0uS76HRj7dOy8hpQ3e/bkl6mrXYfaYbzZfABO9Fzn9O8U2YBafa5JunQZvrMtRpek1KwZyX5j6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386279; c=relaxed/simple;
	bh=uGWkYw+hIBlLg+zD25wQpgmTfJ2M8ozMvov1gXG81wo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RKSE4fzKjGuBMcYz9894Y2sYZm9xTsThHrCLHB26n2V9D+gmpFq1ANvyLU5/Y5i0x5vr1JdF1NINz+zJOvVbzkXQ7FXiErtwPxS0c01VzCX3dq2MWdZzy8Ja7OetWC8heHZeW4a4e9KH9Q3huez5iinqu9eekOdOvU4ND0LEEYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekWViLP+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekWViLP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768386278; x=1799922278;
  h=date:from:to:cc:subject:message-id;
  bh=uGWkYw+hIBlLg+zD25wQpgmTfJ2M8ozMvov1gXG81wo=;
  b=ekWViLP++aODY0N0hma0mA3CwmvfDsoBdP99jguC0KsagFFNZSzn1khg
   Or+k+ZHDAMgnFUQv9q5rl8bX8sq75A2JvJVYAi9kCRDHX0CMBe4rjts5G
   HHClSShGS1MhSWgS7rGgyFVruSMj7p5mgq+Uo869qRtqqJqxqRSxR9RKe
   ITTc95W+3+kxX3gSL/fOlHoG1E2I9edSGlOYDljGWkOdV2biFppStegq6
   EqGryex3rrdljm57S77TkzZH3JnVHm0GaU5VJhEHzRwFy8M6BFp/ZdDsu
   H9iTq3BpNdhSY6YDWYr1bOWEElSjqmQZFELAeVVuQCDtDdMltwo3Mra6E
   A==;
X-CSE-ConnectionGUID: MekrDfooRDChRcs1kSwcyA==
X-CSE-MsgGUID: yXu1Gn2+SAK4v6wvQ9xuXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73318115"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73318115"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:24:36 -0800
X-CSE-ConnectionGUID: M5yln4MuTT2roPluGaxFHg==
X-CSE-MsgGUID: +ZtI04WiSouy7lJ8ECI7mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209691649"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jan 2026 02:24:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfy3C-00000000GD4-3cRo;
	Wed, 14 Jan 2026 10:24:30 +0000
Date: Wed, 14 Jan 2026 18:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-PMT-enhancement-ANBZ27534
 23/23] drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c:426:47: warning:
 '%s' directive output may be truncated writing up to 215 bytes into a region
 of size 32
Message-ID: <202601141842.LSAn1Cp0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-PMT-enhancement-ANBZ27534
head:   5be39e8fdc241e57f9813026ad199ad5add77ce7
commit: b720e864f9c6fe26c6f7ab01738fe9257bfe2a1b [23/23] anolis: drivers/bzwx: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260114/202601141842.LSAn1Cp0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141842.LSAn1Cp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141842.LSAn1Cp0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:67:5: warning: no previous prototype for 'ne6x_hw_init' [-Wmissing-prototypes]
      67 | int ne6x_hw_init(struct ne6x_hw *hw)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:91:5: warning: no previous prototype for 'ne6x_aq_get_phy_capabilities' [-Wmissing-prototypes]
      91 | int ne6x_aq_get_phy_capabilities(struct ne6x_adapter *adpt, bool is_up, bool get_hw_stats)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:143:5: warning: no previous prototype for 'ne6x_aq_get_vf_link_status' [-Wmissing-prototypes]
     143 | int ne6x_aq_get_vf_link_status(struct ne6x_adapter *adpt, bool is_up)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:215:6: warning: no previous prototype for 'ne6x_print_link_message' [-Wmissing-prototypes]
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
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:2381:43: warning: '%d' directive writing between 1 and 5 bytes into a region of size between 1 and 7 [-Wformat-overflow=]
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
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:587:6: warning: no previous prototype for 'ne6x_dbg_show_txdesc_states' [-Wmissing-prototypes]
     587 | void ne6x_dbg_show_txdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:654:6: warning: no previous prototype for 'ne6x_dbg_show_rxdesc_states' [-Wmissing-prototypes]
     654 | void ne6x_dbg_show_rxdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:701:6: warning: no previous prototype for 'ne6x_dbg_show_cqdesc_states' [-Wmissing-prototypes]
     701 | void ne6x_dbg_show_cqdesc_states(int adpt_num, int queue_num, struct ne6x_pf *pf)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:757:6: warning: no previous prototype for 'ne6x_dbg_show_arfs_cnt' [-Wmissing-prototypes]
     757 | void ne6x_dbg_show_arfs_cnt(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:783:6: warning: no previous prototype for 'ne6x_dbg_apb_read' [-Wmissing-prototypes]
     783 | void ne6x_dbg_apb_read(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:801:6: warning: no previous prototype for 'ne6x_dbg_apb_write' [-Wmissing-prototypes]
     801 | void ne6x_dbg_apb_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:819:6: warning: no previous prototype for 'ne6x_dbg_mem_read' [-Wmissing-prototypes]
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
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1275:6: warning: no previous prototype for 'ne6x_dbg_tab_delete' [-Wmissing-prototypes]
    1275 | void ne6x_dbg_tab_delete(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1329:6: warning: no previous prototype for 'ne6x_dbg_tab_search' [-Wmissing-prototypes]
    1329 | void ne6x_dbg_tab_search(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1401:6: warning: no previous prototype for 'ne6x_dbg_get_fru_info' [-Wmissing-prototypes]
    1401 | void ne6x_dbg_get_fru_info(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1432:5: warning: no previous prototype for 'getparam' [-Wmissing-prototypes]
    1432 | u32 getparam(char *cmd_buf, u32 *param, int max_cnt)
         |     ^~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1489:6: warning: no previous prototype for 'ne6x_dbg_show_pcie_drop_counter' [-Wmissing-prototypes]
    1489 | void ne6x_dbg_show_pcie_drop_counter(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1500:6: warning: no previous prototype for 'ne6x_dbg_clr_table' [-Wmissing-prototypes]
    1500 | void ne6x_dbg_clr_table(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: In function 'ne6x_dbg_clr_table':
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1502:27: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
    1502 |         u32 table_id = 0, cnt;
         |                           ^~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: At top level:
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1509:6: warning: no previous prototype for 'ne6x_dbg_set_hw_flag_eeprom' [-Wmissing-prototypes]
    1509 | void ne6x_dbg_set_hw_flag_eeprom(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1532:6: warning: no previous prototype for 'ne6x_dbg_erase_norflash' [-Wmissing-prototypes]
    1532 | void ne6x_dbg_erase_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1550:6: warning: no previous prototype for 'ne6x_dbg_write_norflash' [-Wmissing-prototypes]
    1550 | void ne6x_dbg_write_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1593:6: warning: no previous prototype for 'ne6x_dbg_read_norflash' [-Wmissing-prototypes]
    1593 | void ne6x_dbg_read_norflash(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1620:6: warning: no previous prototype for 'ne6x_dbg_meter_write' [-Wmissing-prototypes]
    1620 | void ne6x_dbg_meter_write(struct ne6x_pf *pf, char *cmd_buf, int count)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1995:6: warning: no previous prototype for 'ne6x_dbg_update_adpt_speed' [-Wmissing-prototypes]
    1995 | void ne6x_dbg_update_adpt_speed(struct ne6x_adapter *adpt, u32 speed, u32 lane_mode) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: In function 'ne6x_dbg_info_pnsn_read':
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1840:23: warning: 'sprintf' argument 3 overlaps destination object '<unknown>' [-Wrestrict]
    1840 |                 len = sprintf(name, "%s[PN] Part number: %s\n", name, pru_pn);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c:1844:23: warning: 'sprintf' argument 3 overlaps destination object '<unknown>' [-Wrestrict]
    1844 |                 len = sprintf(name, "%s[SN] Serial number: %s\n", name, pru_sn);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:441: warning: Function parameter or member 'kernel_coal' not described in 'ne6xvf_get_coalesce'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:441: warning: Function parameter or member 'extack' not described in 'ne6xvf_get_coalesce'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:596: warning: Function parameter or member 'info' not described in 'ne6xvf_set_rxnfc'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:596: warning: Excess function parameter 'cmd' description in 'ne6xvf_set_rxnfc'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:620: warning: expecting prototype for iavf_get_rxnfc(). Prototype was for ne6xvf_get_rxnfc() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:659: warning: expecting prototype for iavf_get_rxfh_indir_size(). Prototype was for ne6xvf_get_rxfh_indir_size() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:739: warning: Function parameter or member 'channels' not described in 'ne6xvf_get_channels'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:739: warning: expecting prototype for iavf_get_channels(). Prototype was for ne6xvf_get_channels() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:762: warning: Function parameter or member 'channels' not described in 'ne6xvf_set_channels'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:762: warning: Excess function parameter 'ch' description in 'ne6xvf_set_channels'
--
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:72: warning: Function parameter or member 'adapter' not described in 'nce_get_vsi_stats_struct'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:72: warning: Excess function parameter 'vsi' description in 'nce_get_vsi_stats_struct'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:84: warning: Function parameter or member 'adapter' not described in 'ne6xvf_update_pf_stats'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:84: warning: expecting prototype for nce_update_pf_stats(). Prototype was for ne6xvf_update_pf_stats() instead
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2325: warning: expecting prototype for nce_set_features(). Prototype was for ne6xvf_set_features() instead
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2440: warning: expecting prototype for nce_fix_features(). Prototype was for ne6xvf_fix_features() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2582: warning: Function parameter or member 'adapter' not described in 'ne6xvf_find_vlan'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2582: warning: Excess function parameter 'vsi' description in 'ne6xvf_find_vlan'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2602: warning: expecting prototype for ne6xvf_add_vlan(). Prototype was for ne6xvf_add_vlan_list() instead
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:2630: warning: expecting prototype for ne6xvf_del_vlan(). Prototype was for ne6xvf_del_vlan_list() instead
--
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_debugfs.c:160: warning: expecting prototype for nce_dbg_command_read(). Prototype was for ne6xvf_dbg_command_read() instead
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_debugfs.c:257: warning: expecting prototype for nce_dbg_pf_init(). Prototype was for ne6xvf_dbg_pf_init() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_debugfs.c:283: warning: expecting prototype for nce_dbg_pf_exit(). Prototype was for ne6xvf_dbg_pf_exit() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_debugfs.c:292: warning: expecting prototype for nce_dbg_init(). Prototype was for ne6xvf_dbg_init() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_debugfs.c:302: warning: expecting prototype for nce_dbg_exit(). Prototype was for ne6xvf_dbg_exit() instead


vim +426 drivers/net/ethernet/bzwx/nce/ne6x/ne6x_ethtool.c

   419	
   420	static void ne6x_get_priv_flag_strings(struct net_device *netdev, u8 *data)
   421	{
   422		unsigned int i;
   423		u8 *p = data;
   424	
   425		for (i = 0; i < NE6X_PRIV_FLAG_ARRAY_SIZE; i++) {
 > 426			snprintf(p, ETH_GSTRING_LEN, "%s", ne6x_gstrings_priv_flags[i].name);
   427			p += ETH_GSTRING_LEN;
   428		}
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
