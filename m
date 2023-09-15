Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD0130CED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694790557; x=1726326557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DARoNemkfVYIFitFCDt0i47DQEUDQ5aaBfQe+WjuQNQ=;
  b=iKq7P31b9Nhx6imrKlQHdDS2Rsr+qicrX2zJXFLc60BrtDxvZ2wHEkJt
   bvUghLmotkWKyj/rjKVBksFlZehPNx77c6ibq+x6RKQM+MQ+CZxzvrjEv
   ptmkRObR55RWaxZbBRpjZ/pbad3RFHeasiyclJVvzKmnDeM9+k2AW3kvg
   w1AYpOZBIH1QQh5nwzLb0ebWFXhUR4MxVfM5ct/Wf49N8AzXrgDTrhzoc
   6cs/QCEvO0KHRVALNdZ32O7uO5A5P6LKSy4xF9fQLk2ykfLE7VrY+wLwc
   tM6s/+6jWhcRUYXbLbso4Dicj4QfV8EKw/Upj7tCuFaMQKTwrUDRCUQOs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358687387"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="358687387"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 08:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="721718506"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="721718506"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Sep 2023 08:09:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhARM-00036T-2U;
	Fri, 15 Sep 2023 15:09:04 +0000
Date: Fri, 15 Sep 2023 23:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 3/3]
 drivers/platform/chrome/cros_ec_i2c_test.c:51: undefined reference to
 `__kunit_activate_ftrace_stub'
Message-ID: <202309152341.uwSPQZdy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   915d1f69c42b297c8f26c23866ee454f9e824c34
commit: 915d1f69c42b297c8f26c23866ee454f9e824c34 [3/3] platform/chrome: add Kunit for cros_ec_i2c
config: x86_64-randconfig-013-20230915 (https://download.01.org/0day-ci/archive/20230915/202309152341.uwSPQZdy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152341.uwSPQZdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152341.uwSPQZdy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/chrome/cros_ec_i2c_test.o: in function `cros_ec_i2c_test_init':
>> drivers/platform/chrome/cros_ec_i2c_test.c:51: undefined reference to `__kunit_activate_ftrace_stub'
>> ld: drivers/platform/chrome/cros_ec_i2c_test.c:52: undefined reference to `__kunit_activate_ftrace_stub'
>> ld: drivers/platform/chrome/cros_ec_i2c_test.c:77: undefined reference to `kunit_deactivate_ftrace_stub'
   ld: drivers/platform/chrome/cros_ec_i2c_test.c:78: undefined reference to `kunit_deactivate_ftrace_stub'


vim +51 drivers/platform/chrome/cros_ec_i2c_test.c

    41	
    42	static int cros_ec_i2c_test_init(struct kunit *test)
    43	{
    44		struct i2c_adapter *adap;
    45		struct i2c_client *client;
    46		int ret;
    47		struct i2c_board_info dummy_info = {
    48			I2C_BOARD_INFO("cros-ec-i2c", 0x06),
    49		};
    50	
  > 51		kunit_activate_ftrace_stub(test, cros_ec_register, fake_cros_ec_register);
  > 52		kunit_activate_ftrace_stub(test, cros_ec_unregister, fake_cros_ec_unregister);
    53	
    54		adap = kunit_kzalloc(test, sizeof(*adap), GFP_KERNEL);
    55		if (!adap)
    56			return -ENOMEM;
    57	
    58		adap->owner = THIS_MODULE;
    59		strcpy(adap->name, "cros-ec-i2c-test");
    60		adap->algo = &cros_ec_i2c_algorithm;
    61		adap->retries = 3;
    62	
    63		ret = i2c_add_adapter(adap);
    64		if (ret)
    65			return ret;
    66	
    67		client = i2c_new_client_device(adap, &dummy_info);
    68		if (IS_ERR(client)) {
    69			ret = PTR_ERR(client);
    70			kunit_err(test, "err = %d\n", ret);
    71			return ret;
    72		}
    73	
    74		i2c_unregister_device(client);
    75		i2c_del_adapter(adap);
    76	
  > 77		kunit_deactivate_ftrace_stub(test, cros_ec_register);
    78		kunit_deactivate_ftrace_stub(test, cros_ec_unregister);
    79	
    80		return 0;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
