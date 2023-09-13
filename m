Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFEA3FFE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694612752; x=1726148752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GCLaFcwHhlJuHgafwVLpXMyOgrPNb4ShTKeaOQkpDmQ=;
  b=GdNzZcRXoSwGDs+ZvgI/KsJwwRcSwbmIYiQXBUToe5PF8l5MguwMiAxe
   CAjGC4Oth7VAz+MoX/2t03Pa0v1Rtp2Q1GDj+Dc5tICJNH9fsCDTpqRC5
   oQsYCXQPpZ7BEkVg9fUM1glRfcfHl7+hoosaCHEVEkhtFCScbpnVWJp2f
   gwmytWSNT6Omr2E3rgMdNFB/pqzGMew2JhNzhWDQ0H1jte9WHGkDsK/pq
   foso67km3IekWGv34g/Ebw02bDZXl8/l2mAQ3xycc38R0kz5i5hPCzJXD
   8CxdoomjjVrHIgnPZzxGF50nY0Xa0ruhNzqewMkaghCstZ5Aq94i958Bd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="375995833"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="375995833"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 06:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="720810862"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="720810862"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Sep 2023 06:45:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgQBg-00007R-14;
	Wed, 13 Sep 2023 13:45:48 +0000
Date: Wed, 13 Sep 2023 21:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2]
 mm/kfence/kfence_test.c:647:39: warning: dereferencing 'void *' pointer
Message-ID: <202309132114.QnzvZDAs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   b086f69b6ffadeb19959f05bd67cc5d196a78558
commit: b086f69b6ffadeb19959f05bd67cc5d196a78558 [2/2] kfence: Use a void * for page pool
config: parisc-randconfig-r035-20230913 (https://download.01.org/0day-ci/archive/20230913/202309132114.QnzvZDAs-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309132114.QnzvZDAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132114.QnzvZDAs-lkp@intel.com/

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
>> mm/kfence/kfence_test.c:647:39: warning: dereferencing 'void *' pointer
     647 |                 .addr = &__kfence_pool[10],
         |                                       ^
   In file included from ./arch/parisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246:
   mm/kfence/kfence_test.c:651:32: warning: dereferencing 'void *' pointer
     651 |         READ_ONCE(__kfence_pool[10]);
         |                                ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/kfence/kfence_test.c:651:9: note: in expansion of macro 'READ_ONCE'
     651 |         READ_ONCE(__kfence_pool[10]);
         |         ^~~~~~~~~
>> include/asm-generic/rwonce.h:44:26: warning: dereferencing 'void *' pointer
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/kfence/kfence_test.c:651:9: note: in expansion of macro 'READ_ONCE'
     651 |         READ_ONCE(__kfence_pool[10]);
         |         ^~~~~~~~~
   In file included from mm/kfence/kfence_test.c:17:
   include/linux/kfence.h: In function 'is_kfence_address':
   include/linux/kfence.h:59:1: error: control reaches end of non-void function [-Werror=return-type]
      59 | }
         | ^
   cc1: some warnings being treated as errors


vim +647 mm/kfence/kfence_test.c

bc8fbc5f305aec Marco Elver 2021-02-25  641  
bc8fbc5f305aec Marco Elver 2021-02-25  642  static void test_invalid_access(struct kunit *test)
bc8fbc5f305aec Marco Elver 2021-02-25  643  {
bc8fbc5f305aec Marco Elver 2021-02-25  644  	const struct expect_report expect = {
bc8fbc5f305aec Marco Elver 2021-02-25  645  		.type = KFENCE_ERROR_INVALID,
bc8fbc5f305aec Marco Elver 2021-02-25  646  		.fn = test_invalid_access,
bc8fbc5f305aec Marco Elver 2021-02-25 @647  		.addr = &__kfence_pool[10],
bc8fbc5f305aec Marco Elver 2021-02-25  648  		.is_write = false,
bc8fbc5f305aec Marco Elver 2021-02-25  649  	};
bc8fbc5f305aec Marco Elver 2021-02-25  650  
bc8fbc5f305aec Marco Elver 2021-02-25  651  	READ_ONCE(__kfence_pool[10]);
bc8fbc5f305aec Marco Elver 2021-02-25  652  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
bc8fbc5f305aec Marco Elver 2021-02-25  653  }
bc8fbc5f305aec Marco Elver 2021-02-25  654  

:::::: The code at line 647 was first introduced by commit
:::::: bc8fbc5f305aecf63423da91e5faf4c0ce40bf38 kfence: add test suite

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
