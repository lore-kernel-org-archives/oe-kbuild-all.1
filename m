Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2028051010
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 21:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6Cm6+e+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702330996; x=1733866996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufuEMiqijz/b3eLEaZJnFLOEV+hC35cYPPAzKe4F2PA=;
  b=F6Cm6+e+Z1xVC2VWz5crdbx6mMWTpkfnViLJIW5N32VJN5RnPFyx068Y
   AcwTTYdfjc0NxvyboMP5qK2NoKIIoC4i8pSk4xG91Y+zYVpxmIRSLR8FW
   hhTyBLjvbb6PKBYNAplOYYenK74JWlr2C6TPTmI0nO9nW8TYotBBHERV/
   IY0RhDTujhXuaCCoZJfwEyh7QQmCdATyRrLUpC2xOaSUIDKGGJ84AXPG1
   njcr+d6FCj/nHq4MBx16ehwzLllHJgqxSWICiFt2FLnt2ACOHKIx8uAyq
   g4kbT7eHCV9+cTxT+CG7v8/KlXM/k1qLcT7/lvb+WHOZNFL5xw+H5zD0j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1862481"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1862481"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 13:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722964429"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="722964429"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 13:43:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCo3K-000IV4-03;
	Mon, 11 Dec 2023 21:43:02 +0000
Date: Tue, 12 Dec 2023 05:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Luca Abeni <luca.abeni@santannapisa.it>
Subject: drivers/pinctrl/pinctrl-tb10x.c:786:21: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202312120534.7NDFPyWK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: aa5222e92f8000ed3c1c38dddf11c83222aadfb3 sched/deadline: Don't use dubious signed bitfields
date:   6 years ago
config: arc-randconfig-r121-20231111 (https://download.01.org/0day-ci/archive/20231212/202312120534.7NDFPyWK-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120534.7NDFPyWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120534.7NDFPyWK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-tb10x.c:786:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/pinctrl/pinctrl-tb10x.c:786:21: sparse:     expected void *base
   drivers/pinctrl/pinctrl-tb10x.c:786:21: sparse:     got void [noderef] __iomem *
>> drivers/pinctrl/pinctrl-tb10x.c:514:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:514:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:514:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:516:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:516:30: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:516:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:514:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:514:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:514:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:516:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:516:30: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:516:30: sparse:     got void *base
   drivers/pinctrl/pinctrl-tb10x.c:523:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:523:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:523:31: sparse:     got void *base
   In file included from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:16,
                    from include/linux/fs.h:22,
                    from include/linux/seq_file.h:11,
                    from include/linux/pinctrl/pinctrl.h:19,
                    from drivers/pinctrl/pinctrl-tb10x.c:23:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:159:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     159 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:126:39: note: in definition of macro '__setup_timer'
     126 |                 (_timer)->function = (_fn);                             31-      |                                       ^~~
   include/linux/timer.h: In function 'timer_setup_on_stack':
   include/linux/timer.h:167:39: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     167 |         __setup_timer_on_stack(timer, (TIMER_FUNC_TYPE)callback,
         |                                       ^
   include/linux/timer.h:133:39: note: in definition of macro '__setup_timer_on_stack'
     133 |                 (_timer)->function = (_fn);                             38-      |                                       ^~~

vim +786 drivers/pinctrl/pinctrl-tb10x.c

5aad0db1c1ebb0 Christian Ruppert 2013-10-15  758  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  759  static int tb10x_pinctrl_probe(struct platform_device *pdev)
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  760  {
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  761  	int ret = -EINVAL;
aa2c35e5a66194 Varka Bhadram     2014-10-21  762  	struct resource *mem;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  763  	struct device *dev = &pdev->dev;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  764  	struct device_node *of_node = dev->of_node;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  765  	struct device_node *child;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  766  	struct tb10x_pinctrl *state;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  767  	int i;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  768  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  769  	if (!of_node) {
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  770  		dev_err(dev, "No device tree node found.\n");
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  771  		return -EINVAL;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  772  	}
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  773  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  774  	state = devm_kzalloc(dev, sizeof(struct tb10x_pinctrl) +
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  775  					of_get_child_count(of_node)
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  776  					* sizeof(struct tb10x_of_pinfunc),
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  777  				GFP_KERNEL);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  778  	if (!state)
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  779  		return -ENOMEM;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  780  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  781  	platform_set_drvdata(pdev, state);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  782  	state->pinfuncs = (struct tb10x_of_pinfunc *)(state + 1);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  783  	mutex_init(&state->mutex);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  784  
aa2c35e5a66194 Varka Bhadram     2014-10-21  785  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15 @786  	state->base = devm_ioremap_resource(dev, mem);
86467ff2ddca94 Wei Yongjun       2013-10-21  787  	if (IS_ERR(state->base)) {
86467ff2ddca94 Wei Yongjun       2013-10-21  788  		ret = PTR_ERR(state->base);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  789  		goto fail;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  790  	}
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  791  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  792  	state->pingroups = tb10x_pingroups;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  793  	state->pinfuncgrpcnt = ARRAY_SIZE(tb10x_pingroups);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  794  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  795  	for (i = 0; i < TB10X_PORTS; i++)
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  796  		state->ports[i].mode = tb10x_pinctrl_get_config(state, i);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  797  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  798  	for_each_child_of_node(of_node, child) {
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  799  		const char *name;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  800  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  801  		if (!of_property_read_string(child, "abilis,function",
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  802  						&name)) {
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  803  			state->pinfuncs[state->pinfuncnt].name = child->name;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  804  			state->pinfuncs[state->pinfuncnt].group = name;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  805  			state->pinfuncnt++;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  806  		}
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  807  	}
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  808  
c3a6d9e0a37df7 Laxman Dewangan   2016-02-24  809  	state->pctl = devm_pinctrl_register(dev, &tb10x_pindesc, state);
323de9efdf3e75 Masahiro Yamada   2015-06-09  810  	if (IS_ERR(state->pctl)) {
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  811  		dev_err(dev, "could not register TB10x pin driver\n");
323de9efdf3e75 Masahiro Yamada   2015-06-09  812  		ret = PTR_ERR(state->pctl);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  813  		goto fail;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  814  	}
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  815  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  816  	return 0;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  817  
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  818  fail:
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  819  	mutex_destroy(&state->mutex);
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  820  	return ret;
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  821  }
5aad0db1c1ebb0 Christian Ruppert 2013-10-15  822  

:::::: The code at line 786 was first introduced by commit
:::::: 5aad0db1c1ebb0f5be79f0adbecc16a2f0259b21 pinctrl: add TB10x pin control driver

:::::: TO: Christian Ruppert <christian.ruppert@abilis.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
