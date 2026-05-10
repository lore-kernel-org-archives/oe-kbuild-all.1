Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC733F5A8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 05:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778391033; cv=none; b=q4BVvTsyb6MxDezVT14zgPCN/zyfx+RFje7d7QABLd0HJCmEABe/aCe8CD5k0XL464jsqBMzYRjWwdjRfafmylT3GV4oAthvqr2Mt3gz6URjMxdaCraAEfy0RNQVhwl6TYpnUZozkX3m1dFcmIieAWbD4/aQcfX7HRjeI01m+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778391033; c=relaxed/simple;
	bh=K00OG1SG2u2LSvZSbPzFzdnqjTDxB6s3DXAJFeT/KwA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lE0ZvAXHxojPT4PPFoZd3sf+sWtTu6gtwXnNlrDhrFdN+zKS3ll0Mw08DWOspc31S7eekw6svgJYlzo0lf8VP9izlrM0Ifigf/rqawJ2uWHwKfnsWVUTuvj47+tCC8a275J/yCvMfGtSTWhbLF0RJEIiH+ARQzZbF5m56OOlzu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buuso/t7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buuso/t7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778391032; x=1809927032;
  h=date:from:to:cc:subject:message-id;
  bh=K00OG1SG2u2LSvZSbPzFzdnqjTDxB6s3DXAJFeT/KwA=;
  b=buuso/t7fLTrwsMXyaJ4QOTT35Vz74fIcVy8L7QvhQkevtb8XlAwvckP
   Q/VJyOeKa8mlzx0LGcdNq0ZIpWZOgVZ04vw5QwafZMrwfaLK8kdJLKWJ5
   ad44Emk9TIsB3jFA0r4dtb5IYGh6vj//9OlcV9Dytib89Yq87VpiXsloB
   GUwAN4NTR31rfTLLS19SfRazJfiLaYvnJV5hVfFYyhROMEzcj44H5zIkA
   vtsM3MGysPV+LpiAG2EYeARsQ3kTxRlZkKRGgCF3MYlMM5lLd0AZhdyt9
   IWi2C54moFLEv4MvbV2ePUJt+qCOiMmcpOgISfWtRWaK94LXbHRC6yESz
   g==;
X-CSE-ConnectionGUID: oxWS/kEeRW+lRpre7HYyuw==
X-CSE-MsgGUID: BfMANsCQSJqcB5pUITjzhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="82930280"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="82930280"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 22:30:31 -0700
X-CSE-ConnectionGUID: ZFA+00CxQXuBwlQ9G4sphg==
X-CSE-MsgGUID: 6JOEDoWVRRyrjUUO6loxQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="242115037"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 May 2026 22:30:30 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLwkF-000000001mn-3Ej5;
	Sun, 10 May 2026 05:30:27 +0000
Date: Sun, 10 May 2026 13:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 142/162]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:31: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202605101350.3xRKu2Xl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   12aaea139e45ed0d826a63a866c1ce03d352fea6
commit: 50fc35bec984b372f0d6e9253a7f4104edbef12d [142/162] lro-debugfs: some fixes
config: sparc-randconfig-r123-20260509 (https://download.01.org/0day-ci/archive/20260510/202605101350.3xRKu2Xl-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101350.3xRKu2Xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101350.3xRKu2Xl-lkp@intel.com/

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
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2130:48: sparse: sparse: Using plain integer as NULL pointer

vim +435 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

3d7587812f1f0f Frank Wunderlich 2025-01-15  431  
3d7587812f1f0f Frank Wunderlich 2025-01-15  432  static int mtketh_debug_show(struct seq_file *m, void *private)
3d7587812f1f0f Frank Wunderlich 2025-01-15  433  {
3d7587812f1f0f Frank Wunderlich 2025-01-15  434  	struct mtk_eth *eth = m->private;
3d7587812f1f0f Frank Wunderlich 2025-01-15 @435  	struct mtk_mac *mac = 0;
3d7587812f1f0f Frank Wunderlich 2025-01-15  436  	int  i = 0;
3d7587812f1f0f Frank Wunderlich 2025-01-15  437  
3d7587812f1f0f Frank Wunderlich 2025-01-15  438  	for (i = 0 ; i < MTK_MAX_DEVS ; i++) {
3d7587812f1f0f Frank Wunderlich 2025-01-15  439  		if (!eth->mac[i] ||
3d7587812f1f0f Frank Wunderlich 2025-01-15  440  		    of_phy_is_fixed_link(eth->mac[i]->of_node))
3d7587812f1f0f Frank Wunderlich 2025-01-15  441  			continue;
3d7587812f1f0f Frank Wunderlich 2025-01-15  442  		mac = eth->mac[i];
3d7587812f1f0f Frank Wunderlich 2025-01-15  443  /* FIXME */
3d7587812f1f0f Frank Wunderlich 2025-01-15  444  /*
3d7587812f1f0f Frank Wunderlich 2025-01-15  445  		while (j < 30) {
3d7587812f1f0f Frank Wunderlich 2025-01-15  446  			d =  _mtk_mdio_read_c22(eth, mac->phy_dev->addr, j);
3d7587812f1f0f Frank Wunderlich 2025-01-15  447  
3d7587812f1f0f Frank Wunderlich 2025-01-15  448  			seq_printf(m, "phy=%d, reg=0x%08x, data=0x%08x\n",
3d7587812f1f0f Frank Wunderlich 2025-01-15  449  				   mac->phy_dev->addr, j, d);
3d7587812f1f0f Frank Wunderlich 2025-01-15  450  			j++;
3d7587812f1f0f Frank Wunderlich 2025-01-15  451  		}
3d7587812f1f0f Frank Wunderlich 2025-01-15  452  */
3d7587812f1f0f Frank Wunderlich 2025-01-15  453  	}
3d7587812f1f0f Frank Wunderlich 2025-01-15  454  	return 0;
3d7587812f1f0f Frank Wunderlich 2025-01-15  455  }
3d7587812f1f0f Frank Wunderlich 2025-01-15  456  

:::::: The code at line 435 was first introduced by commit
:::::: 3d7587812f1f0f35408e7efbf4bf78cbe5b07ec3 net: mediatek: add proprietary debugfs

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
