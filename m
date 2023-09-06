Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DB36AB3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 22:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694037729; x=1725573729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z90l7bSjmn4gGslUOd6E61Y8J5X8QsaAME9U/f45J2U=;
  b=YNEGsKOL+LryUc/TMSKT4XwqJNlCbzeYXqqEfnxK7T8Kh1DCo0Fzlq1c
   rOE1pBwS5SsN6KgVJgbe4zxyLGzAsJQIKZTwB9WeQKboNmBrNDQrTsN3n
   SF+D9EhtqtNF8mPjeJiyg6yMUmD1SYGQZPyO1k2w7LGOEDb/eMAk7vdak
   Nv8eV6n2Lu4JETpJfRxNsa3eCXYmQZMwTC/qeLN8be9HLEAf0+2Wk28xL
   oa2U+xagD7Z1NQZirqJ4y/4y7ccdc/JLtEUqSKN3ZIjvCE/gYzJ5lfCtt
   mEdWuBB320kh6ur+c9NYLkGAmqiIKnk0jE4ftQ495Uf0qFltVgbQ+PbME
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357507854"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="357507854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718438478"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="718438478"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2023 15:02:06 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe0b5-0000cz-38;
	Wed, 06 Sep 2023 22:02:03 +0000
Date: Thu, 7 Sep 2023 06:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3285/24606]
 drivers/input/touchscreen/vtl/vtl_ts.c:126:8: error: implicit declaration of
 function 'i2c_transfer'
Message-ID: <202309070519.TLEknyDn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: 5fd1a9756fe0090bd795889b135e4dfb78141f0a [3285/24606] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: x86_64-randconfig-004-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070519.TLEknyDn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070519.TLEknyDn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070519.TLEknyDn-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> drivers/input/touchscreen/vtl/vtl_ts.c:126:8: error: implicit declaration of function 'i2c_transfer' [-Werror,-Wimplicit-function-declaration]
           err = i2c_transfer(ts->driver->client->adapter, &msgs, 1);
                 ^
   drivers/input/touchscreen/vtl/vtl_ts.c:278:6: warning: no previous prototype for function 'vtl_ts_remove' [-Wmissing-prototypes]
   int  vtl_ts_remove(struct i2c_client *client)
        ^
   drivers/input/touchscreen/vtl/vtl_ts.c:278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int  vtl_ts_remove(struct i2c_client *client)
   ^
   static 
   drivers/input/touchscreen/vtl/vtl_ts.c:376:6: error: implicit declaration of function 'i2c_transfer' [-Werror,-Wimplicit-function-declaration]
           if (i2c_transfer(client->adapter, &msgs, 1) != 1)
               ^
   drivers/input/touchscreen/vtl/vtl_ts.c:366:5: warning: no previous prototype for function 'ct36x_test_tp' [-Wmissing-prototypes]
   int ct36x_test_tp(struct i2c_client *client)
       ^
   drivers/input/touchscreen/vtl/vtl_ts.c:366:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ct36x_test_tp(struct i2c_client *client)
   ^
   static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:419:8: error: implicit declaration of function 'i2c_check_functionality' [-Werror,-Wimplicit-function-declaration]
           err = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
                 ^
   drivers/input/touchscreen/vtl/vtl_ts.c:382:5: warning: no previous prototype for function 'vtl_ts_probe' [-Wmissing-prototypes]
   int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
       ^
   drivers/input/touchscreen/vtl/vtl_ts.c:382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
   ^
   static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:492:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   module_i2c_driver(vtl_ts_driver);
   ^
   int
>> drivers/input/touchscreen/vtl/vtl_ts.c:492:19: error: a parameter list without types is only allowed in a function definition
   module_i2c_driver(vtl_ts_driver);
                     ^
   6 warnings and 5 errors generated.


vim +/i2c_transfer +126 drivers/input/touchscreen/vtl/vtl_ts.c

   113	
   114	static union ts_xy_data *vtl_read_xy_data(struct ts_info *ts)
   115	{
   116		struct i2c_msg msgs;
   117		int err;
   118	
   119		DEBUG();
   120	
   121		msgs.addr = ts->driver->client->addr;
   122		msgs.flags = 0x01;
   123		msgs.len = sizeof(ts->xy_data.buf);
   124		msgs.buf = ts->xy_data.buf;
   125	
 > 126		err = i2c_transfer(ts->driver->client->adapter, &msgs, 1);
   127		if (err != 1) {
   128			pr_err("___%s:i2c read err___\n", __func__);
   129			return NULL;
   130		}
   131		return &ts->xy_data;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
