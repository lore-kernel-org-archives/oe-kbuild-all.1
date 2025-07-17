Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD61411EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752717010; cv=none; b=dLYYGgV0pgpKQMVn6oJSD5x0sINf0aVmCY61t6S28aReigYhZ0c2JrS/G6doaAs63o5CJ5Qt7YDh9mYdNvEPvNDOAnXf+Ocq4TzBh/FyOp4g7LejGywukkNMkAgntJqyDFRXQNueXnBpkfcloKMmP4wu+bkPN10lQ/EGGeVOgg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752717010; c=relaxed/simple;
	bh=YjUPJYFrSqyuBSAaHMHu6W/HDyz242itBxhpbC5Wyos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nKOLBtYpaMpmc0ov7WlkG0nLU3h9G8GdsBGRkY4MXQXwYCeMWYGfQ/YcgvmUHi8Zr/RpifXmJqSfURtm4AjdPf4TE32jEgPLkNFdAvLvEKp94+1YAQ1vlaBtdQ2LnQ1CFk1+OzJg/N4xdmld2cF35PBq2klfwU4eW0MW/M0n7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuQJeWTp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuQJeWTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752717009; x=1784253009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjUPJYFrSqyuBSAaHMHu6W/HDyz242itBxhpbC5Wyos=;
  b=YuQJeWTprwQtqFLaksUWMBXQc5tzWeo8yQvjCDhMnFJqvzuy4BlT/odv
   gxX97/z99IzKcv7Eoa8K21/xBvFNaEVAfmBA6hk1uOIE0k51ImHGW52OJ
   U2yFGGhQOX9hQ501+3Jy4RezQhWCqx3AnoK5RCrvhoTMAj4uufWVVRzbj
   lXJ/rduI9WMOI1tjxpUlQ9YVc6lP3DQ6sKlXbxuaNpRpXrui1B2WNmEiz
   uP576um23KMBM2ZqgjnblN98qNUZM+/eZbLZ2zoDM+dIzsPnjDRLGTdDf
   WiEZYUqKZgkZh0aZc3Bv9ihdrYiMYs0W/2hLiZm5YHqMLYV2polOIaYka
   Q==;
X-CSE-ConnectionGUID: ogtll9vtSHi+mz/JNdlhEA==
X-CSE-MsgGUID: qKkgBWn6Qau/iEmr1Cag+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65547519"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="65547519"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 18:50:08 -0700
X-CSE-ConnectionGUID: qO1RWCPFTO2HKF4YbBz32g==
X-CSE-MsgGUID: TrTdC+BETPm8qDa6WkJVqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="157470815"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jul 2025 18:50:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucDl6-000D2p-2f;
	Thu, 17 Jul 2025 01:50:04 +0000
Date: Thu, 17 Jul 2025 09:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 79/87]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:3186:16: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202507170900.Sk9UwkoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   05f94f4f1c1174f5bbb0e4311ee9c397bba69b87
commit: aa241e7e19abc6c637970bc7deb69fceae13066a [79/87] net: ethernet: mtk_eth_soc: Add LRO support
config: arm-randconfig-r113-20250716 (https://download.01.org/0day-ci/archive/20250717/202507170900.Sk9UwkoN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce: (https://download.01.org/0day-ci/archive/20250717/202507170900.Sk9UwkoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507170900.Sk9UwkoN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1850:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __sum16 [usertype] check @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1850:45: sparse:     expected restricted __sum16 [usertype] check
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1850:45: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3081:22: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] ip @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3081:22: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3081:22: sparse:     got restricted __be32 [usertype] ip
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3186:18: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3186:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ip4dst @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3186:16: sparse:     expected unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3186:16: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3191:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned int [usertype] ip4dst @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3191:38: sparse:     expected restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3191:38: sparse:     got unsigned int [usertype] ip4dst
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3212:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ip4dst @@     got restricted __be32 @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3212:16: sparse:     expected unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3212:16: sparse:     got restricted __be32
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3235:72: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] ip4dst @@     got restricted __be32 @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3235:72: sparse:     expected unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3235:72: sparse:     got restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3253:72: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] ip4dst @@     got restricted __be32 @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3253:72: sparse:     expected unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3253:72: sparse:     got restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3277:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4dst @@     got unsigned int [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3277:38: sparse:     expected restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3277:38: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3281:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4src @@     got unsigned int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3281:38: sparse:     expected restricted __be32 [usertype] ip4src
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3281:38: sparse:     got unsigned int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3283:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] psrc @@     got int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3283:36: sparse:     expected restricted __be16 [usertype] psrc
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3283:36: sparse:     got int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3285:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] pdst @@     got int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3285:36: sparse:     expected restricted __be16 [usertype] pdst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3285:36: sparse:     got int

