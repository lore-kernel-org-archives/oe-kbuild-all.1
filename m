Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C10156D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690564528; x=1722100528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RaUxeVbVzfZLjuJvYHjSSBTAxlefKrSMEWLpQpx3rJE=;
  b=HjlLZmStXw80/mj7meTzvPFEgZK3lG3K2UEtMPP6SpwB7543qFhRr8OW
   VhJN2gELvp399IxJUCJN7IoSKWGV9OLQnQBP030K87V/9eREtISgN8mzE
   ctjPeaQqaHbROHXDR44R/Ougy3rU4sXib+IZMog3vdvz06TXLuw5v2yAo
   QZPMvSX5R5tTSZLm8VP3Gh6wJh+bnnBjGVR/gHGROm7sooCPjyWFHEW36
   KxNsRmFkoz4akP0BZs1efofsfdeRJj3Ou6YZs+5VWoaWOdAjv06YZbPCf
   pdJLKtyKMAmsQfJ4m5OKmz2nxFhr0uFDBsdmqKtQnIJhvShQIsmeX9FpY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434927491"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="434927491"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 10:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727554904"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="727554904"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Jul 2023 10:15:15 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPR3a-0003Q3-1O;
	Fri, 28 Jul 2023 17:15:14 +0000
Date: Sat, 29 Jul 2023 01:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 7/45]
 arch/riscv/kernel/vdso64.S:19: Error: file not found:
 arch/riscv/kernel/vdso/vdso64.so
Message-ID: <202307290135.aCtzsqzf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guo,

First bad commit (maybe != root cause):

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   ac5eb96728dec4876b1b7ecbb2ed9064a8151171
commit: b105ee5a0719a3ab731fc0f15d7205871909d573 [7/45] riscv: u64ilp32: Unify vdso32 & compat_vdso into vdso/Makefile
config: riscv-randconfig-r004-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290135.aCtzsqzf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290135.aCtzsqzf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290135.aCtzsqzf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/vdso64.S: Assembler messages:
>> arch/riscv/kernel/vdso64.S:19: Error: file not found: arch/riscv/kernel/vdso/vdso64.so

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VDSO64
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - 64BIT [=y]


vim +19 arch/riscv/kernel/vdso64.S

0715372a06ce17 arch/riscv/kernel/vdso/vdso.S Guo Ren        2022-04-05  13  
e2c0cdfba7f699 arch/riscv/kernel/vdso/vdso.S Palmer Dabbelt 2017-07-10  14  	__PAGE_ALIGNED_DATA
e2c0cdfba7f699 arch/riscv/kernel/vdso/vdso.S Palmer Dabbelt 2017-07-10  15  
b105ee5a0719a3 arch/riscv/kernel/vdso64.S    Guo Ren        2023-04-18  16  	.globl vdso64_start, vdso64_end
e2c0cdfba7f699 arch/riscv/kernel/vdso/vdso.S Palmer Dabbelt 2017-07-10  17  	.balign PAGE_SIZE
b105ee5a0719a3 arch/riscv/kernel/vdso64.S    Guo Ren        2023-04-18  18  vdso64_start:
0715372a06ce17 arch/riscv/kernel/vdso/vdso.S Guo Ren        2022-04-05 @19  	.incbin __VDSO_PATH

:::::: The code at line 19 was first introduced by commit
:::::: 0715372a06ce17a9ba69bbec306ddf30c4bad99e riscv: compat: vdso: Add COMPAT_VDSO base code implementation

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
