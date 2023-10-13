Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C990D1FDA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 04:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaAL09ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697170737; x=1728706737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUJlaKYnuseKTjyLrk6FGhZmmf52umn2SIC58BDktG4=;
  b=ZaAL09aklMOUzKBDc9iZK41w5D0muthJwHzD+Z3YmGnbroqHpECzVOwy
   r1a43MLrzK99uj0T6lIUM8MlTmEU9PxaaxDVrYKa7701MH6yVq8msG7BU
   1eBnU6qyUnVhjHbr5uz+kKpFVZN65QOgsgz4T+fRZoT/bmuk8zT3PIRT4
   0OHuATviX9kPnADkuG9swBQfL4f23GbvHwJ0Mxp/EMelrg+P5UbZFHyZL
   og+MdF2zCbfGES1MXUmOnctSOUOQn+DEcA4HT1Aa5/BIMlM6ZUZ3+XnSA
   LdNmeGX4OPMCrcNOJtwcXOUxzcTYd25CKlRfgnF8HzQ0hpHjXOwjaB3RE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387956004"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="387956004"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 21:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878386260"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="878386260"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 21:18:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr9dS-0004Jv-0O;
	Fri, 13 Oct 2023 04:18:50 +0000
Date: Fri, 13 Oct 2023 12:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1573/30000]
 drivers/input/touchscreen/vtl/vtl_ts.c:126:15: error: implicit declaration
 of function 'i2c_transfer'
Message-ID: <202310131248.MVekvD3w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 3785cf3fded6ec2c0230baf53fca19a1e956446f [1573/30000] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: x86_64-randconfig-004-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131248.MVekvD3w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131248.MVekvD3w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131248.MVekvD3w-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/input/touchscreen/vtl/vtl_ts.c: In function 'vtl_ts_config':
   drivers/input/touchscreen/vtl/vtl_ts.c:65:24: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
      65 |         struct device *dev;
         |                        ^~~
   drivers/input/touchscreen/vtl/vtl_ts.c: At top level:
   drivers/input/touchscreen/vtl/vtl_ts.c:80:6: warning: no previous prototype for 'vtl_ts_free_gpio' [-Wmissing-prototypes]
      80 | void vtl_ts_free_gpio(void)
         |      ^~~~~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:90:6: warning: no previous prototype for 'vtl_ts_hw_reset' [-Wmissing-prototypes]
      90 | void vtl_ts_hw_reset(void)
         |      ^~~~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c: In function 'vtl_read_xy_data':
>> drivers/input/touchscreen/vtl/vtl_ts.c:126:15: error: implicit declaration of function 'i2c_transfer' [-Werror=implicit-function-declaration]
     126 |         err = i2c_transfer(ts->driver->client->adapter, &msgs, 1);
         |               ^~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c: At top level:
   drivers/input/touchscreen/vtl/vtl_ts.c:278:6: warning: no previous prototype for 'vtl_ts_remove' [-Wmissing-prototypes]
     278 | int  vtl_ts_remove(struct i2c_client *client)
         |      ^~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:366:5: warning: no previous prototype for 'ct36x_test_tp' [-Wmissing-prototypes]
     366 | int ct36x_test_tp(struct i2c_client *client)
         |     ^~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:382:5: warning: no previous prototype for 'vtl_ts_probe' [-Wmissing-prototypes]
     382 | int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
         |     ^~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c: In function 'vtl_ts_probe':
>> drivers/input/touchscreen/vtl/vtl_ts.c:419:15: error: implicit declaration of function 'i2c_check_functionality' [-Werror=implicit-function-declaration]
     419 |         err = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c: At top level:
>> drivers/input/touchscreen/vtl/vtl_ts.c:492:1: warning: data definition has no type or storage class
     492 | module_i2c_driver(vtl_ts_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/vtl/vtl_ts.c:492:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
>> drivers/input/touchscreen/vtl/vtl_ts.c:492:1: warning: parameter names (without types) in function declaration
>> drivers/input/touchscreen/vtl/vtl_ts.c:480:26: warning: 'vtl_ts_driver' defined but not used [-Wunused-variable]
     480 | static struct i2c_driver vtl_ts_driver  = {
         |                          ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
