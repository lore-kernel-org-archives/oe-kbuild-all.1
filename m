Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871511094C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694796602; x=1726332602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8jtSIJwjAPvwXsMACJB2QSdbJ+vUJH5gUxwMg5HmPow=;
  b=WIs4KYnRkqpcIXKWVjSCS8xURFPNyz1LBx5Hum/RD3dBCI718phb5PK1
   uzc0Ozn7cBxy+qMMols9tbBODldTF3mEvkfIkPOZDFUmS7As1z2e/DEe/
   NowTMAEzvVICFI/DiZIdeiQRR4gfJQfTfZ0eqAvm3rzszRANb8CGbbO/K
   GXS+dLm9fYHF1XbhZXLsRDaeBvcUSueieSrEQrzWwkl8VkQq/BbVqaB1X
   7BBKpeCRE/sNaCJ0Hzt+vc6lH3anHckAMlsTwvPWQEkyyGIh957I+OPJT
   woZHuAZmBOdjVKN/7mPKyuxAh6C9zLjJXumjj2xlNec80Iqs+BXrSzPf7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445755289"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="445755289"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 09:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745058066"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="745058066"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 09:50:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhC10-0003D6-2h;
	Fri, 15 Sep 2023 16:49:58 +0000
Date: Sat, 16 Sep 2023 00:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 3/3] cros_ec_i2c_test.c:undefined
 reference to `__kunit_activate_ftrace_stub'
Message-ID: <202309160013.13Drt2hn-lkp@intel.com>
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
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230916/202309160013.13Drt2hn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160013.13Drt2hn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160013.13Drt2hn-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/platform/chrome/cros_ec_i2c_test.o: in function `cros_ec_i2c_test_init':
>> cros_ec_i2c_test.c:(.text+0xa0): undefined reference to `__kunit_activate_ftrace_stub'
   cros_ec_i2c_test.c:(.text+0xa0): relocation truncated to fit: R_NIOS2_CALL26 against `__kunit_activate_ftrace_stub'
>> nios2-linux-ld: cros_ec_i2c_test.c:(.text+0xc0): undefined reference to `__kunit_activate_ftrace_stub'
   cros_ec_i2c_test.c:(.text+0xc0): relocation truncated to fit: R_NIOS2_CALL26 against `__kunit_activate_ftrace_stub'
>> nios2-linux-ld: cros_ec_i2c_test.c:(.text+0x17c): undefined reference to `kunit_deactivate_ftrace_stub'
   cros_ec_i2c_test.c:(.text+0x17c): relocation truncated to fit: R_NIOS2_CALL26 against `kunit_deactivate_ftrace_stub'
   nios2-linux-ld: cros_ec_i2c_test.c:(.text+0x18c): undefined reference to `kunit_deactivate_ftrace_stub'
   cros_ec_i2c_test.c:(.text+0x18c): relocation truncated to fit: R_NIOS2_CALL26 against `kunit_deactivate_ftrace_stub'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
