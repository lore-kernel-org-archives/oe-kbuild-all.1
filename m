Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081A1641C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 17:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690566424; x=1722102424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4cMJVUtgjt0tIAnsh3VQjOsyYAcLYIwBfchhalCBam0=;
  b=Jqw9FRfhWguORsyFrRm4Q3+36P/L11Lk3CwaRlWPHsKe1HbYyAAd5oiL
   FRY8ZlqOo2EP6uSH+e5NAEzwumwx1K93ag56JAlZnuk4A7f1CaNq8+8jP
   RtiEpgvNLz0gsf0wW3e1gK9QG/Ntgy95c426h6j7+0d12ezkw6yUoWuhM
   kQMsbN9ye6WUY6/a8wG9A6Ui0hzZjKscnL/d1+J/FqtudA8k4w+GfSYJ/
   mJCluOX64alkUvb7DhImMCnM2WR+2b2s3XVqiIGWMt/R+OyRSPL9vPG6P
   FWqN2R8Plq4zA10gFqTgRq1JYyR/aedVVLFiDeZdmbhVMvQiE50eLi9ed
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371348202"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="371348202"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 10:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901369121"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="901369121"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 10:47:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPRYM-0003Rp-1A;
	Fri, 28 Jul 2023 17:47:02 +0000
Date: Sat, 29 Jul 2023 01:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 11/45]
 arch/riscv/kernel/alternative.c:220:33: error: 'vdso64_start' undeclared
Message-ID: <202307290114.npUieF86-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   ac5eb96728dec4876b1b7ecbb2ed9064a8151171
commit: fea3d07fbad0afbaa64bac1e849bdc298d4c06fb [11/45] riscv: u64ilp32: Adjust vDSO kernel flow for 64ilp32 abi
config: riscv-randconfig-r004-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290114.npUieF86-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290114.npUieF86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290114.npUieF86-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/alternative.c: In function 'apply_boot_alternatives':
>> arch/riscv/kernel/alternative.c:220:33: error: 'vdso64_start' undeclared (first use in this function)
     220 |         apply_vdso_alternatives(vdso64_start);
         |                                 ^~~~~~~~~~~~
   arch/riscv/kernel/alternative.c:220:33: note: each undeclared identifier is reported only once for each function it appears in
--
   arch/riscv/kernel/signal.c: In function 'setup_rt_frame':
>> arch/riscv/kernel/signal.c:350:43: error: implicit declaration of function 'VDSO64_SYMBOL' [-Werror=implicit-function-declaration]
     350 |                 regs->ra = (unsigned long)VDSO64_SYMBOL(
         |                                           ^~~~~~~~~~~~~
>> arch/riscv/kernel/signal.c:351:52: error: 'rt_sigreturn' undeclared (first use in this function); did you mean 'sys_rt_sigreturn'?
     351 |                         current->mm->context.vdso, rt_sigreturn);
         |                                                    ^~~~~~~~~~~~
         |                                                    sys_rt_sigreturn
   arch/riscv/kernel/signal.c:351:52: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VDSO64
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - 64BIT [=y]


vim +/vdso64_start +220 arch/riscv/kernel/alternative.c

   208	
   209	void __init apply_boot_alternatives(void)
   210	{
   211		/* If called on non-boot cpu things could go wrong */
   212		WARN_ON(smp_processor_id() != 0);
   213	
   214		probe_vendor_features(0);
   215		_apply_alternatives((struct alt_entry *)__alt_start,
   216				    (struct alt_entry *)__alt_end,
   217				    RISCV_ALTERNATIVES_BOOT);
   218	
   219	#ifdef CONFIG_VDSO64
 > 220		apply_vdso_alternatives(vdso64_start);
   221	#endif
   222	#ifdef CONFIG_VDSO32
   223		apply_vdso_alternatives(vdso32_start);
   224	#endif
   225	#ifdef CONFIG_VDSO64ILP32
   226		apply_vdso_alternatives(vdso64ilp32_start);
   227	#endif
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
