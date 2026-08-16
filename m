Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599DA3C0A09
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 19:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909050; cv=none; b=i3D9zOrpXNO3wQMuE2nh45lYUKcKrtz5GkNgekKhQW+WF6iV16weKMrt48E/Ga2aXS3/c2xBGmHXhW4Kcu90qFmVKUSf2BoHA6iDgYDJaNdAfY02quC+fmmCTKEVS0tGPsKG/uEtejPUCk/39SldIToh/ynTRma7EfmIcPxjOcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909050; c=relaxed/simple;
	bh=CnrXjJZl16h6sjUMPByZym1rW8nYJW7wjfR5SUt/PRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nU7nuz9CQP/X+72zKCrMIv8VT8tYDMXc2ELkcHKvENi1ZJSUvOPCZMoP5+bIuQt2A3wQd94e9nLfLypdfIj7CDyifmvjBJpwEzyoj8tptimwYbubVPD1eC0dagBZrGAt4omAv+ZH/WzFIC9cbMs/NG2kOyhIdby89ZmMzLtneM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pqm+I9PI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pqm+I9PI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786909048; x=1818445048;
  h=date:from:to:cc:subject:message-id;
  bh=CnrXjJZl16h6sjUMPByZym1rW8nYJW7wjfR5SUt/PRM=;
  b=Pqm+I9PIU65Q75TvhuPNNTqNdDE3bjj8zQNlY4eo7FrXrEKKgqa4PrYT
   MtBkynRHJj3/G4Q0VK9GvDMiwJVTvUpHcguabDOaeuzwZoUjTEvfPrn3n
   /UDsI2H+UWb39e3S50vy9g9gNBnsdAHifwYIGr0ZWmvSVss5HF7gXmO2U
   CE+kxqyIK0nBc+KK0WoNmVyBce44EXOM6qt3aDh/+Vv13KsH0FjUoVdDS
   m/vpu3fhDi1/xVqE8tWbAPqsSuTz3Vy96UP3N1Grsz+hIQzZqeMWQgRab
   Eqm77LEqPBQ1wnBbgtDQem2Gkro3gj8P7DmLnQZezTO6nsG+LxhGtN+Kk
   A==;
X-CSE-ConnectionGUID: 4l8TWTV1QBSxlRyI+CsdEw==
X-CSE-MsgGUID: QtnQ/BqHToG63GAHSqmp9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91208665"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91208665"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 12:37:28 -0700
X-CSE-ConnectionGUID: nV8t2L3DSi6j4jrufTn84Q==
X-CSE-MsgGUID: owRCc+OeTo2RcLT492OThw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="264766524"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2026 12:37:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvgfb-00000000d4f-2vG8;
	Sun, 16 Aug 2026 19:37:23 +0000
Date: Mon, 17 Aug 2026 03:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 114/217]
 drivers/regulator/da9055-regulator.c:534:15: error: too many arguments to
 function 'da9055_gpio_init'
Message-ID: <202608170503.dqOGRyEa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 158b19afd623da6a93d8ac59dd4aeefe48fa2085 [114/217] mfd: da9055: remove pdata based probing
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260817/202608170503.dqOGRyEa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170503.dqOGRyEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170503.dqOGRyEa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/da9055-regulator.c:77:26: error: field 'reg_rselect' has incomplete type
      77 |         enum gpio_select reg_rselect;
         |                          ^~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_voltage_sel':
   drivers/regulator/da9055-regulator.c:208:39: error: 'NO_GPIO' undeclared (first use in this function)
     208 |         if (regulator->reg_rselect == NO_GPIO) {
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c:208:39: note: each undeclared identifier is reported only once for each function it appears in
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_suspend_voltage':
   drivers/regulator/da9055-regulator.c:248:39: error: 'NO_GPIO' undeclared (first use in this function)
     248 |         if (regulator->reg_rselect == NO_GPIO) {
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:269:39: error: 'NO_GPIO' undeclared (first use in this function)
     269 |         if (regulator->reg_rselect == NO_GPIO)
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
   drivers/regulator/da9055-regulator.c:282:39: error: 'NO_GPIO' undeclared (first use in this function)
     282 |         if (regulator->reg_rselect == NO_GPIO)
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_gpio_init':
   drivers/regulator/da9055-regulator.c:466:42: error: 'pdata' undeclared (first use in this function); did you mean '_data'?
     466 |                 regulator->reg_rselect = pdata->reg_rsel[id];
         |                                          ^~~~~
         |                                          _data
   drivers/regulator/da9055-regulator.c:417:33: warning: parameter 'id' set but not used [-Wunused-but-set-parameter]
     417 |                             int id)
         |                             ~~~~^~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/regulator/da9055-regulator.c:9:
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_probe':
   include/linux/stddef.h:8:14: error: passing argument 4 of 'da9055_gpio_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/regulator/da9055-regulator.c:534:64: note: in expansion of macro 'NULL'
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |                                                                ^~~~
   drivers/regulator/da9055-regulator.c:417:33: note: expected 'int' but argument is of type 'void *'
     417 |                             int id)
         |                             ~~~~^~
