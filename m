Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2201F181
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 12:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695384115; x=1726920115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lo/cqGtk4VbJ3ht5Czf5dtXTfM8C8CAvzsc/e1bzQ4I=;
  b=ZVIhYm1nyr0OvXs2SH5OR4oZSJcefhhmd8zbEBAtuZkLeNAlFYhfcT6Y
   hFNlw1Zxi5JSdcYomUKndLjiVKKEz8g5XYk64P9h+HpCbhqMtQsGpdUXq
   2x3AUDEXw6gc0WZ/wgnUt+T6NtVa/ydTwTzWfHhG76vRNt5M6LqmhE4t8
   Fq+ShUnl/6bQayncNOrkoVIvEpw1uAJAW1HUgG8LWxhnfO2G5dGLjX2O9
   rKXgBducQlyE3HyBxf3TvKPKKucEoZpHmQkdpvnUcH9Qv2SSkJ2LF+2MM
   jLz9SzwVyfA5g8zzEPHo8DxOAwLrvxY+eyIril4LBFG9aOB0fr1irbHES
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="380713915"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="380713915"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 05:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697152381"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="697152381"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Sep 2023 05:01:52 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjer0-0000fl-0S;
	Fri, 22 Sep 2023 12:01:50 +0000
Date: Fri, 22 Sep 2023 20:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 5/6]
 drivers/platform/chrome/cros_ec_i2c_test.c:412: undefined reference to
 `kunit_deactivate_ftrace_stub'
Message-ID: <202309221916.VDGLeJTw-lkp@intel.com>
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
commit: d4e8c5f9be8d1bb6bbab144e86b91df6d55519ce [5/6] platform/chrome: add Kunit tests for cros_ec_i2c
config: i386-buildonly-randconfig-005-20230922 (https://download.01.org/0day-ci/archive/20230922/202309221916.VDGLeJTw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309221916.VDGLeJTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221916.VDGLeJTw-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/chrome/cros_ec_i2c_test.o: in function `cros_ec_i2c_test_exit':
>> drivers/platform/chrome/cros_ec_i2c_test.c:412: undefined reference to `kunit_deactivate_ftrace_stub'
   ld: drivers/platform/chrome/cros_ec_i2c_test.c:413: undefined reference to `kunit_deactivate_ftrace_stub'
   ld: drivers/platform/chrome/cros_ec_i2c_test.o: in function `cros_ec_i2c_test_init':
   drivers/platform/chrome/cros_ec_i2c_test.c:376: undefined reference to `__kunit_activate_ftrace_stub'
   ld: drivers/platform/chrome/cros_ec_i2c_test.c:377: undefined reference to `__kunit_activate_ftrace_stub'


vim +412 drivers/platform/chrome/cros_ec_i2c_test.c

   402	
   403	static void cros_ec_i2c_test_exit(struct kunit *test)
   404	{
   405		struct cros_ec_i2c_test_priv *priv = test->priv;
   406	
   407		i2c_unregister_device(priv->client);
   408		KUNIT_EXPECT_EQ(test, priv->fake_cros_ec_unregister_called, 1);
   409	
   410		i2c_del_adapter(priv->adap);
   411	
 > 412		kunit_deactivate_ftrace_stub(test, cros_ec_register);
   413		kunit_deactivate_ftrace_stub(test, cros_ec_unregister);
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
