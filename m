Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34E713AF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 18:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687197780; x=1718733780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uGKm6Av4wPsbuR1VlUyg5vC1/B81S1Wyh2ObgUr7s9w=;
  b=H7Q4h4RrfG2HKXZqrY/MXIkuOHWsejUBvaxKBlwEYKBe+VTu1D2pepAG
   cxGaZEv1Bx3AadPcMbRjDNTyimMapqv5hbyAy40UxdLICdBYW8ck9aoxc
   qYtwKR9DtLFuxqnCgXGWGAFVCkFDbvh7Fo0WfFm8PFzMM6wGGkIzSOm9P
   gk1NmQ8f6w0eCcSKSRyl4Ho84PWPy0CyW0ec5WBlmdWwY6Ub/QNMQ/8hK
   pmMhryRszsZorvddGoCDD4lCCyfdGB1B+mATJyu7nO1Wcrlml8SU7B0Ti
   86ZCmLEJoNPHx2SQfMBLu0XwhLcoDFwFiH3jO7KqEK4a5N3IgziX5K87A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="339299544"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="339299544"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 11:02:58 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="747681076"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="747681076"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Jun 2023 11:02:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBJDM-0004zM-0M;
	Mon, 19 Jun 2023 18:02:56 +0000
Date: Tue, 20 Jun 2023 02:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 26/35]
 arch/arm64/kernel/fpsimd.c:598:49: error: 'sve_default_vector_length'
 undeclared; did you mean 'vec_set_vector_length'?
Message-ID: <202306200154.P8xHeDDK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   2b49f8dc213b7691cb69000b5a3986f82eb064e8
commit: 2d78312d569c20b5084a58dbce76b04d5f526380 [26/35] sysctl: add ARRAY_SIZE to register_sysctl call in fpsimd.c
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230620/202306200154.P8xHeDDK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200154.P8xHeDDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200154.P8xHeDDK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/cpufeature.h:22,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/arm64/kernel/fpsimd.c:14:
   arch/arm64/kernel/fpsimd.c: In function 'sve_sysctl_init':
>> arch/arm64/kernel/fpsimd.c:598:49: error: 'sve_default_vector_length' undeclared (first use in this function); did you mean 'vec_set_vector_length'?
     598 |                                      ARRAY_SIZE(sve_default_vector_length))
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:33: note: in definition of macro 'ARRAY_SIZE'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   arch/arm64/kernel/fpsimd.c:598:49: note: each undeclared identifier is reported only once for each function it appears in
     598 |                                      ARRAY_SIZE(sve_default_vector_length))
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:33: note: in definition of macro 'ARRAY_SIZE'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   In file included from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from include/linux/bitmap.h:8,
                    from arch/arm64/kernel/fpsimd.c:9:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:232:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     232 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/fpsimd.c:598:38: note: in expansion of macro 'ARRAY_SIZE'
     598 |                                      ARRAY_SIZE(sve_default_vector_length))
         |                                      ^~~~~~~~~~
>> arch/arm64/kernel/fpsimd.c:598:76: error: expected ')' before 'return'
     598 |                                      ARRAY_SIZE(sve_default_vector_length))
         |                                                                            ^
         |                                                                            )
     599 |                         return -EINVAL;
         |                         ~~~~~~                                              
   arch/arm64/kernel/fpsimd.c:597:20: note: to match this '('
     597 |                 if (!register_sysctl("abi", sve_default_vl_table,
         |                    ^
>> arch/arm64/kernel/fpsimd.c:602:1: error: expected expression before '}' token
     602 | }
         | ^
   arch/arm64/kernel/fpsimd.c:602:1: error: no return statement in function returning non-void [-Werror=return-type]
   arch/arm64/kernel/fpsimd.c: In function 'sme_sysctl_init':
   arch/arm64/kernel/fpsimd.c:621:22: error: too few arguments to function 'register_sysctl'
     621 |                 if (!register_sysctl("abi", sme_default_vl_table))
         |                      ^~~~~~~~~~~~~~~
   In file included from include/linux/key.h:17,
                    from include/linux/cred.h:13,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17:
   include/linux/sysctl.h:230:26: note: declared here
     230 | struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table,
         |                          ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +598 arch/arm64/kernel/fpsimd.c

   593	
   594	static int __init sve_sysctl_init(void)
   595	{
   596		if (system_supports_sve())
   597			if (!register_sysctl("abi", sve_default_vl_table,
 > 598					     ARRAY_SIZE(sve_default_vector_length))
   599				return -EINVAL;
   600	
   601		return 0;
 > 602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
