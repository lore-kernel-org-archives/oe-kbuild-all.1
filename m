Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91E2F2E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 04:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752725664; cv=none; b=TFUJHkewsk73yULfJs5ijRokCfvxuLhgNLfHY1njua3qx7hsUbdcyDNMHOmdvGk4FmbgVpAjwPv2FsxKg6UVH0qE7FgSuW/B3Syiu3ulFiRKa6fR15IM1ycumUifTvA8Fn2FOQs1Kz8uzyjQC9Jv158K1mzyLpZDJbJdW+i68S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752725664; c=relaxed/simple;
	bh=SHXl/mB4pyfhsdWIU0+bvAzLYsC6iqsMAmd1g0bV0xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qaenUWQqtAM4M8u+xJNbPNm5ltZxpRsh1i+dpUMfahw6gyTLqsKMncsJx2U7HmAEF4TpANYRFDQvZuhpVSafmsZO0y1zixoxRtQhnUkBOibB/rcSamYK3noUYe+K8qAtsW7kAy+caLo7/addsLqnGECO6d6oWdzW7eyoHV1+J9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZlauybU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZlauybU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752725663; x=1784261663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHXl/mB4pyfhsdWIU0+bvAzLYsC6iqsMAmd1g0bV0xo=;
  b=CZlauybUQ9Qz5Uxr01QAb9Elf+9uYUZkJcPX89+kKcUHW0i+tBqe4QYM
   2VjHfPAXO/mLuLyUCsyKhnbBd0Y6Eym/JdWLVeGOaITHIDOB9amhe7PfT
   LNUBdsSP+Xngmgv27z9wzsqnpGgK5zYu1HfMzhFfaZADAPh7UdWIDWbEj
   0PHECKnyZEKUDFPb5xoSnzdIrtWzutTjaayytjxQHayihoZ1iOkpjeh2r
   OuYEhzmMEK+m89Dt5iemmizTbbtBy6inpKm5UOgkKxQZzIH1F7FyToXY9
   F5IsMmTohArBUlV5cy8GOK0zNyJTHhUlg25iRgm8Sc22FozvpYDA/48SI
   A==;
X-CSE-ConnectionGUID: GWs6DGwMTES6lqkTKFIWcA==
X-CSE-MsgGUID: 6SeWWThqQzqoRejzzM+Gcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54846399"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="54846399"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 21:14:22 -0700
X-CSE-ConnectionGUID: 2+WKYbXVTf+RoH++jhQL/w==
X-CSE-MsgGUID: vHw1oiR6QCi9s/2NtSytqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="162219920"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jul 2025 21:14:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucG0g-000D8R-2h;
	Thu, 17 Jul 2025 04:14:18 +0000
Date: Thu, 17 Jul 2025 12:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 82/87]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:33:5: sparse: sparse: symbol
 'hw_lro_agg_num_cnt' was not declared. Should it be static?
Message-ID: <202507171241.kPoznzjL-lkp@intel.com>
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
commit: 52257f5195119f5b4b79d5811367cd047af0bfd9 [82/87] net: mediatek: add proprietary debugfs
config: arm-randconfig-r113-20250716 (https://download.01.org/0day-ci/archive/20250717/202507171241.kPoznzjL-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce: (https://download.01.org/0day-ci/archive/20250717/202507171241.kPoznzjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171241.kPoznzjL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:33:5: sparse: sparse: symbol 'hw_lro_agg_num_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:34:5: sparse: sparse: symbol 'hw_lro_agg_size_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:35:5: sparse: sparse: symbol 'hw_lro_tot_agg_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:36:5: sparse: sparse: symbol 'hw_lro_tot_flush_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:37:5: sparse: sparse: symbol 'hw_lro_agg_flush_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:38:5: sparse: sparse: symbol 'hw_lro_age_flush_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:39:5: sparse: sparse: symbol 'hw_lro_seq_flush_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:40:5: sparse: sparse: symbol 'hw_lro_timestamp_flush_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:41:5: sparse: sparse: symbol 'hw_lro_norule_flush_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:43:5: sparse: sparse: symbol 'dbg_show_level' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:54:16: sparse: sparse: symbol 'g_eth' was not declared. Should it be static?
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1075:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1132:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1420:49: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2054:23: sparse: sparse: symbol 'proc_reg_dir' was not declared. Should it be static?

vim +/hw_lro_agg_num_cnt +33 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

    32	
  > 33	u32 hw_lro_agg_num_cnt[MTK_MAX_RX_RING_NUM][MTK_HW_LRO_MAX_AGG_CNT + 1];
  > 34	u32 hw_lro_agg_size_cnt[MTK_MAX_RX_RING_NUM][16];
  > 35	u32 hw_lro_tot_agg_cnt[MTK_MAX_RX_RING_NUM];
  > 36	u32 hw_lro_tot_flush_cnt[MTK_MAX_RX_RING_NUM];
  > 37	u32 hw_lro_agg_flush_cnt[MTK_MAX_RX_RING_NUM];
  > 38	u32 hw_lro_age_flush_cnt[MTK_MAX_RX_RING_NUM];
  > 39	u32 hw_lro_seq_flush_cnt[MTK_MAX_RX_RING_NUM];
  > 40	u32 hw_lro_timestamp_flush_cnt[MTK_MAX_RX_RING_NUM];
  > 41	u32 hw_lro_norule_flush_cnt[MTK_MAX_RX_RING_NUM];
    42	u32 mtk_hwlro_stats_ebl;
  > 43	u32 dbg_show_level;
    44	
    45	static struct proc_dir_entry *proc_hw_lro_stats, *proc_hw_lro_auto_tlb;
    46	typedef int (*mtk_lro_dbg_func) (int par);
    47	
    48	struct mtk_eth_debug {
    49		struct dentry *root;
    50		void __iomem *base;
    51		int direct_access;
    52	};
    53	
  > 54	struct mtk_eth *g_eth;
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
