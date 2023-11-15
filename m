Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77C2747F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAWWRj5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700059864; x=1731595864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9D3T4M10CW55F/QDP/Mvbsq/NHZU+GWFUpkbGjqS5g4=;
  b=jAWWRj5QthRWcSzak+K0A6OtbbdPNRF4jaa+rjMrCh4L5z7EDRm0RN2m
   OLUG+GIOSrHjE4Qg3VZdExiiQeBi9XJTSAMz5o7Fwrc/rdtEPYb/91IFU
   4wuwdNycj72cPpPIcJqn479jB2ZjqZ0fFSi0Q3jCqtnuvIa1EAp4lCsB0
   wYPG5RzmK1r6/AdlfLTbUPZhWP4kFOQWWYQyq4r74LnbBd3oiiotH+J3q
   OmdREQPTHVVWI6EJPbskIWTuYpaw4IMk19ffKIxi0cTXiJwWCYZCVKNIm
   0Xmc1SD+BRTeJJj8AoyBn90qEtIjnN2Nk6U/AjDGZ10e6pKMmvkGHPVeE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9524549"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="9524549"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 06:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="938496598"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="938496598"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 06:50:59 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3HEG-0000Pu-2g;
	Wed, 15 Nov 2023 14:50:56 +0000
Date: Wed, 15 Nov 2023 22:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/kernel/irq.c:49:1: sparse: sparse: symbol
 '__pcpu_scope_irq_stack' was not declared. Should it be static?
Message-ID: <202311152232.0ru8PmcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 163e76cc6ef43b7a5e9b6e245a6d6667c9d9b4a7 riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
date:   5 months ago
config: riscv-randconfig-r122-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152232.0ru8PmcL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311152232.0ru8PmcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152232.0ru8PmcL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> arch/riscv/kernel/irq.c:49:1: sparse: sparse: symbol '__pcpu_scope_irq_stack' was not declared. Should it be static?

vim +/__pcpu_scope_irq_stack +49 arch/riscv/kernel/irq.c

    35	
    36	#ifdef CONFIG_VMAP_STACK
    37	static void init_irq_stacks(void)
    38	{
    39		int cpu;
    40		ulong *p;
    41	
    42		for_each_possible_cpu(cpu) {
    43			p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
    44			per_cpu(irq_stack_ptr, cpu) = p;
    45		}
    46	}
    47	#else
    48	/* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
  > 49	DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
