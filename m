Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584C3876A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 04:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785212656; cv=none; b=ny0qvlL4gUSFBwtAJuJ4ISs5jc4eJiA5vxMGByTerAkMgGxzN0DMlF6FmdaLS6dj2pllqFIjF0NgZKIgbs3pEZMMmsZjW5+lxtRsbrMkIBnwram2ynYNfV4QYOdaAdX7+zXBEa1T86ODtDWmRHPeb1DKJ/H6Df7pDtLenfLtTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785212656; c=relaxed/simple;
	bh=ry6dliGfUTtKmkGkfrtRTnQmzYwvIKXe2X4cMiet2mg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SGo46JuDOgbs2sGWP3oS/Jv8WRqe5Pjy7/voElrAkNoZwD2MuBGHKBAOUSZUqCDGL1pzC9sFpFoQ00GqarxYnYeHceqcok0a4axgbXr9aZjI0I+9Ttp4/vPL4gH3LxPALIHr4GvlayQaLvarVEe7QKZ/zIsN7LDpm7FJQ3Dusdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwEhjro/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwEhjro/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785212654; x=1816748654;
  h=date:from:to:cc:subject:message-id;
  bh=ry6dliGfUTtKmkGkfrtRTnQmzYwvIKXe2X4cMiet2mg=;
  b=RwEhjro/WHHt6U0whOb+1C+bMBz1ISFWjp6oNI4ySxDJcwHOMIrga1Rg
   2M61rdD/WwRAn9TX01qp15iKf4N/mc1VPGFv855Do0PuZu9Jth98tQnSi
   VWysC1D91BXo/J9NWA7zIMWenBIUw/qjtOYjwBilnG3dZbPryA6FYNmK1
   eAsay+pxhu6ouRmPVYKmAhgUdLPcS+4BeBNKeW4xJX85C8dY2eWXfPvMA
   nJz+utmqbfIHXe0pwMgdNtyTUKPQ90hWJFdFlLlPdffwQONhZfhrMcCuG
   TEogvASWOhJtVt8Jwmw/hDaGFC9BlPi+ugA/Q4EGJXMHHWTLF/pp+62MH
   g==;
X-CSE-ConnectionGUID: SmEC4bITRyOaQhSruL2B1A==
X-CSE-MsgGUID: lLYCR36vSIGuRPoISOjlFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="97164657"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="97164657"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 21:24:13 -0700
X-CSE-ConnectionGUID: o49uJKPvQnK3HWbSNxZMfA==
X-CSE-MsgGUID: bMbnQeWORkWMtSVR6g6fzQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jul 2026 21:24:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woZMQ-00000000dx5-0EGB;
	Tue, 28 Jul 2026 04:24:10 +0000
Date: Tue, 28 Jul 2026 12:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 164/164]
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype
 for 'mtk_xfi_tphy_valid_ctle'
Message-ID: <202607281230.N6INscrH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   23918d7eab97daf57988a8a538a870c4e862b525
commit: ed46f2ec2a2feae7cd59f583b9a0db444b86be49 [164/164] phy: mtk-xfi: add mtk_xfi_tphy_valid_ctle for use in usxgmii driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607281230.N6INscrH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281230.N6INscrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281230.N6INscrH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype for 'mtk_xfi_tphy_valid_ctle' [-Wmissing-prototypes]
      75 | bool mtk_xfi_tphy_valid_ctle(struct phy *phy)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/mtk_xfi_tphy_valid_ctle +75 drivers/phy/mediatek/phy-mtk-xfi-tphy.c

    74	
  > 75	bool mtk_xfi_tphy_valid_ctle(struct phy *phy)
    76	{
    77		struct mtk_xfi_tphy *xfi_tphy = phy_get_drvdata(phy);
    78		unsigned int val, ctle;
    79	
    80		writel(0x00000404, xfi_tphy->base + 0x00);
    81		writel(0x00d600d5, xfi_tphy->base + 0x10);
    82	
    83		val = readl(xfi_tphy->base + 0xd0);
    84	
    85		ctle = FIELD_GET(GENMASK(12, 8), val);
    86		if (ctle > 10)
    87		       return false;
    88	
    89		return true;
    90	}
    91	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
