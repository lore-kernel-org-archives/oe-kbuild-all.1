Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11B325542
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Dec 2023 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBc2gTrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703264587; x=1734800587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULLxk4Tm0hvYLgp75PStSjypP+pPpjLpsvea5ayzi1Q=;
  b=CBc2gTrCoAPx//bJhuRBggOebEFexYPFMSBiFWbVcZQqvVwBHp+9865O
   g8cNKlDDFoCTTy5Dt2enBBN5dYrvVWt5KagXQSu/aW2bl8XxMfqG8ONgU
   7gfim7FI0toJZptnPJKOVrtAiE2SAjBEOADBddJ/NkwNNUU2atq4FRlaq
   16qhojZqI0NcLWf4jmamj9jzJDX5jKxFkjFJFZv9jW9vPnJ2LAD5R1g+C
   KK7hU++a7OTsF3t65n6E6Nh5MRJsW7UOy0FbXekg4ebQ5hkMY9ou/MANR
   V6lUbwXk4Zetd4S1o1h6ttJpQMtK6uPQC5FrXxZAH8ag55Rn8XWdJV63x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="482315994"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="482315994"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 09:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="847502664"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="847502664"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2023 09:03:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGivK-0009fb-37;
	Fri, 22 Dec 2023 17:02:59 +0000
Date: Sat, 23 Dec 2023 01:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:zap-batching 43/50] sound/drivers/pcmtest.c:59:12:
 warning: 'index' defined but not used
Message-ID: <202312230023.wjXlx9o6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux zap-batching
head:   a87ca0519e9108ec48b13a88d4a30a7756923d83
commit: 7ddc8bfc39055b1ed487d6639b4125e1c77a9e4b [43/50] mm/memory: optimize fork() with PTE-mapped THP
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231223/202312230023.wjXlx9o6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230023.wjXlx9o6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230023.wjXlx9o6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/thread_info_64.h:27,
                    from arch/sparc/include/asm/thread_info.h:5,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from sound/drivers/pcmtest.c:33:
   include/linux/pgtable.h: In function 'pte_next_pfn':
   include/linux/pgtable.h:211:45: error: 'PFN_PTE_SHIFT' undeclared (first use in this function)
     211 |         return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                             ^~~~~~~~~~~~~
   arch/sparc/include/asm/page_64.h:83:37: note: in definition of macro '__pte'
      83 | #define __pte(x)        ((pte_t) { (x) } )
         |                                     ^
   include/linux/pgtable.h:211:45: note: each undeclared identifier is reported only once for each function it appears in
     211 |         return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                             ^~~~~~~~~~~~~
   arch/sparc/include/asm/page_64.h:83:37: note: in definition of macro '__pte'
      83 | #define __pte(x)        ((pte_t) { (x) } )
         |                                     ^
   In file included from include/linux/mm.h:29,
                    from include/sound/pcm.h:15,
                    from sound/drivers/pcmtest.c:35:
   include/linux/pgtable.h: In function 'wrprotect_ptes':
   include/linux/pgtable.h:220:17: error: implicit declaration of function 'ptep_set_wrprotect'; did you mean 'pte_wrprotect'? [-Werror=implicit-function-declaration]
     220 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 pte_wrprotect
   include/linux/pgtable.h: At top level:
   include/linux/pgtable.h:631:20: warning: conflicting types for 'ptep_set_wrprotect'; have 'void(struct mm_struct *, long unsigned int,  pte_t *)'
     631 | static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:631:20: error: static declaration of 'ptep_set_wrprotect' follows non-static declaration
   include/linux/pgtable.h:220:17: note: previous implicit declaration of 'ptep_set_wrprotect' with type 'void(struct mm_struct *, long unsigned int,  pte_t *)'
     220 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
>> sound/drivers/pcmtest.c:59:12: warning: 'index' defined but not used [-Wunused-variable]
      59 | static int index = -1;
         |            ^~~~~
   cc1: some warnings being treated as errors


vim +/index +59 sound/drivers/pcmtest.c

315a3d57c64c55 Ivan Orlov 2023-06-06  58  
315a3d57c64c55 Ivan Orlov 2023-06-06 @59  static int index = -1;
315a3d57c64c55 Ivan Orlov 2023-06-06  60  static char *id = "pcmtest";
315a3d57c64c55 Ivan Orlov 2023-06-06  61  static bool enable = true;
315a3d57c64c55 Ivan Orlov 2023-06-06  62  static int inject_delay;
315a3d57c64c55 Ivan Orlov 2023-06-06  63  static bool inject_hwpars_err;
315a3d57c64c55 Ivan Orlov 2023-06-06  64  static bool inject_prepare_err;
315a3d57c64c55 Ivan Orlov 2023-06-06  65  static bool inject_trigger_err;
678a0bbe158076 Ivan Orlov 2023-07-13  66  static bool inject_open_err;
315a3d57c64c55 Ivan Orlov 2023-06-06  67  

:::::: The code at line 59 was first introduced by commit
:::::: 315a3d57c64c55901d6fe5a5eef3b3e51d215381 ALSA: Implement the new Virtual PCM Test Driver

:::::: TO: Ivan Orlov <ivan.orlov0322@gmail.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
