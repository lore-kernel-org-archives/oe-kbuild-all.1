Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B8117580
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 01:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732239332; cv=none; b=rguEAZOBZOCr3EZhKv58dBuX6xc5DvhRbrUF9TyJhd8S66Vh2thKHhmzsm9+RUBusD28o4hPGxY/Ky+hZxf+SLn+zf5wvD54Q3BDFUnbP9S7gkpd60mDKRZhJDgu5eN0mv1HgUN90/qCYt84J/q7PEwxxWyy1NPyjRcFz0o+EQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732239332; c=relaxed/simple;
	bh=ueausemDAQIjxPjxmHG5yiCi0sQWwVWSjDbAnwvPhQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQNm4gmFKTGnKQ5EWR48t1UJ9dB4497dqxJ1Fnr4YNJudQmcUoZIpPmnkjO0SVIr/PLuOIm6UP8wgbFyRjUFdZri5xFPFYtcTLlqXIoMjgQEcHz7i2SGrgbsnoe8hvFo3ugkVM6uv/LOAKHsp54gMAWFh8s82L5iuq7ILwE+5m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmKx8Dsw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmKx8Dsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732239330; x=1763775330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ueausemDAQIjxPjxmHG5yiCi0sQWwVWSjDbAnwvPhQ4=;
  b=MmKx8DswBQODYhvzic2sg83qZ3vDJksiRRDKnKqe8UqfNyfMCziAdT2t
   gL0diRdTL2YB/pfgxItMn5cESlbMUrh72mB3ODTqvr9kbIgi6HmM8uY1m
   b+IeSR3CD98oyASPblA7nVXnVZJ0ZMSxXmaLqP1ySYobufgYWriD5qF8W
   6bYuPks5+NhYkdUKAYZ69OQwDVknvorerAVQfezdspwPfqW+//w4Ar/wk
   CM7sIqCLDXmFhMnUAASuWRIzsecXWT6NSckG2J0jZisD/VTLBMQk937t7
   t+7fcAhR8TPEN8KzBD6hFmms+oorFG8kaycfjIL+L6/xtue9GoMhl/zY/
   w==;
X-CSE-ConnectionGUID: J1DCiI8xSxShxhicoasu8A==
X-CSE-MsgGUID: I3Dy2qrGQ+6DCmOI+Ut83w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42896728"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="42896728"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 17:35:28 -0800
X-CSE-ConnectionGUID: Fb25tUcpRNu0h5cmvyEPSA==
X-CSE-MsgGUID: c2i2ABvoQRGbfV2X2nJzBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="95231572"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2024 17:35:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEIZv-0003YT-2C;
	Fri, 22 Nov 2024 01:35:23 +0000
Date: Fri, 22 Nov 2024 09:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1513/1513]
 drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field
 'hinic_ieee_ets_default' has incomplete type
