Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733EA42A82
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771068026; cv=none; b=UnRsgI0aAJ4plwgC2atbeZZSFWOz4B3WfAnoGgKU2bHnOVshGa/bjuoTjk8skP/vwVgjbvHXvtQ83ctVL7KsK/ZXcfff9VfUZKOjcd3/ww6Uq71XzgOQkjjP91/AxDViHtDMz36QLTw2DZ3Mi0L8NftYeLSbJQQxh9AJh/9xpI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771068026; c=relaxed/simple;
	bh=eBMyZAb4v3t4qWyLvAqrXhcx9QOqOiPb6xoHn7VT5Wg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ND4gz0nRwBtDDxm6MvDOZGCYWaOJpJC0+GJTT0pCcMQ/oSq4nMQwVFounx0k1iJkgFmvP2piR12yroaWF47uehMm44z6IzksRTClaIqiipGntepMkLzPGHjaluzp/Di/uG4lb5NgvuTuk+gmyBzYqfjddliLxSVbw7UEhtaaKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjKwBbNl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjKwBbNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771068026; x=1802604026;
  h=date:from:to:cc:subject:message-id;
  bh=eBMyZAb4v3t4qWyLvAqrXhcx9QOqOiPb6xoHn7VT5Wg=;
  b=VjKwBbNlpu/VpPrgGfD9QKGuMecR4RD1tYG7Tv/LFA2vkaBP+wan+2L0
   KHOWNRRCNwHe1u3/omUY5laEU0pwjtprp25kQAQciMO+6chbxgUE/nkMw
   MP2qe9oga/0IlbuxoF6n36sghBwGimFUoxrHfuAAhCZLNJTmGDjXhmVR4
   ZBGaQXmG3GDe150mMrYFfnA5WmVALBp/36k83qvmIMHbcf10PDWI66GlZ
   WavpGlh8vSxOU4HFqJnxSucipbFM4NGS8JJ9ngJPFhXoSIZPlo/fRmWGw
   GyCj2ogfaE247wTqEm0diGIf7K0b8I2O7mPBFv5Kn5MMd67Co0f6O7pOe
   A==;
X-CSE-ConnectionGUID: 9iAGVtb9QX2whi9Y90+IPg==
X-CSE-MsgGUID: nm9eY7ITQbmYbu4CDin6GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71432780"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71432780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 03:20:25 -0800
X-CSE-ConnectionGUID: UzFvvSV+RvGsdG7OKdwWtw==
X-CSE-MsgGUID: U4tRQUEDTWqzO93e75D4bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="212539065"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2026 03:20:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrDhF-00000000wTg-0oTn;
	Sat, 14 Feb 2026 11:20:21 +0000
Date: Sat, 14 Feb 2026 19:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 243/1266]
 drivers/gpu/drm/xlnx/xlnx_sdi.c:252:9: error: implicit declaration of
 function 'writel'
Message-ID: <202602141933.2hffjqX8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Saurabh,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   343f487d634122b137e2b1491d0c7fe1fb876c2e
commit: 6126d5c7f967fcef16227b5d83850832d0984135 [243/1266] drm: xlnx: sdi: Adding sdi-tx driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260214/202602141933.2hffjqX8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141933.2hffjqX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141933.2hffjqX8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_sdi.c: In function 'xlnx_sdi_writel':
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:252:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
     252 |         writel(val, base + offset);
         |         ^~~~~~
   drivers/gpu/drm/xlnx/xlnx_sdi.c: In function 'xlnx_sdi_readl':
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:257:16: error: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
     257 |         return readl(base + offset);
         |                ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_PANEL_SIMPLE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=y] && PM
   Selected by [y]:
   - DRM_XLNX_DSI [=y] && HAS_IOMEM [=y] && DRM_XLNX [=y]


vim +/writel +252 drivers/gpu/drm/xlnx/xlnx_sdi.c

   249	
   250	static inline void xlnx_sdi_writel(void __iomem *base, int offset, u32 val)
   251	{
 > 252		writel(val, base + offset);
   253	}
   254	
   255	static inline u32 xlnx_sdi_readl(void __iomem *base, int offset)
   256	{
 > 257		return readl(base + offset);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
