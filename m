Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A68C1E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 02:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694484252; x=1726020252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQg+s2V6b7qoKhAYmVAQrA4PEOfHbzWWvRfnD0nfzeg=;
  b=eaRawVxPEKTZeufz1wJis/GhDGbeLwZPvR88GXUIgQ/3A4yl71hvEcwy
   vnbVRWauOOpaaNzq/T3jxVqJdglecNchIik2ADhW4RH7AdiHYhkHQETmg
   NyFU5mKG2rsxzEdy2CG+KqQg2utQbVsrDbSHLdyh3vf4LSCbcJJ+yBdvA
   bu6uMeRKS8ja/YJoscJrKFrwnnWXJbGVaM+pqy1s39JZ+f3VbU3WIRdPf
   /Sh81UI1oP2UzXvKUrxy16zoIDmP6iLDQNz5iBd/eqR5Z4LPUzoOa3R4K
   G0AEik9mrl31RHFCIIcGVjC9k3DCINekNiE/tcdUBwL1RE4nzZxDF21En
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363289093"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="363289093"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 19:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813616648"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="813616648"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2023 19:04:08 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfsl4-00077s-0j;
	Tue, 12 Sep 2023 02:04:06 +0000
Date: Tue, 12 Sep 2023 10:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 7/7] riscv: mm: Combine the SMP and non-SMP TLB flushing
 code
Message-ID: <202309120901.kQtGm3L4-lkp@intel.com>
References: <20230909201727.10909-8-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230909201727.10909-8-samuel@sholland.org>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc1 next-20230911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv-Apply-SiFive-CIP-1200-workaround-to-single-ASID-sfence-vma/20230910-042028
base:   linus/master
patch link:    https://lore.kernel.org/r/20230909201727.10909-8-samuel%40sholland.org
patch subject: [PATCH 7/7] riscv: mm: Combine the SMP and non-SMP TLB flushing code
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20230912/202309120901.kQtGm3L4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120901.kQtGm3L4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120901.kQtGm3L4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/pgtable.h:117,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/riscv/kernel/asm-offsets.c:10:
   arch/riscv/include/asm/tlbflush.h: In function 'flush_tlb_kernel_range':
>> arch/riscv/include/asm/tlbflush.h:60:9: error: implicit declaration of function 'flush_tlb_all' [-Werror=implicit-function-declaration]
      60 |         flush_tlb_all();
         |         ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/flush_tlb_all +60 arch/riscv/include/asm/tlbflush.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  55  
fab957c11efe2f Palmer Dabbelt 2017-07-10  56  /* Flush a range of kernel pages */
fab957c11efe2f Palmer Dabbelt 2017-07-10  57  static inline void flush_tlb_kernel_range(unsigned long start,
fab957c11efe2f Palmer Dabbelt 2017-07-10  58  	unsigned long end)
fab957c11efe2f Palmer Dabbelt 2017-07-10  59  {
fab957c11efe2f Palmer Dabbelt 2017-07-10 @60  	flush_tlb_all();
fab957c11efe2f Palmer Dabbelt 2017-07-10  61  }
fab957c11efe2f Palmer Dabbelt 2017-07-10  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
