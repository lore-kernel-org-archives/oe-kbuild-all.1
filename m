Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192D77081E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612336; cv=none; b=aD0apObKmh9NAT2pA06oRwMRkRayvJ1Ve9kB44c2pppV3SkasW1hsO8dMnhZ4Yb9yhBuX9R49KLjRvSnj7yBW2F9uAQJsLSvTd0efL11sRg6VoMSXA6ymJX95cD5tbe3Wprm50acnaR0iy1wi4bLtQFoEoWP1ysoDZWT0/K2v10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612336; c=relaxed/simple;
	bh=QypQoRz5H7FcPdIJvEhWouBflviRhyuL6gYEpx0yttI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4kCUY87r43Oqv5+iegtY/ZJRZ/O1Zi1L0lIr0MXmftBTwanDZ4twHtaGRU5o3uydgrnEup8YK86HoidSeOFcGNL/bq/oyOT/vvmZWdhqs3YJSFZcueimB4ICR0jwqS70Km1ATAIMNC32P6L9hSf2/+B/VbKjqPFKjAlYhQMk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/6GcEpr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/6GcEpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738612335; x=1770148335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QypQoRz5H7FcPdIJvEhWouBflviRhyuL6gYEpx0yttI=;
  b=B/6GcEpr5q3gSVLQhcXhCYIv/j19BdLfu4RLleJlFL70tjjVeuXYDfGN
   gBSCBiRMhrQDnAia/ymLprxcbOT5Ifg+AJ2XW0lDVFzkAg5N8SgR0goHu
   G1PvU8NwU8qZHdO1SflxdyA8G/hoxuv2TLSmRkkYmpmMdY9gL5o9DeGPd
   tXvrcu1uxapstQr8o6po7wlx5vxaSIxZIUM2pbyJ0aOHJM0T+YCgJjaci
   xZta++QEbWNQpq7lbbaRzb42VJujSs+VI7q+oSchsN4shug/B/QiLhBVI
   F70Q/gJqtwvFG4ujbXEsYwVBq15IgH1w/laRqmdm0fQHMklP66D9tIv7G
   g==;
X-CSE-ConnectionGUID: OEYh9h8/SVSuusRfJKKdKw==
X-CSE-MsgGUID: BmA/N6MVQCimgCcKyl8KdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50510470"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="50510470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 11:52:14 -0800
X-CSE-ConnectionGUID: 3f4i/RQCRGymgspZOwsUKA==
X-CSE-MsgGUID: MdgtCskWSvKU30LncXKvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111226758"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2025 11:52:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2UN-000rPn-1t;
	Mon, 03 Feb 2025 19:52:11 +0000
Date: Tue, 4 Feb 2025 03:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 169/169]
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c:77:2: error: call to undeclared
 function 'mtk_crtc_read_crc'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202502040334.YkN5QALM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c65c7bbfa145ae7df24f5e9b4de74a7fbaaac6c5
commit: b7c8e781f020aabd1461232257632f4c04ba97ca [169/169] CHROMIUM: drm/mediatek: Add CRC support for MT8196
config: i386-buildonly-randconfig-005-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040334.YkN5QALM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040334.YkN5QALM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040334.YkN5QALM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:77:2: error: call to undeclared function 'mtk_crtc_read_crc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |         mtk_crtc_read_crc(&priv->crc);
         |         ^
   1 error generated.


vim +/mtk_crtc_read_crc +77 drivers/gpu/drm/mediatek/mtk_disp_outproc.c

    72	
    73	void mtk_disp_outproc_crc_read(struct device *dev)
    74	{
    75		struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
    76	
  > 77		mtk_crtc_read_crc(&priv->crc);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
