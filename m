Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D3E14267
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 23:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705793341; cv=none; b=RaoEEPlLmpxForMCbsg1+qfsPJuKGSwV/P5+dGqsZPohiGhvKXMsNWtdQUN2xt6v/7k9qdE0+X1NrZ90vMyQjJ26R1WBoClMQwPHa4s3EgkSag/Lr70zLAEchkheUm/XbbGgZfr6VeiCXbvDuZw0PnDnEwUWjp2ljXB7hJRLHbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705793341; c=relaxed/simple;
	bh=HC9hJRwXuKtENwyUMW+EjaIQgN/ZLYyG2Myq+85NIok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGGBLQ4jO9TkTcNU5LOGsDrrZonvoKzK9kTDrY0SbHLtMUBcFNib+FuypsBAjnXay0MX7r480kJ9zxf+fNU/7oAdPQoLfcQT5cE2+4hE2BZt9gF2Ikibei9JWEZT5r//CQQji78njULwD5kffi04d5ojyW0IkaxENl/pyewjHJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhwdYznY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhwdYznY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705793339; x=1737329339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HC9hJRwXuKtENwyUMW+EjaIQgN/ZLYyG2Myq+85NIok=;
  b=AhwdYznY49Ah5hS4jkrG/bNiQ88cflOM04oVbCs+I2oDbKl2LFy7KRm/
   YlnX9Ou5sU622a1PZaNU0AjFDruW/WCfqfy5G/vojTEy5bG/l8FFjwxQ/
   ZsILTum9CyCVDHnPTqiinSd9zN6yrPwtRgqPRnUeF5jgxhQT/atCdBsGR
   liLTGaq/3G4XJWuxJERE+aZqNTepBOSwVedFXkTutUzFktYsDHuZmtoYR
   3DkGntEAdpTslWQlIp7THFkVuoKWGklxa9amD49uFx26dZ6mBkAMQE32V
   FAOfMQX4bL/8l2OVJT8tLQSaAjhY4H5kOhCoY+wZ4lpm9Z7ArJ3ERXRp0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="14493175"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="14493175"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 15:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="855623207"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="855623207"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2024 15:28:56 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRKli-0005WS-1L;
	Sat, 20 Jan 2024 23:28:54 +0000
Date: Sun, 21 Jan 2024 07:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 40/91]
 drivers/gpu/drm/meson/meson_viu.c:81:13: warning:
 'meson_viu_set_g12a_osd1_matrix' defined but not used
Message-ID: <202401210742.J0D6bu0C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   4abe38fb1d55e2c5f10582404c5ff88505060b73
commit: 390ce5fc2874737218d6a2a8a74208c61a93793b [40/91] (DO NOT MERGE) ODROID-COMMON: drm/meson: not load RGB709 to YUV709 coefficient
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240121/202401210742.J0D6bu0C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210742.J0D6bu0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210742.J0D6bu0C-lkp@intel.com/

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
