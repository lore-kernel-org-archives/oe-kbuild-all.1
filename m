Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA66946F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693562857; x=1725098857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=okPBsVQdx8x0uQfwuqRdW4721gbpzZhYBnoDafBkz6A=;
  b=BIHOVRM048Bufs4pGTE0Urabnwqnu9Ip0WPLrf8Lo7TFWPcWXTixtelF
   la6TqikIDt2hOq3DIQn795w4/4BjQIe9TLUKLybO+RyV9rzZdW2dBxRal
   gSYgDRYpkvl0D62PtOANL8Ym1SXpVntsEuPoFX/2fdFYxSacgZkhD4ky/
   r+lLHiSCrQPHmD2CjC23+R3LgjTYA4hT2YeZMJTY5JzswBFc0SxJGI4x4
   WL4x1uMM4jgu/3hQPCPWmhfKooBJ0KonBfXS2MhMVLAfgT1oQZKlbSNBV
   rlyvXvAyKrXmLNgio9JrkJ/CdyzxsA3btJ4uOr7JievKJzebkpe0Dky/K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355682797"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="355682797"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 03:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689718071"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="689718071"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Sep 2023 03:07:34 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc13r-0001Ag-3C;
	Fri, 01 Sep 2023 10:07:31 +0000
Date: Fri, 1 Sep 2023 18:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 3/3]
 drivers/platform/chrome/cros_ec_i2c_test.c:56:15: error: implicit
 declaration of function 'i2c_add_adapter'; did you mean
 'i2c_verify_adapter'?
Message-ID: <202309011709.Jpm2opXY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   f54bc0b7e87fc979c2b36d7bbc70d614e0d569d6
commit: f54bc0b7e87fc979c2b36d7bbc70d614e0d569d6 [3/3] platform/chrome: add Kunit for cros_ec_i2c
config: arc-randconfig-001-20230901 (https://download.01.org/0day-ci/archive/20230901/202309011709.Jpm2opXY-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011709.Jpm2opXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011709.Jpm2opXY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/chrome/cros_ec_i2c_test.c: In function 'cros_ec_i2c_test_init':
>> drivers/platform/chrome/cros_ec_i2c_test.c:56:15: error: implicit declaration of function 'i2c_add_adapter'; did you mean 'i2c_verify_adapter'? [-Werror=implicit-function-declaration]
      56 |         ret = i2c_add_adapter(adap);
         |               ^~~~~~~~~~~~~~~
         |               i2c_verify_adapter
>> drivers/platform/chrome/cros_ec_i2c_test.c:62:18: error: implicit declaration of function 'i2c_new_client_device' [-Werror=implicit-function-declaration]
      62 |         client = i2c_new_client_device(adap, &dummy_info);
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_i2c_test.c:62:16: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      62 |         client = i2c_new_client_device(adap, &dummy_info);
         |                ^
   cc1: some warnings being treated as errors


vim +56 drivers/platform/chrome/cros_ec_i2c_test.c

    37	
    38	static int cros_ec_i2c_test_init(struct kunit *test)
    39	{
    40		struct i2c_adapter *adap;
    41		struct i2c_client *client;
    42		int ret;
    43		struct i2c_board_info dummy_info = {
    44			I2C_BOARD_INFO("cros-ec-i2c", 0x06),
    45		};
    46	
    47		adap = kunit_kzalloc(test, sizeof(*adap), GFP_KERNEL);
    48		if (!adap)
    49			return -ENOMEM;
    50	
    51		adap->owner = THIS_MODULE;
    52		strcpy(adap->name, "cros-ec-i2c-test");
    53		adap->algo = &cros_ec_i2c_algorithm;
    54		adap->retries = 3;
    55	
  > 56		ret = i2c_add_adapter(adap);
    57		if (ret)
    58			return ret;
    59	
    60		kunit_activate_static_stub(test, cros_ec_register, fake_cros_ec_register);
    61	
  > 62		client = i2c_new_client_device(adap, &dummy_info);
    63		if (IS_ERR(client))
    64			kunit_err(test, "err = %ld\n", PTR_ERR(client));
    65	
    66		kunit_deactivate_static_stub(test, cros_ec_register);
    67	
    68		return 0;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
