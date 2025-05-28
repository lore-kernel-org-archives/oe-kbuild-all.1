Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5391862
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461849; cv=none; b=CVtPfS6m3SdcjEpAEbDSZPCPQYGKzFnI+jMSZFa8wEn6DvDARzFF/I2KM27HFBwC8H/Sm1onYuAc5/vUhdOILNmyrL8ABRqGHfKYdhepmiUUOZgezpzgrwe3FDBKSnziqqi1L8lHEmXVrNwfVJko97KpmPLBUjQ3u4hO2zI3hj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461849; c=relaxed/simple;
	bh=IHk1seflRMDbgIP7lasH9tExZ0XtGJqWDRHYOTT2stE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iuh2yidtsAIR1hEM+abJrOtB+BwT0A0P+KHNxGY6cjppc321YwsvWi+G2txlUZvlh/+q+uudQZJSCET2YYtQf94iKXnTrBFBGaicU2hXKD6lBIc6AIjFlucjHNGcChNOPseBcYkh05tIJ4K8px5nPrqdfMuZlA/cKUWVj2ZZUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8QfqE9w; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8QfqE9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748461847; x=1779997847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHk1seflRMDbgIP7lasH9tExZ0XtGJqWDRHYOTT2stE=;
  b=S8QfqE9w7G5YtJ4JmphvzybInEVSNCbBJnx0Jw2FN9HHbXegfJcxgHFb
   jV9EZTSCppApUfh4C8LCjrwDevKP6T124PTKWSMsVytRrRQno3GF+DM20
   XbE54/ar6t7DUvnmUprlHDEm3daHZp/3Xfj7UHoKh0OzffzcCwdLP1/3c
   g4nhsmJ+5gp+ZxIAHOvw7S7C5F+UbvU/Ghx3sTV7o4CF6mc6+44cQYg4o
   8zi6aRRuVtjQa5qMtbkNWebCXIl0OQuZy9rXq4qDpvZ0aAWZsZ4BGVAi+
   PZrrhl0gL5uVEKKnIpcqbC1CN3ZuDDJS3ethKvuIMbhPClB7SgdF1XERF
   g==;
X-CSE-ConnectionGUID: NYnb2d4ZTRu6W4ntIXrqQQ==
X-CSE-MsgGUID: JLWNSG87QO2aDSuFKRIN7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50657989"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="50657989"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 12:50:46 -0700
X-CSE-ConnectionGUID: renvQIqIR3eEZZ1FIbgrMw==
X-CSE-MsgGUID: dil7/+fPRqWPum0+aVs5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="144324582"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2025 12:50:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKMnS-000W1g-2t;
	Wed, 28 May 2025 19:50:42 +0000
Date: Thu, 29 May 2025 03:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.15.y 12/42]
 drivers/gpu/drm/meson/meson_viu.c:81:13: warning:
 'meson_viu_set_g12a_osd1_matrix' defined but not used
Message-ID: <202505290349.mO4VCacC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.15.y
head:   62efa5294148d0ccb18203491839df4fb9dc18d1
commit: 22f24b89950763af305e8dbf488b023540767619 [12/42] (DO NOT MERGE) ODROID-COMMON: drm/meson: not load RGB709 to YUV709 coefficient
config: arm64-randconfig-004-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290349.mO4VCacC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290349.mO4VCacC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290349.mO4VCacC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/meson/meson_viu.c:81:13: warning: 'meson_viu_set_g12a_osd1_matrix' defined but not used [-Wunused-function]
    static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/meson_viu_set_g12a_osd1_matrix +81 drivers/gpu/drm/meson/meson_viu.c

bbbe775ec5b5da Neil Armstrong 2016-11-10   80  
2ccb8433ebe8dc YueHaibing     2019-04-13  @81  static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
2ccb8433ebe8dc YueHaibing     2019-04-13   82  					   int *m, bool csc_on)
728883948b0d3c Neil Armstrong 2019-03-25   83  {
728883948b0d3c Neil Armstrong 2019-03-25   84  	/* VPP WRAP OSD1 matrix */
728883948b0d3c Neil Armstrong 2019-03-25   85  	writel(((m[0] & 0xfff) << 16) | (m[1] & 0xfff),
728883948b0d3c Neil Armstrong 2019-03-25   86  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_PRE_OFFSET0_1));
728883948b0d3c Neil Armstrong 2019-03-25   87  	writel(m[2] & 0xfff,
728883948b0d3c Neil Armstrong 2019-03-25   88  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_PRE_OFFSET2));
728883948b0d3c Neil Armstrong 2019-03-25   89  	writel(((m[3] & 0x1fff) << 16) | (m[4] & 0x1fff),
728883948b0d3c Neil Armstrong 2019-03-25   90  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF00_01));
728883948b0d3c Neil Armstrong 2019-03-25   91  	writel(((m[5] & 0x1fff) << 16) | (m[6] & 0x1fff),
728883948b0d3c Neil Armstrong 2019-03-25   92  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF02_10));
728883948b0d3c Neil Armstrong 2019-03-25   93  	writel(((m[7] & 0x1fff) << 16) | (m[8] & 0x1fff),
728883948b0d3c Neil Armstrong 2019-03-25   94  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF11_12));
728883948b0d3c Neil Armstrong 2019-03-25   95  	writel(((m[9] & 0x1fff) << 16) | (m[10] & 0x1fff),
728883948b0d3c Neil Armstrong 2019-03-25   96  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF20_21));
6463d3930ba5b6 Stuart Menefy  2022-09-08   97  	writel((m[11] & 0x1fff),
728883948b0d3c Neil Armstrong 2019-03-25   98  		priv->io_base +	_REG(VPP_WRAP_OSD1_MATRIX_COEF22));
728883948b0d3c Neil Armstrong 2019-03-25   99  
728883948b0d3c Neil Armstrong 2019-03-25  100  	writel(((m[18] & 0xfff) << 16) | (m[19] & 0xfff),
728883948b0d3c Neil Armstrong 2019-03-25  101  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_OFFSET0_1));
728883948b0d3c Neil Armstrong 2019-03-25  102  	writel(m[20] & 0xfff,
728883948b0d3c Neil Armstrong 2019-03-25  103  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_OFFSET2));
728883948b0d3c Neil Armstrong 2019-03-25  104  
728883948b0d3c Neil Armstrong 2019-03-25  105  	writel_bits_relaxed(BIT(0), csc_on ? BIT(0) : 0,
728883948b0d3c Neil Armstrong 2019-03-25  106  		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
728883948b0d3c Neil Armstrong 2019-03-25  107  }
728883948b0d3c Neil Armstrong 2019-03-25  108  

:::::: The code at line 81 was first introduced by commit
:::::: 2ccb8433ebe8dc99ed7cd0e3b8ff6976dcc05e3d drm/meson: Make some functions static

:::::: TO: YueHaibing <yuehaibing@huawei.com>
:::::: CC: Neil Armstrong <narmstrong@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