Message-ID: <202411221143.jAhVHv3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab293c3a32ba6594fd24cd7ecd4a4a00ede0cd65
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [1513/1513] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: arm64-randconfig-004-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221143.jAhVHv3i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221143.jAhVHv3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221143.jAhVHv3i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic/hinic_tx.c:39:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:913:5: warning: no previous prototype for 'hinic_setup_tx_wqe' [-Wmissing-prototypes]
     913 | int hinic_setup_tx_wqe(struct hinic_txq *txq)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:1100:5: warning: no previous prototype for 'hinic_stop_sq' [-Wmissing-prototypes]
    1100 | int hinic_stop_sq(struct hinic_txq *txq)
         |     ^~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_sriov.c:25:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_nictool.c:28:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
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
   In file included from drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:34:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
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
   In file included from drivers/net/ethernet/huawei/hinic/hinic_dcb.c:32:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
     212 |         struct ieee_pfc         hinic_ieee_pfc;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:62:6: warning: no previous prototype for 'hinic_dcb_config_init' [-Wmissing-prototypes]
      62 | void hinic_dcb_config_init(struct hinic_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:95:6: warning: no previous prototype for 'hinic_init_ieee_settings' [-Wmissing-prototypes]
      95 | void hinic_init_ieee_settings(struct hinic_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_init_ieee_settings':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:103:33: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
     103 |         memset(ets, 0x0, sizeof(struct ieee_ets));
         |                                 ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:104:54: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
     104 |         memset(&nic_dev->hinic_ieee_ets, 0x0, sizeof(struct ieee_ets));
         |                                                      ^~~~~~
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
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:117:33: error: invalid application of 'sizeof' to incomplete type 'struct ieee_pfc'
     117 |         memset(pfc, 0x0, sizeof(struct ieee_pfc));
         |                                 ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:118:12: error: invalid use of undefined type 'struct ieee_pfc'
     118 |         pfc->pfc_cap = dcb_cfg->pfc_tcs;
         |            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:121:28: error: invalid use of undefined type 'struct ieee_pfc'
     121 |                         pfc->pfc_en |= (u8)BIT(i);
         |                            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcb_init':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:29: error: 'DCB_CAP_DCBX_HOST' undeclared (first use in this function)
     244 |         nic_dev->dcbx_cap = DCB_CAP_DCBX_HOST | DCB_CAP_DCBX_VER_CEE;
         |                             ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:29: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:244:49: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function)
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
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1126:25: error: storage size of 'pfc' isn't known
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
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:19: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                   ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:37: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                                     ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:59: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                                                           ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1281:19: error: invalid use of undefined type 'struct ieee_ets'
    1281 |         memcpy(ets->tc_rx_bw, my_ets->tc_rx_bw, sizeof(ets->tc_rx_bw));
         |                   ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1281:37: error: invalid use of undefined type 'struct ieee_ets'
    1281 |         memcpy(ets->tc_rx_bw, my_ets->tc_rx_bw, sizeof(ets->tc_rx_bw));
         |                                     ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1281:59: error: invalid use of undefined type 'struct ieee_ets'
    1281 |         memcpy(ets->tc_rx_bw, my_ets->tc_rx_bw, sizeof(ets->tc_rx_bw));
         |                                                           ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1282:19: error: invalid use of undefined type 'struct ieee_ets'
    1282 |         memcpy(ets->prio_tc, my_ets->prio_tc, sizeof(ets->prio_tc));
         |                   ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1282:36: error: invalid use of undefined type 'struct ieee_ets'
    1282 |         memcpy(ets->prio_tc, my_ets->prio_tc, sizeof(ets->prio_tc));
         |                                    ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1282:57: error: invalid use of undefined type 'struct ieee_ets'
    1282 |         memcpy(ets->prio_tc, my_ets->prio_tc, sizeof(ets->prio_tc));
         |                                                         ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1283:19: error: invalid use of undefined type 'struct ieee_ets'
    1283 |         memcpy(ets->tc_tsa, my_ets->tc_tsa, sizeof(ets->tc_tsa));
         |                   ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1283:35: error: invalid use of undefined type 'struct ieee_ets'
    1283 |         memcpy(ets->tc_tsa, my_ets->tc_tsa, sizeof(ets->tc_tsa));
         |                                   ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1283:55: error: invalid use of undefined type 'struct ieee_ets'
    1283 |         memcpy(ets->tc_tsa, my_ets->tc_tsa, sizeof(ets->tc_tsa));
         |                                                       ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_ieee_set_ets':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1294:25: error: storage size of 'back_ets' isn't known
    1294 |         struct ieee_ets back_ets;
         |                         ^~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1299:35: error: 'DCB_CAP_DCBX_VER_IEEE' undeclared (first use in this function)
    1299 |         if (!(nic_dev->dcbx_cap & DCB_CAP_DCBX_VER_IEEE))
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1302:24: error: invalid use of undefined type 'struct ieee_ets'
    1302 |         if (!memcmp(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw)) &&
         |                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1302:42: error: invalid use of undefined type 'struct ieee_ets'
    1302 |         if (!memcmp(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw)) &&
         |                                          ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1302:64: error: invalid use of undefined type 'struct ieee_ets'
    1302 |         if (!memcmp(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw)) &&
         |                                                                ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1303:24: error: invalid use of undefined type 'struct ieee_ets'
    1303 |             !memcmp(ets->tc_rx_bw, my_ets->tc_rx_bw, sizeof(ets->tc_rx_bw)) &&
         |                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1303:42: error: invalid use of undefined type 'struct ieee_ets'
    1303 |             !memcmp(ets->tc_rx_bw, my_ets->tc_rx_bw, sizeof(ets->tc_rx_bw)) &&
         |                                          ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1303:64: error: invalid use of undefined type 'struct ieee_ets'
    1303 |             !memcmp(ets->tc_rx_bw, my_ets->tc_rx_bw, sizeof(ets->tc_rx_bw)) &&
         |                                                                ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1304:24: error: invalid use of undefined type 'struct ieee_ets'
    1304 |             !memcmp(ets->prio_tc, my_ets->prio_tc, sizeof(ets->prio_tc)) &&
         |                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1304:41: error: invalid use of undefined type 'struct ieee_ets'
    1304 |             !memcmp(ets->prio_tc, my_ets->prio_tc, sizeof(ets->prio_tc)) &&
         |                                         ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1304:62: error: invalid use of undefined type 'struct ieee_ets'
    1304 |             !memcmp(ets->prio_tc, my_ets->prio_tc, sizeof(ets->prio_tc)) &&
         |                                                              ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1305:24: error: invalid use of undefined type 'struct ieee_ets'
    1305 |             !memcmp(ets->tc_tsa, my_ets->tc_tsa, sizeof(ets->tc_tsa)))
         |                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1305:40: error: invalid use of undefined type 'struct ieee_ets'
    1305 |             !memcmp(ets->tc_tsa, my_ets->tc_tsa, sizeof(ets->tc_tsa)))
         |                                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1305:60: error: invalid use of undefined type 'struct ieee_ets'
    1305 |             !memcmp(ets->tc_tsa, my_ets->tc_tsa, sizeof(ets->tc_tsa)))
         |                                                            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1309:32: error: invalid use of undefined type 'struct ieee_ets'
    1309 |                 total_bw += ets->tc_tx_bw[i];
         |                                ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1314:24: error: invalid use of undefined type 'struct ieee_ets'
    1314 |                 if (ets->prio_tc[i] > max_tc)
         |                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1315:37: error: invalid use of undefined type 'struct ieee_ets'
    1315 |                         max_tc = ets->prio_tc[i];
         |                                     ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1324:42: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
    1324 |         memcpy(&back_ets, my_ets, sizeof(struct ieee_ets));
         |                                          ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1325:22: error: invalid use of undefined type 'struct ieee_ets'
    1325 |         memcpy(my_ets->tc_tx_bw, ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                      ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1325:37: error: invalid use of undefined type 'struct ieee_ets'
    1325 |         memcpy(my_ets->tc_tx_bw, ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                                     ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1325:59: error: invalid use of undefined type 'struct ieee_ets'
    1325 |         memcpy(my_ets->tc_tx_bw, ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |                                                           ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1326:22: error: invalid use of undefined type 'struct ieee_ets'
    1326 |         memcpy(my_ets->tc_rx_bw, ets->tc_rx_bw, sizeof(ets->tc_rx_bw));
         |                      ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1326:37: error: invalid use of undefined type 'struct ieee_ets'
    1326 |         memcpy(my_ets->tc_rx_bw, ets->tc_rx_bw, sizeof(ets->tc_rx_bw));
         |                                     ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1326:59: error: invalid use of undefined type 'struct ieee_ets'
    1326 |         memcpy(my_ets->tc_rx_bw, ets->tc_rx_bw, sizeof(ets->tc_rx_bw));
         |                                                           ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1327:22: error: invalid use of undefined type 'struct ieee_ets'
    1327 |         memcpy(my_ets->prio_tc, ets->prio_tc, sizeof(ets->prio_tc));
         |                      ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1327:36: error: invalid use of undefined type 'struct ieee_ets'
    1327 |         memcpy(my_ets->prio_tc, ets->prio_tc, sizeof(ets->prio_tc));
         |                                    ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1327:57: error: invalid use of undefined type 'struct ieee_ets'
    1327 |         memcpy(my_ets->prio_tc, ets->prio_tc, sizeof(ets->prio_tc));
         |                                                         ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:22: error: invalid use of undefined type 'struct ieee_ets'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |                      ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:35: error: invalid use of undefined type 'struct ieee_ets'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |                                   ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:55: error: invalid use of undefined type 'struct ieee_ets'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |                                                       ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1336:58: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
    1336 |                         memcpy(my_ets, &back_ets, sizeof(struct ieee_ets));
         |                                                          ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1294:25: warning: unused variable 'back_ets' [-Wunused-variable]
    1294 |         struct ieee_ets back_ets;
         |                         ^~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_ieee_get_pfc':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1360:12: error: invalid use of undefined type 'struct ieee_pfc'
    1360 |         pfc->pfc_en = my_pfc->pfc_en;
         |            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1360:29: error: invalid use of undefined type 'struct ieee_pfc'
    1360 |         pfc->pfc_en = my_pfc->pfc_en;
         |                             ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1361:12: error: invalid use of undefined type 'struct ieee_pfc'
    1361 |         pfc->pfc_cap = my_pfc->pfc_cap;
         |            ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1361:30: error: invalid use of undefined type 'struct ieee_pfc'
    1361 |         pfc->pfc_cap = my_pfc->pfc_cap;
         |                              ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_ieee_set_pfc':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1378:35: error: 'DCB_CAP_DCBX_VER_IEEE' undeclared (first use in this function)
    1378 |         if (!(nic_dev->dcbx_cap & DCB_CAP_DCBX_VER_IEEE))
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1381:19: error: invalid use of undefined type 'struct ieee_pfc'
    1381 |         if (my_pfc->pfc_en == pfc->pfc_en)
         |                   ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1381:34: error: invalid use of undefined type 'struct ieee_pfc'
    1381 |         if (my_pfc->pfc_en == pfc->pfc_en)
         |                                  ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1384:22: error: invalid use of undefined type 'struct ieee_pfc'
    1384 |         pfc_map = pfc->pfc_en & nic_dev->up_valid_bitmap;
         |                      ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1385:30: error: invalid use of undefined type 'struct ieee_pfc'
    1385 |         outof_range_pfc = pfc->pfc_en & (~nic_dev->up_valid_bitmap);
         |                              ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1400:27: error: invalid use of undefined type 'struct ieee_ets'
    1400 |                 if (my_ets->prio_tc[i] > max_tc)
         |                           ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1401:40: error: invalid use of undefined type 'struct ieee_ets'
    1401 |                         max_tc = my_ets->prio_tc[i];
         |                                        ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1415:15: error: invalid use of undefined type 'struct ieee_pfc'
    1415 |         my_pfc->pfc_en = pfc->pfc_en;
         |               ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1415:29: error: invalid use of undefined type 'struct ieee_pfc'
    1415 |         my_pfc->pfc_en = pfc->pfc_en;
         |                             ^~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_getnumtcs':
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1432:14: error: 'DCB_NUMTCS_ATTR_PG' undeclared (first use in this function)
    1432 |         case DCB_NUMTCS_ATTR_PG:
         |              ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1435:14: error: 'DCB_NUMTCS_ATTR_PFC' undeclared (first use in this function)
    1435 |         case DCB_NUMTCS_ATTR_PFC:
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_setdcbx':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1476:22: error: 'DCB_CAP_DCBX_VER_IEEE' undeclared (first use in this function)
    1476 |         if (((mode & DCB_CAP_DCBX_VER_IEEE) && (mode & DCB_CAP_DCBX_VER_CEE)) ||
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1476:56: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function)
    1476 |         if (((mode & DCB_CAP_DCBX_VER_IEEE) && (mode & DCB_CAP_DCBX_VER_CEE)) ||
         |                                                        ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1477:22: error: 'DCB_CAP_DCBX_LLD_MANAGED' undeclared (first use in this function)
    1477 |             ((mode & DCB_CAP_DCBX_LLD_MANAGED) &&
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1478:23: error: 'DCB_CAP_DCBX_HOST' undeclared (first use in this function)
    1478 |             (!(mode & DCB_CAP_DCBX_HOST)))) {
         |                       ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1519:14: error: variable 'hinic_dcbnl_ops' has initializer but incomplete type
    1519 | const struct dcbnl_rtnl_ops hinic_dcbnl_ops = {
         |              ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1521:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_getets'
    1521 |         .ieee_getets    = hinic_dcbnl_ieee_get_ets,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1521:27: warning: excess elements in struct initializer
    1521 |         .ieee_getets    = hinic_dcbnl_ieee_get_ets,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1521:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1522:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_setets'
    1522 |         .ieee_setets    = hinic_dcbnl_ieee_set_ets,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1522:27: warning: excess elements in struct initializer
    1522 |         .ieee_setets    = hinic_dcbnl_ieee_set_ets,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1522:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1523:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_getpfc'
    1523 |         .ieee_getpfc    = hinic_dcbnl_ieee_get_pfc,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1523:27: warning: excess elements in struct initializer
    1523 |         .ieee_getpfc    = hinic_dcbnl_ieee_get_pfc,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1523:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1524:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_setpfc'
    1524 |         .ieee_setpfc    = hinic_dcbnl_ieee_set_pfc,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1524:27: warning: excess elements in struct initializer
    1524 |         .ieee_setpfc    = hinic_dcbnl_ieee_set_pfc,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1524:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1527:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getstate'
    1527 |         .getstate       = hinic_dcbnl_get_state,
         |          ^~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1527:27: warning: excess elements in struct initializer
    1527 |         .getstate       = hinic_dcbnl_get_state,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1527:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1528:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setstate'
    1528 |         .setstate       = hinic_dcbnl_set_state,
         |          ^~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1528:27: warning: excess elements in struct initializer
    1528 |         .setstate       = hinic_dcbnl_set_state,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1528:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1529:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpermhwaddr'
    1529 |         .getpermhwaddr  = hinic_dcbnl_get_perm_hw_addr,
         |          ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1529:27: warning: excess elements in struct initializer
    1529 |         .getpermhwaddr  = hinic_dcbnl_get_perm_hw_addr,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1529:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1530:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpgtccfgtx'
    1530 |         .setpgtccfgtx   = hinic_dcbnl_set_pg_tc_cfg_tx,
         |          ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1530:27: warning: excess elements in struct initializer
    1530 |         .setpgtccfgtx   = hinic_dcbnl_set_pg_tc_cfg_tx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1530:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1531:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpgbwgcfgtx'
    1531 |         .setpgbwgcfgtx  = hinic_dcbnl_set_pg_bwg_cfg_tx,
         |          ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1531:27: warning: excess elements in struct initializer
    1531 |         .setpgbwgcfgtx  = hinic_dcbnl_set_pg_bwg_cfg_tx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1531:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1532:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpgtccfgrx'
    1532 |         .setpgtccfgrx   = hinic_dcbnl_set_pg_tc_cfg_rx,
         |          ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1532:27: warning: excess elements in struct initializer
    1532 |         .setpgtccfgrx   = hinic_dcbnl_set_pg_tc_cfg_rx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1532:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1533:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpgbwgcfgrx'
    1533 |         .setpgbwgcfgrx  = hinic_dcbnl_set_pg_bwg_cfg_rx,
         |          ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1533:27: warning: excess elements in struct initializer
    1533 |         .setpgbwgcfgrx  = hinic_dcbnl_set_pg_bwg_cfg_rx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1533:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1534:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpgtccfgtx'
    1534 |         .getpgtccfgtx   = hinic_dcbnl_get_pg_tc_cfg_tx,
         |          ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1534:27: warning: excess elements in struct initializer
    1534 |         .getpgtccfgtx   = hinic_dcbnl_get_pg_tc_cfg_tx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1534:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1535:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpgbwgcfgtx'
    1535 |         .getpgbwgcfgtx  = hinic_dcbnl_get_pg_bwg_cfg_tx,
         |          ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1535:27: warning: excess elements in struct initializer
    1535 |         .getpgbwgcfgtx  = hinic_dcbnl_get_pg_bwg_cfg_tx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1535:27: note: (near initialization for 'hinic_dcbnl_ops')
..


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
   212		struct ieee_pfc		hinic_ieee_pfc;
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