>> drivers/regulator/da9055-regulator.c:534:15: error: too many arguments to function 'da9055_gpio_init'
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |               ^~~~~~~~~~~~~~~~
   drivers/regulator/da9055-regulator.c:414:12: note: declared here
     414 | static int da9055_gpio_init(struct device *dev,
         |            ^~~~~~~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:274:1: warning: control reaches end of non-void function [-Wreturn-type]
     274 | }
         | ^
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
   drivers/regulator/da9055-regulator.c:287:1: warning: control reaches end of non-void function [-Wreturn-type]
     287 | }
         | ^


vim +/da9055_gpio_init +534 drivers/regulator/da9055-regulator.c

   510	
   511	static int da9055_regulator_probe(struct platform_device *pdev)
   512	{
   513		struct regulator_config config = { };
   514		struct da9055_regulator *regulator;
   515		struct da9055 *da9055 = dev_get_drvdata(pdev->dev.parent);
   516		int ret, irq;
   517	
   518		regulator = devm_kzalloc(&pdev->dev, sizeof(struct da9055_regulator),
   519					 GFP_KERNEL);
   520		if (!regulator)
   521			return -ENOMEM;
   522	
   523		regulator->info = find_regulator_info(pdev->id);
   524		if (regulator->info == NULL) {
   525			dev_err(&pdev->dev, "invalid regulator ID specified\n");
   526			return -EINVAL;
   527		}
   528	
   529		regulator->da9055 = da9055;
   530		config.dev = da9055->dev;
   531		config.driver_data = regulator;
   532		config.regmap = da9055->regmap;
   533	
 > 534		ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
   535		if (ret < 0)
   536			return ret;
   537	
   538		regulator->rdev = devm_regulator_register(&pdev->dev,
   539							  &regulator->info->reg_desc,
   540							  &config);
   541		if (IS_ERR(regulator->rdev)) {
   542			dev_err(&pdev->dev, "Failed to register regulator %s\n",
   543				regulator->info->reg_desc.name);
   544			return PTR_ERR(regulator->rdev);
   545		}
   546	
   547		/* Only LDO 5 and 6 has got the over current interrupt */
   548		if (pdev->id == DA9055_ID_LDO5 || pdev->id ==  DA9055_ID_LDO6) {
   549			irq = platform_get_irq_byname(pdev, "REGULATOR");
   550			if (irq < 0)
   551				return irq;
   552	
   553			ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
   554							da9055_ldo5_6_oc_irq,
   555							IRQF_TRIGGER_HIGH |
   556							IRQF_ONESHOT |
   557							IRQF_PROBE_SHARED,
   558							pdev->name, regulator);
   559			if (ret != 0) {
   560				if (ret != -EBUSY) {
   561					dev_err(&pdev->dev,
   562					"Failed to request Regulator IRQ %d: %d\n",
   563					irq, ret);
   564					return ret;
   565				}
   566			}
   567		}
   568	
   569		platform_set_drvdata(pdev, regulator);
   570	
   571		return 0;
   572	}
   573	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
