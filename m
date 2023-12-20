Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7237020310
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Dec 2023 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YL0rOnXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703066007; x=1734602007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqTwT0Cp7Nul/CQl1VblkPnUTYx06iawDEfQi7nQpto=;
  b=YL0rOnXpY8LLsT7iM2cnYRG1+G267b8a135fd2MvTK8hlLR/4X+L/otE
   zolQRk/swO3JoKTCWut81j5TaOX1u7n9eJqvE3f8YQKKb7NEbDX0hWFxA
   LAFULkLPppazXgAp5J2wMfTXQeN+FXq6R6GLAMGri7THy9G/eyc9BfDya
   21E943eDkFuJqZcyC7n4SE4HtCh8byKR+1srcO/0qpxbb6QfHqOuMplaa
   z3aGzTeVZceKUX9EpkRfIpkFMDYGSG9U8TRY7HUMGSmOKZxBN3N97O34Z
   pC08F1apIkhEDmc01iM3/2edftYD4gjsNaW6KL7wYAIvBLIHnj1EMJC3x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="3024880"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="3024880"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 01:53:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="919918514"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="919918514"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2023 01:53:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFtGV-0006ix-1V;
	Wed, 20 Dec 2023 09:53:23 +0000
Date: Wed, 20 Dec 2023 17:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 6/13] mm/kfence/kfence_test.c:37:17: error:
 implicit declaration of function 'kunit_skip'
Message-ID: <202312201706.J8DYOfa6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   1f3e1df23c54838efc061abcf1041f4292a5c344
commit: 42cf5538c64f10c33580d3cbf521cfc8f31d0616 [6/13] UPSTREAM: kfence: test: use kunit_skip() to skip tests
config: arm64-randconfig-001-20231220 (https://download.01.org/0day-ci/archive/20231220/202312201706.J8DYOfa6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312201706.J8DYOfa6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312201706.J8DYOfa6-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/kfence/kfence_test.c: In function 'test_init_on_free':
>> mm/kfence/kfence_test.c:37:17: error: implicit declaration of function 'kunit_skip' [-Werror=implicit-function-declaration]
      37 |                 kunit_skip((test), "Test requires: " #cond);    \
         |                 ^~~~~~~~~~
   mm/kfence/kfence_test.c:562:9: note: in expansion of macro 'KFENCE_TEST_REQUIRES'
     562 |         KFENCE_TEST_REQUIRES(test, IS_ENABLED(CONFIG_INIT_ON_FREE_DEFAULT_ON));
         |         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kunit_skip +37 mm/kfence/kfence_test.c

    34	
    35	#define KFENCE_TEST_REQUIRES(test, cond) do {			\
    36		if (!(cond))						\
  > 37			kunit_skip((test), "Test requires: " #cond);	\
    38	} while (0)
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
