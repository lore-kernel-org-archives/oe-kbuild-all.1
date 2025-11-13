Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147152D7386
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763027773; cv=none; b=OpxdIX1UmX8RjC9JB+jX+UgeOGI4UPJfnwom3UOnmriAcoGPeaBHVVC7Y+I1vUF+2jEQIBuaFaGyoN1/9hD5jWTt/5FvtehYY9MnFqIUGTQqClDdYosJzjSPb8vk+nAZWPPb1Pf5f7c++7/f7TqZ0qrSE2Yrr3Nhh1rVEkWvh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763027773; c=relaxed/simple;
	bh=XM0BFznQeEm+niLG25nWOqHe2ToLG4Mj5C02mjx9yy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a2p5o8ZL3NsxpDnCG1aU8amXmM8t1skGYg9Cdkfop7N1BUTSyoHX/AN7quIFpjHHD3RDKj9JBTiApYOQpuXfiRHmIqGD1dEEeTU/lInOf4xy4A2u7GrQKTcOnIgEg1N94UqXmB8m9grFwpEXvIRSrQDPYYiPo68xyuxpoq/YAzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5/yS9qX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5/yS9qX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763027771; x=1794563771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XM0BFznQeEm+niLG25nWOqHe2ToLG4Mj5C02mjx9yy4=;
  b=L5/yS9qXWzW8gFwtLKRKc7fPiISWdgAvGjFONUNkGBGaLTf9ALnHl3AJ
   myKbr8j/ma8i1B+Xp0DapM3WUPHp9dJupm3057aVF8SdXjHXh6FAnFgJD
   5vD2qgPCkpPJasYSKJLncYYRPqnoq/h2qQnoF/VUyzzkfsZYFq1bkoaxA
   6uxTaHKc+dCoUZTgiwXWLNTY7+vmXWyrwmor2FRkBmVYbFehVOcT7w3yo
   xivVuDvhZWNIU7bYIqyGv7673iWhgj+gjC17s13Hv8s85auUPol5sNvxR
   kWrA5Ex2v+A4zu0NzWhgXcnOmdHZo30+ZQegwLT/x6iC5DoOBlVu0MZHn
   g==;
X-CSE-ConnectionGUID: 5O1TYfymT026C/2rOrdsBQ==
X-CSE-MsgGUID: czR3QwR9SQe5QN/CpB+RZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="67703478"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="67703478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 01:55:51 -0800
X-CSE-ConnectionGUID: bd2tpCy1TDW6yGZirZgt5g==
X-CSE-MsgGUID: 8P05UABZRh+5/dZX3F50Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="194442448"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 01:55:50 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJU3Q-00058h-1M;
	Thu, 13 Nov 2025 09:55:48 +0000
Date: Thu, 13 Nov 2025 17:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 289/289]
 drivers/gpu/drm/mediatek/mtk_disp_dither.c:109:6: warning: no previous
 prototype for 'mtk_dither_set'
Message-ID: <202511131711.82VvJvz4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jay,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   207d9b4854da0b5e3534ed6b5379a00aeaac8ce0
commit: f12867625feef57b67579aef553133dfe5dd1bf2 [289/289] CHROMIUM: drm/mediatek: refactor dither module code
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251113/202511131711.82VvJvz4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131711.82VvJvz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131711.82VvJvz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:109:6: warning: no previous prototype for 'mtk_dither_set' [-Wmissing-prototypes]
     109 | void mtk_dither_set(struct device *dev, unsigned int bpc,
         |      ^~~~~~~~~~~~~~


vim +/mtk_dither_set +109 drivers/gpu/drm/mediatek/mtk_disp_dither.c

   108	
 > 109	void mtk_dither_set(struct device *dev, unsigned int bpc,
   110			    unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
   111	{
   112		struct mtk_disp_dither *dither = dev_get_drvdata(dev);
   113	
   114		mtk_dither_set_common(dither->regs, &dither->cmdq_reg, bpc, cfg,
   115				      DISP_DITHERING, cmdq_pkt);
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
