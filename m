Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B79B36AE3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 19:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7JbD0HA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699384876; x=1730920876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RWRQTeku4Eofce+cB+Ppg0o5mWLxRtJYY54mCnYv4m8=;
  b=G7JbD0HAuzqJkc652EEB/ZFbzESNP2izq0XgMo37IqNN18lHbccjsUYX
   d2kb6hJ55GRkdbmd8R5KQjsdYPhFy3CHLWmI3mCLJ3KDego+3C1tLHF4C
   vXux3ItBooGGc7ik3On4kDa4iEQTmaGCtEUQpncXbfdnqyG1ttLR0B2tr
   tb4CP5E4kSwEOy2u9pZKKBqTF2YDoiUxBLo/AKPjCCaGIgTChMFMQDy2U
   kYf1lIzqeBhyIOuwy60Dn6mNaDjfhY12i3YGS0K8TReORKOt0Unj+MwF1
   qirYiRFZogEaBJaEK0QVk4bbXv6cxjnz430m5lRT+hKKpDriAe6fNUczm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2535224"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="2535224"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 11:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762798850"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="762798850"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2023 11:21:14 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0RdQ-0007Lg-1F;
	Tue, 07 Nov 2023 19:21:12 +0000
Date: Wed, 8 Nov 2023 03:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Message-ID: <202311080350.HLgrpabe-lkp@intel.com>
References: <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3ff7a5781ceee3befb9224d29cef6e6a4766c5fe]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fb-amifb-Stop-using-platform_driver_probe/20231107-173128
base:   3ff7a5781ceee3befb9224d29cef6e6a4766c5fe
patch link:    https://lore.kernel.org/r/20231107091740.3924258-3-u.kleine-koenig%40pengutronix.de
patch subject: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
config: arc-randconfig-002-20231108 (https://download.01.org/0day-ci/archive/20231108/202311080350.HLgrpabe-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080350.HLgrpabe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080350.HLgrpabe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/video/fbdev/atmel_lcdfb.c:1314:44: error: macro "module_platform_driver" passed 2 arguments, but takes just 1
    1314 | module_platform_driver(atmel_lcdfb_driver, );
         |                                            ^
   In file included from drivers/video/fbdev/atmel_lcdfb.c:12:
   include/linux/platform_device.h:302: note: macro "module_platform_driver" defined here
     302 | #define module_platform_driver(__platform_driver) \
         | 
>> drivers/video/fbdev/atmel_lcdfb.c:1314:1: warning: data definition has no type or storage class
    1314 | module_platform_driver(atmel_lcdfb_driver, );
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/atmel_lcdfb.c:1314:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/video/fbdev/atmel_lcdfb.c:1303:31: warning: 'atmel_lcdfb_driver' defined but not used [-Wunused-variable]
    1303 | static struct platform_driver atmel_lcdfb_driver = {
         |                               ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/module_platform_driver +1314 drivers/video/fbdev/atmel_lcdfb.c

  1302	
> 1303	static struct platform_driver atmel_lcdfb_driver = {
  1304		.probe		= atmel_lcdfb_probe,
  1305		.remove		= atmel_lcdfb_remove,
  1306		.suspend	= atmel_lcdfb_suspend,
  1307		.resume		= atmel_lcdfb_resume,
  1308		.driver		= {
  1309			.name	= "atmel_lcdfb",
  1310			.of_match_table	= atmel_lcdfb_dt_ids,
  1311		},
  1312	};
  1313	
> 1314	module_platform_driver(atmel_lcdfb_driver, );
  1315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
