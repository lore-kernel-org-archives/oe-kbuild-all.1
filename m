Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6D51111
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 06:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690180517; x=1721716517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m+qPwukwbEwzqIAHO31dbaDqx+rqciqUMTapTUFZYko=;
  b=mcyY5EJtHjWaTXz7W7SapHds68X3fAhwbTwl5/to76awu0Jh2b6tk3Bj
   UCfRX5AF7AIpAQxh4Mu8f9O+C9PM3Jf1kpWZBjvcK3cITtd8rEvH6DmBB
   oSvSIR0P4v313gKyS4J1zCamMl0uX2k1Kwjnzb2oQZQCvwg1nLLcvyzUz
   4FyhhEgAP1Y9sh2/qbNOZpUFxLkHtRdgrmWNpCKPsyamlu+QhxuuF3439
   918VdTOYzuPu4qtY4om1LJslqdWgsnzW+Hs3opPNMbpGrO3cgRmcEJ22l
   28kM78cNe8bvYdpiOHDQcX4uuvve0HZzeKynvHHLXdgTPCcF6lMj+lafK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="453738317"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="453738317"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 23:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="728799044"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="728799044"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jul 2023 23:34:58 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNp9h-0009Xv-1b;
	Mon, 24 Jul 2023 06:34:54 +0000
Date: Mon, 24 Jul 2023 14:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-4.19.y 593/9999] arch/riscv/include/asm/irqflags.h:42:
 Error: unrecognized opcode `csrrc t4,sstatus,2', extension `zicsr' required
Message-ID: <202307241458.eJAjP2ul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 9ee0e501f8041151d3917b0c752ed783945cbf78 [593/9999] slub: improve bit diffusion for freelist ptr obfuscation
config: riscv-randconfig-r024-20230724 (https://download.01.org/0day-ci/archive/20230724/202307241458.eJAjP2ul-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241458.eJAjP2ul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241458.eJAjP2ul-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s7,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s7', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s7,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s7', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s8,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc t4,sstatus,2', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,t4', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,t4', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,t4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s8,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr a5,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s8,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required


vim +42 arch/riscv/include/asm/irqflags.h

6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  38  
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  39  /* get status and disable interrupts */
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  40  static inline unsigned long arch_local_irq_save(void)
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  41  {
1125203c13b9da3 Christoph Hellwig 2018-01-04 @42  	return csr_read_clear(sstatus, SR_SIE);
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  43  }
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  44  
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  45  /* test flags */
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  46  static inline int arch_irqs_disabled_flags(unsigned long flags)
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  47  {
1125203c13b9da3 Christoph Hellwig 2018-01-04  48  	return !(flags & SR_SIE);
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  49  }
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  50  
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  51  /* test hardware interrupt enable bit */
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  52  static inline int arch_irqs_disabled(void)
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  53  {
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  54  	return arch_irqs_disabled_flags(arch_local_save_flags());
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  55  }
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  56  
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  57  /* set interrupt enabled status */
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  58  static inline void arch_local_irq_restore(unsigned long flags)
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  59  {
1125203c13b9da3 Christoph Hellwig 2018-01-04 @60  	csr_set(sstatus, flags & SR_SIE);
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  61  }
6d60b6ee0c9777b Palmer Dabbelt    2017-07-10  62  

:::::: The code at line 42 was first introduced by commit
:::::: 1125203c13b9da32125e171b4bd75e93d4918ddd riscv: rename SR_* constants to match the spec

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
