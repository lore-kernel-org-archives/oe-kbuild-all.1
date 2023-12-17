Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20410E7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 04:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtdgjHI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702787060; x=1734323060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVK6q3jfQsvOhBkGx7gSpwOmd/gm+FdnO/4kJr8zgN4=;
  b=MtdgjHI/jLoHBk8VeWg3TwqC8RV4VAyoPbzcGmQS335qjzrRIB+imazx
   fLdcQi8S1HDGXyMTGlFt+ttfRswlmCPuc40Z+r2pfzO9ZxyJG2feC3dZ7
   KFGFsdfHxEqTvERh4zF87JRbSvDy0VpQ6JDUj8ertU7SkO1GLjFgTYyKE
   EIiE0KanAERAU5sOfQgwiC+w1eqsfAvAQbHPLK7pWMSkeZcZ/H7A1lQT/
   smbLLaGJxdVfc6qPOgvUwzY4d4o7xrAzm4GWCbpjSY/5LwoMX0AA+4+Rr
   8I/TljsAFjWFQvSo5gN8EcFVUtrvj9f/e1pbpDyGZRgPOGd9F+/jpjcPq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2238609"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2238609"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="918876727"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="918876727"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2023 20:24:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEihM-0002dN-2x;
	Sun, 17 Dec 2023 04:24:16 +0000
Date: Sun, 17 Dec 2023 12:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 2934/16025]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 prototype for function 'max11801_read_adc'
Message-ID: <202312171205.6V4b853v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: bd34cf3f292d182344cba8955612ed51d4717610 [2934/16025] MLK-11703-1: input: touchscreen: max11801_ts: Add DCM mode for max11801 ADC
config: i386-buildonly-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171205.6V4b853v-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171205.6V4b853v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171205.6V4b853v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous prototype for function 'max11801_read_adc' [-Wmissing-prototypes]
   u32 max11801_read_adc(void)
       ^
   drivers/input/touchscreen/max11801_ts.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 max11801_read_adc(void)
   ^
   static 
   1 warning generated.


vim +/max11801_read_adc +148 drivers/input/touchscreen/max11801_ts.c

   147	
 > 148	u32 max11801_read_adc(void)
   149	{
   150		u32 adc_data;
   151	
   152		if (!max11801_client) {
   153			pr_err("FAIL  max11801_client not initialize\n");
   154			return -1;
   155		}
   156		adc_data = max11801_dcm_sample_aux(max11801_client);
   157	
   158		return adc_data;
   159	}
   160	EXPORT_SYMBOL_GPL(max11801_read_adc);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
