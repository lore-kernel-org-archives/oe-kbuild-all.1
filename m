Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1711C35E956
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783565264; cv=none; b=eaf/aOYroSBO+sxJMOk8hiDdmMI8ZTi8uFKVdB+hp8nah76feORBrdi+EhgsgCmFVX4Tdd+eOh1/jdsqsWHl70UqHgLRjvZJmtBVeGFNr4K+WDz6XpnitdyW5v7PtJBtuwV6JPW422PyRr62FGU3sur98UVuj+YTsG5irLNG5/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783565264; c=relaxed/simple;
	bh=oVMofs2atwJROOSeReyjoAEquPI0h2KlQshkX6vPJks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pzxl0sbBTXj48+eZlzHVFxDPHdnMI4r40GgFtRQIqYuj1ePpVqgxenIdor+MKQQRBDpHdwd+E6HAfDIR74oJIw5dPUonnVd5w+Gvm2IaCcVopANoe07tU0kmI1BY0lbwTLo+lE+Egc18Lf7mDmR4AzYAKKRv6sGUEHI8WLLch5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsbwQLbP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsbwQLbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783565262; x=1815101262;
  h=date:from:to:cc:subject:message-id;
  bh=oVMofs2atwJROOSeReyjoAEquPI0h2KlQshkX6vPJks=;
  b=GsbwQLbPDeg9qbgSa/mjgSOGOZrJI5Xy75vuNTIeMeH84EuCPLLoHiMc
   /xJVRwaj/E0HzXCtloyA5BX7RCRn4047h9PARQBim7ZLqiLKcqKRKCZzv
   ASNpqNmyB43JYUVaiDHAXplDn1KEST1BzOCgZG4Vq/JdwfYHRb9ImuBMy
   /92JiOFR64g1//u/MSnXAIq8y64FYpzyQLIEGk4x3Txp0muD56IkJY9HT
   ImJpgazxzy4HQBiqC34S3hDeMDK/GVTqYiIhK4U5R2uReqewHXeLxJ2zo
   wHI70YpsXoa4MhR4AeqSF+iX8Z/AKw3pTEinyTLNwql3Kx1RQqoa8/HG1
   A==;
X-CSE-ConnectionGUID: X183EavFTgC6+jJVlSwq9Q==
X-CSE-MsgGUID: xCO/9GzvTwWCKz30DY/4hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88153640"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88153640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 19:47:42 -0700
X-CSE-ConnectionGUID: 2e7JKA1mSd2LTnJnleuZTg==
X-CSE-MsgGUID: iw5CpKEJTFOnvjQSdeIYTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251803592"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2026 19:47:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whenZ-00000000HDR-3mrh;
	Thu, 09 Jul 2026 02:47:37 +0000
Date: Thu, 09 Jul 2026 10:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/192 6/6]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac'
 set but not used
Message-ID: <202607091036.u7NFLeXX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/192
head:   2406221a9e06d563d7a7dba094afe4ba8187d5f7
commit: f6261a83d9f211b58713bae33b28f274b6454612 [6/6] net: mediatek: add proprietary debugfs
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607091036.u7NFLeXX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091036.u7NFLeXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091036.u7NFLeXX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'mtketh_debug_show':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac' set but not used [-Wunused-but-set-variable=]
     435 |         struct mtk_mac *mac = 0;
         |                         ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_write':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1810:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable=]
    1810 |         int ret;
         |             ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_dump_v2':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1903:13: warning: variable 'score' set but not used [-Wunused-but-set-variable=]
    1903 |         u32 score = 0, ipv4 = 0;
         |             ^~~~~


vim +/mac +435 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

   431	
   432	static int mtketh_debug_show(struct seq_file *m, void *private)
   433	{
   434		struct mtk_eth *eth = m->private;
 > 435		struct mtk_mac *mac = 0;
   436		int  i = 0;
   437	
   438		for (i = 0 ; i < MTK_MAX_DEVS ; i++) {
   439			if (!eth->mac[i] ||
   440			    of_phy_is_fixed_link(eth->mac[i]->of_node))
   441				continue;
   442			mac = eth->mac[i];
   443	/* FIXME */
   444	/*
   445			while (j < 30) {
   446				d =  _mtk_mdio_read_c22(eth, mac->phy_dev->addr, j);
   447	
   448				seq_printf(m, "phy=%d, reg=0x%08x, data=0x%08x\n",
   449					   mac->phy_dev->addr, j, d);
   450				j++;
   451			}
   452	*/
   453		}
   454		return 0;
   455	}
   456	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
