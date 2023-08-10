Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30219BB3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691657891; x=1723193891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1jH60Q3/mVwKxYUdY/5/RIvMVuA9Q5Kl/SRvYq8NEA=;
  b=E2HD2f4fppDQnqf5qEhFq8zdqSnEA1hq6CmdEs2CIinN0FJHqnr6S1aj
   wzQoZc9W33QZYyNPPmGbnguxJ1vdPvGeAoiVqrxAPU352VhPKHrvP7+7o
   gVaTIS1P9H48KYVe9qLHAKtvpyiR3Na7kYvxUJYjy3zjMVfRhRto0BZ6W
   5ZNQYmOYhHVW/KUV7r6syVi6gHL3kD3vL/e9U4TVrcAH8Qy9H+66sWRo2
   P9oFiZWMWqPU0yjylKEy5ETymj+2SSaY093U+RUydXfviPhvONFHxwDPE
   yEY0p7zu+IODvKCX5ctz3KvYnoS3kAhkN3Qfm2MBCJh5FMp0yHRX7dIBF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370241594"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="370241594"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 01:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761726846"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="761726846"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 01:58:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU1Ua-0006se-13;
	Thu, 10 Aug 2023 08:58:04 +0000
Date: Thu, 10 Aug 2023 16:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2]
 mm/kfence/kfence_test.c:644:39: warning: dereferencing 'void *' pointer
Message-ID: <202308101605.T3fVP6kV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   709c5a98b878015dc4f8838fca1c0194b42dee86
commit: 709c5a98b878015dc4f8838fca1c0194b42dee86 [2/2] kfence: Use a void * for page pool
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230810/202308101605.T3fVP6kV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101605.T3fVP6kV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101605.T3fVP6kV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from mm/kfence/kfence_test.c:14:
   include/linux/kfence.h: In function 'is_kfence_address':
   include/linux/kfence.h:58:54: error: invalid operands to binary - (have 'char *' and 'void *')
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^
         |                                         |
         |                                         char *
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/kfence/kfence_test.c: In function 'test_invalid_access':
>> mm/kfence/kfence_test.c:644:39: warning: dereferencing 'void *' pointer
     644 |                 .addr = &__kfence_pool[10],
         |                                       ^
   In file included from arch/s390/include/asm/rwonce.h:29,
                    from include/linux/compiler.h:246:
   mm/kfence/kfence_test.c:648:32: warning: dereferencing 'void *' pointer
     648 |         READ_ONCE(__kfence_pool[10]);
         |                                ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/kfence/kfence_test.c:648:9: note: in expansion of macro 'READ_ONCE'
     648 |         READ_ONCE(__kfence_pool[10]);
         |         ^~~~~~~~~
>> include/asm-generic/rwonce.h:44:26: warning: dereferencing 'void *' pointer
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/kfence/kfence_test.c:648:9: note: in expansion of macro 'READ_ONCE'
     648 |         READ_ONCE(__kfence_pool[10]);
         |         ^~~~~~~~~
   In file included from mm/kfence/kfence_test.c:17:
   include/linux/kfence.h: In function 'is_kfence_address':
   include/linux/kfence.h:59:1: error: control reaches end of non-void function [-Werror=return-type]
      59 | }
         | ^
   cc1: some warnings being treated as errors


vim +644 mm/kfence/kfence_test.c

bc8fbc5f305aec Marco Elver 2021-02-25  638  
bc8fbc5f305aec Marco Elver 2021-02-25  639  static void test_invalid_access(struct kunit *test)
bc8fbc5f305aec Marco Elver 2021-02-25  640  {
bc8fbc5f305aec Marco Elver 2021-02-25  641  	const struct expect_report expect = {
bc8fbc5f305aec Marco Elver 2021-02-25  642  		.type = KFENCE_ERROR_INVALID,
bc8fbc5f305aec Marco Elver 2021-02-25  643  		.fn = test_invalid_access,
bc8fbc5f305aec Marco Elver 2021-02-25 @644  		.addr = &__kfence_pool[10],
bc8fbc5f305aec Marco Elver 2021-02-25  645  		.is_write = false,
bc8fbc5f305aec Marco Elver 2021-02-25  646  	};
bc8fbc5f305aec Marco Elver 2021-02-25  647  
bc8fbc5f305aec Marco Elver 2021-02-25  648  	READ_ONCE(__kfence_pool[10]);
bc8fbc5f305aec Marco Elver 2021-02-25  649  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
bc8fbc5f305aec Marco Elver 2021-02-25  650  }
bc8fbc5f305aec Marco Elver 2021-02-25  651  

:::::: The code at line 644 was first introduced by commit
:::::: bc8fbc5f305aecf63423da91e5faf4c0ce40bf38 kfence: add test suite

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
