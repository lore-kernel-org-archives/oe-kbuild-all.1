Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A61FC2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694259981; x=1725795981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UI7IR0Ft3ndhwmZaJP7vXpuiljdP0FhgaQdrnHO04f4=;
  b=MsePHlGbg2DqT84zYjUwkfZlXzxOC9C6yiD2JRWHNFRPHUtbj/NMHSao
   K2HKZTuTOEKqScMpVRRr6d7kHioaDW6FeUhpHzt8s6wuJcBXmMBks4mLY
   P74rkbru36/Fxuhxkzy4tZ/LOVwF9ZZ336sZJC9qSN41PbT9sizlIzIbd
   /N9Oho7IPbEYPhAIpuFspai0iMsWkcTaqFlOZHLQa/7Y39CmnfJdpmEQW
   InrEKqC0SxxokFroUhNpZ+tHl9tBjr7fLJ21gpWgkqAPGc/L65DM5yo2I
   XJPe9rvcCmxQ7azrT14ezoB/Slxmg2yK5vuUcbumLICtff9suKyWorTFA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376724425"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="376724425"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 04:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="866392453"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="866392453"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Sep 2023 04:46:16 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qewPm-0003RK-09;
	Sat, 09 Sep 2023 11:46:14 +0000
Date: Sat, 9 Sep 2023 19:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: arch/loongarch/kernel/asm-offsets.c:278:6: warning: no previous
 prototype for 'output_fgraph_ret_regs_defines'
Message-ID: <202309091907.j6NUC3Nc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 5779e3c0f5aed8a3239839ad55ad017e1278ecd7 LoongArch: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
date:   3 months ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230909/202309091907.j6NUC3Nc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091907.j6NUC3Nc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091907.j6NUC3Nc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kernel/asm-offsets.c:17:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      17 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:64:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      64 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:79:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      79 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:95:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      95 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:138:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     138 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:178:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     178 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:210:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     210 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:218:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     218 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:256:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     256 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:266:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     266 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:278:6: warning: no previous prototype for 'output_fgraph_ret_regs_defines' [-Wmissing-prototypes]
     278 | void output_fgraph_ret_regs_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   arch/loongarch/kernel/asm-offsets.c:17:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      17 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:64:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      64 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:79:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      79 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:95:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      95 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:138:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     138 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:178:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     178 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:210:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     210 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:218:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     218 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:256:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     256 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:266:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     266 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:278:6: warning: no previous prototype for 'output_fgraph_ret_regs_defines' [-Wmissing-prototypes]
     278 | void output_fgraph_ret_regs_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/output_fgraph_ret_regs_defines +278 arch/loongarch/kernel/asm-offsets.c

   276	
   277	#ifdef CONFIG_FUNCTION_GRAPH_TRACER
 > 278	void output_fgraph_ret_regs_defines(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
