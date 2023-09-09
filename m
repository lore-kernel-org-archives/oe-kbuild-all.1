Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3825C6FBD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694300578; x=1725836578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kdYI3gLn+OXw5eJXQsX/kgg4km5uXqWEXPrQgDX6NVs=;
  b=IL6f6hnMQBRL/62V6Sm0DbqfpdqWsZdiTHtkz03T/jI4am+kwjK4OQSj
   BYvr4NdLQhjWO5br/pbhX891Os1rPpKcKHUNCqNjNW9puvsQc905oPzML
   dbjXy4TjxbLHYdC2HsqxDyPLoPeeO+Kiv8lA4Pm8Lo79BPyUjVMjxa8lP
   hXzqunHQ0fV+r6UOGj083cfOvEjtu8XBcTzkZFibTQeL8IYr82tYu4I5F
   b76ta3PJq7JdMlIUhzalgLabzB7H0gWLjp8d7PNCpH+mHLwgEcjRKv8kL
   Iu/ppGKsmvBcIfjhPX60o9B11oJPnQXUP/q2HzVPlm9KKbLkUU+mYpAfN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362897874"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="362897874"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 16:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736336319"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="736336319"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Sep 2023 16:02:55 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf6yb-000424-0Z;
	Sat, 09 Sep 2023 23:02:53 +0000
Date: Sun, 10 Sep 2023 07:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 7/7] riscv: mm: Combine the SMP and non-SMP TLB flushing
 code
Message-ID: <202309100639.tTr4BtGk-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv-Apply-SiFive-CIP-1200-workaround-to-single-ASID-sfence-vma/20230910-042028
base:   linus/master
patch link:    https://lore.kernel.org/r/20230909201727.10909-8-samuel%40sholland.org
patch subject: [PATCH 7/7] riscv: mm: Combine the SMP and non-SMP TLB flushing code
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230910/202309100639.tTr4BtGk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100639.tTr4BtGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100639.tTr4BtGk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/mm/tlbflush.c: In function '__flush_tlb_range':
>> arch/riscv/mm/tlbflush.c:52:22: warning: variable 'cpuid' set but not used [-Wunused-but-set-variable]
      52 |         unsigned int cpuid;
         |                      ^~~~~


vim +/cpuid +52 arch/riscv/mm/tlbflush.c

18d2199d81054f Anup Patel        2023-03-28  46  
18d2199d81054f Anup Patel        2023-03-28  47  static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
c3b2d67046d236 Nanyong Sun       2021-04-30  48  			      unsigned long size, unsigned long stride)
95594cb40c6e01 Christoph Hellwig 2019-08-21  49  {
ff15058bb4eb32 Samuel Holland    2023-09-09  50  	unsigned long asid = cntx2asid(atomic_long_read(&mm->context.id));
70c7605c08c597 Christoph Hellwig 2021-06-06  51  	struct cpumask *cmask = mm_cpumask(mm);
31738ede9b339c Atish Patra       2019-08-22 @52  	unsigned int cpuid;
95594cb40c6e01 Christoph Hellwig 2019-08-21  53  
6384423f49c804 Atish Patra       2019-08-22  54  	if (cpumask_empty(cmask))
6384423f49c804 Atish Patra       2019-08-22  55  		return;
6384423f49c804 Atish Patra       2019-08-22  56  
31738ede9b339c Atish Patra       2019-08-22  57  	cpuid = get_cpu();
047bf3010ac2de Samuel Holland    2023-09-09  58  #ifdef CONFIG_SMP
3f1e782998cdf6 Guo Ren           2021-06-06  59  	/* check if the tlbflush needs to be sent to other CPUs */
ff15058bb4eb32 Samuel Holland    2023-09-09  60  	if (cpumask_any_but(cmask, cpuid) < nr_cpu_ids) {
18d2199d81054f Anup Patel        2023-03-28  61  		if (riscv_use_ipi_for_rfence()) {
047bf3010ac2de Samuel Holland    2023-09-09  62  			struct flush_tlb_range_data ftd;
047bf3010ac2de Samuel Holland    2023-09-09  63  
18d2199d81054f Anup Patel        2023-03-28  64  			ftd.asid = asid;
18d2199d81054f Anup Patel        2023-03-28  65  			ftd.start = start;
18d2199d81054f Anup Patel        2023-03-28  66  			ftd.size = size;
18d2199d81054f Anup Patel        2023-03-28  67  			ftd.stride = stride;
18d2199d81054f Anup Patel        2023-03-28  68  			on_each_cpu_mask(cmask,
18d2199d81054f Anup Patel        2023-03-28  69  					 __ipi_flush_tlb_range_asid,
18d2199d81054f Anup Patel        2023-03-28  70  					 &ftd, 1);
18d2199d81054f Anup Patel        2023-03-28  71  		} else
18d2199d81054f Anup Patel        2023-03-28  72  			sbi_remote_sfence_vma_asid(cmask,
18d2199d81054f Anup Patel        2023-03-28  73  						   start, size, asid);
18d2199d81054f Anup Patel        2023-03-28  74  	} else
047bf3010ac2de Samuel Holland    2023-09-09  75  #endif
ff15058bb4eb32 Samuel Holland    2023-09-09  76  		local_flush_tlb_range_asid(start, size, stride, asid);
31738ede9b339c Atish Patra       2019-08-22  77  	put_cpu();
95594cb40c6e01 Christoph Hellwig 2019-08-21  78  }
95594cb40c6e01 Christoph Hellwig 2019-08-21  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
