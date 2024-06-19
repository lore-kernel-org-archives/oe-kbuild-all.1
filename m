Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D124315F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803032; cv=none; b=rMKYbN195kARpADu0RYBcLynyvTqC4yU3186fruQZB55XCen2C0M7Xua3YNIpkeiuugrZWguOQY8suji78PEHGqmxvGv6zLU0DLReklQk4c5tuPae+g8wOtcxhv9lVv8zQk++vfpniiVtmiWPg6breeGgBz2OxlwkC5HgU2PBY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803032; c=relaxed/simple;
	bh=dNEX2HUtYC9i7dJheRFHZt3o1JlLJQ7/OLI0LfvSygI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKaHTLewDuZoG4gLJxkbbohXvcc+M07yAuvGdwgpGPFh7fZZDcFxYO0aJ6Jwm0wo8qAxdUy7wTVejA2Xlui+UhoED6huuzegI9lMYizFBI0esVoJaGjJG19+cKfq5iTYDAerjaY8o/6dnzaN5l8PjgPlY2SY/mw22PkQpgcD81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJXptmtx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJXptmtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718803031; x=1750339031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dNEX2HUtYC9i7dJheRFHZt3o1JlLJQ7/OLI0LfvSygI=;
  b=IJXptmtx+tnGV44/fLkOUMC/Dm2hyqjVGLjskIOfS6WBxy2prSsdAkJD
   JjqUHl/spN68wb7QLT2oyoyTRGQpkqaiVjrgfC5YzLl1X29cX43ryKHK+
   jw0FsIDMtjUssE0jt5vciNj7jODyqvtMtQIqf4M5XJvH28M6jL9/0jLwy
   8QPDhyzNjDOiuZi/l8+GecB7egci8ttiBsQYYCnXMERj/mwzWTHRrQXkJ
   B09nJVWkEqe6MTXQ724YWyNLeQxILSAxRum9YuK/8VRuEAX/R3H8mMrfI
   JnsNL8EyoveyjO37tuKa7AOX+A0woIHfbRwzQUOqWgaTomlnqQmAAOPPH
   Q==;
X-CSE-ConnectionGUID: Uc1GFf5JQA2Bb/Rxdd7aew==
X-CSE-MsgGUID: e6ar3gVQQ7KA44OiiAM4Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15453084"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15453084"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:17:07 -0700
X-CSE-ConnectionGUID: B6uChnEFRp2T513kGORNAQ==
X-CSE-MsgGUID: RNELGucaSSaePht6R96W4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="46368266"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jun 2024 06:17:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJvBO-0006cB-16;
	Wed, 19 Jun 2024 13:17:02 +0000
Date: Wed, 19 Jun 2024 21:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-rsslro 33/33]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:3135:38: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202406192153.JJ8YL6bj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-rsslro
head:   be2f09e3794f1add52c0edc2b31d868a14562ac4
commit: be2f09e3794f1add52c0edc2b31d868a14562ac4 [33/33] net: lro patch from balika011
config: powerpc64-randconfig-r123-20240619 (https://download.01.org/0day-ci/archive/20240619/202406192153.JJ8YL6bj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240619/202406192153.JJ8YL6bj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406192153.JJ8YL6bj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1832:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __sum16 [usertype] check @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1832:45: sparse:     expected restricted __sum16 [usertype] check
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1832:45: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3081:22: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] ip @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3081:22: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3081:22: sparse:     got restricted __be32 [usertype] ip
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3132:40: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3135:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned int [usertype] ip4dst @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3135:38: sparse:     expected restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3135:38: sparse:     got unsigned int [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3196:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4dst @@     got unsigned int [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3196:38: sparse:     expected restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3196:38: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3200:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4src @@     got unsigned int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3200:38: sparse:     expected restricted __be32 [usertype] ip4src
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3200:38: sparse:     got unsigned int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3202:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] psrc @@     got int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3202:36: sparse:     expected restricted __be16 [usertype] psrc
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3202:36: sparse:     got int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3204:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] pdst @@     got int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3204:36: sparse:     expected restricted __be16 [usertype] pdst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3204:36: sparse:     got int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1233:9: sparse: sparse: context imbalance in 'mtk_stats_update' - different lock contexts for basic block
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1258:46: sparse: sparse: context imbalance in 'mtk_get_stats64' - wrong count at exit
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4830:13: sparse: sparse: context imbalance in 'mtk_get_ethtool_stats' - different lock contexts for basic block

vim +3135 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  3115	
  3116	static int mtk_hwlro_add_ipaddr(struct net_device *dev,
  3117					struct ethtool_rxnfc *cmd)
  3118	{
  3119		struct ethtool_rx_flow_spec *fsp =
  3120			(struct ethtool_rx_flow_spec *)&cmd->fs;
  3121		struct mtk_mac *mac = netdev_priv(dev);
  3122		struct mtk_eth *eth = mac->hw;
  3123		int hwlro_idx;
  3124		u32 ip4dst;
  3125	
  3126	printk(KERN_ALERT "DEBUG: Passed %s %d\n",__FUNCTION__,__LINE__);
  3127		if ((fsp->flow_type != TCP_V4_FLOW) ||
  3128		    (!fsp->h_u.tcp_ip4_spec.ip4dst) ||
  3129		    (fsp->location > 1))
  3130			return -EINVAL;
  3131	printk(KERN_ALERT "DEBUG: Passed %s %d\n",__FUNCTION__,__LINE__);
  3132		mac->hwlro_ip[fsp->location] = htonl(fsp->h_u.tcp_ip4_spec.ip4dst);
  3133		hwlro_idx = (mac->id * MTK_MAX_LRO_IP_CNT) + fsp->location;
  3134	
> 3135		mac->hwlro_ip[fsp->location] = ip4dst;
  3136	
  3137		mac->hwlro_ip_cnt = mtk_hwlro_get_ip_cnt(mac);
  3138	
  3139		mtk_hwlro_val_ipaddr(eth, hwlro_idx, mac->hwlro_ip[fsp->location]);
  3140	
  3141		return 0;
  3142	}
  3143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
