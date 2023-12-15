Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2AA4596A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIqSj4tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702653290; x=1734189290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80OH7Xu7oA4KpII8gnJsyfQtgT6sSrLG/g4Lf3Rnp2E=;
  b=XIqSj4tza5yzm4g5SCa+yATHDnmqg6Gbhl5LChsLaFZZ0FG4nPjONfoN
   ZepInCFimckN1zCSbd86Eq9yINBbN3TB8jgABirkGKjxiGokJn6gNHrvl
   eaJE1vnWUXWo+O2BlUOAo1sWiZd1ckS/W/sjdP+Pb/oprcOMR+FjjCFZi
   V98sIbaNFPjHYzDICgUzwC/vM8cHUWphQoUmSSiL4HM2w5hL9NLwVTj3w
   ecA7eSF+z3QOZCEdVwG1p7+0NUpB+mc8Wq6RUBgne153uIwqamRKa2VW/
   sUymaloHI9LkMDB507MM+TV+jm9AjVSblGDoA2z9LiDhhCN1z8Uxxd0gW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8645515"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="8645515"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 07:14:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840692395"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="840692395"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Dec 2023 07:14:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE9tg-0000MS-2Q;
	Fri, 15 Dec 2023 15:14:40 +0000
Date: Fri, 15 Dec 2023 23:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3285/25021]
 drivers/input/touchscreen/vtl/vtl_ts.c:473:34: warning: unused variable
 'vtl_ts_dt_ids'
Message-ID: <202312152301.AQdtsnue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 5fd1a9756fe0090bd795889b135e4dfb78141f0a [3285/25021] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: hexagon-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20231215/202312152301.AQdtsnue-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312152301.AQdtsnue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312152301.AQdtsnue-lkp@intel.com/

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
   drivers/input/touchscreen/vtl/vtl_ts.c:278:6: warning: no previous prototype for function 'vtl_ts_remove' [-Wmissing-prototypes]
   int  vtl_ts_remove(struct i2c_client *client)
        ^
   drivers/input/touchscreen/vtl/vtl_ts.c:278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int  vtl_ts_remove(struct i2c_client *client)
   ^
   static 
   drivers/input/touchscreen/vtl/vtl_ts.c:366:5: warning: no previous prototype for function 'ct36x_test_tp' [-Wmissing-prototypes]
   int ct36x_test_tp(struct i2c_client *client)
       ^
   drivers/input/touchscreen/vtl/vtl_ts.c:366:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ct36x_test_tp(struct i2c_client *client)
   ^
   static 
   drivers/input/touchscreen/vtl/vtl_ts.c:382:5: warning: no previous prototype for function 'vtl_ts_probe' [-Wmissing-prototypes]
   int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
       ^
   drivers/input/touchscreen/vtl/vtl_ts.c:382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
   ^
   static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:473:34: warning: unused variable 'vtl_ts_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id vtl_ts_dt_ids[] = {
                                    ^
   7 warnings generated.


vim +/vtl_ts_dt_ids +473 drivers/input/touchscreen/vtl/vtl_ts.c

   472	
 > 473	static const struct of_device_id vtl_ts_dt_ids[] = {
   474		{ .compatible = "vtl,ct365", },
   475		{ }
   476	};
   477	MODULE_DEVICE_TABLE(of, vtl_ts_dt_ids);
   478	
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
