Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8592D1D6BB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781474756; cv=none; b=KexIQdq32pqY1/UHGEsIy7tB4cXhjrnp28K5Z2AUsy3Umx2OdfBWMuYHrSdzj41BZ/veOVHWWEXL1s7Y8+VI8zAsjjn1ZoXIuPz2ABDXsiNCLauOpDX9NWG9hfP1B883Khs3XmyJegNh+tvi90tu3zubQmWX2mJ8Kj+YyVdNnG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781474756; c=relaxed/simple;
	bh=aWbc8kZjD92BsrXE2/3BK9PLOchJe0TjPxrARU9CZKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nvzHXNJx8F6dDOIU2Lf3VfCiIspUR+zBx+ALFZQCVsHizP53pfXeeqSXSvwVJiXwbDueCeO0mSSHMz0zC/74Y4lil3l3sIdQJdUiJenyuH/qRkLSAru405pusGEho7hFCf6ObsEvvzNvpSopyGmPwU6wW4ijnqqyqWIdj4OglFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=da2dwbsT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="da2dwbsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781474755; x=1813010755;
  h=date:from:to:cc:subject:message-id;
  bh=aWbc8kZjD92BsrXE2/3BK9PLOchJe0TjPxrARU9CZKE=;
  b=da2dwbsThn8+KpgzqHeywyCsCCXWPDyqASDCffdIeOq7PBa+F8ti1gnH
   rdPhtbfGgVqHukT3SzoAOm0ulIpxUEMTJhhO5FC+6/YgNhvYGLhCDxT35
   qQCiYEzaivvGU3iD73FOzDMQfK5uIsSbxF1GOyL1/yYIxqO3Icg3kWAZR
   oSsxqD6wJdzXTw2BJgB8OC9CcAKcG5E7gOkpPimAAJfTnyFq+juCrlyXL
   JhFwLNpHzD96vod84PT9PHxPxwmoShyTze/ZPV9NyoFPi1i3ScnO0JcIm
   OxhofysCdYIe6uP23Nk1CNh4hcwQ9LtlET/tzED+NGV0ceWZQJl7qGOyC
   w==;
X-CSE-ConnectionGUID: yVAIp9wYTFuYxkxY9ZiLcg==
X-CSE-MsgGUID: OMr5Rd9ZSWWAPH06rr3apw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99637091"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="99637091"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 15:05:54 -0700
X-CSE-ConnectionGUID: TIbAZqeKT12F3cRMayvBUw==
X-CSE-MsgGUID: FSmI5JkqTy6xxxuG+5RKkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="243161544"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2026 15:05:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYsxh-00000000RE6-2rxz;
	Sun, 14 Jun 2026 22:05:49 +0000
Date: Mon, 15 Jun 2026 06:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202606150641.cbQ05ZMM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 1982621decaf788d0611fc291fe89b297b6e5510 pinctrl: Allow compile testing for K210, TB10X and ZYNQ
date:   12 months ago
config: s390-randconfig-r113-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150641.cbQ05ZMM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150641.cbQ05ZMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1982621decaf ("pinctrl: Allow compile testing for K210, TB10X and ZYNQ")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150641.cbQ05ZMM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse:     expected void *base
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     got void *base
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     got void *base
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     got void *base
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     got void *base
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse:     got void *base

vim +770 drivers/pinctrl/pinctrl-tb10x.c

5aad0db1c1ebb0 Christian Ruppert   2013-10-15  746  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  747  static int tb10x_pinctrl_probe(struct platform_device *pdev)
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  748  {
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  749  	int ret = -EINVAL;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  750  	struct device *dev = &pdev->dev;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  751  	struct device_node *of_node = dev->of_node;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  752  	struct device_node *child;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  753  	struct tb10x_pinctrl *state;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  754  	int i;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  755  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  756  	if (!of_node) {
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  757  		dev_err(dev, "No device tree node found.\n");
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  758  		return -EINVAL;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  759  	}
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  760  
d32aa74555575a Gustavo A. R. Silva 2019-06-06  761  	state = devm_kzalloc(dev, struct_size(state, pinfuncs,
d32aa74555575a Gustavo A. R. Silva 2019-06-06  762  					      of_get_child_count(of_node)),
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  763  			     GFP_KERNEL);
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  764  	if (!state)
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  765  		return -ENOMEM;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  766  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  767  	platform_set_drvdata(pdev, state);
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  768  	mutex_init(&state->mutex);
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  769  
4b024225c4a824 YueHaibing          2019-11-04 @770  	state->base = devm_platform_ioremap_resource(pdev, 0);
86467ff2ddca94 Wei Yongjun         2013-10-21  771  	if (IS_ERR(state->base)) {
86467ff2ddca94 Wei Yongjun         2013-10-21  772  		ret = PTR_ERR(state->base);
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  773  		goto fail;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  774  	}
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  775  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  776  	state->pingroups = tb10x_pingroups;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  777  	state->pinfuncgrpcnt = ARRAY_SIZE(tb10x_pingroups);
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  778  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  779  	for (i = 0; i < TB10X_PORTS; i++)
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  780  		state->ports[i].mode = tb10x_pinctrl_get_config(state, i);
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  781  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  782  	for_each_child_of_node(of_node, child) {
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  783  		const char *name;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  784  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  785  		if (!of_property_read_string(child, "abilis,function",
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  786  						&name)) {
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  787  			state->pinfuncs[state->pinfuncnt].name = child->name;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  788  			state->pinfuncs[state->pinfuncnt].group = name;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  789  			state->pinfuncnt++;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  790  		}
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  791  	}
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  792  
c3a6d9e0a37df7 Laxman Dewangan     2016-02-24  793  	state->pctl = devm_pinctrl_register(dev, &tb10x_pindesc, state);
323de9efdf3e75 Masahiro Yamada     2015-06-09  794  	if (IS_ERR(state->pctl)) {
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  795  		dev_err(dev, "could not register TB10x pin driver\n");
323de9efdf3e75 Masahiro Yamada     2015-06-09  796  		ret = PTR_ERR(state->pctl);
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  797  		goto fail;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  798  	}
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  799  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  800  	return 0;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  801  
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  802  fail:
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  803  	mutex_destroy(&state->mutex);
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  804  	return ret;
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  805  }
5aad0db1c1ebb0 Christian Ruppert   2013-10-15  806  

:::::: The code at line 770 was first introduced by commit
:::::: 4b024225c4a8245e6ecc66ce1df1eaf2ebeb4acb pinctrl: use devm_platform_ioremap_resource() to simplify code

:::::: TO: YueHaibing <yuehaibing@huawei.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
