Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B130C177
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 23:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782170045; cv=none; b=px+A80Frn0TF+8wsUK7c1lIdLj4ENMcBIZhWjr4oh1x2PXzzcd5llR1TZN4296saKKasyxF2YfZc/JoDEXxkIiQSZxscw6PQfxPvUGxgUnlMBMz7fqa7bScoAjs8Qn7AuF51sKk/aReRzBnmgx0wdYIpo6m2Li/ZfUWawThCyqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782170045; c=relaxed/simple;
	bh=X2p4UwiwNzbIU8/C6aFRMwkDqwRlcfmt79MAawetVRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AxH/EamhUgP+AN4Egsyt7jBgMT0YqOxlw8U3ALbsFsdzrkjToR+WFi1W3WD2nMUL4x2Xf39iudFUxw9nRRIXEitb4pcKf45ZFfpqi6PSsTBOOImHSA72twdWSlrg/RXKLA2N6URiJX5C0qWfz52v3IMgDsDlgBNiabAB+4iTJ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/486a+I; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/486a+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782170043; x=1813706043;
  h=date:from:to:cc:subject:message-id;
  bh=X2p4UwiwNzbIU8/C6aFRMwkDqwRlcfmt79MAawetVRs=;
  b=L/486a+IU4z+SA0JeSF57+MrJDstO2tLWTe23R65G2J4x4wwxGGHnT/I
   Wa8EVbGT/8XK7brVWdqiasyiVc03MTJAugZ9Nu8V9L4JgmWTKw2Wwv3mC
   LsyvCmibhwRRFuttNcUQzbijEfbs1yMb9ykPS1R5s9U4AdshcBmXY5KNP
   c85W/FuGHOWLp3r6yUwbOGjJwUsKFICza/OHswkGuK4WyoRy+Vm5op6CQ
   xA1Tdb1vTaloex+Tuy0kNJysA5Puu8JWHrdzI/UxRl0AULfjVOU43TbI3
   MqFRHn5Fz5XeYHUJEc1tH1o4nQZiBOS2vW21mHvlziiH7wobx4t3EGkIU
   w==;
X-CSE-ConnectionGUID: 5pBH5yD8SquqYtIPIl4Ktg==
X-CSE-MsgGUID: B5wpjXbdReOU2NGeQnzgEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83022696"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="83022696"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 16:14:02 -0700
X-CSE-ConnectionGUID: Hf/fpnlHQ7Gp26Zz+PrBug==
X-CSE-MsgGUID: XZzCfOriR9W1Gf2C5+52JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273418663"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 16:14:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbnq3-0000000023F-2VzZ;
	Mon, 22 Jun 2026 23:13:59 +0000
Date: Tue, 23 Jun 2026 07:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 166/166]
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype
 for function 'mtk_xfi_tphy_valid_ctle'
Message-ID: <202606230741.zHCuAWae-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   c95b3b76f17fc39ff9ed52ee3e3f0bccc707f586
commit: 93d09f4f4b72a6b829135dfad3eac1c1684ccbe6 [166/166] phy: mtk-xfi: add mtk_xfi_tphy_valid_ctle for use in usxgmii driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230741.zHCuAWae-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230741.zHCuAWae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230741.zHCuAWae-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype for function 'mtk_xfi_tphy_valid_ctle' [-Wmissing-prototypes]
      75 | bool mtk_xfi_tphy_valid_ctle(struct phy *phy)
         |      ^
   drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | bool mtk_xfi_tphy_valid_ctle(struct phy *phy)
         | ^
         | static 
   1 warning generated.


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
