Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD074815
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 04:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691640911; x=1723176911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyXJAOwhgheKnmwCXCKfGzb7Fmjqml1SBxO/u0bgOaU=;
  b=S9RuB+EZPO5APzu/jfQwvaEj/y5gy6I3b7FyZ3FFpd6mQrNSgTwvoa/5
   FCa1BsfeR/D4e+DLU4ffOG+mV5qCtW1jvBoPm6Dma3knzzZ6C1ybRZZwQ
   r6nq3MP6tYkTL9SCBTb0H2JjPTJvYfJyK3taUrscBiimxz8/VoEy9ioIs
   5fqLc33XDHjTBQSJ9G6KYEo1pMvg2en/xthln6M+DuClH9yyqBrrkVCri
   Ml16YqaIFZl2xC4TliR1RplguzWtLSCSbEQTERAOe7Jwv6tu6k3NO5ZK9
   Ry0pjX623qKl+tkBhsAyNpJcMBWxIIyF+OYJyaa8iElVxHpj96A5FpOMa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370194346"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="370194346"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 21:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="822079724"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="822079724"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 21:14:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTx4c-0006iV-1h;
	Thu, 10 Aug 2023 04:14:58 +0000
Date: Thu, 10 Aug 2023 12:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap-fixes 1/12] include/linux/numa.h:48:1: error: expected
 identifier or '(' before '{' token
Message-ID: <202308101238.uZPuL7sc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap-fixes
head:   9afb43a6a90b06db96053e97f26cfdddc08ca372
commit: beec375f74a28a70cfc2160f22585432ee523d5a [1/12] numa_nearest_node
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308101238.uZPuL7sc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101238.uZPuL7sc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101238.uZPuL7sc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:16,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/alpha/kernel/asm-offsets.c:10:
>> include/linux/numa.h:48:1: error: expected identifier or '(' before '{' token
      48 | {
         | ^
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
>> include/linux/numa.h:47:19: warning: 'numa_nearest_node' declared 'static' but never defined [-Wunused-function]
      47 | static inline int numa_nearest_node(int node, unsigned int state);
         |                   ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +48 include/linux/numa.h

a927bd6ba952d1 Dan Williams 2020-11-21  29  
a927bd6ba952d1 Dan Williams 2020-11-21  30  #ifndef memory_add_physaddr_to_nid
a927bd6ba952d1 Dan Williams 2020-11-21  31  static inline int memory_add_physaddr_to_nid(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  32  {
a927bd6ba952d1 Dan Williams 2020-11-21  33  	pr_info_once("Unknown online node for memory at 0x%llx, assuming node 0\n",
a927bd6ba952d1 Dan Williams 2020-11-21  34  			start);
a927bd6ba952d1 Dan Williams 2020-11-21  35  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  36  }
a927bd6ba952d1 Dan Williams 2020-11-21  37  #endif
a927bd6ba952d1 Dan Williams 2020-11-21  38  #ifndef phys_to_target_node
a927bd6ba952d1 Dan Williams 2020-11-21  39  static inline int phys_to_target_node(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  40  {
a927bd6ba952d1 Dan Williams 2020-11-21  41  	pr_info_once("Unknown target node for memory at 0x%llx, assuming node 0\n",
a927bd6ba952d1 Dan Williams 2020-11-21  42  			start);
a927bd6ba952d1 Dan Williams 2020-11-21  43  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  44  }
a927bd6ba952d1 Dan Williams 2020-11-21  45  #endif
a927bd6ba952d1 Dan Williams 2020-11-21  46  #else /* !CONFIG_NUMA */
beec375f74a28a Yury Norov   2023-08-09 @47  static inline int numa_nearest_node(int node, unsigned int state);
b2ca916ce392a9 Dan Williams 2020-02-16 @48  {
b2ca916ce392a9 Dan Williams 2020-02-16  49  	return NUMA_NO_NODE;
b2ca916ce392a9 Dan Williams 2020-02-16  50  }
a927bd6ba952d1 Dan Williams 2020-11-21  51  static inline int memory_add_physaddr_to_nid(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  52  {
a927bd6ba952d1 Dan Williams 2020-11-21  53  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  54  }
a927bd6ba952d1 Dan Williams 2020-11-21  55  static inline int phys_to_target_node(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  56  {
a927bd6ba952d1 Dan Williams 2020-11-21  57  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  58  }
b2ca916ce392a9 Dan Williams 2020-02-16  59  #endif
b2ca916ce392a9 Dan Williams 2020-02-16  60  

:::::: The code at line 48 was first introduced by commit
:::::: b2ca916ce392a9d4cea3489a3efb2b627b839eaf ACPI: NUMA: Up-level "map to online node" functionality

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
