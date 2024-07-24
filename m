Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37827613D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 19:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848959; cv=none; b=fQPwZ0t5qWA5rA6dCBMPMjS/keGNZa9s+vU3JdoM5457sz4lWyIWeE/7FHvyzBITofio2cPknHCtPGdrujfdkIQeD3/gJ2YnJwwFg4G1z9Bf0UmaiR33IHFnHAo+5F54KbrQBMoTHKXLpMkC5uE/RMInD3+kjJVk48LAd7nOq6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848959; c=relaxed/simple;
	bh=peuCAEw59R3godc1E3ACkT1Wr1YSXPO4XrxKMtmuW8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RH4DB0DVFbP5CjjWNRRmNlkjBnF2Vl6yRSvcvdqXyG+bJQKBLsip6RaTFgdzOTihNTw8wxU+9MEEAN9S1CRUdWAFegmNPI6pVYsu5kzQ+GW7BoTWyVnhzf2wdSYYkO4m52fPpaVpumOJAcNk5RV3nwapytV0zQ1cwiGT7aPchO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqRL3gsy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqRL3gsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721848957; x=1753384957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=peuCAEw59R3godc1E3ACkT1Wr1YSXPO4XrxKMtmuW8k=;
  b=bqRL3gsy7WZiq/HP5OHgwX1uC0al6VBj48XsosZnn5rlL2nJLsxZRFnT
   BpWKkkjAN3EelHX3IEJPXqUysyxknpHnMp6DOqM61id9FRMPHR2hIO2lw
   +s+UUCJ5yKHO/ciopFF789761UgE/0xDkFKomcqkYyahh6NfUzlQM+v1h
   Tx02CLWZnwbjnBL3HhnBlHhlqiPA9cQjLdQq6pP9Cz8tfHcuyJv2KpQW2
   tUrw/ABUW3JgKW5Kf7Cw9KbBo7sqX41/WAbaUh9pKfzYH48crBIbzBoAw
   wgo67+TNOUmtHPh+1Cwhe6TrNbpq8tpZEdX1CTjpQOjDE/a6XjhLNLX/i
   A==;
X-CSE-ConnectionGUID: cK41i2SqS9OIlUzLKaZD7g==
X-CSE-MsgGUID: zRyCIfF4ROKpRRWqg3ynvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19360252"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="19360252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 12:22:36 -0700
X-CSE-ConnectionGUID: aJVrWKvYSlGU2HNT/7/Wtw==
X-CSE-MsgGUID: yAA2si9lQaSmr8d2lSKSnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="53455054"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Jul 2024 12:22:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWhZI-000nMu-2U;
	Wed, 24 Jul 2024 19:22:32 +0000
Date: Thu, 25 Jul 2024 03:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18554/23360]
 drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:82:14: error:
 'NGBE_LINK_SPEED_10GB_FULL' undeclared; did you mean
 'NGBE_LINK_SPEED_1GB_FULL'?
