Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F5C2260C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750617329; cv=none; b=GtOAvTPxgNOjRiCta7mDfATJnw02rZ/dSwqE9cZdYF3QM6p2ea5ldhTHVoxC5tn1R+ZY+UhX4t0LRo2gO8Rrb4oabowliLLLsT9zlWaG8cfuAjZ9QMNf0EUqE4XD76TqqmGGbKFbmMo8Xl4spuzr1ZBYHivE+vhGJ9IfhGFhif0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750617329; c=relaxed/simple;
	bh=SRI8kUDz+AhlX2t9HGrIiq9z+XJSbPHxj7oZzpxl6XY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=otHCf8U9hHuBxrMGVWsQXZdqLdFjvz/m99jnh1Ey+kVxDVZDkswz1vUJr5Y0y+gLl53hsFihCm66/pnugSM1lTkuEgFHhwCqcnovuRyeDH0TORUsevW3WqxLAMGOzwCUG/FyBSVxVWWF5QiyCep3FYj1bCEB49NFGJMXtyDJ1/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEnckbD3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEnckbD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750617328; x=1782153328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SRI8kUDz+AhlX2t9HGrIiq9z+XJSbPHxj7oZzpxl6XY=;
  b=JEnckbD3iQHN25R9+gW2TpJcgpY+CGDtNP1MjAo4Yl55UuhBA0o6Z8Xj
   5H5ZZMjscWsOK5a25PKhCkNQKb5lZEsFpCoIRl066b/lOPAHtkjsMnbAN
   YF2Vwdt8PflgOIRWl4K5y72eyH37fTbOOAF1SYKtDpJO0BfUo33iT73Eu
   h/4JzeK6fxO5bdjZ8jpaw/0ztrG9AUeCBoDepi1LpmZekH96xaXqdyKnm
   h/WGNxIoAoO5ND+6vIY6xFfZQ6sW1sm1S8HZCLZeUlWBOQqOemUojlHMP
   XErRfqZKe+QsctqxhN0Qh5C6+RJeAA8O1HY+dsUXqWJSafTqLQX6vQfDY
   A==;
X-CSE-ConnectionGUID: cEJrvMigSbOPnuaS2InG4w==
X-CSE-MsgGUID: TcHZhzFSSAS0uHM1jRRHCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="70389213"
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="70389213"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 11:35:27 -0700
X-CSE-ConnectionGUID: mSrBRtOlRQaLUtQGOl+9cg==
X-CSE-MsgGUID: 3BP7X7MWSvyKCv9J1id6Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="182268996"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2025 11:35:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTPXI-000NSg-0f;
	Sun, 22 Jun 2025 18:35:24 +0000
Date: Mon, 23 Jun 2025 02:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 41/72]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:533:2-3: Unneeded semicolon
Message-ID: <202506230254.CIbBvQBz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   14bf550b65cbf5b2fc136cfa4f48a3475b597d25
commit: 8e98cc829670ca46d3e30ab0856da7240f6961bf [41/72] net: pcs: implement Firmware node support for PCS driver
config: arm64-randconfig-r051-20250622 (https://download.01.org/0day-ci/archive/20250623/202506230254.CIbBvQBz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506230254.CIbBvQBz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:533:2-3: Unneeded semicolon

vim +533 drivers/net/ethernet/mediatek/mtk_eth_soc.c

445eb6448ed3bf Lorenzo Bianconi      2023-07-25  517  
2bc47ff7ea2ace Daniel Golle          2023-12-12  518  static bool mtk_check_gmac23_idle(struct mtk_mac *mac)
14a44ab0330d29 Russell King (Oracle  2022-05-18  519) {
2bc47ff7ea2ace Daniel Golle          2023-12-12  520  	u32 mac_fsm, gdm_fsm;
14a44ab0330d29 Russell King (Oracle  2022-05-18  521) 
2bc47ff7ea2ace Daniel Golle          2023-12-12  522  	mac_fsm = mtk_r32(mac->hw, MTK_MAC_FSM(mac->id));
14a44ab0330d29 Russell King (Oracle  2022-05-18  523) 
2bc47ff7ea2ace Daniel Golle          2023-12-12  524  	switch (mac->id) {
2bc47ff7ea2ace Daniel Golle          2023-12-12  525  	case MTK_GMAC2_ID:
2bc47ff7ea2ace Daniel Golle          2023-12-12  526  		gdm_fsm = mtk_r32(mac->hw, MTK_FE_GDM2_FSM);
2bc47ff7ea2ace Daniel Golle          2023-12-12  527  		break;
2bc47ff7ea2ace Daniel Golle          2023-12-12  528  	case MTK_GMAC3_ID:
2bc47ff7ea2ace Daniel Golle          2023-12-12  529  		gdm_fsm = mtk_r32(mac->hw, MTK_FE_GDM3_FSM);
2bc47ff7ea2ace Daniel Golle          2023-12-12  530  		break;
2bc47ff7ea2ace Daniel Golle          2023-12-12  531  	default:
2bc47ff7ea2ace Daniel Golle          2023-12-12  532  		return true;
2bc47ff7ea2ace Daniel Golle          2023-12-12 @533  	};
14a44ab0330d29 Russell King (Oracle  2022-05-18  534) 
2bc47ff7ea2ace Daniel Golle          2023-12-12  535  	if ((mac_fsm & 0xFFFF0000) == 0x01010000 &&
2bc47ff7ea2ace Daniel Golle          2023-12-12  536  	    (gdm_fsm & 0xFFFF0000) == 0x00000000)
2bc47ff7ea2ace Daniel Golle          2023-12-12  537  		return true;
2bc47ff7ea2ace Daniel Golle          2023-12-12  538  
2bc47ff7ea2ace Daniel Golle          2023-12-12  539  	return false;
14a44ab0330d29 Russell King (Oracle  2022-05-18  540) }
14a44ab0330d29 Russell King (Oracle  2022-05-18  541) 

:::::: The code at line 533 was first introduced by commit
:::::: 2bc47ff7ea2ace3310b449c338064e7700ffd323 net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
