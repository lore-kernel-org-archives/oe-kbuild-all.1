Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD9348C7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 22:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782166190; cv=none; b=IENvlxJc9mlnzh5fN8zBHdBU8z7pLl5w0Utw+3nXAvWoTGjBYRYRNVWlfAw2VnkXyzFO6kqO53y2B7xECO+onmHF587opd9I47bYD2NkUBJaTXTxS8O7Y5ZpoiOOPM4jhFoFQvyhsJgYFH7hOVV5O6zBAkQDcW8wT6j8IgrbDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782166190; c=relaxed/simple;
	bh=rkeU+E62ptnwm4cGsHldFfbjTaSfkiTNhVnjEGrb5dc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dcczA6FZDeI7mJioudqmCx9owcuwuBGvc61WRVtuOxgZMmLQY9Wm8gEV3cFMjc7kimVyd2rXv4KneaKPFs4j0g+JxuzbVUZb0dvhMf9L+whoEnq7eqh0sjVJM9swiGoDO2j44iI6ffGGQLwBDQ5uGaQdCFtWqpAx86Ea9eCT0Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFeAvCGj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFeAvCGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782166190; x=1813702190;
  h=date:from:to:cc:subject:message-id;
  bh=rkeU+E62ptnwm4cGsHldFfbjTaSfkiTNhVnjEGrb5dc=;
  b=QFeAvCGjVwDFY0ppXLgORRgYRc0TIQSwxM3dw38mbK1yluz2znrnOKm0
   MBSIP60H8VhiItl/dHPykFfE7mb7E/gyieS2xivZW2cWkw49CCEaakjgi
   hU2W/75uIGdoTCmc9uxc48gGov5bA5ycISggacJLaRxyb6zVU6q55xssB
   /Kkc6oKOrczucGD7w3ge1SQ8yTcpyL2tpFzkN91VixdHZiSCWIkoFDypi
   sXzune+Nxn1BqUF2UemSMlSYychGLKyE5y6Ihfi/hn+jAE/zTBuFzfI+j
   smJkMV7M1gLBc6ARiovJh83LscAdskKDqPQPw3pS8vsG60GrHDcV6GGzz
   w==;
X-CSE-ConnectionGUID: mdhddz5KTNe7UXdgmkvpOQ==
X-CSE-MsgGUID: k1SyvctIR6eD6NSmoc0lAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94021329"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="94021329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:09:50 -0700
X-CSE-ConnectionGUID: B76vb8raS0q+M8PgKQbzGw==
X-CSE-MsgGUID: rOHPj2aKSMaZKHB/PqWxxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253679137"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2026 15:09:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbmpt-0000000020D-2eK4;
	Mon, 22 Jun 2026 22:09:45 +0000
Date: Tue, 23 Jun 2026 06:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 166/166]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:43:12: warning: variable
 'dbg_show_level' set but not used
Message-ID: <202606230640.nmuG3u1l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   c95b3b76f17fc39ff9ed52ee3e3f0bccc707f586
commit: 7e9e6fcc49180cb1d0e986f23c0abe82e17d0ff3 [166/166] mtk_eth_dbg: fix some sparse errors
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230640.nmuG3u1l-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230640.nmuG3u1l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230640.nmuG3u1l-lkp@intel.com/

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
