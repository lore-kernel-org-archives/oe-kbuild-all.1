Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB41C1C84BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944240; cv=none; b=UTKGgGUzYRNDLiWeYgRIhrEzKW5v9JX+zGlaK+4MueS07CYDSJbCsUU4VyQ+3CSe1qPzI/V94n27rn9dEg0p2q/G7X8NHFaKkHGQ9+SHNn7RhaXoK3m5DcstRIm5PXogFWj1FkJQ6nwqWhnLA90YV+OnuEWtRXZ8foMDbnu43JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944240; c=relaxed/simple;
	bh=Zw/c6VmssJjplhSZY97FYGPAZgkdz26Tu0KNgE2JJbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbhfSTKN5lB4nq+IHaCco3VxzVpYp5KJYPV7xjTsugikWYHNBusd2xeF9ds5TbxVNbAoTtH1enEisfhNBsfB9VlfVqSvzFUCuDpic5X0zObLwOaAWoqWQtVirtVPxxOR028U+SkEenGDaGDU6MYesK7Lb4d5gmtG/ymX/42lvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNy4WIWh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNy4WIWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741944236; x=1773480236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zw/c6VmssJjplhSZY97FYGPAZgkdz26Tu0KNgE2JJbk=;
  b=kNy4WIWhUEm1lU1guplSvtCmqNMxEt8hCRjSp+wrdi4mPic/xxaMXQLc
   NUNrCGYRCaWpTtdA6YfDhbA2rkzp5pXGC7ZTBNC7t8KaZqH4anZB61azi
   fXJaEgVMZGNFC2LW/HHp8BvjzojBfwP5kZSYWErOfthFqq0dnAqXsAA4f
   1gvbKx+c1eMe7JU57hbqgnt+Ao19H278tiGeNwAPc4DI2YUavcFzY0mgW
   pKO/LXuE4S9Vzaxh1rXWfUX5UV4ywRitm1kTU9TvLCWOtn9AvfYDRXIzk
   2ymvFO2bCYO/y9Q/I9txhEtKY8gR5ANImkvMVbhVcjWoi6/3/3quPZzSM
   Q==;
X-CSE-ConnectionGUID: XOS68bF4TOi5S/tgzM8gxA==
X-CSE-MsgGUID: 6k6I7hI6Sxu3jCoZxc+TDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68456091"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="68456091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 02:23:55 -0700
X-CSE-ConnectionGUID: kYlwj7ufTBWPFgUPv3IyBA==
X-CSE-MsgGUID: 8JoNAUL0TwyQ+KR7N7Px4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="144400221"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2025 02:23:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt1Gh-000AIC-21;
	Fri, 14 Mar 2025 09:23:51 +0000
Date: Fri, 14 Mar 2025 17:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2033/2033]
 drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field
 'hinic_ieee_ets_default' has incomplete type
Message-ID: <202503141744.6L1UQKTr-lkp@intel.com>
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
head:   9176bda54ce98dbe711ae84180a3968e9d1e4889
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [2033/2033] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: x86_64-buildonly-randconfig-005-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141744.6L1UQKTr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141744.6L1UQKTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141744.6L1UQKTr-lkp@intel.com/

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
   In file included from drivers/net/ethernet/huawei/hinic/hinic_rx.c:39:
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:210:33: error: field 'hinic_ieee_ets_default' has incomplete type
     210 |         struct ieee_ets         hinic_ieee_ets_default;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:211:33: error: field 'hinic_ieee_ets' has incomplete type
     211 |         struct ieee_ets         hinic_ieee_ets;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dev.h:212:33: error: field 'hinic_ieee_pfc' has incomplete type
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
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:105:12: error: invalid use of undefined type 'struct ieee_ets'
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
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:689:14: error: 'DCB_CAP_ATTR_PG' undeclared (first use in this function)
     689 |         case DCB_CAP_ATTR_PG:
         |              ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:692:14: error: 'DCB_CAP_ATTR_PFC' undeclared (first use in this function)
     692 |         case DCB_CAP_ATTR_PFC:
         |              ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:695:14: error: 'DCB_CAP_ATTR_UP2TC' undeclared (first use in this function)
     695 |         case DCB_CAP_ATTR_UP2TC:
         |              ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:698:14: error: 'DCB_CAP_ATTR_PG_TCS' undeclared (first use in this function)
     698 |         case DCB_CAP_ATTR_PG_TCS:
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:701:14: error: 'DCB_CAP_ATTR_PFC_TCS' undeclared (first use in this function)
     701 |         case DCB_CAP_ATTR_PFC_TCS:
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:704:14: error: 'DCB_CAP_ATTR_GSP' undeclared (first use in this function)
     704 |         case DCB_CAP_ATTR_GSP:
         |              ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:707:14: error: 'DCB_CAP_ATTR_BCN' undeclared (first use in this function)
     707 |         case DCB_CAP_ATTR_BCN:
         |              ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:710:14: error: 'DCB_CAP_ATTR_DCBX' undeclared (first use in this function)
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
     695 |                 __member_size(p), __member_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:9: note: in expansion of macro 'memcpy'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1280:19: error: invalid use of undefined type 'struct ieee_ets'
    1280 |         memcpy(ets->tc_tx_bw, my_ets->tc_tx_bw, sizeof(ets->tc_tx_bw));
