Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857771AA781
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903242; cv=none; b=Ai0tE41mKSXOP34lbpIrMwxPEAgyLJJZd+nz5B17lLxhWJHrHPmZQgZcBYWwluxHP/JiSML9PUPvlZ+hG39TmyCvnamESuE1LZnG/wQPyl1GNFkynfxxffzUYON+RS2XpdwraCE6upERhKkweDJubYTCZPok3olGNB5Up+Pc4qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903242; c=relaxed/simple;
	bh=AQfZwAqY40FZvsrzZd+yrlxn5QkTvihmGjlo8bhWdg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npY4e0XmHYqQaGZxDmDAnKhLNFDz9rOTl0QtJLRilw8OsViBMz6Ilo67mIyUvEVragQvLprzvsVOyEXGEJ6Ht42n9sJMXKhxL7ez8RCzGvsrre04BcdmNJEykmZXesBjfgICZsDy6yOpuR6/GEgn8LK+cPRCiWeHT93jWxhUdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LimIg5SM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LimIg5SM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728903241; x=1760439241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQfZwAqY40FZvsrzZd+yrlxn5QkTvihmGjlo8bhWdg4=;
  b=LimIg5SMlvcqxRLj5hxnpyi+HGq21kRFyljox2pjpknLO94GJvXK8D+2
   fd9LaHdQ1+LSGZnw7eUWYk/VmYX5MsWO1L4eUaFH+71laPdmGVl8zDRmt
   O9gtxEDGXUrVq4WEn0le6+KJPc2DsGogZG3X9huPLKpXCltkmZnPBn22M
   dPAzJet1J8svrUyhnHp2FgfkXCppg4UXJX3dgHJtENhkMr76WYJunKp6L
   GOD8HuBgG201LqnOMwfGVst63emti3Y5R+IWt2DY8Rk6StpI0+KkkOV45
   1/PEqfU1Fu76JOfgdVz/6io3pRNlQD0pHb85Nvq/XDc6+ItLoRGQH7nzb
   A==;
X-CSE-ConnectionGUID: iMwNhVqeS3qA2DUlDDXqBg==
X-CSE-MsgGUID: oEKZ+Ue9R6aqeRup2utZsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28199081"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28199081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 03:54:00 -0700
X-CSE-ConnectionGUID: FKbkSxSjT3KiWl6dQrd2aQ==
X-CSE-MsgGUID: mZGNE9LURL6CaR/r2bwRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77636400"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Oct 2024 03:53:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Ii4-000FCS-2u;
	Mon, 14 Oct 2024 10:53:56 +0000
Date: Mon, 14 Oct 2024 18:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.6.y 25/88]
 drivers/gpu/drm/meson/meson_viu.c:81:13: warning:
 'meson_viu_set_g12a_osd1_matrix' defined but not used
Message-ID: <202410141807.zRNx1j9p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dongjin,

FYI, the error/warning still remains.

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   506d08468b830f4f71052cf0f23e9f1053f9c9b6
commit: b21b1dd3cb69f9e86370f5cd26fd733530928717 [25/88] ODROID-COMMON: drm/meson: not load RGB709 to YUV709 coefficient
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241014/202410141807.zRNx1j9p-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141807.zRNx1j9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141807.zRNx1j9p-lkp@intel.com/

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
