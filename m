Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45003016F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582209; cv=none; b=A9QIPmOvPnjoielud6YZ6v3fpTyZMUq7U3DlwhgLoOL+GHF1vkcAGxyMzmhB94GIASfJC03kSF6YQkb9/DeEd5U+LkPN/5GKce1hGsRLJVaCEmlxi8PDoNGNygFoyYJ7ioRWHR3CcUexyKr+zNAra+VzOze4cpJEhr/A7zGUUoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582209; c=relaxed/simple;
	bh=uQ8M3zFL09os8Lnd0wyIHcSFzUp9ocNWWhLfpS1S2pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cz/8rNnEdF09sgrmGFtI70Lxl9lHWVIimWzPj63e8Yw77suI+ZHpmVN1MGe5x5v6ggHlT/xOheQvyP4m+Xcrd4moX510scWz+V+ltwnfU4YptDhRB1aZPRkyF0x1A67fTKYh72rLVW/v55TaqernesPN7N5AMjhfYy5UDQhz9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TP2PueCM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TP2PueCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764582207; x=1796118207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQ8M3zFL09os8Lnd0wyIHcSFzUp9ocNWWhLfpS1S2pc=;
  b=TP2PueCMPSwbDrVlMRQwepwiwIYYeVQ510Gy4ZUFWDumv53MCU4Gof6Q
   T/T9jUV6lTPmAIu5kRIESD0sLcqXPhVW7KvtNVuL+IUDdKv3DsPmvbkDL
   EW5LA/ZmquLwJdvQDbBgHY1C43Xvj54vDNo+hhCPyQu1pwF0j00mZT6SU
   G7H/lcsEY+pj0DcC49n6nzRHeZKHgtByl1iGcEn6ftCT+H+snFFoa40h7
   6LY0i+fNYwnBjEjU0XKiUFkoohA57qGmz8SGs6smbhxK+EdywH3+XFMjf
   wnYnoejwhWutpc1bRC2Omdvcr4gJTkMnHlcO7kjx2BnGbHs9A722ECsf7
   A==;
X-CSE-ConnectionGUID: rQDBjECaQXmm/l7ulWUdeg==
X-CSE-MsgGUID: Wi8Kqg04RCGt3Gg1xa/9YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77617993"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77617993"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 01:43:27 -0800
X-CSE-ConnectionGUID: 4FbfYz4zS4WczePaFx9n0Q==
X-CSE-MsgGUID: dN22oSr2SLWx0BREUSg+jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193287550"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2025 01:43:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ0RG-000000008Rt-3kQj;
	Mon, 01 Dec 2025 09:43:22 +0000
Date: Mon, 1 Dec 2025 17:42:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 132/133]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:4810:6: warning: variable
 'length' is uninitialized when used here
Message-ID: <202512011750.yA1lZdzZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-jumbo
head:   74eb25d0d7e555c424d80aac1e24055014c999c4
commit: d876347d06610a97ea1b7dc0f18c7484aec251db [132/133] net: ethernet: mtk_eth_soc: add dynamic rx buffer adjustment support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251201/202512011750.yA1lZdzZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011750.yA1lZdzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512011750.yA1lZdzZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:4810:6: warning: variable 'length' is uninitialized when used here [-Wuninitialized]
    4810 |             length > MTK_PP_MAX_BUF_SIZE) {
         |             ^~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4807:15: note: initialize the variable 'length' to silence this warning
    4807 |         int i, length, max_mtu = 0;
         |                      ^
         |                       = 0
   1 warning generated.


vim +/length +4810 drivers/net/ethernet/mediatek/mtk_eth_soc.c

656e705243fd0c John Crispin     2016-03-08  4802  
4fd59792097a6b DENG Qingfang    2021-01-25  4803  static int mtk_change_mtu(struct net_device *dev, int new_mtu)
4fd59792097a6b DENG Qingfang    2021-01-25  4804  {
4fd59792097a6b DENG Qingfang    2021-01-25  4805  	struct mtk_mac *mac = netdev_priv(dev);
4fd59792097a6b DENG Qingfang    2021-01-25  4806  	struct mtk_eth *eth = mac->hw;
d876347d06610a Mason Chang      2025-11-12  4807  	int i, length, max_mtu = 0;
4fd59792097a6b DENG Qingfang    2021-01-25  4808  
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4809  	if (rcu_access_pointer(eth->prog) &&
7c26c20da5d420 Lorenzo Bianconi 2022-07-22 @4810  	    length > MTK_PP_MAX_BUF_SIZE) {
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4811  		netdev_err(dev, "Invalid MTU for XDP mode\n");
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4812  		return -EINVAL;
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4813  	}
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4814  
1eb2cded45b358 Eric Dumazet     2024-05-06  4815  	WRITE_ONCE(dev->mtu, new_mtu);
4fd59792097a6b DENG Qingfang    2021-01-25  4816  
d876347d06610a Mason Chang      2025-11-12  4817  	for (i = 0; i < MTK_MAX_DEVS; i++) {
d876347d06610a Mason Chang      2025-11-12  4818  		if (!eth->netdev[i])
d876347d06610a Mason Chang      2025-11-12  4819  			continue;
d876347d06610a Mason Chang      2025-11-12  4820  
d876347d06610a Mason Chang      2025-11-12  4821  		if (eth->netdev[i]->mtu > max_mtu)
d876347d06610a Mason Chang      2025-11-12  4822  			max_mtu = eth->netdev[i]->mtu;
d876347d06610a Mason Chang      2025-11-12  4823  	}
d876347d06610a Mason Chang      2025-11-12  4824  
d876347d06610a Mason Chang      2025-11-12  4825  	length = max_mtu + MTK_RX_ETH_HLEN;
d876347d06610a Mason Chang      2025-11-12  4826  	if (length <= MTK_MAX_RX_LENGTH)
d876347d06610a Mason Chang      2025-11-12  4827  		eth->rx_buf_len = MTK_MAX_RX_LENGTH;
d876347d06610a Mason Chang      2025-11-12  4828  	else if (length <= MTK_MAX_RX_LENGTH_2K)
d876347d06610a Mason Chang      2025-11-12  4829  		eth->rx_buf_len = MTK_MAX_RX_LENGTH_2K;
d876347d06610a Mason Chang      2025-11-12  4830  	else if (length <= MTK_MAX_RX_LENGTH_9K)
d876347d06610a Mason Chang      2025-11-12  4831  		eth->rx_buf_len = MTK_MAX_RX_LENGTH_9K;
d876347d06610a Mason Chang      2025-11-12  4832  
4fd59792097a6b DENG Qingfang    2021-01-25  4833  	return 0;
4fd59792097a6b DENG Qingfang    2021-01-25  4834  }
4fd59792097a6b DENG Qingfang    2021-01-25  4835  

:::::: The code at line 4810 was first introduced by commit
:::::: 7c26c20da5d420cde55618263be4aa2f6de53056 net: ethernet: mtk_eth_soc: add basic XDP support

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
