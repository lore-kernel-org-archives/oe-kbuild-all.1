Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74484A05
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 03:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740195702; cv=none; b=hSD8Rpl8ztfBCqijCFxUfBPy8kGs1vK4pg6dD8kMaX3pupQrZqnt5hcyyz/mLClW2bVhC9py8B8u6l+anUHJV57+Kkf1DxBhdiwNFW7bucPkoTNUpjp5GMrG+8l7VgnwnOGxC+fZysEyeIiZY/7bDtIqHacXIH2oo8wNp73HEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740195702; c=relaxed/simple;
	bh=qCaI18Y5SBJ9lKQIYrjvaNEA/R+le8EQnkw5fKIaNw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQXHWTRhnev4wxafoKjK0P3afc6ST8qWEcpdFYfgQ38g9CCXZ1mDOXz4iRpAgfIYzAtbPHJZOKj24pFT9mkSjDAW22lhDbQAQnmerj1/Dn1XiZ/kJL893P0DhVt38Aya5a479b20UIXcnqwwbX5nxqguGeb7R5BXnwAUX836Y70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6N/4SMn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6N/4SMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740195701; x=1771731701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qCaI18Y5SBJ9lKQIYrjvaNEA/R+le8EQnkw5fKIaNw4=;
  b=U6N/4SMnQGLsy6J65200TZZCBkgQFgq/49K4NTdupyYaso9RS6bdw4SQ
   26wn7nXLrNgJrbMf5lxUbifubFCOoZsC31WPt462bgP5J1Ut/55wbZPOR
   bsjz9JBjf42mWnFjFwLTFC1Xn4X4gV/5C4ApSi01EXgmace5oadZhG1Mk
   iNpjYJyuOkt4XgNvjsgquEE3RKy1yBOYlL9hq2fJ5Vq3vTWPSuJTtK7ae
   tPsug0Q5O3qmRoZvGfM1nKbmsGBOQPoGmeoPY8EMClcrm909LtXf2xr5W
   S9NOtjU0RqshhoLxu7E1DOYO2LkNcOahqMXXLP2wCiOZlS9JSHVDPY5DP
   A==;
X-CSE-ConnectionGUID: Nsk5hqheTymwpT+84I48NA==
X-CSE-MsgGUID: AwvafBuxRSerc74hafAT5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44935354"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="44935354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 19:41:40 -0800
X-CSE-ConnectionGUID: T6vidcSURY+NxTo+aSd6vA==
X-CSE-MsgGUID: EMcEY5JETXih5pyOIGx2Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="116172853"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Feb 2025 19:41:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlgOR-0006HP-35;
	Sat, 22 Feb 2025 03:41:33 +0000
Date: Sat, 22 Feb 2025 11:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:b4/acpm-debugfs 4/4]
 drivers/firmware/samsung/exynos-acpm.c:139: warning: Function parameter or
 struct member 'mbox_dbg_chan' not described in 'acpm_match_data'
Message-ID: <202502221112.fZH4hBWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day b4/acpm-debugfs
head:   bafe7f9a113167725d05a697c67c199f0be52748
commit: bafe7f9a113167725d05a697c67c199f0be52748 [4/4] firmware: samsung: add ACPM debugfs support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250222/202502221112.fZH4hBWQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221112.fZH4hBWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221112.fZH4hBWQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/firmware/samsung/exynos-acpm.c:139: warning: Function parameter or struct member 'mbox_dbg_chan' not described in 'acpm_match_data'
>> drivers/firmware/samsung/exynos-acpm.c:139: warning: Excess struct member 'debug_chan' description in 'acpm_match_data'
--
>> drivers/firmware/samsung/exynos-acpm-debugfs.c:206: warning: expecting prototype for logb_gprio_level_get(). Prototype was for acpm_logb_gprio_level_get() instead
>> drivers/firmware/samsung/exynos-acpm-debugfs.c:238: warning: expecting prototype for logb_gprio_level_set(). Prototype was for acpm_logb_gprio_level_set() instead
>> drivers/firmware/samsung/exynos-acpm-debugfs.c:325: warning: Function parameter or struct member 'acpm' not described in 'acpm_debugfs_register'
--
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/firmware/samsung/acpm-protocol.ko] undefined!


vim +139 drivers/firmware/samsung/exynos-acpm.c

a88927b534ba18 Tudor Ambarus 2025-02-13  130  
a88927b534ba18 Tudor Ambarus 2025-02-13  131  /**
a88927b534ba18 Tudor Ambarus 2025-02-13  132   * struct acpm_match_data - of_device_id data.
a88927b534ba18 Tudor Ambarus 2025-02-13  133   * @initdata_base:	offset in SRAM where the channels configuration resides.
bafe7f9a113167 Tudor Ambarus 2025-02-14  134   * @debug_chan:		mailbox channel number used for ACPM debug.
a88927b534ba18 Tudor Ambarus 2025-02-13  135   */
a88927b534ba18 Tudor Ambarus 2025-02-13  136  struct acpm_match_data {
a88927b534ba18 Tudor Ambarus 2025-02-13  137  	loff_t initdata_base;
bafe7f9a113167 Tudor Ambarus 2025-02-14  138  	unsigned int mbox_dbg_chan;
a88927b534ba18 Tudor Ambarus 2025-02-13 @139  };
a88927b534ba18 Tudor Ambarus 2025-02-13  140  

:::::: The code at line 139 was first introduced by commit
:::::: a88927b534ba18019b0440cf3d7f068407b5250c firmware: add Exynos ACPM protocol driver

:::::: TO: Tudor Ambarus <tudor.ambarus@linaro.org>
:::::: CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
