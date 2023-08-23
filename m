Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AAA20F18
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692795820; x=1724331820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XafbKmrj9k+5yoXbychGf1j7OJIVWtPK30bqACJEaJg=;
  b=D+fec3e+ULZFPgO8qU9H/sTXT56dtcwkTxhomyqsOLP06oWSAW6OSIy2
   0pIEaVPSu6Z0vaQImrI7bjk2mWHHArUMLXvYl1YrcYDqWmygNqLq/x8J2
   76YyarOMcS9JDlZnjoGjWEpyYePlFT5wxO8TppBZwafDG7m7e9GCFXdDW
   tQxBTS5QNli7zbPR2h0QqT/o/XqiXf2XXj15vbQENl84TUvXPGqpuhdJV
   uiEu/iZBip8MnElCn+gbjFg76WooO9E2nqsvU39C7vLHuTDvHH69e7vvK
   oGK/VES+E+Cks9CRVz7mJE20o0RmxRtIiyTqsF+nr11ywucQOrP4GXsoG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="376880731"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="376880731"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 05:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="771709705"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="771709705"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 05:58:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYnR1-0001DI-29;
	Wed, 23 Aug 2023 12:58:07 +0000
Date: Wed, 23 Aug 2023 20:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-for-next 3/14] lib/test_bits.c:45:16: warning:
 unused variable 'w'
Message-ID: <202308232006.FKNRwmvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-for-next
head:   176809129318c1debb5c61911768ac2ace4f4362
commit: f1b5dc28a1619939ac88b323094226cd5a78e5fd [3/14] DO NOT SUBMIT - Suppress W=2 warnings
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230823/202308232006.FKNRwmvg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232006.FKNRwmvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232006.FKNRwmvg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_bits.c: In function 'genmask_input_check_test':
>> lib/test_bits.c:45:16: warning: unused variable 'w' [-Wunused-variable]
      45 |         int z, w;
         |                ^
>> lib/test_bits.c:45:13: warning: unused variable 'z' [-Wunused-variable]
      45 |         int z, w;
         |             ^
>> lib/test_bits.c:44:25: warning: unused variable 'y' [-Wunused-variable]
      44 |         unsigned int x, y;
         |                         ^
>> lib/test_bits.c:44:22: warning: unused variable 'x' [-Wunused-variable]
      44 |         unsigned int x, y;
         |                      ^


vim +/w +45 lib/test_bits.c

6d511020e13d5d Rikard Falkeborn 2020-08-11  41  
6d511020e13d5d Rikard Falkeborn 2020-08-11  42  static void genmask_input_check_test(struct kunit *test)
6d511020e13d5d Rikard Falkeborn 2020-08-11  43  {
6d511020e13d5d Rikard Falkeborn 2020-08-11 @44  	unsigned int x, y;
6d511020e13d5d Rikard Falkeborn 2020-08-11 @45  	int z, w;
6d511020e13d5d Rikard Falkeborn 2020-08-11  46  
6d511020e13d5d Rikard Falkeborn 2020-08-11  47  	/* Unknown input */
6d511020e13d5d Rikard Falkeborn 2020-08-11  48  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(x, 0));
6d511020e13d5d Rikard Falkeborn 2020-08-11  49  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(0, x));
6d511020e13d5d Rikard Falkeborn 2020-08-11  50  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(x, y));
6d511020e13d5d Rikard Falkeborn 2020-08-11  51  
6d511020e13d5d Rikard Falkeborn 2020-08-11  52  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(z, 0));
6d511020e13d5d Rikard Falkeborn 2020-08-11  53  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(0, z));
6d511020e13d5d Rikard Falkeborn 2020-08-11  54  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(z, w));
6d511020e13d5d Rikard Falkeborn 2020-08-11  55  
6d511020e13d5d Rikard Falkeborn 2020-08-11  56  	/* Valid input */
6d511020e13d5d Rikard Falkeborn 2020-08-11  57  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(1, 1));
6d511020e13d5d Rikard Falkeborn 2020-08-11  58  	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(39, 21));
6d511020e13d5d Rikard Falkeborn 2020-08-11  59  }
6d511020e13d5d Rikard Falkeborn 2020-08-11  60  

:::::: The code at line 45 was first introduced by commit
:::::: 6d511020e13d5d6f5f0af853e32ddef75c693ccc lib/test_bits.c: add tests of GENMASK

:::::: TO: Rikard Falkeborn <rikard.falkeborn@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
