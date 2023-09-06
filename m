Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23D26AB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 19:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694027038; x=1725563038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l9fvwNVR3ATInpnyyjp6bBu8ebIIwJ+C1QUzV+aJGGw=;
  b=UUkHdmGDQng4OiMhyLg5BAhLJy2I32uJLg9bdVP/mjiczXNTnHJPkPrW
   UzjUKWgH/C+VFbUJPPWd6mDPxjYyX4juI2WO+69RXMSals/S7+HQ3kvz5
   PKVUqZC9wH8brc++v+MyAs2mJmY45gbL7ecAn+0jHtjQAs6ZLLwxe6aVs
   uB/GBkDSCfHfN3Mvw9C/6f54papGA7/OFM8h14pYGWr6VkyokX9H8bnw9
   1mdEYkP6ivrqk+ISJKWxlSue93PQNf+KYGME8w1z7WSEK1yDEP24E0bsx
   zAhAW72PF1a36a28eebPYwD0HMCo3gUgn++MNsnJAIem2HuDcvvmPiQSw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374548956"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="374548956"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 12:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691410118"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="691410118"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Sep 2023 12:03:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdxoc-0000Vr-2D;
	Wed, 06 Sep 2023 19:03:50 +0000
Date: Thu, 7 Sep 2023 03:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 7/9] include/linux/rcutree.h:119:1:
 error: unknown type name 'define'
Message-ID: <202309070226.VybJw3MS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   748148886e34351abeb1ba226107d86437bda722
commit: 38b6f851c89d305fdbbcf2ec53aa3033e1870678 [7/9] rcu: Conditionally build CPU-hotplug down related functions
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230907/202309070226.VybJw3MS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070226.VybJw3MS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070226.VybJw3MS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rcupdate.h:261,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/alpha/kernel/asm-offsets.c:10:
>> include/linux/rcutree.h:119:1: error: unknown type name 'define'
     119 | define rcutree_dead_cpu NULL
         | ^~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from arch/alpha/kernel/asm-offsets.c:8:
>> include/linux/stddef.h:8:15: error: expected declaration specifiers or '...' before '(' token
       8 | #define NULL ((void *)0)
         |               ^
   include/linux/rcutree.h:119:25: note: in expansion of macro 'NULL'
     119 | define rcutree_dead_cpu NULL
         |                         ^~~~
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
   make[3]: *** [scripts/Makefile.build:116: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/define +119 include/linux/rcutree.h

   113	
   114	#ifdef CONFIG_HOTPLUG_CPU
   115	int rcutree_dead_cpu(unsigned int cpu);
   116	int rcutree_dying_cpu(unsigned int cpu);
   117	int rcutree_offline_cpu(unsigned int cpu);
   118	#else
 > 119	define rcutree_dead_cpu NULL
   120	define rcutree_dying_cpu NULL
   121	define rcutree_offline_cpu NULL
   122	#endif
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
