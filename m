Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C800156237
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717289; cv=none; b=HENtgJwC3cTnr5k53+6KdjZGTdrZnU4ri8vNG5AU4B6o9v6aBik5yXZz5DcpL+3plbSW9DMNCLlRZmYPIqULoVnuD2a77SRm1Mria6vguI0H70vMa3Q8F4xGUXEegxz7U5rrUaSkkctbtulIDYH/8v6uuWefJXymsFiYSvelI90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717289; c=relaxed/simple;
	bh=6uRNV2BrL55Ti7hlOdKjkg9kaq3yV1TvzODZcWog9cU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WcBcpXIejHIbAG+p/gWKnyVu0bBNMGU5qBvPavPEA0sUCBOLlkCGnhLjVwZjlgRcnav0y+NK1fn4AiRf5Zpc5a5GvyloRJ6XJYw0SimJpjF2TZgTiW4NsnyoCl3iSNsbBIayxI1NSzfbBXcthMnuyftoowsV22uWM5rESSEhpHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmQHwJ0x; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmQHwJ0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717288; x=1765253288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uRNV2BrL55Ti7hlOdKjkg9kaq3yV1TvzODZcWog9cU=;
  b=JmQHwJ0xsvPXDXAVIMpeG4Hk8S5H0QEf4KR7vAfj20lXJqcz5PRrASVy
   km8v0MVHSaapSI503eXEwmiG1Cr+abPMmnsmhrtBJgrVORr4Mj0naD/XE
   KJxQjcvQlQSwL+dgfJIzWOr0gdDh5+xrZTP2PRNMVdAleyhZ/7MDxZUtX
   mKyZ0PeAaVzoxFwfpTlWe0WTOFAvD2Quil9FdoybeGxIxVosSuiT5HHL6
   c4eDBKNi2WCdHHG/WHDNzNdWj/TIkmAC816+1O3Dz5uSD6BoWGH8nZPba
   4QddkvLuMPjBqrSdoD2x5TT/SQ+JyFgg28cch2OFSibeNKuw/jMXO4BDr
   w==;
X-CSE-ConnectionGUID: WeBwUNtGSsSnUd/J6PbSoA==
X-CSE-MsgGUID: 6Q/I7DPkQqmRGJW0S3xoiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34121833"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34121833"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:08:07 -0800
X-CSE-ConnectionGUID: bwijhbxnRS60coq5sJSPYA==
X-CSE-MsgGUID: IwqDjl/CQBKyVU8dPDu4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99400243"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 20:08:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV3z-0003nD-1K;
	Mon, 09 Dec 2024 04:08:03 +0000
Date: Mon, 9 Dec 2024 12:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sandeep Patil <sspatil@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Alistair Delva <adelva@google.com>
Subject: sc2731_charger.c:undefined reference to `devm_usb_get_phy_by_phandle'
Message-ID: <202412071214.zhfDXtm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandeep,

FYI, the error/warning still remains.

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
date:   4 years, 8 months ago
config: x86_64-buildonly-randconfig-003-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071214.zhfDXtm5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071214.zhfDXtm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071214.zhfDXtm5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0xc38): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x1454): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
>> sc2731_charger.c:(.text+0xaa1): undefined reference to `devm_usb_get_phy_by_phandle'
>> ld: sc2731_charger.c:(.text+0xb56): undefined reference to `usb_phy_get_charger_current'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
