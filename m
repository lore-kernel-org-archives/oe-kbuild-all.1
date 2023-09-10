Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF606ABC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694361363; x=1725897363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nj45BA+pWu/nJu6iJbdzNI9R9I9bO1cCR8/yyn9BZ6w=;
  b=aP5HOQDtDD4PkFiARBktsNxQXPiV7yNDKeCn90Td3flSBzXRO6XLpops
   SRxi6F7nDiV4ItAtE2O67sTjkRKaWJaXQLn4yomZmlP1oPfqGIm9aO36I
   rELzcDy3VvUYkPSz5wFr/JSF6PH/6TiGOvjxnG8ITmXRdSNtbFacM6lM3
   MzYJnS4O8TYkLhq9kLgIEmGQY+/C+PCVB/SW9uPvdEQFr2AKrjwTX1QSc
   RdQX/Ms+N8WCzt/Fl9JfxhEnmLUgpPl7X62SPji56MQe0U0lSa/DiSMxz
   Dfg/hAKJeUM+T4TFVVCTO1Yc0l4hzz8QGY5fgCrfehwiAHIthaiaLAQ1C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="441920237"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="441920237"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 08:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858019601"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="858019601"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2023 08:56:01 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfMn0-00057E-2i;
	Sun, 10 Sep 2023 15:55:58 +0000
Date: Sun, 10 Sep 2023 23:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Hu <huqi@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous
 prototype for 'output_thread_lbt_defines'
Message-ID: <202309102312.Dh7fxcU6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   535a265d7f0dd50d8c3a4f8b4f3a452d56bd160f
commit: bd3c5798484aa9a08302a844d7a75a2ee3b53d05 LoongArch: Add Loongson Binary Translation (LBT) extension support
date:   4 days ago
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230910/202309102312.Dh7fxcU6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309102312.Dh7fxcU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309102312.Dh7fxcU6-lkp@intel.com/

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
