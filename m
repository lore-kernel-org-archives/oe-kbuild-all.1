Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6913210D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728812084; cv=none; b=aOj+ds82GQuRrjITmb9rjjXBAMqfOl5z5IcqDoeVxvNtGsb1dLiiyXb36hQFLnSQ+cwm00c7qZc0gim9LflNoNA9hw/38oiIsVzKGzpKs1pCTzV+8bdmMICcEpVMZ3Uv5dr1KolLT8I4EMHTHyk6qs47Cz/G1N5Md8ziaDT7/Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728812084; c=relaxed/simple;
	bh=blFM45J1EnyieMhsmIB5Ek6kk80Qh2EG83lkFsCWi84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNDP6h/CS2Qsxv/KZBt4DyPvhsKKX/GfiDX2F9u/JfvO3qYhC4qfyP1PEyMm2trCQa5rdOYnXIxcdrOx8EO7I0mXcOvRu6z5PSMB8flFsyeIXBfPwx34P/QQKJOlu3N41q9emfK2MNaVYLl5da9Rn93Dj6Y8hv4Ilq7VM3B8LTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDpLhcru; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDpLhcru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728812081; x=1760348081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blFM45J1EnyieMhsmIB5Ek6kk80Qh2EG83lkFsCWi84=;
  b=JDpLhcru9XBYNFqzzObLntbOVBjB0StWAXNYja8rzhA86zG0L6qnnUA8
   bYLv321jkvvGPCJYCXZm/FFWGM4zo/r3VyWLp6Kjl/JkkO7IQJ9imh2A7
   fmjKVyXHOMRDiozLWD+mFDJb5UgGuQioxRKZul/4jq/cAJ7Cwnu2fhsCQ
   GC5I5YdQtyQiL5XuFOtZTm3EIWGC2okEOJxmHzNJREmCWg3QrsdXjlqkX
   E+qpWkDe978mJoHE5N3w6wj8jdBO/PxC+ajGjP3OnVQldz/k+sWzGtLgL
   UpH6+cmRwHd2Mhc1EKj5pyLLrUkWXsal6QqNQkKZSs4fBu/1+SW3zFjrc
   A==;
X-CSE-ConnectionGUID: 4eRNN72IT/2vlExJvnTMEw==
X-CSE-MsgGUID: 8JztS9wUTSSX7MwTetxUbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38805513"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="38805513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 02:34:39 -0700
X-CSE-ConnectionGUID: oEH8WN5eQh2gpvntsE/hEg==
X-CSE-MsgGUID: Zbzvm2tPT4SPv492H4W92A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="81302789"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Oct 2024 02:33:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szuyp-000EFj-2s;
	Sun, 13 Oct 2024 09:33:39 +0000
Date: Sun, 13 Oct 2024 17:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3971/14354]
 drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field
 'hinic_ieee_ets_default' has incomplete type
