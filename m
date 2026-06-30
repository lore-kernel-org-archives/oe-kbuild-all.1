Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D90C2367DF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 03:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782789647; cv=none; b=nD6d3MVFnGwSx7UwxiNgftwWVV6VWbJHN9GmjXtwVyVxWJIOllyDEwGS3wdfyhbmI8zggg8neN6Es1A/+ydWGnVrPiNQptGDxzS/9qugkxNVbgGLPEMnu9xA6zXMQKSrgZNkI3MK4VgySkHH1r/f7reImznnW1rhtSFIKta9J/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782789647; c=relaxed/simple;
	bh=3R9Fm5XX2ni9qYeqc3YwmkAsf40PwPtoBGlhwzikQU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wp54sUfTas8bwR4E0UDueJom6jX45GWFHIPo9lBqGOHlDivYmqINYCyB/Lr7yYqA1o0oSKGOi6Szn0hTD9a24w2MECnoGCIYktK5iAkumkTFvC2rPFfoFy6PNQD7Zduj1hKDCRQaOxc6n4q/5goL3voPlEkN6tdJ12Jqoc6Iotc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9BJox0I; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9BJox0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782789645; x=1814325645;
  h=date:from:to:cc:subject:message-id;
  bh=3R9Fm5XX2ni9qYeqc3YwmkAsf40PwPtoBGlhwzikQU0=;
  b=e9BJox0InWpQ7CS2Gy7AHf8Is1N7Z5KE7P4YjzvKigHYawV0sPp133mi
   N4X0cKnC3J24ddsLwev20Y6YITETYW4gYUJ7BBF5GQ2gETU7R+eOatQLh
   s/1zes+O1617aoqjhWx4SHMhO/96T47Jsoef5oCR0QqgyXYND0sFDmvC0
   P//C8FEI7dMjznSoNaB69GRRvN1TS49FyYPEWr0llOsdo4VBcwWWfY7PQ
   nlx/+L7eL22IMGA9g4xzUds6HQ1xoVHeT2xgC5u2HEcsbRn8Qy7IGiZHq
   zpnmrD/3BHFOuEaHhuQu1aGnjhpU7ZDxsoEMRL1p13lUGQolznUU6NlrU
   A==;
X-CSE-ConnectionGUID: dtpg9mCuROenZg2QClF5pg==
X-CSE-MsgGUID: AlI5Fhp8Taao8jv47V5zkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86043477"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="86043477"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 20:20:45 -0700
X-CSE-ConnectionGUID: RfwbEOTSRSq3aiIqt3QIPQ==
X-CSE-MsgGUID: 2mT/0CozTyWtiKASDW2dmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="256068023"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Jun 2026 20:20:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weP1c-000000007yj-3KXF;
	Tue, 30 Jun 2026 03:20:40 +0000
Date: Tue, 30 Jun 2026 11:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/188 1/1]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:31: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202606301109.cKGVgXgK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/188
head:   616866fe35b03d003aa74b684a16a24a9e119e2a
commit: f6261a83d9f211b58713bae33b28f274b6454612 [1/1] net: mediatek: add proprietary debugfs
config: microblaze-randconfig-r123-20260629 (https://download.01.org/0day-ci/archive/20260630/202606301109.cKGVgXgK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301109.cKGVgXgK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301109.cKGVgXgK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:33:5: sparse: sparse: symbol 'hw_lro_agg_num_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:34:5: sparse: sparse: symbol 'hw_lro_agg_size_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:35:5: sparse: sparse: symbol 'hw_lro_tot_agg_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:36:5: sparse: sparse: symbol 'hw_lro_tot_flush_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:37:5: sparse: sparse: symbol 'hw_lro_agg_flush_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:38:5: sparse: sparse: symbol 'hw_lro_age_flush_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:39:5: sparse: sparse: symbol 'hw_lro_seq_flush_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:40:5: sparse: sparse: symbol 'hw_lro_timestamp_flush_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:41:5: sparse: sparse: symbol 'hw_lro_norule_flush_cnt' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:42:5: sparse: sparse: symbol 'mtk_hwlro_stats_ebl' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:43:5: sparse: sparse: symbol 'dbg_show_level' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:54:16: sparse: sparse: symbol 'g_eth' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1075:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1132:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1420:49: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2047:23: sparse: sparse: symbol 'proc_reg_dir' was not declared. Should it be static?

vim +435 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

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
