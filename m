Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE41851
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694247418; x=1725783418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=on7fcGhDhOSHrDFPYPxEfCIkCWmYbrJyFDP+8sMR7fQ=;
  b=cEPT5O5TQKrbo6V3pZeqEg0UK2siQltU8M3mVsNIrei878/FAlX4hwvK
   pzwA1CjVoBzTnLozpAMCkqpdJecQiY+8ZTxQz0siqn4SPLt5s5JTyZA4o
   2P/d2vinXuzkJhbdnwxFGUJifUplBei/FmEto1cCAs03J9/+DvfbvVBqQ
   GiGZehA4SRsHLk7PUUsv+DXkSsVeKsTbhg3EHeHPJZmgwXjeiwNFovrOL
   oaUYL7C62VICw97WlUCuoCdUN82QYjiSgvD3pC7hCFoBSlLknx0H8vzeR
   JxG4KgHpO7nOcytcqElugMzYj39dOXiClbJwSCugMwhMlqRBZzoSfR4DK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376714668"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="376714668"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 01:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692512082"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="692512082"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Sep 2023 01:16:55 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qet9B-00038j-22;
	Sat, 09 Sep 2023 08:16:53 +0000
Date: Sat, 9 Sep 2023 16:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/loongarch/kernel/asm-offsets.c:262:6: warning: no previous
 prototype for 'output_pbe_defines'
Message-ID: <202309091602.wwOWrqLD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 7db54bfe44a662c8f2c10277bccfa02c2f4c719c LoongArch: Add hibernation (ACPI S4) support
date:   9 months ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230909/202309091602.wwOWrqLD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091602.wwOWrqLD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091602.wwOWrqLD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kernel/asm-offsets.c:16:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      16 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:63:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      63 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:75:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      75 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:91:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      91 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:134:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     134 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:174:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     174 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:206:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     206 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:214:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     214 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:252:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     252 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:262:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     262 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
--
   arch/loongarch/kernel/asm-offsets.c:16:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      16 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:63:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      63 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:75:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      75 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:91:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      91 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:134:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     134 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:174:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     174 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:206:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     206 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:214:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     214 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:252:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     252 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:262:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     262 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   <stdin>:569:2: warning: #warning syscall fstat not implemented [-Wcpp]


vim +/output_pbe_defines +262 arch/loongarch/kernel/asm-offsets.c

   260	
   261	#ifdef CONFIG_HIBERNATION
 > 262	void output_pbe_defines(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
