Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723415AE7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 11:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695207990; x=1726743990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWc/JB5gomMmbMQNpvRXUgHbyM6N2wzG4WO66SgUf1c=;
  b=JUvKXfk+rTQWoRYYgmMoruUcdrqyCxVPXbSqN8jErylDaReY5Lrb9gBF
   K13aniLlujmH2p86WVN+QngEOMOGwbO3/tYa9ZgLg4bGgRen2Q8pdk56L
   awNLK6NpkMYEb05EERlVjhY4oXr0zXNjJW7h//D9bxAZUBTAzTXstwY5f
   QECsInRYYxJNostSsX0t3/XD2xYjud5K5aAt2c27++tNqbJTNcfel0ror
   k4ndjMmpoAxJ2KyP2Ni5rgHgF5uokS530AePgsriUsND0usn71EtQ1hBq
   eUXcp4rvJCLH0gwl9AXf6B58+L22W9g8XNEVh5TAJt07sM2tNu1WzW78x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380094751"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380094751"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 04:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="812105991"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="812105991"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2023 04:06:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiv2H-0008fs-1r;
	Wed, 20 Sep 2023 11:06:25 +0000
Date: Wed, 20 Sep 2023 19:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 5/5] cros_ec_i2c_test.c:undefined
 reference to `kunit_deactivate_ftrace_stub'
Message-ID: <202309201826.voBw8VtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   19272bbf1090409b4e12c2c4019ceb11bf4b3fec
commit: 19272bbf1090409b4e12c2c4019ceb11bf4b3fec [5/5] platform/chrome: add Kunit for cros_ec_i2c
config: x86_64-buildonly-randconfig-002-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201826.voBw8VtZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201826.voBw8VtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201826.voBw8VtZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `cros_ec_i2c_test_exit':
>> cros_ec_i2c_test.c:(.text+0x2451680): undefined reference to `kunit_deactivate_ftrace_stub'
   ld: cros_ec_i2c_test.c:(.text+0x245168f): undefined reference to `kunit_deactivate_ftrace_stub'
   ld: vmlinux.o: in function `cros_ec_i2c_test_init':
   cros_ec_i2c_test.c:(.text+0x2451794): undefined reference to `__kunit_activate_ftrace_stub'
   ld: cros_ec_i2c_test.c:(.text+0x24517b1): undefined reference to `__kunit_activate_ftrace_stub'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
