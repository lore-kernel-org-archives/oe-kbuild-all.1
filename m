Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA2979F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692631059; x=1724167059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j4fMPuO8XCUdlZmre5s4m7/T67iiNAgs0dHoxRDCCiQ=;
  b=lPaH585CskaKwuemOKKJSBdURIIzS2s9rEWU87Yk2IU9m/hINpwDDJTB
   bDtA5Et8yo+vjoVqQZWIL2DICq/GCjsqQUhu2hoUYlmeIHcsCx6fiSRsy
   IwhMLzsQ0V1DRpJaYRer5+mZ/X4LfnEcVMluWe8PknJ1yU1dyQWddQkYm
   y7/4fvbjdja+VApsMX7blmfIbrl4WU6UjDVUsxO0k5hqb/mw13UQNXqko
   bOZVgO7Vuiu+Mkra+tG8Pfdsu1qDA66x1B3E99MzZ6cEbq+m+Fpb3cCVg
   OGlducxnex/tTYkv9MC/uKhfLZJ35bDnMDMdVe+WMddqxTwTSCLZaxwbu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="363784497"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="363784497"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 08:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765407117"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="765407117"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 08:14:09 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY6bY-0000cx-1p;
	Mon, 21 Aug 2023 15:14:08 +0000
Date: Mon, 21 Aug 2023 23:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	surenb@google.com, willy@infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH rfc v2 01/10] mm: add a generic VMA lock-based page fault
 handler
Message-ID: <202308212249.dZG3d55u-lkp@intel.com>
References: <20230821123056.2109942-2-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821123056.2109942-2-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230821]
[cannot apply to akpm-mm/mm-everything arm64/for-next/core tip/x86/mm s390/features powerpc/next powerpc/fixes arm/for-next arm/fixes linus/master v6.5-rc7 v6.5-rc6 v6.5-rc5 v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-add-a-generic-VMA-lock-based-page-fault-handler/20230821-203442
base:   next-20230821
patch link:    https://lore.kernel.org/r/20230821123056.2109942-2-wangkefeng.wang%40huawei.com
patch subject: [PATCH rfc v2 01/10] mm: add a generic VMA lock-based page fault handler
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230821/202308212249.dZG3d55u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212249.dZG3d55u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212249.dZG3d55u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> include/linux/mm.h:810:38: error: redefinition of 'lock_vma_under_rcu'
     810 | static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/mm.h:794:38: note: previous definition of 'lock_vma_under_rcu' with type 'struct vm_area_struct *(struct mm_struct *, long unsigned int)'
     794 | static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
         |                                      ^~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/lock_vma_under_rcu +810 include/linux/mm.h

   809	
 > 810	static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
   811			unsigned long address)
   812	{
   813		return NULL;
   814	}
   815	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