--
         |                                   ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:9: note: in expansion of macro 'memcpy'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:22: error: invalid use of undefined type 'struct ieee_ets'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |                      ^~
   include/linux/fortify-string.h:639:40: note: in definition of macro '__fortify_memcpy_chk'
     639 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:695:17: note: in expansion of macro '__member_size'
     695 |                 __member_size(p), __member_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:9: note: in expansion of macro 'memcpy'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:35: error: invalid use of undefined type 'struct ieee_ets'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |                                   ^~
   include/linux/fortify-string.h:640:40: note: in definition of macro '__fortify_memcpy_chk'
     640 |         const size_t __q_size_field = (q_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:695:35: note: in expansion of macro '__member_size'
     695 |                 __member_size(p), __member_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:9: note: in expansion of macro 'memcpy'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:22: error: invalid use of undefined type 'struct ieee_ets'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |                      ^~
   include/linux/fortify-string.h:648:27: note: in definition of macro '__fortify_memcpy_chk'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |                           ^
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:9: note: in expansion of macro 'memcpy'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:35: error: invalid use of undefined type 'struct ieee_ets'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |                                   ^~
   include/linux/fortify-string.h:648:30: note: in definition of macro '__fortify_memcpy_chk'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |                              ^
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1328:9: note: in expansion of macro 'memcpy'
    1328 |         memcpy(my_ets->tc_tsa, ets->tc_tsa, sizeof(ets->tc_tsa));
         |         ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1336:58: error: invalid application of 'sizeof' to incomplete type 'struct ieee_ets'
    1336 |                         memcpy(my_ets, &back_ets, sizeof(struct ieee_ets));
         |                                                          ^~~~~~
   include/linux/fortify-string.h:636:48: note: in definition of macro '__fortify_memcpy_chk'
     636 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1336:25: note: in expansion of macro 'memcpy'
    1336 |                         memcpy(my_ets, &back_ets, sizeof(struct ieee_ets));
         |                         ^~~~~~
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
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1435:14: error: 'DCB_NUMTCS_ATTR_PFC' undeclared (first use in this function)
    1435 |         case DCB_NUMTCS_ATTR_PFC:
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: In function 'hinic_dcbnl_setdcbx':
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1476:22: error: 'DCB_CAP_DCBX_VER_IEEE' undeclared (first use in this function)
    1476 |         if (((mode & DCB_CAP_DCBX_VER_IEEE) && (mode & DCB_CAP_DCBX_VER_CEE)) ||
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1476:56: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function)
    1476 |         if (((mode & DCB_CAP_DCBX_VER_IEEE) && (mode & DCB_CAP_DCBX_VER_CEE)) ||
         |                                                        ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1477:22: error: 'DCB_CAP_DCBX_LLD_MANAGED' undeclared (first use in this function)
    1477 |             ((mode & DCB_CAP_DCBX_LLD_MANAGED) &&
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1478:23: error: 'DCB_CAP_DCBX_HOST' undeclared (first use in this function)
    1478 |             (!(mode & DCB_CAP_DCBX_HOST)))) {
         |                       ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c: At top level:
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1519:14: error: variable 'hinic_dcbnl_ops' has initializer but incomplete type
    1519 | const struct dcbnl_rtnl_ops hinic_dcbnl_ops = {
         |              ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1521:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_getets'
    1521 |         .ieee_getets    = hinic_dcbnl_ieee_get_ets,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1521:27: warning: excess elements in struct initializer
    1521 |         .ieee_getets    = hinic_dcbnl_ieee_get_ets,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1521:27: note: (near initialization for 'hinic_dcbnl_ops')
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1522:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_setets'
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
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1524:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'ieee_setpfc'
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
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1528:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setstate'
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
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1530:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpgtccfgtx'
    1530 |         .setpgtccfgtx   = hinic_dcbnl_set_pg_tc_cfg_tx,
         |          ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1530:27: warning: excess elements in struct initializer
    1530 |         .setpgtccfgtx   = hinic_dcbnl_set_pg_tc_cfg_tx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1530:27: note: (near initialization for 'hinic_dcbnl_ops')
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1531:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpgbwgcfgtx'
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
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1536:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpgtccfgrx'
    1536 |         .getpgtccfgrx   = hinic_dcbnl_get_pg_tc_cfg_rx,
         |          ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1536:27: warning: excess elements in struct initializer
    1536 |         .getpgtccfgrx   = hinic_dcbnl_get_pg_tc_cfg_rx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1536:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1537:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpgbwgcfgrx'
    1537 |         .getpgbwgcfgrx  = hinic_dcbnl_get_pg_bwg_cfg_rx,
         |          ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1537:27: warning: excess elements in struct initializer
    1537 |         .getpgbwgcfgrx  = hinic_dcbnl_get_pg_bwg_cfg_rx,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1537:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1538:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpfccfg'
    1538 |         .setpfccfg      = hinic_dcbnl_set_pfc_cfg,
         |          ^~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1538:27: warning: excess elements in struct initializer
    1538 |         .setpfccfg      = hinic_dcbnl_set_pfc_cfg,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1538:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1539:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpfccfg'
    1539 |         .getpfccfg      = hinic_dcbnl_get_pfc_cfg,
         |          ^~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1539:27: warning: excess elements in struct initializer
    1539 |         .getpfccfg      = hinic_dcbnl_get_pfc_cfg,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1539:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1540:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setall'
    1540 |         .setall         = hinic_dcbnl_set_all,
         |          ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1540:27: warning: excess elements in struct initializer
    1540 |         .setall         = hinic_dcbnl_set_all,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1540:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1541:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getcap'
    1541 |         .getcap         = hinic_dcbnl_getcap,
         |          ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1541:27: warning: excess elements in struct initializer
    1541 |         .getcap         = hinic_dcbnl_getcap,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1541:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1542:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getnumtcs'
    1542 |         .getnumtcs      = hinic_dcbnl_getnumtcs,
         |          ^~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1542:27: warning: excess elements in struct initializer
    1542 |         .getnumtcs      = hinic_dcbnl_getnumtcs,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1542:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1543:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setnumtcs'
    1543 |         .setnumtcs      = hinic_dcbnl_setnumtcs,
         |          ^~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1543:27: warning: excess elements in struct initializer
    1543 |         .setnumtcs      = hinic_dcbnl_setnumtcs,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1543:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1544:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'getpfcstate'
    1544 |         .getpfcstate    = hinic_dcbnl_getpfcstate,
         |          ^~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1544:27: warning: excess elements in struct initializer
    1544 |         .getpfcstate    = hinic_dcbnl_getpfcstate,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1544:27: note: (near initialization for 'hinic_dcbnl_ops')
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1545:10: error: 'const struct dcbnl_rtnl_ops' has no member named 'setpfcstate'
    1545 |         .setpfcstate    = hinic_dcbnl_setpfcstate,
         |          ^~~~~~~~~~~
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
