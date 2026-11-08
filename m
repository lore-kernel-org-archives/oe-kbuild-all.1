Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794105647;
	b=Z3Qmyma0AT7618ClH4clixAwt2EYNP/ZA5iCgpaqCox79BO/Uo+5lzoLxP0VY8KV3kS1
	 MUZ2gkUJkjEkRNZ77SqW+ZTz5gh4ITeHWcCNdDYEeOUFxw4b8q421zRf5EZCIFeSLMmJ9
	 pc8RP2Y7q3vq8+UOJbZ1LuhLxg5H4ydG3lKbvvwZu1vvTtLC6ce2UvdMibhqcJSkGyXow
	 KFt2URdsJA13bciHdaK7Q2sp5UaX/qREkDA1JLMLm0Ef28eLRTRjpbwV263bI7StPiS9i
	 82D9PHkXBtqVI55iwmLajp31yicLqhexciMczxuSzQGL+gGR5QP0g26G88VWVLGll1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794105647;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ehJlqDb6VEnXiwOcRjrfmJNa5AykSsRhNAG2oe+8S/Y=;
	b=3/vgWvpDb3WICJIoOMJ/Td0G0nZxCiE9ffHnoJ7W8phgJHvSlF/dWm+keYSMl9cn/cjK
	 H//zBoZBGov2wQhu6yjV1ycM3ksrF+XPs4CJyOFmPVyOy+g0MMkHxJ0jqAn/Lb7be3JNp
	 ZR86wqV+coDAjfQY7mQXAQqDyppLdouVk2n8ssz3zf3vh/zowIzeb9+G/2Rhl9q16FGMX
	 1XKinP4vduqb0KQ8fE3muOx49FtRDFU5b/llEU1++vkEP8qq6EASBOBX+z+ZTXWUhbaD8
	 thBx6IUqzgI4mbliZylTE7lYxUL5pFcKQcZYFyPRVKz4jcq2nbJPvSNFGDYICbSGlaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CAFEp2Y+;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBC2606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 02:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CAFEp2Y+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794105645; x=1825641645;
  h=date:from:to:cc:subject:message-id;
  bh=qQOK76QT5o0uSG9XhOcitcwAHC8XT1UBOFn9oxNAXsQ=;
  b=CAFEp2Y+Gh6tJ1VKe8Wg9g8DDqFK2AqsyI1MjjL3EY02VtyYmFaq5tJW
   H8AIXBwlu0ajECBb1bmNtViq2SN+FbY4yiLJMMpfTvHNax1sZ7XlWsHCH
   9O6QKXWab29KH8OflU1DQ9sj+cWenKpvyAsXb24nP4JtkTTDSSK9e3Fdn
   SygsuUB561f9lLQu04KJ7zfxFnJV736Bp313iJ29HFgkCKcjnNzINjr0c
   VHIQMxBzG83+KZ9/UXY70Bv6NVOqxEuik982zL3mznu3Sk0rPETV7BzTA
   CpI0pMQ72Cu+UaiZ3rN2QBO4cKVWpw6p1LZ288+2mincTDma1ZygJC/km
   w==;
X-CSE-ConnectionGUID: YmIXZebmR5ic/QksQM7oNA==
X-CSE-MsgGUID: ZZLw2LhgSve1fPCuthsT0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2791907"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2791907"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 18:40:44 -0800
X-CSE-ConnectionGUID: xvScQUUJTROSXalrvBbmkw==
X-CSE-MsgGUID: LhjoWi2/THqLag4g5YBXPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7449553"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2026 18:40:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPspl-00000000rx9-07hw;
	Sun, 08 Nov 2026 02:40:41 +0000
Date: Sun, 08 Nov 2026 10:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 139/154]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:43:12: warning: variable
 'dbg_show_level' set but not used
Message-ID: <202611081036.jFCIEbE2-lkp@intel.com>
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
commit: c027d5d6fdb1f8dcd1d002e5faf1942a17eb2666 [139/154] mtk_eth_dbg: fix some sparse errors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611081036.jFCIEbE2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081036.jFCIEbE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081036.jFCIEbE2-lkp@intel.com/

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
