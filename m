Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48083624B0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139477; cv=none; b=A0Oc4DbTuVTRpTJdc2U3PMFDWYpMjmogBuPadHdBl/1jkzOJVQl5cFY+ucMf/FkY2goVqvwnpMvCjsLSOe3QfmPJI4A/vRxbPKn3+dvdrUr+e5NCAX9PKjPP2fhYwbhRYcS5phtQqY4htlytU2GrOIvluExqWi/EF5nma9TSAA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139477; c=relaxed/simple;
	bh=J7tKVXhyeb9RcsHBpYq1nAoPBgChL6krqFpt5UUcemE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BoQHCw24Pa5i5U+ccJ8+q7RlvxgucBcNRVqIN0vTXOQIqmiRBD2mA1sANKah8dRKxE6tYlh1buEw+heWG9ZIlGG3TawzOlvv5F02Hf6Wtej66TKMeD/ZI5nfQInxp3itQb2ZKp3MC1sP1TrbGAttqigfAa6j3wRRtSOgBpOLClU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2yTKyNH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2yTKyNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778139475; x=1809675475;
  h=date:from:to:cc:subject:message-id;
  bh=J7tKVXhyeb9RcsHBpYq1nAoPBgChL6krqFpt5UUcemE=;
  b=d2yTKyNHpvCGBjtiihBR7kFysXukgaH1/oueANb3gl6E6UOEp4bvF9tG
   7DLQsqd0b0VQPtipiMI4X0QAXGu2EsN8LUo5sbGTfob4wIzc2N25CtFbY
   v3ueGf/PXpX3UIz3Hda8RdY7Bb2K4vIuQZOwevIUrvhLhyKwigDtRf/pB
   D5kpDY3sVY78daE5lfQCL0gVDNJxbGzKw0gcf4IwhPpvobN4X6LbWXObz
   h8ETKSGouztvDdmz4ayHk7zKCkNT/XodNOfcC+EUhTffJgn54GNPsQ0/N
   KyW1NhWf3Hb500MwfWXgnnLDxz6hbsX8BS4VLwtzSAHt9otgJTdy+jCG9
   Q==;
X-CSE-ConnectionGUID: +MvxptYSRV670TFbHPOaCA==
X-CSE-MsgGUID: qoKPt+gCS3yIBY281gdDPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79191527"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79191527"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 00:37:54 -0700
X-CSE-ConnectionGUID: WX3ftoUNTPeF5gggLvBc0Q==
X-CSE-MsgGUID: qYGWrH5CSRK08OAX7ucrpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="235537655"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2026 00:37:52 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKtIs-0000000006R-2QPk;
	Thu, 07 May 2026 07:37:50 +0000
Date: Thu, 07 May 2026 15:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 156/157]
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype
 for function 'mtk_xfi_tphy_valid_ctle'
Message-ID: <202605071519.bwOOXfLz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: 062d4ec22c7baf7ffd88056f69a1bcdf27cb27da [156/157] phy: mtk-xfi: add mtk_xfi_tphy_valid_ctle for use in usxgmii driver
config: powerpc64-randconfig-001-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071519.bwOOXfLz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071519.bwOOXfLz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071519.bwOOXfLz-lkp@intel.com/

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