vim +3186 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  3170	
  3171	static int mtk_hwlro_add_ipaddr(struct net_device *dev,
  3172					struct ethtool_rxnfc *cmd)
  3173	{
  3174		struct ethtool_rx_flow_spec *fsp =
  3175			(struct ethtool_rx_flow_spec *)&cmd->fs;
  3176		struct mtk_mac *mac = netdev_priv(dev);
  3177		struct mtk_eth *eth = mac->hw;
  3178		int hwlro_idx;
  3179		u32 ip4dst;
  3180	
  3181		if ((fsp->flow_type != TCP_V4_FLOW) ||
  3182		    (!fsp->h_u.tcp_ip4_spec.ip4dst) ||
  3183		    (fsp->location > 1))
  3184			return -EINVAL;
  3185	
> 3186		ip4dst = htonl(fsp->h_u.tcp_ip4_spec.ip4dst);
  3187		hwlro_idx = mtk_hwlro_add_ipaddr_idx(dev, ip4dst);
  3188		if (hwlro_idx < 0)
  3189			return hwlro_idx;
  3190	
> 3191		mac->hwlro_ip[fsp->location] = ip4dst;
  3192		mac->hwlro_ip_cnt = mtk_hwlro_get_ip_cnt(mac);
  3193	
  3194		mtk_hwlro_val_ipaddr(eth, hwlro_idx, mac->hwlro_ip[fsp->location]);
  3195	
  3196		return 0;
  3197	}
  3198	
  3199	static int mtk_hwlro_del_ipaddr(struct net_device *dev,
  3200					struct ethtool_rxnfc *cmd)
  3201	{
  3202		struct ethtool_rx_flow_spec *fsp =
  3203			(struct ethtool_rx_flow_spec *)&cmd->fs;
  3204		struct mtk_mac *mac = netdev_priv(dev);
  3205		struct mtk_eth *eth = mac->hw;
  3206		int hwlro_idx;
  3207		u32 ip4dst;
  3208	
  3209		if (fsp->location > 1)
  3210			return -EINVAL;
  3211	
> 3212		ip4dst = mac->hwlro_ip[fsp->location];
  3213		hwlro_idx = mtk_hwlro_get_ipaddr_idx(dev, ip4dst);
  3214		if (hwlro_idx < 0)
  3215			return hwlro_idx;
  3216	
  3217		mac->hwlro_ip[fsp->location] = 0;
  3218		mac->hwlro_ip_cnt = mtk_hwlro_get_ip_cnt(mac);
  3219	
  3220		mtk_hwlro_inval_ipaddr(eth, hwlro_idx);
  3221	
  3222		return 0;
  3223	}
  3224	
  3225	static void mtk_hwlro_netdev_enable(struct net_device *dev)
  3226	{
  3227		struct mtk_mac *mac = netdev_priv(dev);
  3228		struct mtk_eth *eth = mac->hw;
  3229		int i, hwlro_idx;
  3230	
  3231		for (i = 0; i < MTK_MAX_LRO_IP_CNT; i++) {
  3232			if (mac->hwlro_ip[i] == 0)
  3233				continue;
  3234	
> 3235			hwlro_idx = mtk_hwlro_get_ipaddr_idx(dev, mac->hwlro_ip[i]);
  3236			if (hwlro_idx < 0)
  3237				continue;
  3238	
  3239			mtk_hwlro_val_ipaddr(eth, hwlro_idx, mac->hwlro_ip[i]);
  3240		}
  3241	}
  3242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
