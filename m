Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2576151B166
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691156; cv=none; b=VD20NiyCVqsrOZgPbzV17LgHhTbhmjSVCpVmIi3G4SumbnTdSAER1C7nEAXfRcias0utSqYXMCOdS9UoFiyBh73t7RWJ4wBnVzJ2+JcPADYcAPHkgSDfAQFnv9tEfqpnRJ0lt0a3rNtbNEEXMHGzrWeviV5SYLD47z7IQ3pLRjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691156; c=relaxed/simple;
	bh=Sr02o493mlJr+6p0S/+3sbYU1xvRB3u0JJVKQn9QZNE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uXXgd0TsWAMBTfm0ecjDrrwghOfXkgsKk/ZjfSj+1vGGQI2UxvGBAHZ1KwMhY+EDZk+wiAWbSu7s/zD/vo8Yjj2NOoEQNMZ7SUxPWCeNJ/zECZx+Y1B9BOo5jJSVCJPgH7wOCbUkJa7UOOvUZOHMMoMd7i3ZXupL55anyQYwKBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e77I7bIh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e77I7bIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790691154; x=1822227154;
  h=date:from:to:cc:subject:message-id;
  bh=Sr02o493mlJr+6p0S/+3sbYU1xvRB3u0JJVKQn9QZNE=;
  b=e77I7bIhe34pqH+kBTAic12J7xVF26HErM+C5YdqtkMxKsmhE936F8hK
   JSITAByR1Q7KH+g7Q0ZbTsOYb6TWth1x/xdVpQBhsdJWCEkst8lQ7Fs3F
   AxL/GXG0gt4Hepw1lWmH4msGEC/+cg7Cty+YS6KAUnfVN8IYqoYJvBPE3
   P3P0MTB9YZ3FQDF9QdyWF28H7M2aAbh0v4jENJDOfdtR48YvTygow6DdB
   blIiU2YuCYU2yCgFrDnhqcPiWqSN11LvKmqf8p3TzF7fyGpFNgvxXGUrn
   tHC51hLoCiAEfZq2AYxvemGTOpNyFhZBR3FRRoQqgJU7ANhLyC5Yj+Hr3
   Q==;
X-CSE-ConnectionGUID: KeCu6saTSCGzIX7k3PIJUA==
X-CSE-MsgGUID: Qm+7GrB7TDqNkPQXVoHb2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91272330"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91272330"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 07:12:33 -0700
X-CSE-ConnectionGUID: D8ckb7EvS/Kqcigoh7BX9Q==
X-CSE-MsgGUID: WHCl0UUhQ/2OCwNdiRo/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="279205123"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2026 07:12:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBYZK-00000000POK-08PL;
	Tue, 29 Sep 2026 14:12:30 +0000
Date: Tue, 29 Sep 2026 22:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rc 154/154]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:43:12: warning: variable
 'dbg_show_level' set but not used
Message-ID: <202609292150.0hwbM2He-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rc
head:   9f3e97a095434cde0e8076b38848505d8d7576f5
commit: 2d97c6da931166152b9194a07ee556cdddeb8a9f [154/154] mtk_eth_dbg: fix some sparse errors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260929/202609292150.0hwbM2He-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609292150.0hwbM2He-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609292150.0hwbM2He-lkp@intel.com/

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
