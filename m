Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653427709
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695391707; x=1726927707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5A7GP0t0si8Vu0RInopD8TEe9MyOLRhcZ/CjfelSGU=;
  b=E2y1aQ0y7dQHzg3DltyhjegT+GCAvvWZDQZZ1Rv3whlpS1jB9Ygn8Sq5
   P1sBPYlEbWdmfyYjc5filEJy7j1fEscpTjvXz2M4jVxXAgo9cfmuap6zo
   oXnWCvUyvcikdWQgI9Qcvo2OZo5TX3chTmvUvBJm8S+8V6sHMWqb6kdhJ
   7aarqah4GXf39sYrmAs8K+KEn+kHaO6QphfkAYo7MNrxzXM9MAgsan6Mz
   Kv3MR782ZAhSrzp3VsJkeUQ6OeBfp6CsDAtQx1dtlizsIc+TmNmm85oGV
   k8US3x2D47OmymxTUsQODccxcZf9PRav6WDz7DTyYPAKIUL2ABsDM3sf8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="467132878"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="467132878"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="862951984"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="862951984"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2023 07:08:26 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjgpT-0000oG-3A;
	Fri, 22 Sep 2023 14:08:23 +0000
Date: Fri, 22 Sep 2023 22:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 6/6]
 drivers/platform/chrome/cros_ec_spi_test.c:51:undefined reference to
 `__kunit_activate_ftrace_stub'
Message-ID: <202309222211.y3UbgY9G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   1e682f788e6a8c36351f18696847a6420c6e83ce
commit: 1e682f788e6a8c36351f18696847a6420c6e83ce [6/6] platform/chrome: add Kunit tests for cros_ec_spi
config: arc-randconfig-001-20230922 (https://download.01.org/0day-ci/archive/20230922/202309222211.y3UbgY9G-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309222211.y3UbgY9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309222211.y3UbgY9G-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/platform/chrome/cros_ec_spi_test.o: in function `cros_ec_spi_test_init':
>> drivers/platform/chrome/cros_ec_spi_test.c:51:(.text+0x66): undefined reference to `__kunit_activate_ftrace_stub'
>> arc-elf-ld: drivers/platform/chrome/cros_ec_spi_test.c:51:(.text+0x66): undefined reference to `__kunit_activate_ftrace_stub'
   arc-elf-ld: drivers/platform/chrome/cros_ec_spi_test.c:52:(.text+0x84): undefined reference to `__kunit_activate_ftrace_stub'
   arc-elf-ld: drivers/platform/chrome/cros_ec_spi_test.c:52:(.text+0x84): undefined reference to `__kunit_activate_ftrace_stub'


vim +51 drivers/platform/chrome/cros_ec_spi_test.c

    42	
    43	static int cros_ec_spi_test_init(struct kunit *test)
    44	{
    45		struct spi_controller *ctlr;
    46		struct device dev;
    47		struct class *class;
    48		struct spi_board_info dummy_board_info = {};
    49		struct spi_device *spi_device;
    50	
  > 51		kunit_activate_ftrace_stub(test, cros_ec_register, fake_cros_ec_register);
    52		kunit_activate_ftrace_stub(test, cros_ec_unregister, fake_cros_ec_unregister);
    53	
    54		strncpy(dummy_board_info.modalias, "cros-ec-spi", SPI_NAME_SIZE);
    55	
    56		class = class_create("dummy_class");
    57		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, class);
    58		dev.class = class;
    59		dev.parent = NULL;
    60		dev_set_name(&dev, "dummy_dev");
    61		KUNIT_ASSERT_EQ(test, device_register(&dev), 0);
    62	
    63		ctlr = spi_alloc_master(&dev, 0);
    64		KUNIT_ASSERT_NOT_NULL(test, ctlr);
    65	
    66		ctlr->transfer_one = fake_spi_transfer_one;
    67		ctlr->transfer_one_message = fake_spi_transfer_one_message;
    68		ctlr->bus_num = 0x6;
    69	
    70		KUNIT_ASSERT_EQ(test, spi_register_controller(ctlr), 0);
    71	
    72		spi_device = spi_new_device(ctlr, &dummy_board_info);
    73		KUNIT_ASSERT_NOT_NULL(test, spi_device);
    74	
    75		return 0;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
