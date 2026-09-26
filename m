Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837F138DC44
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423532; cv=none; b=lWQ2/Zn8yNVyQzSLsvZDVyXA4JRcM4QTYXz0yKPmHdn5rGWEeJ0a7PjDPJ2VqOnZ96uoZ1VI67OR7UoOyCe1qCCE+BXHOWiDfRMXhfvlY5Y57otNdfmJ2K2RNKMvFTPWepY8oYbdaIMNh5YOfgaJFd9G/LZZyVmpysCBVSHqadk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423532; c=relaxed/simple;
	bh=+AZpHv4mM8odZbVIEkCmV1pVKQ98ZTOUWhO/WPXa6c4=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsbtcPFInuLfuc8dANuySvddMVqh+q6Q2yI1AOlNMAlqNwXAtP+yDKBsfwVAEgUH2sYrqyOhz7jLI06HxMgW+vaP5dnK4yEeHATHcsVR/16Re+d/UDG/rjeIkaFDXV5lo0vaB4CLygac5NXafGrbpjzQ1aJSJK15jr8BG1vzEno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7PFzVmi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7PFzVmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790423527; x=1821959527;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=+AZpHv4mM8odZbVIEkCmV1pVKQ98ZTOUWhO/WPXa6c4=;
  b=P7PFzVmiqRi5mMiRfiyUZndNQECYrkl1VtHOkk7gVAZw+7A7gexiSKzy
   zrSaLtzJH6sDGcowyYykxCaTXB+Vq6EaNZO3m7XJ6qtBb1KEn+kJJUC/f
   0+rOPWHJbUY2kSST/PX0uyAE0oraT454QZlmG9u4PfVAiwGtQ7UZ5hJJJ
   +7tUNUswb4O0W07XOO8EzULwPkUjnt9Qw1C9QwO6Ip73tjEoobjeI03T/
   zcKncPt1y8pdwCZnkK5r4p+J3n+nWwy4ddXzEUK+5DvmLXjDtUWSLPPAA
   0Ys68XLIkcGvgta/Ans6qw6qjv/AycfY+hNB2hup4FbaRbctLEtm9cMZt
   g==;
X-CSE-ConnectionGUID: LgAtJuOsSpems77bJyJAPA==
X-CSE-MsgGUID: LujU5JO7Tp6GiLn8I8woyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="89956985"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="89956985"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 04:52:05 -0700
X-CSE-ConnectionGUID: 5bOR40TsR9q+UFJgyFaCSQ==
X-CSE-MsgGUID: WmcGCKitTFyHggfhvwtuzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="273768714"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Sep 2026 04:52:04 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAQwk-00000000Lm5-0V4p
	for oe-kbuild-all@lists.linux.dev;
	Sat, 26 Sep 2026 11:52:02 +0000
Date: Sat, 26 Sep 2026 19:51:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609261923.dDN3B4ot-lkp@intel.com>
References: <202609261923.dDN3B4ot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609261923.dDN3B4ot-lkp@intel.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/pmdomain-imx-gpc-remove-all-initialized-power-domains/20260924-222520
base:   
patch link:    https://lore.kernel.org/r/202609261923.dDN3B4ot-lkp%40intel.com
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260926/202609261923.dDN3B4ot-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261923.dDN3B4ot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261923.dDN3B4ot-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from drivers/pmdomain/imx/gpc.c:11:
   drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_remove':
>> drivers/pmdomain/imx/gpc.c:554:25: error: invalid storage class for function 'imx_gpc_driver_init'
     554 | builtin_platform_driver(imx_gpc_driver)
         |                         ^~~~~~~~~~~~~~
   include/linux/device/driver.h:294:19: note: in definition of macro 'builtin_driver'
     294 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
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
>> drivers/pmdomain/imx/gpc.c:554:25: error: initializer element is not constant
     554 | builtin_platform_driver(imx_gpc_driver)
         |                         ^~~~~~~~~~~~~~
   include/linux/init.h:265:55: note: in definition of macro '____define_initcall'
     265 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:275:9: note: in expansion of macro '__unique_initcall'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:277:35: note: in expansion of macro '___define_initcall'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:298:1: note: in expansion of macro 'device_initcall'
     298 | device_initcall(__driver##_init);
         | ^~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:9: note: in expansion of macro 'builtin_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:176:30: error: expected declaration or statement at end of input
     176 | #define THIS_MODULE ((struct module *)0)
         |                              ^~~~~~
   include/linux/platform_device.h:304:41: note: in expansion of macro 'THIS_MODULE'
     304 |         __platform_driver_register(drv, THIS_MODULE, KBUILD_MODNAME)
         |                                         ^~~~~~~~~~~
   include/linux/device/driver.h:296:16: note: in expansion of macro 'platform_driver_register'
     296 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                ^~~~~~~~~~
   include/linux/platform_device.h:345:9: note: in expansion of macro 'builtin_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c: At top level:
   drivers/pmdomain/imx/gpc.c:503:13: warning: 'imx_gpc_remove' defined but not used [-Wunused-function]
     503 | static void imx_gpc_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~


vim +/imx_gpc_driver_init +554 drivers/pmdomain/imx/gpc.c

721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  545  
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  546  static struct platform_driver imx_gpc_driver = {
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  547  	.driver = {
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  548  		.name = "imx-gpc",
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  549  		.of_match_table = imx_gpc_dt_ids,
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  550  	},
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  551  	.probe = imx_gpc_probe,
e70140ba0d2b1a3 drivers/pmdomain/imx/gpc.c Linus Torvalds 2024-12-01  552  	.remove = imx_gpc_remove,
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  553  };
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17 @554  builtin_platform_driver(imx_gpc_driver)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
