Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794094464;
	b=p0ihSYjFSxTFeq5Dip9eOnIYV8kXE+wsg1iB2juWVKvnJIroQlnH33ig/knOFMLin7Nh
	 79TKur9jvxhycMLJR4J5jIbccpecWBiscF7qM2iV36QOPSw/CY9cf7+EDyGP2MjYyJewb
	 3vs4OuwoKAoErnkNQs6PB98KSlUm62nZ1eYdF06csxW0LClO6CYRq6xFejLUBSyVBfjgz
	 21Qikx7n+tF6QzSpoA8lhNh1qND1zppEYu13Vv87UhCGIlE/AyNSIiCbdQN7osj5RbbfO
	 GkpGZQh4F5BNKSZewYbZJd9UcHfHnRX4UflSicRgozsehmPzgTf8nbBM3QCRbQCxCQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794094464;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WAdSGsX8SmAhe68LHyXdblhT42ggrDYHMdihtIsbjVY=;
	b=iVNJTTeFYATx5LBEjM0o6lz8DaEGKe5O11eMGhkBBap/kxs29UjOgZfZqlp7Evr4pzQN
	 HI6jzl6xjIGjKOsOGkOwfQE0C5/p5wzRZoeDNW7dZjB1aiRkevAkAJ08fn/xsxs3dV9PW
	 7SWi5oUo/LF2A8ejIOJYgWVf7kymvNaZy0qcs9djtg4wyM2Sx+h/bEaeVkiiznoV9xwmT
	 jcoDxzvLwvVgt2W336SOPPYU+aDZVDwvIqlbFxUHYlcwjT0Xgtb/dgfz0drELFNmRhotl
	 SEAUqxSDmFbEHgBGwdjmEgt0jM/heExHuiMz9iBe4oe+W06D5RMWFR5ccsTJKtXDU0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L18FMMUA;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EF3606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 23:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6EF3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L18FMMUA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794094462; x=1825630462;
  h=date:from:to:cc:subject:message-id;
  bh=GIh2QFt8bX6ChOqeFthGBDx4UsxJGXTUPtIuXQaFGG4=;
  b=L18FMMUABWZoXuhUzkTQzDHkxPp4ImU8Zasc5SQQy13sx0Jh7dZlvgGR
   LfSuMNUfu/umhcY4UqwqTwv3rPP2gu7MRnMtdzn/bsQ3qJpEA0/FeKU94
   gNpyaF+2WGCfe7XQF+8ukY/ChYY4XV+RdQ7e5Y9zgeigi6habt367bUQ2
   TS0VJZlBBcJoHjJve8MjN21g0VKKrU8mSeBIlXSFO6VSduliO23t86k6p
   rXa4UGUq1yR7X7TTstIhUYSLjNy8Nj2MZvPrmXN5YLDcomEu/8ksuNhf8
   aapjKU+yfNHjy0jMdzhRLLN/l78JAx5zcV9R/R1zBq1SEnN9eGi2wieiy
   w==;
X-CSE-ConnectionGUID: O/7n2mCsSNiiEMw/vcHkvw==
X-CSE-MsgGUID: yGuPZyVYROaKCZ/QJF55Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2771044"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2771044"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 15:34:21 -0800
X-CSE-ConnectionGUID: +zjnbaInRHaWdlUUq0p8Kg==
X-CSE-MsgGUID: 5hG2ZlH2SJKV19OfebYaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9313479"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Nov 2026 15:34:20 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPpvO-00000000AqN-02Jk;
	Sat, 07 Nov 2026 23:34:18 +0000
Date: Sun, 08 Nov 2026 00:33:36 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 138/154]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:31: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202611080024.s59Xyr3O-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: aab5d4e842b1b95a85e08dc3da96675a803f676a [138/154] net: mediatek: add proprietary debugfs
config: m68k-randconfig-r2301-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080024.s59Xyr3O-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080024.s59Xyr3O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080024.s59Xyr3O-lkp@intel.com/

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
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:56:22: sparse: sparse: symbol 'eth_debug' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1075:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1132:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1420:49: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2047:23: sparse: sparse: symbol 'proc_reg_dir' was not declared. Should it be static?
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2130:48: sparse: sparse: Using plain integer as NULL pointer

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
