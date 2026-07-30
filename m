Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE453909A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398996; cv=none; b=JFhrihG88jT8VgRRkSRA+MHdiSHga4OylbXTrUuzJtUlRRhPlqBkH08OfAYju5hx0gg8i3aiu+Z9zuakXUVp66Tx8GSZCK8jSYqCEyjf/Lr9xCFoI8yoKqrhIWqEi6KJxBcnfTBO8NHDvf++01gyqFTcr1U6GkaNmWVFTPdCxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398996; c=relaxed/simple;
	bh=ThXot3EIdCh1DakzxkGBWBSSwpPYAO7pZtMaqvqsNlc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R7bmP/veBtiKFz9ZdoCba3MvZd3gaTYj9mvbV4HhhtrCSpf3UKIg9y/1IM7Gl7OGlfaSQY+IZOx0Sch7EjlXm4nS6NkU/ciSJ9LrsgeZcVqrtaaY7j3d2zRZNfhtz3ahmNmcvF8jMQDBZmfvX0vWYiqP2y78xSpOf5j9FyZXzqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhptWGYM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhptWGYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785398994; x=1816934994;
  h=date:from:to:cc:subject:message-id;
  bh=ThXot3EIdCh1DakzxkGBWBSSwpPYAO7pZtMaqvqsNlc=;
  b=IhptWGYME5n00SxcP451KfbqM4O45WqyAG6z/PgWH4fqqaYtv68Dlx8o
   Lo1+iqQK1yy0lrdCV6aHmihGGH0tGha505lQ3TB15Lr/ZHUp75hfACXTI
   0HxYxJpZr0BuKeNPU1/mm1wgU6N2g8uIa1NLmfRwUSfQBPqBeF9GgpbFK
   av0LdTBHvnC988GAOJhX5NlrxuNRZA+lsbKAqoiGkTZfAk023UCflyXHU
   q+d1brmMMjVsMCerw3JU3cCq8RrZB4NKuoOaSQ8HZEmM/Nk9kGktKuozZ
   20mip+hYX2BUPROZEUIhztuLFXulFYSUPFGOBCJXARZYfTRyW3GUF8d+S
   g==;
X-CSE-ConnectionGUID: JI5DKXRhSpKOxLtCXjg+Aw==
X-CSE-MsgGUID: YhETMqgKQ3WrlBPWmxIVzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103417391"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103417391"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 01:09:53 -0700
X-CSE-ConnectionGUID: JDxnPexwR9KuT2H6NdxGXA==
X-CSE-MsgGUID: knlMC0LIRO6ONOO75wxJZQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jul 2026 01:09:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpLpk-00000000gFe-1nXl;
	Thu, 30 Jul 2026 08:09:42 +0000
Date: Thu, 30 Jul 2026 16:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 130/168]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:43:12: warning: variable
 'dbg_show_level' set but not used
Message-ID: <202607301537.9HCGcK1B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   1953c4d64c0da95dd5833d59a20a9f1f456fec31
commit: 3853dbf2d74797d8aa70f6739ad4c0d7befe15d0 [130/168] mtk_eth_dbg: fix some sparse errors
config: hexagon-randconfig-002-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301537.9HCGcK1B-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301537.9HCGcK1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301537.9HCGcK1B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:18: warning: variable 'mac' set but not used [-Wunused-but-set-variable]
     435 |         struct mtk_mac *mac = 0;
         |                         ^
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1810:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1810 |         int ret;
         |             ^
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1903:6: warning: variable 'score' set but not used [-Wunused-but-set-variable]
    1903 |         u32 score = 0, ipv4 = 0;
         |             ^
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:43:12: warning: variable 'dbg_show_level' set but not used [-Wunused-but-set-global]
      43 | static u32 dbg_show_level;
         |            ^
   4 warnings generated.


vim +/dbg_show_level +43 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

    32	
    33	static u32 hw_lro_agg_num_cnt[MTK_MAX_RX_RING_NUM][MTK_HW_LRO_MAX_AGG_CNT + 1];
    34	static u32 hw_lro_agg_size_cnt[MTK_MAX_RX_RING_NUM][16];
    35	static u32 hw_lro_tot_agg_cnt[MTK_MAX_RX_RING_NUM];
    36	static u32 hw_lro_tot_flush_cnt[MTK_MAX_RX_RING_NUM];
    37	static u32 hw_lro_agg_flush_cnt[MTK_MAX_RX_RING_NUM];
    38	static u32 hw_lro_age_flush_cnt[MTK_MAX_RX_RING_NUM];
    39	static u32 hw_lro_seq_flush_cnt[MTK_MAX_RX_RING_NUM];
    40	static u32 hw_lro_timestamp_flush_cnt[MTK_MAX_RX_RING_NUM];
    41	static u32 hw_lro_norule_flush_cnt[MTK_MAX_RX_RING_NUM];
    42	u32 mtk_hwlro_stats_ebl;
  > 43	static u32 dbg_show_level;
    44	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
