Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349925;
	b=yxI/iFU0ppSLiVNrr0YMiyMu+vdzeDdDyhRzynUyk1lNDKMlmPsC0dbotTPTvEvaHdpx
	 AwnOJOmhV/Ih9veMsA5fYVyV+svoN6IK1L2H79uZezwzskM2JeVtgrxl8+r4oiJImWIBl
	 umc/w89eS8SNTqdSgPTSZR9bPsYG7FpYvh00RS2sD/UPlT1AYG2o5z8d9TsDuQBpp3R+F
	 pOT6TBGWGZ84ameKuxo6HT1Y9ZbsJrtns7FPKIUklmo7y3R/r5Ic1rakx8PnWuglfNkhg
	 jiiXBRE9CJ6O6g8ubtPrY+r4mJc25Ydu27CkQQQTZbL0zGMRxxk5+XwC1VI90qZF4kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349925;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+twLU9PDlhxTxyrMpFEc6SfYjZ3lxMtsNS2mEmMHCGE=;
	b=teTbp/9TnAy5IbaRAox2J7r7y2fBs7xeyjFVHgOqX42i8XZfECZiC1FcCEh4jx+7ZTmY
	 kaCfwYfHJPOufUv6kkV4r456er57fuTyYaR5fIACbXL1hUfEtbiNvWjbxkHmSEWMCoixY
	 A7R+XVagFmtf4Gtd8w7seT2+QBrhTdXyKo7+7ptMAgGJE5dL5pwKnf1DMU21T2dnB8Gl0
	 S7NmATKtGqDWAQWvbYZjUj+eNnbs5FnzAzrwpA6pPv+N6bReFNKkMvzG8/uazutN9EgVO
	 tbE8ykPvLAKaCVfPMTPf9qnDv3xPFGmRsZupwk+f0pZCstV7v5rFBIHugcAMEn0/WgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k2BykJ2r;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D761606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 22:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D761606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k2BykJ2r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794349925; x=1825885925;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TxYH3E2mM+T3HZ1jpprYmwadLZlzmBFqOfwd0DUg8bs=;
  b=k2BykJ2rSDmo8rGnivEepV7hG+M4/4OKIHGdk3QMu3Up+8MpFe+uszm0
   45KkQkDbRQZO/AcJ74lC0W8TpmEDOxcvz66JOfPcE9rCp0HtnAzVubIXw
   p/HzOYQ8Unn17o/lAHz8YBqiMCO10GfsquOiL9R6y1rMwkZ9hPes+uKWG
   LbG4R1e+rwrxopku/f3adVRwQrwHEUagFs2RZ/aYcF0vI3Ewg5wkF7Fzh
   stI0y4+SZKH8oHUcfDyGL2be7WWQvA009DTWbIsWCTK0b/AlojMyCntBm
   JR32noWRm7/r0sNUL7UD1hrLdnMvdjbtJRSlE4vOcrknpY234bnNsZxMC
   Q==;
X-CSE-ConnectionGUID: jPzI3oSFQwqYvSf3qn4bSw==
X-CSE-MsgGUID: fNFuflVMRUquvA1Didnjjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3010502"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3010502"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 14:32:04 -0800
X-CSE-ConnectionGUID: IyOtd5enTfOnVC2gRfQ88g==
X-CSE-MsgGUID: W4WkKqnFQL2HWPiLbwsxHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8131530"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 14:31:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQuNG-00000000xeI-448n;
	Tue, 10 Nov 2026 22:31:30 +0000
Date: Wed, 11 Nov 2026 06:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:fixes 1/3] drivers/pmdomain/imx/gpc.c:503:13:
 warning: 'imx_gpc_remove' defined but not used
Message-ID: <202611110618.ks5wA24B-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git f=
ixes
head:   29030cd58b1e7e788728bc5bf4ae3c44881b7bbc
commit: d7262971a2acc2a835d8727d6833a6f764f56124 [1/3] pmdomain: imx: gpc: =
remove all initialized power domains
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261111/=
202611110618.ks5wA24B-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261111/202611110618.ks5wA24B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110618.ks5wA24B-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from drivers/pmdomain/imx/gpc.c:11:
   drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_remove':
   drivers/pmdomain/imx/gpc.c:554:25: error: invalid storage class for func=
tion 'imx_gpc_driver_init'
     554 | builtin_platform_driver(imx_gpc_driver)
         |                         ^~~~~~~~~~~~~~
   include/linux/device/driver.h:294:19: note: in definition of macro 'buil=
tin_driver'
     294 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_p=
latform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/pmdomain/imx/gpc.c:7:
   drivers/pmdomain/imx/gpc.c:554:25: error: initializer element is not con=
