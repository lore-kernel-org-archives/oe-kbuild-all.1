Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375B4374187
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500798; cv=none; b=CDGCdpCzQqBsI2euFuYMUEJC3eoS2ezaSg0PpxWj6gkXof6lGj7XvQR1+vwOHo4WtVon/KFmtN7PH7nj++CIfYDDXvg36hu9FFpjfft6OuN3+pvnd5MrS68qqZ0hjIXtxVSAp0auYhkEc+IElUujjX4q2vDMNqEPlmBa8dSq21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500798; c=relaxed/simple;
	bh=XCwsasVX9X6kApVcR5u5M/SGecC6rzx1mp+yPeMQS8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVmoLga/gtIZnZlwQw+2G6lU2BN+nSXUYY0pHx7+dFIlX49EZNmvQmdjZtIkldvJqMTI0iXdrvUQyH9r48SuXVjcTp78/LIY1jgvkhr+BQrvNM+4FQGmdHqDaZfLRKHlxeEHxVZddyQy3+bHNhdMPsYxSxre9kfBrdeyIR4VSlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ygrb7qqb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ygrb7qqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778500797; x=1810036797;
  h=date:from:to:cc:subject:message-id;
  bh=XCwsasVX9X6kApVcR5u5M/SGecC6rzx1mp+yPeMQS8Y=;
  b=Ygrb7qqb5DvSKlYYbYmjNZ15jzWL/K0y/3QWba5YcJWsBMDqbFBdbudc
   GV8mWALZ7DojERPEELlxIfud1DGYMBLbNxH1Y8eBBgYsZqM8tL3C0uX2X
   lqbaRLF44kGfW+HrHcPpVDsTlqt1xkXfDV8C57wa6bIwDFESZKdNIQJdL
   rrkzFOEpo7AvKY+JBx7ahZ+cu8Iz28W3Q+EYzV9L7WG+qoI2YmLJQiGdH
   GwlX66xiAQ52NcrSdZmo0AO7zHvbr2H6qgjXrs3pLa+VjyWhqFb29YbHF
   ZNetkeNGvIlC+lOm0zwNL3/VeyUOpIwvkabaQ2XUTrJ4M9YKYZW7cR1LX
   A==;
X-CSE-ConnectionGUID: YCLrXMGBTki3eIj7nmtU2w==
X-CSE-MsgGUID: 8evXoQOnTZCKOKvnO41HFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78413717"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="78413717"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:59:57 -0700
X-CSE-ConnectionGUID: WJcsyWRgSqy5bHDuWzL5IA==
X-CSE-MsgGUID: kA5GPHbXRfmgcVni/C2DMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234377055"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 04:59:56 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMPIf-000000000Vv-14df;
	Mon, 11 May 2026 11:59:53 +0000
Date: Mon, 11 May 2026 19:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 162/162]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:43:12: warning: variable
 'dbg_show_level' set but not used
Message-ID: <202605111948.tTU0sxdB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   12aaea139e45ed0d826a63a866c1ce03d352fea6
commit: 19802a384d163aa3de306249a8bc164f799a64bf [162/162] mtk_eth_dbg: fix some sparse errors
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260511/202605111948.tTU0sxdB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111948.tTU0sxdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111948.tTU0sxdB-lkp@intel.com/

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
