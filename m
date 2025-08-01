Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83F35947
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754030257; cv=none; b=Er5fEBTSzKxV+ks2XtzEs/AO2F9wFCu1Yxf1ZkGcIhRpf38gwaW9DgFxUgkGcKk2wGWEUj9il4j9d+cbpBu/1gRgTIiHLEF4V6E9RQ21gSiVXVcxrIF01HzrY6JYDDUNnxr04pEW7iBpYu9ejFzFToA5/Yz57RhDohJU5eRT/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754030257; c=relaxed/simple;
	bh=E34oE1naxFiPvVHJuq9Ch2YVvUCN4CSAwoh49QE2Yxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtcsuLFIPbc1uPkEAgnZk2ekjtXvlkl3vP/90ro7fxOcJwCE8G4B0Ml7DLQwco7KnG027fPjWv+MUfgmutsH+Szhhhg+Dh2LxykvdgTMdc8xF1T55zrsNTxh9+vSM4M/XqInstpTNkTqH5Ol8wOe44Sg3LsR0Q2pVO/DAh28ZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZnM9sL1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZnM9sL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754030256; x=1785566256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E34oE1naxFiPvVHJuq9Ch2YVvUCN4CSAwoh49QE2Yxs=;
  b=gZnM9sL1b2C7xTjZvXfSwk291JIABpENJ8SCPsVhXUOsyqOM80tadxRF
   5K0g0AwII6GsN7wI9jdnvEgmevyVbTE6iRNPpDwin6Hn8nTt8Wr40i/ZV
   8+Ad+NX6O7u0abXgdrxNzCmnSEf3hFey+gp69FfbmAENX116DMP14GIJF
   sZ5RNpPK075CYHAdJf/83B0Mir9PRAsLCNVJ7WAHywUOLaM4PHhcXEZyq
   n3mdUFIzXFzA1CJfYrn5TW2UxQSe4P4ITIeUospX7NspnqnIC9GARx3oD
   b+nCU4NXDnxksliegTXXCPerTdvnXi7f3u/Cj2nlpFrK+D5BpsdRyRIOI
   g==;
X-CSE-ConnectionGUID: 2awVGHL+TJi4ERJQQmJW2A==
X-CSE-MsgGUID: IWpmO36lRp+OAh5WEaKx+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56451164"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56451164"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 23:37:34 -0700
X-CSE-ConnectionGUID: CbgunYiRTO+8D2c7tpR3mQ==
X-CSE-MsgGUID: X5cXFUYxSOCt7sWkOryqNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163494381"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Jul 2025 23:37:33 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhjOT-0004P1-2h;
	Fri, 01 Aug 2025 06:37:29 +0000
Date: Fri, 1 Aug 2025 14:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2618/2618]
 drivers/net/ethernet/huawei/hinic3/hinic3_main.c:154:9: error: call to
 undeclared function 'vlan_dev_priv'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202508011414.iDmsBjYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7bd792ffd08ba550c6bcfc003d84bed102147e07
commit: dcb286ce50a35a77e51b61db72c7cc001647b598 [2618/2618] net/hinic3: add huawei/hinic3 driver
config: arm64-randconfig-001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011414.iDmsBjYd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011414.iDmsBjYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011414.iDmsBjYd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_main.c:6:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_main.c:154:9: error: call to undeclared function 'vlan_dev_priv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     154 |                 ret = vlan_dev_priv(ndev)->real_dev;
         |                       ^
>> drivers/net/ethernet/huawei/hinic3/hinic3_main.c:154:30: error: member reference type 'int' is not a pointer
     154 |                 ret = vlan_dev_priv(ndev)->real_dev;
         |                       ~~~~~~~~~~~~~~~~~~~  ^
   drivers/net/ethernet/huawei/hinic3/hinic3_main.c:156:30: error: member reference type 'int' is not a pointer
     156 |                         ret = vlan_dev_priv(ret)->real_dev;
         |                               ~~~~~~~~~~~~~~~~~~  ^
   5 warnings and 3 errors generated.


vim +/vlan_dev_priv +154 drivers/net/ethernet/huawei/hinic3/hinic3_main.c

   129	
   130	#define HINIC3_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT	1
   131	#define HINIC3_VLAN_CLEAR_OFFLOAD	(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM | \
   132						 NETIF_F_SCTP_CRC | NETIF_F_RXCSUM | \
   133						 NETIF_F_ALL_TSO)
   134	
   135	static int hinic3_netdev_event(struct notifier_block *notifier, unsigned long event, void *ptr)
   136	{
   137		struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
   138		struct net_device *real_dev = NULL;
   139		struct net_device *ret = NULL;
   140		u16 vlan_depth;
   141	
   142		if (!is_vlan_dev(ndev))
   143			return NOTIFY_DONE;
   144	
   145		dev_hold(ndev);
   146	
   147		switch (event) {
   148		case NETDEV_REGISTER:
   149			real_dev = vlan_dev_real_dev(ndev);
   150			if (!hinic3_is_netdev_ops_match(real_dev))
   151				goto out;
   152	
   153			vlan_depth = 1;
 > 154			ret = vlan_dev_priv(ndev)->real_dev;
   155			while (is_vlan_dev(ret)) {
   156				ret = vlan_dev_priv(ret)->real_dev;
   157				vlan_depth++;
   158			}
   159	
   160			if (vlan_depth == HINIC3_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT) {
   161				ndev->vlan_features &= (~HINIC3_VLAN_CLEAR_OFFLOAD);
   162			} else if (vlan_depth > HINIC3_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT) {
   163	#ifdef HAVE_NDO_SET_FEATURES
   164	#ifdef HAVE_RHEL6_NET_DEVICE_OPS_EXT
   165				set_netdev_hw_features(ndev,
   166						       get_netdev_hw_features(ndev) &
   167						       (~HINIC3_VLAN_CLEAR_OFFLOAD));
   168	#else
   169				ndev->hw_features &= (~HINIC3_VLAN_CLEAR_OFFLOAD);
   170	#endif
   171	#endif
   172				ndev->features &= (~HINIC3_VLAN_CLEAR_OFFLOAD);
   173			}
   174	
   175			break;
   176	
   177		default:
   178			break;
   179		};
   180	
   181	out:
   182		dev_put(ndev);
   183	
   184		return NOTIFY_DONE;
   185	}
   186	#endif
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
