Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090C3E6DE6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149092; cv=none; b=hETMUtfQu98/AAHvtREBopb50fatNUJgOjPIkBxbGA/D/ZQJLstpWpZOCFDtLqy48R+wa/zJNJFiHbbMwN+i4iW8pbew7Z4cs3rZqiZvMTRer1eK8W+PYg4EzhGFtm2wvDTbBJW3rJP/MQPs0iINSJY7Th4LgAX91MXZYr9Jrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149092; c=relaxed/simple;
	bh=vg+GhWbun4rY2x0q57Lzr2bSBPWXLGNuTfCKZDPUUME=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yc5JRCRZsGZ8eaciDVYyOS4HGia2VMUi8nH1JqWSuLL5VKwX0R0wmax8g9ct42fI3OYwR7PKRNz+/SP8tT8CUUYsOoGE+RxLbymgHwCWd6wdFOALOLG9Jfrqz3e5Vmy+pQbrVacI0ERzjMd9b+v+bztsbk/ZiWhFVEnmKJDIaw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkQGZv7N; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkQGZv7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778149089; x=1809685089;
  h=date:from:to:cc:subject:message-id;
  bh=vg+GhWbun4rY2x0q57Lzr2bSBPWXLGNuTfCKZDPUUME=;
  b=CkQGZv7N88I5rusO98xfDPiyCfCsyMRFh2JKUAmTMvo9y/8ZG/L5YI9C
   5meiQroNAd5K3LIK+1qwsp9brT0q2+UEivHi/FtBI3wtoS98V2di54gPd
   vrg13rgdq/AYZwZROhzK0bm2aUonT78+NP/Mox8kGePCtqi4wh8ML/JeD
   r0lVkuAj/DQYNZK4CXeBHvVw4IN3AQUfAiTrkfczbdOZnc0cO+SdqUyjE
   SVQy/zoYTB7WhsUWvHH6ADdvARKnHxEt+d90wchUCqXRQAQbyNsKQWD7x
   tF9cBFI1ZEZOuKrZdDns5nfRlUBivZH/a6n+mu46tnCZYWu916mGeWitV
   g==;
X-CSE-ConnectionGUID: lTPNjQ+LT7qG4aeTnv2ZqQ==
X-CSE-MsgGUID: p2qpRnvfTZ2Ep+oCduW0UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96664046"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="96664046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 03:18:09 -0700
X-CSE-ConnectionGUID: s23ggqD3S5KJJuHW5y6QWA==
X-CSE-MsgGUID: JWnFdyPWRfK2sE3hgnBv4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236338041"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2026 03:18:08 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKvnw-000000000Aj-2XgE;
	Thu, 07 May 2026 10:18:04 +0000
Date: Thu, 07 May 2026 18:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 156/157]
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype
 for 'mtk_xfi_tphy_valid_ctle'
Message-ID: <202605071802.wAoTu5es-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: 062d4ec22c7baf7ffd88056f69a1bcdf27cb27da [156/157] phy: mtk-xfi: add mtk_xfi_tphy_valid_ctle for use in usxgmii driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260507/202605071802.wAoTu5es-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071802.wAoTu5es-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071802.wAoTu5es-lkp@intel.com/

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