Message-ID: <202410131713.fXxBznh8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b52135712fc8eae0751505713e1caf086a1437d4
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [3971/14354] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: arm64-randconfig-003-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131713.fXxBznh8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131713.fXxBznh8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131713.fXxBznh8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:34:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:271:5: warning: no previous prototype for 'hinic_get_io_stats_size' [-Wmissing-prototypes]
     271 | u32 hinic_get_io_stats_size(struct hinic_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:318:6: warning: no previous prototype for 'hinic_get_io_stats' [-Wmissing-prototypes]
     318 | void hinic_get_io_stats(struct hinic_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:1858:6: warning: no previous prototype for 'hinic_lp_test' [-Wmissing-prototypes]
    1858 | void hinic_lp_test(struct net_device *netdev, struct ethtool_test *eth_test,
         |      ^~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_nictool.c:28:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:698:5: warning: no previous prototype for 'get_pfc_info' [-Wmissing-prototypes]
     698 | int get_pfc_info(struct hinic_nic_dev *nic_dev, void *buf_in,
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:720:5: warning: no previous prototype for 'set_pfc_control' [-Wmissing-prototypes]
     720 | int set_pfc_control(struct hinic_nic_dev *nic_dev, void *buf_in,
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:752:5: warning: no previous prototype for 'set_ets' [-Wmissing-prototypes]
     752 | int set_ets(struct hinic_nic_dev *nic_dev, void *buf_in,
         |     ^~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:827:5: warning: no previous prototype for 'get_support_up' [-Wmissing-prototypes]
     827 | int get_support_up(struct hinic_nic_dev *nic_dev, void *buf_in,
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:855:5: warning: no previous prototype for 'get_support_tc' [-Wmissing-prototypes]
     855 | int get_support_tc(struct hinic_nic_dev *nic_dev, void *buf_in,
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:875:5: warning: no previous prototype for 'get_ets_info' [-Wmissing-prototypes]
     875 | int get_ets_info(struct hinic_nic_dev *nic_dev, void *buf_in,
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:893:5: warning: no previous prototype for 'set_pfc_priority' [-Wmissing-prototypes]
     893 | int set_pfc_priority(struct hinic_nic_dev *nic_dev, void *buf_in,
         |     ^~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_lld.c:36:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:447:6: warning: no previous prototype for 'hinic_init_syncfw_timer' [-Wmissing-prototypes]
     447 | void hinic_init_syncfw_timer(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:462:6: warning: no previous prototype for 'hinic_destroy_syncfw_timer' [-Wmissing-prototypes]
     462 | void hinic_destroy_syncfw_timer(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:550:5: warning: no previous prototype for 'hinic_version_cmp' [-Wmissing-prototypes]
     550 | int hinic_version_cmp(char *ver1, char *ver2)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1139:7: warning: no previous prototype for 'hinic_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
    1139 | void *hinic_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1296:6: warning: no previous prototype for 'hinic_get_card_func_info_by_card_name' [-Wmissing-prototypes]
    1296 | void hinic_get_card_func_info_by_card_name(const char *chip_name,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1896:6: warning: no previous prototype for 'hinic_event_process' [-Wmissing-prototypes]
    1896 | void hinic_event_process(void *adapter, struct hinic_event_info *event)
         |      ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_rx.c:39:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:171:6: warning: no previous prototype for 'hinic_rx_free_buffers' [-Wmissing-prototypes]
     171 | void hinic_rx_free_buffers(struct hinic_rxq *rxq)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:513:5: warning: no previous prototype for 'recv_one_pkt' [-Wmissing-prototypes]
     513 | int recv_one_pkt(struct hinic_rxq *rxq, struct hinic_rq_cqe *rx_cqe,
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:560:6: warning: no previous prototype for 'rx_pass_super_cqe' [-Wmissing-prototypes]
     560 | void rx_pass_super_cqe(struct hinic_rxq *rxq, u32 index, u32 pkt_num,
         |      ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:35:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_tx.c:39:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:913:5: warning: no previous prototype for 'hinic_setup_tx_wqe' [-Wmissing-prototypes]
     913 | int hinic_setup_tx_wqe(struct hinic_txq *txq)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:1100:5: warning: no previous prototype for 'hinic_stop_sq' [-Wmissing-prototypes]
    1100 | int hinic_stop_sq(struct hinic_txq *txq)
         |     ^~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:182:5: warning: no previous prototype for 'hinic_netdev_event' [-Wmissing-prototypes]
     182 | int hinic_netdev_event(struct notifier_block *notifier,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_main.c: In function 'hinic_assign_netdev_ops':
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:2291:40: error: 'struct net_device' has no member named 'dcbnl_ops'
    2291 |                         adapter->netdev->dcbnl_ops = &hinic_dcbnl_ops;
         |                                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_main.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_main.c:3058:6: warning: no previous prototype for 'nic_event' [-Wmissing-prototypes]
    3058 | void nic_event(struct hinic_lld_dev *lld_dev, void *adapter,
         |      ^~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_dcb.c:32:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:62:6: warning: no previous prototype for 'hinic_dcb_config_init' [-Wmissing-prototypes]
      62 | void hinic_dcb_config_init(struct hinic_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:95:6: warning: no previous prototype for 'hinic_init_ieee_settings' [-Wmissing-prototypes]
      95 | void hinic_init_ieee_settings(struct hinic_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:294,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/net/ethernet/huawei/hinic/hinic_dcb.c:18:
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_init_ieee_settings':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:103:33: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
     103 |         memset(ets, 0x0, sizeof(struct ieee_ets));
         |                                 ^~~~~~
   include/linux/fortify-string.h:514:42: note: in definition of macro '__fortify_memset_chk'
     514 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:103:9: note: in expansion of macro 'memset'
     103 |         memset(ets, 0x0, sizeof(struct ieee_ets));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:104:54: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
     104 |         memset(&nic_dev->hinic_ieee_ets, 0x0, sizeof(struct ieee_ets));
         |                                                      ^~~~~~
   include/linux/fortify-string.h:514:42: note: in definition of macro '__fortify_memset_chk'
     514 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:104:9: note: in expansion of macro 'memset'
     104 |         memset(&nic_dev->hinic_ieee_ets, 0x0, sizeof(struct ieee_ets));
         |         ^~~~~~
   include/linux/fortify-string.h:515:65: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     515 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                                 ^
   include/linux/fortify-string.h:524:25: note: in expansion of macro '__fortify_memset_chk'
     524 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:104:9: note: in expansion of macro 'memset'
     104 |         memset(&nic_dev->hinic_ieee_ets, 0x0, sizeof(struct ieee_ets));
         |         ^~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:105:12: error: invalid use of undefined type 'struct ieee_ets'
     105 |         ets->ets_cap = dcb_cfg->pg_tcs;
         |            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:108:20: error: invalid use of undefined type 'struct ieee_ets'
     108 |                 ets->tc_tsa[i] = tc_attr->prio_type ?
         |                    ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:110:20: error: invalid use of undefined type 'struct ieee_ets'
     110 |                 ets->tc_tx_bw[i] = nic_dev->dcb_cfg.bw_pct[HINIC_DCB_CFG_TX][i];
         |                    ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:111:20: error: invalid use of undefined type 'struct ieee_ets'
     111 |                 ets->tc_rx_bw[i] = nic_dev->dcb_cfg.bw_pct[HINIC_DCB_CFG_RX][i];
         |                    ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:112:20: error: invalid use of undefined type 'struct ieee_ets'
     112 |                 ets->prio_tc[i] = hinic_dcb_get_tc(dcb_cfg,
         |                    ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:115:54: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
     115 |         memcpy(&nic_dev->hinic_ieee_ets, ets, sizeof(struct ieee_ets));
         |                                                      ^~~~~~
   include/linux/fortify-string.h:636:48: note: in definition of macro '__fortify_memcpy_chk'
     636 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:115:9: note: in expansion of macro 'memcpy'
     115 |         memcpy(&nic_dev->hinic_ieee_ets, ets, sizeof(struct ieee_ets));
         |         ^~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:117:33: error: invalid application of 'sizeof' to incomplete type 'struct ieee_pfc'
     117 |         memset(pfc, 0x0, sizeof(struct ieee_pfc));
         |                                 ^~~~~~
   include/linux/fortify-string.h:514:42: note: in definition of macro '__fortify_memset_chk'
     514 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:117:9: note: in expansion of macro 'memset'
     117 |         memset(pfc, 0x0, sizeof(struct ieee_pfc));
         |         ^~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:118:12: error: invalid use of undefined type 'struct ieee_pfc'
     118 |         pfc->pfc_cap = dcb_cfg->pfc_tcs;
         |            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:121:28: error: invalid use of undefined type 'struct ieee_pfc'
     121 |                         pfc->pfc_en |= (u8)BIT(i);
         |                            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcb_init':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:29: error: 'DCB_CAP_DCBX_HOST' undeclared (first use in this function)
     244 |         nic_dev->dcbx_cap = DCB_CAP_DCBX_HOST | DCB_CAP_DCBX_VER_CEE;
         |                             ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:29: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:49: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function)
     244 |         nic_dev->dcbx_cap = DCB_CAP_DCBX_HOST | DCB_CAP_DCBX_VER_CEE;
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:258:6: warning: no previous prototype for 'hinic_set_prio_tc_map' [-Wmissing-prototypes]
     258 | void hinic_set_prio_tc_map(struct hinic_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_set_state':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:380:35: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function)
     380 |         if (!(nic_dev->dcbx_cap & DCB_CAP_DCBX_VER_CEE))
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_set_pg_tc_cfg_tx':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:475:21: error: 'DCB_ATTR_VALUE_UNDEFINED' undeclared (first use in this function)
     475 |         if (prio != DCB_ATTR_VALUE_UNDEFINED)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_set_pg_tc_cfg_rx':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:507:21: error: 'DCB_ATTR_VALUE_UNDEFINED' undeclared (first use in this function)
     507 |         if (prio != DCB_ATTR_VALUE_UNDEFINED)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_getcap':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:689:14: error: 'DCB_CAP_ATTR_PG' undeclared (first use in this function)
     689 |         case DCB_CAP_ATTR_PG:
         |              ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:692:14: error: 'DCB_CAP_ATTR_PFC' undeclared (first use in this function)
     692 |         case DCB_CAP_ATTR_PFC:
         |              ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:695:14: error: 'DCB_CAP_ATTR_UP2TC' undeclared (first use in this function)
     695 |         case DCB_CAP_ATTR_UP2TC:
         |              ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:698:14: error: 'DCB_CAP_ATTR_PG_TCS' undeclared (first use in this function)
     698 |         case DCB_CAP_ATTR_PG_TCS:
         |              ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:701:14: error: 'DCB_CAP_ATTR_PFC_TCS' undeclared (first use in this function)
     701 |         case DCB_CAP_ATTR_PFC_TCS:
         |              ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:704:14: error: 'DCB_CAP_ATTR_GSP' undeclared (first use in this function)
     704 |         case DCB_CAP_ATTR_GSP:
         |              ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:707:14: error: 'DCB_CAP_ATTR_BCN' undeclared (first use in this function)
     707 |         case DCB_CAP_ATTR_BCN:
         |              ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:710:14: error: 'DCB_CAP_ATTR_DCBX' undeclared (first use in this function)
     710 |         case DCB_CAP_ATTR_DCBX:
         |              ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function '__set_hw_ets':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1026:42: error: 'DCB_CAP_DCBX_VER_IEEE' undeclared (first use in this function)
    1026 |                 if ((nic_dev->dcbx_cap & DCB_CAP_DCBX_VER_IEEE)) {
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1027:44: error: invalid use of undefined type 'struct ieee_ets'
    1027 |                         up_tc[cos] = my_ets->prio_tc[i];
         |                                            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1028:46: error: invalid use of undefined type 'struct ieee_ets'
    1028 |                         up_pgid[cos] = my_ets->prio_tc[i];
         |                                              ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1031:40: error: invalid use of undefined type 'struct ieee_ets'
    1031 |                                 (my_ets->tc_tsa[cos] == IEEE8021Q_TSA_STRICT) ?
         |                                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1049:42: error: invalid use of undefined type 'struct ieee_ets'
    1049 |                         pg_bw[i] = my_ets->tc_tx_bw[i];
         |                                          ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_set_df_ieee_cfg':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1126:16: error: variable 'pfc' has initializer but incomplete type
    1126 |         struct ieee_pfc pfc = {0};
         |                ^~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1126:32: warning: excess elements in struct initializer
    1126 |         struct ieee_pfc pfc = {0};
         |                                ^
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1126:32: note: (near initialization for 'pfc')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1126:25: error: storage size of 'pfc' isn't known
    1126 |         struct ieee_pfc pfc = {0};
         |                         ^~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1131:35: error: 'DCB_CAP_DCBX_VER_IEEE' undeclared (first use in this function)
    1131 |         if (!(nic_dev->dcbx_cap & DCB_CAP_DCBX_VER_IEEE))
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1134:48: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
    1134 |         if (memcmp(my_ets, ets_default, sizeof(struct ieee_ets)))
         |                                                ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1137:19: error: invalid use of undefined type 'struct ieee_pfc'
    1137 |         if (my_pfc->pfc_en)
         |                   ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1149:52: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
    1149 |                 memcpy(my_ets, ets_default, sizeof(struct ieee_ets));
         |                                                    ^~~~~~
   include/linux/fortify-string.h:636:48: note: in definition of macro '__fortify_memcpy_chk'
     636 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1149:17: note: in expansion of macro 'memcpy'
    1149 |                 memcpy(my_ets, ets_default, sizeof(struct ieee_ets));
         |                 ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1153:23: error: invalid use of undefined type 'struct ieee_pfc'
    1153 |                 my_pfc->pfc_en = 0;
         |                       ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1126:25: warning: unused variable 'pfc' [-Wunused-variable]
    1126 |         struct ieee_pfc pfc = {0};
         |                         ^~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1201:4: warning: no previous prototype for 'hinic_dcbnl_set_all' [-Wmissing-prototypes]
    1201 | u8 hinic_dcbnl_set_all(struct net_device *netdev)
         |    ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_set_all':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1208:35: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function)
    1208 |         if (!(nic_dev->dcbx_cap & DCB_CAP_DCBX_VER_CEE))
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_ieee_get_ets':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1279:12: error: invalid use of undefined type 'struct ieee_ets'
    1279 |         ets->ets_cap = my_ets->ets_cap;
         |            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1279:30: error: invalid use of undefined type 'struct ieee_ets'
    1279 |         ets->ets_cap = my_ets->ets_cap;
         |                              ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:59: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                                                           ^~
   include/linux/fortify-string.h:636:48: note: in definition of macro '__fortify_memcpy_chk'
     636 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:9: note: in expansion of macro 'memcpy'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:19: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                   ^~
   include/linux/fortify-string.h:637:34: note: in definition of macro '__fortify_memcpy_chk'
     637 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:694:17: note: in expansion of macro '__struct_size'
     694 |                 __struct_size(p), __struct_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:9: note: in expansion of macro 'memcpy'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:37: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                                     ^~
   include/linux/fortify-string.h:638:34: note: in definition of macro '__fortify_memcpy_chk'
     638 |         const size_t __q_size = (q_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:694:35: note: in expansion of macro '__struct_size'
     694 |                 __struct_size(p), __struct_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:9: note: in expansion of macro 'memcpy'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:19: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                   ^~
   include/linux/fortify-string.h:639:40: note: in definition of macro '__fortify_memcpy_chk'
     639 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:695:17: note: in expansion of macro '__member_size'
     695 |                 __member_size(p), __member_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:9: note: in expansion of macro 'memcpy'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:37: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                                     ^~
   include/linux/fortify-string.h:640:40: note: in definition of macro '__fortify_memcpy_chk'
     640 |         const size_t __q_size_field = (q_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:695:35: note: in expansion of macro '__member_size'


vim +/hinic_ieee_ets_default +210 drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h

   153	
   154	struct hinic_nic_dev {
   155		struct pci_dev		*pdev;
   156		struct net_device	*netdev;
   157		void			*hwdev;
   158	
   159		int			poll_weight;
   160	
   161		unsigned long		*vlan_bitmap;
   162	
   163		u16			num_qps;
   164		u16			max_qps;
   165	
   166		u32			msg_enable;
   167		unsigned long		flags;
   168	
   169		u16			sq_depth;
   170		u16			rq_depth;
   171	
   172		/* mapping from priority */
   173		u8			sq_cos_mapping[HINIC_DCB_UP_MAX];
   174		u8			default_cos_id;
   175		struct hinic_txq	*txqs;
   176		struct hinic_rxq	*rxqs;
   177	
   178		struct nic_service_cap	nic_cap;
   179	
   180		struct irq_info		*qps_irq_info;
   181		struct hinic_irq	*irq_cfg;
   182		struct work_struct	rx_mode_work;
   183		struct delayed_work	moderation_task;
   184		struct workqueue_struct *workq;
   185	
   186		struct list_head	uc_filter_list;
   187		struct list_head	mc_filter_list;
   188		unsigned long		rx_mod_state;
   189		int			netdev_uc_cnt;
   190		int			netdev_mc_cnt;
   191		int			lb_test_rx_idx;
   192		int			lb_pkt_len;
   193		u8			*lb_test_rx_buf;
   194	
   195		u8			rss_tmpl_idx;
   196		u16			num_rss;
   197		u16			rss_limit;
   198		u8			rss_hash_engine;
   199		struct nic_rss_type	rss_type;
   200		u8			*rss_hkey_user;
   201		/* hkey in big endian */
   202		u32			*rss_hkey_user_be;
   203		u32			*rss_indir_user;
   204	
   205		u8			dcbx_cap;
   206		u32			dcb_changes;
   207		u8			max_cos;
   208		u8			up_valid_bitmap;
   209		u8			up_cos[HINIC_DCB_UP_MAX];
 > 210		struct ieee_ets		hinic_ieee_ets_default;
 > 211		struct ieee_ets		hinic_ieee_ets;
 > 212		struct ieee_pfc		hinic_ieee_pfc;
   213		struct hinic_dcb_config	dcb_cfg;
   214		struct hinic_dcb_config	tmp_dcb_cfg;
   215		struct hinic_dcb_config	save_dcb_cfg;
   216		unsigned long		dcb_flags;
   217		int			disable_port_cnt;
   218		/* lock for disable or enable traffic flow */
   219		struct semaphore	dcb_sem;
   220	
   221		bool			heart_status;
   222	
   223		struct hinic_intr_coal_info *intr_coalesce;
   224		unsigned long		last_moder_jiffies;
   225		u32			adaptive_rx_coal;
   226		u8			intr_coal_set_flag;
   227		u32			his_link_speed;
   228		/* interrupt coalesce must be different in virtual machine */
   229		bool			in_vm;
   230		bool			is_vm_slave;
   231		int			is_bm_slave;
   232		struct hinic_nic_stats	stats;
   233		/* lock for nic resource */
   234		struct mutex		nic_mutex;
   235		bool			force_port_disable;
   236		struct semaphore	port_state_sem;
   237		u8			link_status;
   238	
   239		struct hinic_environment_info env_info;
   240		struct hinic_adaptive_cfg adaptive_cfg;
   241	
   242		/* pangea cpu affinity setting */
   243		bool			force_affinity;
   244		cpumask_t		affinity_mask;
   245	
   246		u32			lro_replenish_thld;
   247		u16			rx_buff_len;
   248		u32			page_order;
   249	};
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
