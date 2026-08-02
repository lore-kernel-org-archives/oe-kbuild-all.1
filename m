Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B4A1F4180
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 04:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785643490; cv=none; b=gsJhpDVoSJRT9gsfruGkzKD9Co7nMnVql8ydOR3r6FHR3su4KdpLAy7SxbM0NAAE9bGRjv9MrquGs+hvxPMupYXAQ9FRBgwSy3op1vo1xlRzfVIdx4DvpHC+eZ9B8FCuYKn3pMNvK8HnkGV8Jn79Mw1toP/+jlwvDj4GVk6AFSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785643490; c=relaxed/simple;
	bh=PHvjcmYMD6ushhXHQSLb2vdkOmvlQzgKj38R2YKPye4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AsGfUwGokNwkwy4MwLn6gBCE5eRCDcJan/oArJwV09JjevmH2zJD8lGRj7auOR4JmVnOvNMNcVoijbQ3cBrbJu8R1J4L4OgEln67YL5N7DA/wBlDMKvz+xfjTigiwAV4Qbmgeup+y+SBfrct1utGYgetWxDgBImDiHsBb2Pw1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpWsHkmF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpWsHkmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785643488; x=1817179488;
  h=date:from:to:cc:subject:message-id;
  bh=PHvjcmYMD6ushhXHQSLb2vdkOmvlQzgKj38R2YKPye4=;
  b=HpWsHkmF0cUMoO+07Ib94WoNP5FWB/JNwEGLL7qMBo6PcmoS+awiYp4P
   MmABPs+1ZIjm2UeH557LTj6gZWDJ2x4znY9F7RoOU6eOFHr60VkDuitw6
   a7OCqsS4/+Rwy/ZsaKueRGmdZmyB+L3FXz2fkp5lu67qaSLwKGPO1FTHY
   JAo4VaVZQ3JF52LVNSCZIHV3ZsU3KMK445ZW1gU6hCEzM+dJ2Y4Yc2wAs
   P2e+EqHqaArhA0T4GKcLAqGf+55/OZDk13+gFwK2gcsLsWZNayIsQ8WZH
   UDdIYETfM0pg3wJOtXNjdTLFHYiQ+cyuxFSWx9hWKnjXy/5t2ENR/NlWs
   g==;
X-CSE-ConnectionGUID: AzmkGchNTIafoJt4QLgxHg==
X-CSE-MsgGUID: qdBtY2RgQk6VbvOEbll3rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86420563"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86420563"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:04:47 -0700
X-CSE-ConnectionGUID: t8dD55rKT0+eeqcxcny2ZQ==
X-CSE-MsgGUID: o1RFfYjAQqyKTIjDNcEUMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="264730556"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2026 21:04:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqNRM-000000004QX-0Rnw;
	Sun, 02 Aug 2026 04:04:44 +0000
Date: Sun, 02 Aug 2026 12:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/207 2/2]
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype
 for function 'mtk_xfi_tphy_valid_ctle'
Message-ID: <202608021106.c41tjA8x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/207
head:   a433dbf4c7c757ae352428dbd961d1034aa6856d
commit: dc5255ff11eef125710c5e5403a961b3219eb641 [2/2] phy: mtk-xfi: add mtk_xfi_tphy_valid_ctle for use in usxgmii driver
config: powerpc64-randconfig-002-20260802 (https://download.01.org/0day-ci/archive/20260802/202608021106.c41tjA8x-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608021106.c41tjA8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608021106.c41tjA8x-lkp@intel.com/

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
