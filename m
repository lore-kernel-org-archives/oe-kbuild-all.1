Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A03419A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 21:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kD3GWOnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702762022; x=1734298022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lS3UE8Nk1cPLgAaexbr2aOkuCL663lJIcbNUm91UkZg=;
  b=kD3GWOncFdm/BK12K+MZ5grHh83fLLMgxVoqUR7901fOBoB50BYcy37a
   sbCqC13/az3Obf7S4TOYDUKaEDWM/Z0zq2f+4CJ8B0fYG77ZoIBrf7flF
   E4A1q1BDv9Zgruv95sUU5vbI2wYtTnQvpjK5QfFOrxKOlt+bJ4Z8mqu/m
   KBmwO8sbPkIdRW9z2W4m5LqvXBEMqupd7g8N1mFtcXx+jgrIJGYCvFkn7
   ygUtaVoNgXTf0Lcraempwb4ZK79wPYXc96IO6QUYOffsBCOLpf7BvdE5G
   VnQ93h0baB88SUTTZyi+fJ6Lq+ddywCLwvDQk9CXmTCgqHq8/YyY+jnfI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="461846423"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="461846423"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 13:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="751323956"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="751323956"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2023 13:26:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEcBV-0002EU-2L;
	Sat, 16 Dec 2023 21:26:57 +0000
Date: Sun, 17 Dec 2023 05:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 2936/16025]
 drivers/input/touchscreen/vtl/vtl_ts.c:228:5: warning: no previous prototype
 for function 'vtl_ts_suspend'
Message-ID: <202312170548.TX1N067T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alejandro,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 8457aa0d969d961d9c1c65182a84522589550c92 [2936/16025] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170548.TX1N067T-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170548.TX1N067T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170548.TX1N067T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/vtl/vtl_ts.c:65:17: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
           struct device *dev;
                          ^
   drivers/input/touchscreen/vtl/vtl_ts.c:80:6: warning: no previous prototype for function 'vtl_ts_free_gpio' [-Wmissing-prototypes]
   void vtl_ts_free_gpio(void)
        ^
   drivers/input/touchscreen/vtl/vtl_ts.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vtl_ts_free_gpio(void)
   ^
   static 
   drivers/input/touchscreen/vtl/vtl_ts.c:90:6: warning: no previous prototype for function 'vtl_ts_hw_reset' [-Wmissing-prototypes]
   void vtl_ts_hw_reset(void)
        ^
   drivers/input/touchscreen/vtl/vtl_ts.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vtl_ts_hw_reset(void)
   ^
   static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:228:5: warning: no previous prototype for function 'vtl_ts_suspend' [-Wmissing-prototypes]
   int vtl_ts_suspend(struct device *dev)
       ^
   drivers/input/touchscreen/vtl/vtl_ts.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vtl_ts_suspend(struct device *dev)
   ^
   static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:241:5: warning: no previous prototype for function 'vtl_ts_resume' [-Wmissing-prototypes]
   int vtl_ts_resume(struct device *dev)
       ^
   drivers/input/touchscreen/vtl/vtl_ts.c:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vtl_ts_resume(struct device *dev)
   ^
   static 
   drivers/input/touchscreen/vtl/vtl_ts.c:278:6: warning: no previous prototype for function 'vtl_ts_remove' [-Wmissing-prototypes]
   void vtl_ts_remove(struct i2c_client *client)
        ^
   drivers/input/touchscreen/vtl/vtl_ts.c:278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vtl_ts_remove(struct i2c_client *client)
   ^
   static 
   drivers/input/touchscreen/vtl/vtl_ts.c:364:5: warning: no previous prototype for function 'ct36x_test_tp' [-Wmissing-prototypes]
   int ct36x_test_tp(struct i2c_client *client)
       ^
   drivers/input/touchscreen/vtl/vtl_ts.c:364:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ct36x_test_tp(struct i2c_client *client)
   ^
   static 
   drivers/input/touchscreen/vtl/vtl_ts.c:380:5: warning: no previous prototype for function 'vtl_ts_probe' [-Wmissing-prototypes]
   int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
       ^
   drivers/input/touchscreen/vtl/vtl_ts.c:380:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
   ^
   static 
   8 warnings generated.


vim +/vtl_ts_suspend +228 drivers/input/touchscreen/vtl/vtl_ts.c

   226	
   227	#ifdef CONFIG_PM_SLEEP
 > 228	int vtl_ts_suspend(struct device *dev)
   229	{
   230		struct ts_info *ts;
   231	
   232		ts = pg_ts;
   233		DEBUG();
   234	
   235		disable_irq(ts->config_info.irq_number);
   236		cancel_work_sync(&ts->driver->event_work);
   237	
   238		return 0;
   239	}
   240	
 > 241	int vtl_ts_resume(struct device *dev)
   242	{
   243		struct ts_info *ts;
   244	
   245		ts = pg_ts;
   246		DEBUG();
   247	
   248		/* Hardware reset */
   249		vtl_ts_hw_reset();
   250		enable_irq(ts->config_info.irq_number);
   251	
   252		return 0;
   253	}
   254	#endif
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
