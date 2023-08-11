Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1C5693
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 11:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691751869; x=1723287869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qOxSs4tKJgJghZwRR9vT/DRBXzaVROWVkVxCvcALBk=;
  b=Jah+S0bl+mSnx426WmLpRExYXH/JZyOvCrNK+AbpekPnyxLOJJFLx45/
   7ih8rknWt24mSI1hCyUX7+lE52/9EL5uhobRNCkQwbbc1XSCbRuywhYFd
   nnNIkTmMCBcBoxw9jSooz5iw/cJbNZeAUyYWYMB0dwGeV147TzafYCw9k
   XrfH7frzBoucrxfJOsc8senp6y2XuF4oVW1kIbIT0JYlGijZEZu9gLGKk
   /GEYIfJ5C9Gl92PRhenEppgBy0BUYZIS9joHGS8EDu1v3wbUiV2Ob14lj
   C5Ej0HPKGjAJqZ5xGGGR2Ur2NkRADcHblO4rqPimbmYbsuBUYAYB9sGig
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="374423378"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="374423378"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876123249"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2023 04:03:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUPvf-0007jO-1c;
	Fri, 11 Aug 2023 11:03:39 +0000
Date: Fri, 11 Aug 2023 19:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Hu <huqi@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 7425/8441]
 arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype
 for 'output_thread_lbt_defines'
Message-ID: <202308111853.ISf5a6VC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 833b4e93b2f9a86522e7ae1f92ba05812cb3a382 [7425/8441] LoongArch: Add Loongson Binary Translation (LBT) extension support
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230811/202308111853.ISf5a6VC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111853.ISf5a6VC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111853.ISf5a6VC-lkp@intel.com/

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
   arch/loongarch/kernel/asm-offsets.c:131:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     131 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     172 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:182:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     182 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:214:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     214 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:222:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     222 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:260:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     260 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
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
   arch/loongarch/kernel/asm-offsets.c:131:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     131 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     172 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:182:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     182 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:214:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     214 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:222:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     222 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:260:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     260 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/output_thread_lbt_defines +172 arch/loongarch/kernel/asm-offsets.c

   171	
 > 172	void output_thread_lbt_defines(void)
   173	{
   174		OFFSET(THREAD_SCR0,  loongarch_lbt, scr0);
   175		OFFSET(THREAD_SCR1,  loongarch_lbt, scr1);
   176		OFFSET(THREAD_SCR2,  loongarch_lbt, scr2);
   177		OFFSET(THREAD_SCR3,  loongarch_lbt, scr3);
   178		OFFSET(THREAD_EFLAGS, loongarch_lbt, eflags);
   179		BLANK();
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
