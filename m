Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F149432E126
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 05:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777354114; cv=none; b=SrgGT2u58oC3diOZ43x5nbEO4+mbQftiIn1aytK9ftKjE+xO82SwK5Z/UZOKCT6MkVbmh3l+tQ9AOlgJ4nMG2YNpL3ki5Htn0lYt9kYDiR7NqQkh1pGZSO+Zqc3yTLKc8BkWpn9fjuR14h3M3FLhLTIfmZZtdKQ1k+DmqZ10SWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777354114; c=relaxed/simple;
	bh=1Ba2AhI8hbRDOB/NH312vQRy6Os76rIZPSf9va4Y55E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N/+6QKnBG7bgSSwy4A3f+I/VeyxuRMN8rhetZYozGtB1V5OpxW88/24OCr8EZ8MKvEC0vVO7dFcIRFIVVzHKTwHW2GOyVcv+CqHKDy73pxV4mo0f/A18vacJ1z41zYIvu6o7VVFGkEbL5UjUcKuumRdy+dIhhzuaxBXdq/grmYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLmbgEcH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLmbgEcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777354113; x=1808890113;
  h=date:from:to:cc:subject:message-id;
  bh=1Ba2AhI8hbRDOB/NH312vQRy6Os76rIZPSf9va4Y55E=;
  b=CLmbgEcHSJ8qvwvMM0IospZFzaM6F+IBgOCYzGPEjVXBuIHHaQji6hcf
   1PrSRBYCVwxT6YlnHBjJzyQjWvg8fU/pSz8IWUgkvHePByrJWILeo5Opa
   dhNkW4DI4DpE9H49OLgH/OUhlI47sSu1wwbcRbGX10zVtXc6kNEgwd6IW
   Q4xvpJj8jIY5jGQYBjzCqLx2kDjzKJTLXtTK+J66+dmmMO8JbC7MVoGgs
   FQMb+2UA/ig1Mh3mAT/EyUhA9COCW1pIW3pmajp12+gT1df8VUoQD8EN0
   tFflnO5cYmsDRk24g3cG6qomfY4gsJkfMMXgHozNzKILrVlBF200cCmbi
   Q==;
X-CSE-ConnectionGUID: tH7EId4ATRyLbx+fzXd7XA==
X-CSE-MsgGUID: 1JiG+dZPQY2vku0glrRRag==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="65782264"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="65782264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 22:28:32 -0700
X-CSE-ConnectionGUID: 1sTVBF1dRxiJAqtYG/DZCA==
X-CSE-MsgGUID: fJ6rkhfUT+Ox/jam1WW9gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="229284770"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 22:28:31 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHazk-000000009YS-1Lp9;
	Tue, 28 Apr 2026 05:28:28 +0000
Date: Tue, 28 Apr 2026 13:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: 
 drivers/media/i2c/tc358746.c:1279:(.text.tc358746_probe+0x4ac): undefined
 reference to `devm_clk_hw_register'
Message-ID: <202604281338.QFAJ2bBa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
commit: 4fbdd56edf1f0b3e338c90a011bbae1a677ac884 m68k: Enable dead code elimination
date:   10 months ago
config: m68k-randconfig-r062-20260428 (https://download.01.org/0day-ci/archive/20260428/202604281338.QFAJ2bBa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604281338.QFAJ2bBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4fbdd56edf1f ("m68k: Enable dead code elimination")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604281338.QFAJ2bBa-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
>> drivers/media/i2c/tc358746.c:1279:(.text.tc358746_probe+0x4ac): undefined reference to `devm_clk_hw_register'
>> m68k-linux-ld: drivers/media/i2c/tc358746.c:1285:(.text.tc358746_probe+0x4be): undefined reference to `of_clk_hw_simple_get'
>> m68k-linux-ld: drivers/media/i2c/tc358746.c:1285:(.text.tc358746_probe+0x4c6): undefined reference to `devm_of_clk_add_hw_provider'


vim +1279 drivers/media/i2c/tc358746.c

80a21da360516f Marco Felsch 2022-09-30  1256  
80a21da360516f Marco Felsch 2022-09-30  1257  static int tc358746_setup_mclk_provider(struct tc358746 *tc358746)
80a21da360516f Marco Felsch 2022-09-30  1258  {
80a21da360516f Marco Felsch 2022-09-30  1259  	struct clk_init_data mclk_initdata = { };
80a21da360516f Marco Felsch 2022-09-30  1260  	struct device *dev = tc358746->sd.dev;
80a21da360516f Marco Felsch 2022-09-30  1261  	const char *mclk_name;
80a21da360516f Marco Felsch 2022-09-30  1262  	int err;
80a21da360516f Marco Felsch 2022-09-30  1263  
80a21da360516f Marco Felsch 2022-09-30  1264  	/* MCLK clk provider support is optional */
80a21da360516f Marco Felsch 2022-09-30  1265  	if (!device_property_present(dev, "#clock-cells"))
80a21da360516f Marco Felsch 2022-09-30  1266  		return 0;
80a21da360516f Marco Felsch 2022-09-30  1267  
80a21da360516f Marco Felsch 2022-09-30  1268  	/* Init to highest possibel MCLK */
80a21da360516f Marco Felsch 2022-09-30  1269  	tc358746->mclk_postdiv = 512;
80a21da360516f Marco Felsch 2022-09-30  1270  	tc358746->mclk_prediv = 8;
80a21da360516f Marco Felsch 2022-09-30  1271  
80a21da360516f Marco Felsch 2022-09-30  1272  	mclk_name = "tc358746-mclk";
80a21da360516f Marco Felsch 2022-09-30  1273  	device_property_read_string(dev, "clock-output-names", &mclk_name);
80a21da360516f Marco Felsch 2022-09-30  1274  
80a21da360516f Marco Felsch 2022-09-30  1275  	mclk_initdata.name = mclk_name;
80a21da360516f Marco Felsch 2022-09-30  1276  	mclk_initdata.ops = &tc358746_mclk_ops;
80a21da360516f Marco Felsch 2022-09-30  1277  	tc358746->mclk_hw.init = &mclk_initdata;
80a21da360516f Marco Felsch 2022-09-30  1278  
80a21da360516f Marco Felsch 2022-09-30 @1279  	err = devm_clk_hw_register(dev, &tc358746->mclk_hw);
80a21da360516f Marco Felsch 2022-09-30  1280  	if (err) {
80a21da360516f Marco Felsch 2022-09-30  1281  		dev_err(dev, "Failed to register mclk provider\n");
80a21da360516f Marco Felsch 2022-09-30  1282  		return err;
80a21da360516f Marco Felsch 2022-09-30  1283  	}
80a21da360516f Marco Felsch 2022-09-30  1284  
80a21da360516f Marco Felsch 2022-09-30 @1285  	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
80a21da360516f Marco Felsch 2022-09-30  1286  					  &tc358746->mclk_hw);
80a21da360516f Marco Felsch 2022-09-30  1287  	if (err)
80a21da360516f Marco Felsch 2022-09-30  1288  		dev_err(dev, "Failed to add mclk provider\n");
80a21da360516f Marco Felsch 2022-09-30  1289  
80a21da360516f Marco Felsch 2022-09-30  1290  	return err;
80a21da360516f Marco Felsch 2022-09-30  1291  }
80a21da360516f Marco Felsch 2022-09-30  1292  

:::::: The code at line 1279 was first introduced by commit
:::::: 80a21da360516fa602f3a50eb9792f9dfbfb5fdb media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver

:::::: TO: Marco Felsch <m.felsch@pengutronix.de>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
