Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345B6FBF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 01:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714957250; cv=none; b=Q4Vb5l9FejvFovOvd+yLkIDPos9NLS6G4IPRa2xTT++c16LYNtswcvdRDpg5i794UxmFbWcuSvG9lRDC9/VTbmBm7JaH/v/05+aB7puZ8mkO0v/WbYn9GfwgdXcbwAzaeuOr3xs7a4ksPprA33v3IYdnVcD+yHhKSNpj1KvFxmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714957250; c=relaxed/simple;
	bh=RRalxoNPSynWD+7n6FXQ55yDgRUuTybMiTrJnamT2m0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DtGp73F8eF+x8GuQ1qpJi5HJL9TtcoEIZMjbzbp5ys8NpGaSfas+YR20GFsGEd9TuLWGkLjV0v9MkoU+0AC1Z9nACOumDpoOptFjsDGbLs7GnrU8ILWOY5aZWVaoFq/nYPt+6xh7rZpgFlE80ZVvB8e4jMlL2vpDoMIVfEqRDVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbVKpuAd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbVKpuAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714957247; x=1746493247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RRalxoNPSynWD+7n6FXQ55yDgRUuTybMiTrJnamT2m0=;
  b=NbVKpuAdNvBGkHeDv0i8u0M8sc2hQcPKq29x0OTS/3Kjk47zs5PX3xwD
   pEvWgbIAcZ/7hG18vKz4Yvc4HUFYwUo5okcXH8iyMtqLbeWvqfv2vWWOJ
   bWLuF2QwaZJS8fPkaXKhqQCslalHRm80BfV+d5sDhk0CKY6bWECOBxIkX
   t9p/SXSZSrKKJw1mfCEzv4OS5Zufz7OZBUNl1ukpydATVj6BUSuyp2Yrt
   b031HTEZ+SFMoy8+H6DYa6YrBVZ3wTMkJBQ8jghgKQh6RndtPzWvaCfxe
   gUzRR1PBWI1AQxln2WuPVrM24KzPe6eakJb02rUwnmF7G4njk8MJPP+41
   w==;
X-CSE-ConnectionGUID: oVBDcuMeRcKgn3BziltkwA==
X-CSE-MsgGUID: cHo8rUNIRtOkdqGWbxmyzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22094470"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="22094470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 18:00:46 -0700
X-CSE-ConnectionGUID: f6VjumpSSYKZfZXOuagHLg==
X-CSE-MsgGUID: BQma0NXbRISez+8cgdnXGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28581799"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 May 2024 18:00:46 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3mig-0000K8-36;
	Mon, 06 May 2024 01:00:42 +0000
Date: Mon, 6 May 2024 09:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-netdma 36/36]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:3130:33: warning: variable
 'ip4dst' is uninitialized when used here
Message-ID: <202405060848.84OkascR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-netdma
head:   f4e76f5899b89144d4421d61833ecc6bee17328f
commit: f4e76f5899b89144d4421d61833ecc6bee17328f [36/36] changes to lro based on review from daniel
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405060848.84OkascR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060848.84OkascR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060848.84OkascR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
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
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3130:33: warning: variable 'ip4dst' is uninitialized when used here [-Wuninitialized]
    3130 |         mac->hwlro_ip[fsp->location] = ip4dst;
         |                                        ^~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3119:12: note: initialize the variable 'ip4dst' to silence this warning
    3119 |         u32 ip4dst;
         |                   ^
         |                    = 0
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4528:12: warning: unused function 'mtk_change_mtu' [-Wunused-function]
    4528 | static int mtk_change_mtu(struct net_device *dev, int new_mtu)
         |            ^~~~~~~~~~~~~~
   19 warnings generated.


vim +/ip4dst +3130 drivers/net/ethernet/mediatek/mtk_eth_soc.c

7aab747e5563ec Nelson Chang     2016-09-17  3110  
7aab747e5563ec Nelson Chang     2016-09-17  3111  static int mtk_hwlro_add_ipaddr(struct net_device *dev,
7aab747e5563ec Nelson Chang     2016-09-17  3112  				struct ethtool_rxnfc *cmd)
7aab747e5563ec Nelson Chang     2016-09-17  3113  {
7aab747e5563ec Nelson Chang     2016-09-17  3114  	struct ethtool_rx_flow_spec *fsp =
7aab747e5563ec Nelson Chang     2016-09-17  3115  		(struct ethtool_rx_flow_spec *)&cmd->fs;
7aab747e5563ec Nelson Chang     2016-09-17  3116  	struct mtk_mac *mac = netdev_priv(dev);
7aab747e5563ec Nelson Chang     2016-09-17  3117  	struct mtk_eth *eth = mac->hw;
7aab747e5563ec Nelson Chang     2016-09-17  3118  	int hwlro_idx;
e0e5f1040639ab Frank Wunderlich 2023-12-21  3119  	u32 ip4dst;
7aab747e5563ec Nelson Chang     2016-09-17  3120  
e0e5f1040639ab Frank Wunderlich 2023-12-21  3121  printk(KERN_ALERT "DEBUG: Passed %s %d\n",__FUNCTION__,__LINE__);
7aab747e5563ec Nelson Chang     2016-09-17  3122  	if ((fsp->flow_type != TCP_V4_FLOW) ||
7aab747e5563ec Nelson Chang     2016-09-17  3123  	    (!fsp->h_u.tcp_ip4_spec.ip4dst) ||
7aab747e5563ec Nelson Chang     2016-09-17  3124  	    (fsp->location > 1))
7aab747e5563ec Nelson Chang     2016-09-17  3125  		return -EINVAL;
e0e5f1040639ab Frank Wunderlich 2023-12-21  3126  printk(KERN_ALERT "DEBUG: Passed %s %d\n",__FUNCTION__,__LINE__);
f4e76f5899b891 Frank Wunderlich 2024-05-03  3127  	mac->hwlro_ip[fsp->location] = htonl(fsp->h_u.tcp_ip4_spec.ip4dst);
f4e76f5899b891 Frank Wunderlich 2024-05-03  3128  	hwlro_idx = (mac->id * MTK_MAX_LRO_IP_CNT) + fsp->location;
7aab747e5563ec Nelson Chang     2016-09-17  3129  
e0e5f1040639ab Frank Wunderlich 2023-12-21 @3130  	mac->hwlro_ip[fsp->location] = ip4dst;
7aab747e5563ec Nelson Chang     2016-09-17  3131  
7aab747e5563ec Nelson Chang     2016-09-17  3132  	mac->hwlro_ip_cnt = mtk_hwlro_get_ip_cnt(mac);
7aab747e5563ec Nelson Chang     2016-09-17  3133  
7aab747e5563ec Nelson Chang     2016-09-17  3134  	mtk_hwlro_val_ipaddr(eth, hwlro_idx, mac->hwlro_ip[fsp->location]);
7aab747e5563ec Nelson Chang     2016-09-17  3135  
7aab747e5563ec Nelson Chang     2016-09-17  3136  	return 0;
7aab747e5563ec Nelson Chang     2016-09-17  3137  }
7aab747e5563ec Nelson Chang     2016-09-17  3138  

:::::: The code at line 3130 was first introduced by commit
:::::: e0e5f1040639abdab37ba59de0b67b6b73d7f2bb net: lro patch from balika011

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