stant
     554 | builtin_platform_driver(imx_gpc_driver)
         |                         ^~~~~~~~~~~~~~
   include/linux/init.h:265:55: note: in definition of macro '____define_in=
itcall'
     265 |                 __attribute__((__section__(__sec))) =3D fn;
         |                                                       ^~
   include/linux/init.h:275:9: note: in expansion of macro '__unique_initca=
ll'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:277:35: note: in expansion of macro '___define_init=
call'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .in=
itcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initc=
all'
     306 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:298:1: note: in expansion of macro 'device=
_initcall'
     298 | device_initcall(__driver##_init);
         | ^~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:9: note: in expansion of macro 'buil=
tin_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_regist=
er)
         |         ^~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_p=
latform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:176:30: error: expected declaration or statement at=
 end of input
     176 | #define THIS_MODULE ((struct module *)0)
         |                              ^~~~~~
   include/linux/platform_device.h:304:41: note: in expansion of macro 'THI=
S_MODULE'
     304 |         __platform_driver_register(drv, THIS_MODULE, KBUILD_MODN=
AME)
         |                                         ^~~~~~~~~~~
   include/linux/device/driver.h:296:16: note: in expansion of macro 'platf=
orm_driver_register'
     296 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                ^~~~~~~~~~
   include/linux/platform_device.h:345:9: note: in expansion of macro 'buil=
tin_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_regist=
er)
         |         ^~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_p=
latform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c: At top level:
>> drivers/pmdomain/imx/gpc.c:503:13: warning: 'imx_gpc_remove' defined but=
 not used [-Wunused-function]
     503 | static void imx_gpc_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~


vim +/imx_gpc_remove +503 drivers/pmdomain/imx/gpc.c

721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  502=
 =20
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-K=C3=B6nig  2023-11-24=
 @503  static void imx_gpc_remove(struct platform_device *pdev)
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  504=
  {
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  505=
  	const struct imx_gpc_dt_data *of_id_data;
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  506=
  	struct device_node *pgc_node;
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  507=
  	unsigned int num_domains;
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  508=
  	int ret;
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  509=
 =20
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  510=
  	pgc_node =3D of_get_child_by_name(pdev->dev.of_node, "pgc");
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  511=
 =20
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  512=
  	/* bail out if DT too old and doesn't provide the necessary info */
8d04dfdbc380d1 drivers/pmdomain/imx/gpc.c Rob Herring (Arm  2024-11-04  513=
) 	if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  514=
  	    !pgc_node)
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-K=C3=B6nig  2023-11-24=
  515  		return;
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  516=
 =20
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  517=
  	/*
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  518=
  	 * If the old DT binding is used the toplevel driver needs to
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  519=
  	 * de-register the power domains
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  520=
  	 */
7801c545e70667 drivers/soc/imx/gpc.c      Stefan Agner      2018-01-07  521=
  	if (!pgc_node) {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  522=
  		of_genpd_del_provider(pdev->dev.of_node);
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  523=
 =20
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  524=
  		of_id_data =3D device_get_match_data(&pdev->dev);
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  525=
  		if (!of_id_data)
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-K=C3=B6nig  2023-11-24=
  526  			return;
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  527=
 =20
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  528=
  		num_domains =3D of_id_data->num_domains;
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  529=
  		while (num_domains--) {
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  530=
  			ret =3D pm_genpd_remove(&imx_gpc_domains[num_domains].base);
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-K=C3=B6nig  2023-11-24=
  531  			if (ret) {
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  532=
  				dev_err(&pdev->dev,
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  533=
  					"Failed to remove %s power domain (%pe)\n",
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  534=
  					imx_gpc_domains[num_domains].base.name,
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-K=C3=B6nig  2023-11-24=
  535  					ERR_PTR(ret));
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-K=C3=B6nig  2023-11-24=
  536  				return;
da07c5871d1815 drivers/pmdomain/imx/gpc.c Uwe Kleine-K=C3=B6nig  2023-11-24=
  537  			}
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  538=
 =20
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  539=
  		if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
d7262971a2acc2 drivers/pmdomain/imx/gpc.c Guangshuo Li      2026-09-24  540=
  			imx_pgc_put_clocks(&imx_gpc_domains[num_domains]);
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  541=
  	}
bbde14682eba21 drivers/pmdomain/imx/gpc.c Miaoqian Lin      2025-10-28  542=
 =20
bbde14682eba21 drivers/pmdomain/imx/gpc.c Miaoqian Lin      2025-10-28  543=
  	of_node_put(pgc_node);
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  544=
  }
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach       2017-02-17  545=
 =20

:::::: The code at line 503 was first introduced by commit
:::::: da07c5871d18157608a0d0702cb093168d79080a pmdomain: imx-gpc: Convert =
to platform remove callback returning void

:::::: TO: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
