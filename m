Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF6E1591E0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 15:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725723774; cv=none; b=Va330Qk+Jkd2ZO7OywwV0rpCa6qyPatE0jPN/cM9t8kPKwBJQMVeGOEAU+qVvmcrS6LybNpqqUnd5OBnRUYS/mg1EesrCNITDnvTpZv1dU4TFwjgrTPejkchnGA6aZAgE15pJoX3m2bPWEp1OWCNQVdEjKFBr8eaKaFRFKM/348=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725723774; c=relaxed/simple;
	bh=eHfnrUpCPyWkD7O9QGA+YY2Ip934CYLikCEYffO9fzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HShv+3BXXOggJVvWnbLs6Xb3mn6N9dvKh13d8dVS+VPnr5uMPbnmGqLMaIkNCzPD6yCxSbgdb1hbVizWW7lQk3/duZEZ/gaCsNL2HDsxCB6++1CTKLWVvwB9s9zpJPXkBIOd0puuUqsOoXAglqOf8vPNe6lL5B118RIgmcYIwL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSguT0qy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSguT0qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725723772; x=1757259772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eHfnrUpCPyWkD7O9QGA+YY2Ip934CYLikCEYffO9fzI=;
  b=VSguT0qycgmqG+u1Jo37nGOHU/6JzoDvXYQ3yBvVFmNDDeOY6zECvWKP
   si9y6BcBBOS35gbQVhpiuRcOk6y+QxvNph/8qMJlpNkQk4qGqt+kvqaw+
   jkO5j/aJWd6W483OuvdJyHQar6h0lyXaAgCy/Ti2i9UDLH7HXZABYkWVN
   CjLMn8xVOgCPLc8AdWApVMbxuJBzDeoA9MOGuMRXTHFrEYkcTD4qfSo21
   9ptUPaVlvPQiVEMhmOAeqN64Zq7pSHVYEuBatP/0RFpMnUxybZkEtcVdK
   vhUxKL432Ya6xRd2a9ivtI6msrec89FGZy7Prc+fjteIzyq/ojc893QDc
   w==;
X-CSE-ConnectionGUID: 1EvOj38WT92lYavo6d5tlw==
X-CSE-MsgGUID: fShZht0sSDiV602/ccUkZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24331291"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24331291"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 08:42:51 -0700
X-CSE-ConnectionGUID: DWQK7G+RQtOoOtdrOu0LJA==
X-CSE-MsgGUID: gIfkzEZsQMOZdJKpIx0L6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66264321"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Sep 2024 08:42:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smxaK-000Cf5-1J;
	Sat, 07 Sep 2024 15:42:48 +0000
Date: Sat, 7 Sep 2024 23:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.6.y 25/82]
 drivers/gpu/drm/meson/meson_viu.c:81:13: warning:
 'meson_viu_set_g12a_osd1_matrix' defined but not used
Message-ID: <202409072337.5FINnn4j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c970a63609188f53cf758a3dcd395e777150a29a
commit: b21b1dd3cb69f9e86370f5cd26fd733530928717 [25/82] ODROID-COMMON: drm/meson: not load RGB709 to YUV709 coefficient
config: arm64-randconfig-003-20240907 (https://download.01.org/0day-ci/archive/20240907/202409072337.5FINnn4j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072337.5FINnn4j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409072337.5FINnn4j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/meson/meson_viu.c:81:13: warning: 'meson_viu_set_g12a_osd1_matrix' defined but not used [-Wunused-function]
      81 | static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
