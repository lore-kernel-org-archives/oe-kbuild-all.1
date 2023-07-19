Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550A5D2EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689753281; x=1721289281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=faYzYzku5nWsIcW5sZxgstZVUNgWSk4jtfonauSAlpI=;
  b=EIn0am8JSw3fPxqqEMGYVDWtp0cmouRqSLad8/EefNQFoBqCVvsNTak6
   SDFOmJNnAHn/EkasPr7jPS/U4/0AFeg2yywIfCH8rgqpykeqf32WsauvU
   0iPzwQ3ApZsuWS25rOkohhkj6JkrmUZakuvHiepbifX/VgfDyNIkpAQ6F
   m8koG+gFX7f7BSZsa1D3903ugJEgLNod8cRDUWgBsW+qW8K0irCE81nYe
   roUfODwKeWTDBlPGmEDj+oVLs+ETkwLAYZEQGvyNkkMvA+AOnMvC3Azlc
   hdDAa1D5YQGheiPter1KmTHZfCtolhHV0TnQNFlS2mNYFUhyEcbJet/7r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369958279"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="369958279"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 00:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="701214181"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="701214181"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2023 00:54:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM218-0004HL-37;
	Wed, 19 Jul 2023 07:54:38 +0000
Date: Wed, 19 Jul 2023 15:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 2936/12466]
 drivers/input/touchscreen/vtl/vtl_ts.c:228:5: warning: no previous prototype
 for function 'vtl_ts_suspend'
Message-ID: <202307191530.kGSBq1UC-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 8457aa0d969d961d9c1c65182a84522589550c92 [2936/12466] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: i386-randconfig-i016-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191530.kGSBq1UC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191530.kGSBq1UC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191530.kGSBq1UC-lkp@intel.com/

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