Message-ID: <202407250304.iuUXdu7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0a1bad10c9f0f69fbd09f08348ff59f98231875a
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [18554/23360] net: ngbe: Add Netswift Giga NIC driver
config: arm64-randconfig-003-20240725 (https://download.01.org/0day-ci/archive/20240725/202407250304.iuUXdu7B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250304.iuUXdu7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250304.iuUXdu7B-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/netswift/ngbe/ngbe.h:28,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:19:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c: In function 'ngbe_portspeed':
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:82:14: error: 'NGBE_LINK_SPEED_10GB_FULL' undeclared (first use in this function); did you mean 'NGBE_LINK_SPEED_1GB_FULL'?
      82 |         case NGBE_LINK_SPEED_10GB_FULL:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              NGBE_LINK_SPEED_1GB_FULL
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:82:14: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c: In function 'ngbe_rxupacks':
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:165:55: error: 'NGBE_TPR' undeclared (first use in this function); did you mean 'NGBE_ERR'?
     165 |         return snprintf(page, count, "%d\n", rd32(hw, NGBE_TPR));
         |                                                       ^~~~~~~~
         |                                                       NGBE_ERR
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c: In function 'ngbe_linkstat':
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:364:13: warning: unused variable 'link_speed' [-Wunused-variable]
     364 |         u32 link_speed;
         |             ^~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c: At top level:
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:770:6: warning: no previous prototype for 'ngbe_del_proc_entries' [-Wmissing-prototypes]
     770 | void ngbe_del_proc_entries(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c: In function 'ngbe_del_proc_entries':
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:779:25: error: 'NGBE_MAX_SENSORS' undeclared (first use in this function); did you mean 'NGBE_MAX_EITR'?
     779 |         for (i = 0; i < NGBE_MAX_SENSORS; i++) {
         |                         ^~~~~~~~~~~~~~~~
         |                         NGBE_MAX_EITR
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:780:39: error: invalid use of undefined type 'struct proc_dir_entry'
     780 |                 if (adapter->therm_dir[i] == NULL)
         |                                       ^
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:780:21: error: invalid use of undefined type 'struct proc_dir_entry'
     780 |                 if (adapter->therm_dir[i] == NULL)
         |                     ^~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c: In function 'ngbe_procfs_init':
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:859:23: error: implicit declaration of function 'create_proc_read_entry' [-Werror=implicit-function-declaration]
     859 |                 if (!(create_proc_read_entry(ngbe_proc_entries[index].name,
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe.h:39:
>> drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2761:40: error: 'struct ngbe_hw' has no member named 'ops'
    2761 | #define TCALL(hw, func, args...) (((hw)->func != NULL) \
         |                                        ^~
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:869:14: note: in expansion of macro 'TCALL'
     869 |         if (!TCALL(&(adapter->hw), ops.init_thermal_sensor_thresh))
         |              ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_type.h:2762:23: error: 'struct ngbe_hw' has no member named 'ops'
    2762 |                 ? (hw)->func((hw), ##args) : NGBE_NOT_IMPLEMENTED)
         |                       ^~
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:869:14: note: in expansion of macro 'TCALL'
     869 |         if (!TCALL(&(adapter->hw), ops.init_thermal_sensor_thresh))
         |              ^~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:833:13: warning: unused variable 'i' [-Wunused-variable]
     833 |         int i;
         |             ^
   drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c: In function 'ngbe_rxupacks':
>> drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c:166:1: warning: control reaches end of non-void function [-Wreturn-type]
     166 | }
         | ^
   cc1: some warnings being treated as errors


vim +82 drivers/net/ethernet/netswift/ngbe/ngbe_procfs.c

    64	
    65	static int ngbe_portspeed(char *page, char __always_unused **start,
    66				   off_t __always_unused off, int count,
    67				   int __always_unused *eof, void *data)
    68	{
    69		struct ngbe_adapter *adapter = (struct ngbe_adapter *)data;
    70		int speed = 0;
    71	
    72		if (adapter == NULL)
    73			return snprintf(page, count, "error: no adapter\n");
    74	
    75		switch (adapter->link_speed) {
    76		case NGBE_LINK_SPEED_100_FULL:
    77			speed = 1;
    78			break;
    79		case NGBE_LINK_SPEED_1GB_FULL:
    80			speed = 10;
    81			break;
  > 82		case NGBE_LINK_SPEED_10GB_FULL:
    83			speed = 100;
    84			break;
    85		default:
    86			break;
    87		}
    88		return snprintf(page, count, "%d\n", speed);
    89	}
    90	
    91	static int ngbe_wqlflag(char *page, char __always_unused **start,
    92				 off_t __always_unused off, int count,
    93				 int __always_unused *eof, void *data)
    94	{
    95		struct ngbe_adapter *adapter = (struct ngbe_adapter *)data;
    96		if (adapter == NULL)
    97			return snprintf(page, count, "error: no adapter\n");
    98	
    99		return snprintf(page, count, "%d\n", adapter->wol);
   100	}
   101	
   102	static int ngbe_xflowctl(char *page, char __always_unused **start,
   103				  off_t __always_unused off, int count,
   104				  int __always_unused *eof, void *data)
   105	{
   106		struct ngbe_adapter *adapter = (struct ngbe_adapter *)data;
   107		struct ngbe_hw *hw;
   108	
   109		if (adapter == NULL)
   110			return snprintf(page, count, "error: no adapter\n");
   111	
   112		hw = &adapter->hw;
   113		if (hw == NULL)
   114			return snprintf(page, count, "error: no hw data\n");
   115	
   116		return snprintf(page, count, "%d\n", hw->fc.current_mode);
   117	}
   118	
   119	static int ngbe_rxdrops(char *page, char __always_unused **start,
   120				 off_t __always_unused off, int count,
   121				 int __always_unused *eof, void *data)
   122	{
   123		struct ngbe_adapter *adapter = (struct ngbe_adapter *)data;
   124		struct net_device_stats *net_stats;
   125	
   126		if (adapter == NULL)
   127			return snprintf(page, count, "error: no adapter\n");
   128		net_stats  = procfs_get_stats(adapter->netdev);
   129		if (net_stats == NULL)
   130			return snprintf(page, count, "error: no net stats\n");
   131	
   132		return snprintf(page, count, "%lu\n",
   133				net_stats->rx_dropped);
   134	}
   135	
   136	static int ngbe_rxerrors(char *page, char __always_unused **start,
   137				  off_t __always_unused off, int count,
   138				  int __always_unused *eof, void *data)
   139	{
   140		struct ngbe_adapter *adapter = (struct ngbe_adapter *)data;
   141		struct net_device_stats *net_stats;
   142	
   143		if (adapter == NULL)
   144			return snprintf(page, count, "error: no adapter\n");
   145		net_stats  = procfs_get_stats(adapter->netdev);
   146		if (net_stats == NULL)
   147			return snprintf(page, count, "error: no net stats\n");
   148	
   149		return snprintf(page, count, "%lu\n", net_stats->rx_errors);
   150	}
   151	
   152	static int ngbe_rxupacks(char *page, char __always_unused **start,
   153				  off_t __always_unused off, int count,
   154				  int __always_unused *eof, void *data)
   155	{
   156		struct ngbe_hw *hw;
   157		struct ngbe_adapter *adapter = (struct ngbe_adapter *)data;
   158		if (adapter == NULL)
   159			return snprintf(page, count, "error: no adapter\n");
   160	
   161		hw = &adapter->hw;
   162		if (hw == NULL)
   163			return snprintf(page, count, "error: no hw data\n");
   164	
 > 165		return snprintf(page, count, "%d\n", rd32(hw, NGBE_TPR));
 > 166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
