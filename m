Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008AB3D62
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 07:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+x9cZT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705304170; x=1736840170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AGE13ZNKc90JJBUv0FQZW2KvKRj0MYvfNGXOyag6jhI=;
  b=i+x9cZT/Vfx9bSYCN8tLbUaQyEbzbKO98ciHTPeZIQnLLjutyTzWux4f
   WgKYBvhTQEflVD3rd2gWMI3jcEjEyPPQIevStSjaRCr1vbM1qDjM3KFfM
   /SLB+35/GP0XwGtWpWZ44Lr0ibUJ6trfex7EkL0ZVjOLtwzU+z/iFoSL6
   xM9plNlZdz0/0gT+iSyBqnSqoU/payVJ/DQz0uU2Buc8QbSZU2K8q4nZn
   vA8pU6bK37pyTRHgkgTDxM+s9YUDOqcxzuQRQHFpGHm/lfbbxFTdlElWg
   HiStCXP2UsmLp3QNP6QyDuAYUg3Z5CUZW0T1Iyu25B/tzZ7NWfoTvV668
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="430722767"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="430722767"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 23:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="787003056"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="787003056"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2024 23:36:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPHVt-000CHp-05;
	Mon, 15 Jan 2024 07:36:05 +0000
Date: Mon, 15 Jan 2024 15:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Loughlin <kevinloughlin@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
Message-ID: <202401151540.v4N5uPZh-lkp@intel.com>
References: <20240111223650.3502633-1-kevinloughlin@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111223650.3502633-1-kevinloughlin@google.com>

Hi Kevin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master tip/x86/mm linus/master v6.7 next-20240112]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Loughlin/x86-sev-enforce-RIP-relative-accesses-in-early-SEV-SME-code/20240112-063856
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240111223650.3502633-1-kevinloughlin%40google.com
patch subject: [RFC PATCH v2] x86/sev: enforce RIP-relative accesses in early SEV/SME code
config: i386-buildonly-randconfig-001-20240115 (https://download.01.org/0day-ci/archive/20240115/202401151540.v4N5uPZh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151540.v4N5uPZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151540.v4N5uPZh-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/mem_encrypt.h:17,
                    from arch/x86/include/asm/page_types.h:7,
                    from arch/x86/include/asm/page.h:9,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/mem_encrypt.h: In function 'sme_get_me_mask_fixup':
>> arch/x86/include/asm/mem_encrypt.h:30:24: error: lvalue required as unary '&' operand
      30 |                 : "p" (&var));          \
         |                        ^
   arch/x86/include/asm/mem_encrypt.h:139:26: note: in expansion of macro 'GET_RIP_RELATIVE_PTR'
     139 |         return *((u64 *) GET_RIP_RELATIVE_PTR(sme_me_mask));
         |                          ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mem_encrypt.h: In function 'sev_get_status_fixup':
>> arch/x86/include/asm/mem_encrypt.h:30:24: error: lvalue required as unary '&' operand
      30 |                 : "p" (&var));          \
         |                        ^
   arch/x86/include/asm/mem_encrypt.h:144:26: note: in expansion of macro 'GET_RIP_RELATIVE_PTR'
     144 |         return *((u64 *) GET_RIP_RELATIVE_PTR(sev_status));
         |                          ^~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2731499559
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2 shuffle=2731499559
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2731499559
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2731499559
   make: Target 'prepare' not remade because of errors.


vim +30 arch/x86/include/asm/mem_encrypt.h

    19	
    20	/*
    21	 * Generates an RIP-relative pointer to a data variable "var".
    22	 * This macro can be used to safely access global data variables prior to kernel
    23	 * relocation, similar to fixup_pointer() in arch/x86/kernel/head64.c.
    24	 */
    25	#define GET_RIP_RELATIVE_PTR(var)	\
    26	({					\
    27		void *rip_rel_ptr;		\
    28		asm ("lea "#var"(%%rip), %0"	\
    29			: "=r" (rip_rel_ptr)	\
  > 30			: "p" (&var));		\
    31		rip_rel_ptr;			\
    32	})
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
