Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB77EE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693148739; x=1724684739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcNWVeMQiljODgI1Ij5VD0PoBYsmmv3eqUG5+gXeR6Q=;
  b=d+caMIZ6khVOGLRciU+km363xEtfHbU8y2S3q5zsqvHywDGieVr9eVNS
   6OnV1ZcMOkgqM/ysrdmqpC8WaSnMP+P6GlhHSuijWqRHsMA76aXgxUIJO
   hLbSHnLacS9MMSiR1fuKJD45LGnjROS4+UMh2ebYLcrSEChb2WyRB2f4N
   mL2lqMAujiCbeonuOJxUU8SVpKu1+xZQ8IU1aIvRC0/V0mnW8OzS9/zmV
   +4jajBDvw0MqI92PGuTnHy0zw6ragRLCvpNjgjat2wvGFYQz5DMMR/UpG
   KLdqeUj2Ol1rYjYob6MvlfIGTL1/TKUYzfy3AsdIscC4qP6PpSdj2AMYf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="365154114"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="365154114"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 08:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="714862075"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="714862075"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Aug 2023 08:05:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaHKa-0005uj-0J;
	Sun, 27 Aug 2023 15:05:36 +0000
Date: Sun, 27 Aug 2023 23:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Reza Arbab <arbab@linux.ibm.com>
Subject: [powerpc:next-test 84/129] arch/powerpc/mm/init_64.c:477:45: error:
 'SECTION_SIZE_BITS' undeclared
Message-ID: <202308272310.O7VMTwkZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   c37b6908f7b2bd24dcaaf14a180e28c9132b9c58
commit: 4d15721177d539d743fcf31d7bb376fb3b81aeb6 [84/129] powerpc/mm: Cleanup memory block size probing
config: powerpc64-randconfig-r021-20230827 (https://download.01.org/0day-ci/archive/20230827/202308272310.O7VMTwkZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308272310.O7VMTwkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308272310.O7VMTwkZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/mm/init_64.c: In function 'update_memory_block_size':
>> arch/powerpc/mm/init_64.c:477:45: error: 'SECTION_SIZE_BITS' undeclared (first use in this function)
     477 |         unsigned long section_size = 1UL << SECTION_SIZE_BITS;
         |                                             ^~~~~~~~~~~~~~~~~
   arch/powerpc/mm/init_64.c:477:45: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/powerpc/mm/init_64.c:43:
   arch/powerpc/mm/init_64.c: In function 'probe_memory_block_size':
>> include/linux/memory.h:23:43: error: 'SECTION_SIZE_BITS' undeclared (first use in this function)
      23 | #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
         |                                           ^~~~~~~~~~~~~~~~~
   arch/powerpc/mm/init_64.c:510:39: note: in expansion of macro 'MIN_MEMORY_BLOCK_SIZE'
     510 |                         *block_size = MIN_MEMORY_BLOCK_SIZE;
         |                                       ^~~~~~~~~~~~~~~~~~~~~


vim +/SECTION_SIZE_BITS +477 arch/powerpc/mm/init_64.c

   474	
   475	static void update_memory_block_size(unsigned long *block_size, unsigned long mem_size)
   476	{
 > 477		unsigned long section_size = 1UL << SECTION_SIZE_BITS;
   478	
   479		for (; *block_size > section_size; *block_size >>= 2) {
   480	
   481			if ((mem_size & *block_size) == 0)
   482				break;
   483		}
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
