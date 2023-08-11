Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67BC2AB4C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 21:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691789754; x=1723325754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5I8InqNscSaN8gbd6nVJalz3S7BKzhm60PVfltvwso=;
  b=jXBKIns8r51DrePyEYVgHxmvW5JfVlGgurEvNuXDYs9fAMvgmP5WaEdo
   X1iUvvkSdK0puONMR2IiGnOkEEl6X9lsxxVLhQ8mo6NGHqFnsdzlWUnKY
   sfyrY5ZMjM/04zA2WP8MKQEjjEwyc8Ib1C+6/U01aayeNYMkXhh2dKtFS
   mDjq46DTZodfCe2qVZlVwJ1xd/WOYbtJZr1T2ViPkP36dMytv2mr7OKCD
   qRoy5wbPeJtqMJ3J3225qSmN8IpijZUuJU22OfHPdZEYQInczGuEi0U7b
   wtkFojlEeigYFouhPhgjt40uilW9+NuKdy2t4p1UfxKKAPIP+1sBRztra
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438103245"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="438103245"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 14:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="802820115"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="802820115"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2023 14:35:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUZnU-00083O-0s;
	Fri, 11 Aug 2023 21:35:52 +0000
Date: Sat, 12 Aug 2023 05:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:linux-next 5/5] arch/csky/include/asm/traps.h:43:11:
 error: expected ';' before 'void'
Message-ID: <202308120502.MXpchFC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux linux-next
head:   c8171a86b27401aa1f492dd1f080f3102264f1ab
commit: c8171a86b27401aa1f492dd1f080f3102264f1ab [5/5] csky: Fixup -Wmissing-prototypes warning
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230812/202308120502.MXpchFC1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120502.MXpchFC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120502.MXpchFC1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/ptrace.h:7,
                    from arch/csky/include/asm/elf.h:6,
                    from include/linux/elf.h:6,
                    from kernel/extable.c:6:
>> arch/csky/include/asm/traps.h:43:11: error: expected ';' before 'void'
      43 | asmlinkage void do_trap_unknown(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:44:11: error: expected ';' before 'void'
      44 | asmlinkage void do_trap_zdiv(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:45:11: error: expected ';' before 'void'
      45 | asmlinkage void do_trap_buserr(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:46:11: error: expected ';' before 'void'
      46 | asmlinkage void do_trap_misaligned(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:47:11: error: expected ';' before 'void'
      47 | asmlinkage void do_trap_bkpt(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:48:11: error: expected ';' before 'void'
      48 | asmlinkage void do_trap_illinsn(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:49:11: error: expected ';' before 'void'
      49 | asmlinkage void do_trap_fpe(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:50:11: error: expected ';' before 'void'
      50 | asmlinkage void do_trap_priv(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:51:11: error: expected ';' before 'void'
      51 | asmlinkage void trap_c(struct pt_regs *regs);
         |           ^~~~~
         |           ;
   arch/csky/include/asm/traps.h:53:11: error: expected ';' before 'void'
      53 | asmlinkage void do_notify_resume(struct pt_regs *regs,
         |           ^~~~~
         |           ;
>> arch/csky/include/asm/ptrace.h:99:11: error: expected ';' before 'int'
      99 | asmlinkage int syscall_trace_enter(struct pt_regs *regs);
         |           ^~~~
         |           ;
>> arch/csky/include/asm/ptrace.h:100:11: error: expected ';' before 'void'
     100 | asmlinkage void syscall_trace_exit(struct pt_regs *regs);
         |           ^~~~~
         |           ;


vim +43 arch/csky/include/asm/traps.h

    42	
  > 43	asmlinkage void do_trap_unknown(struct pt_regs *regs);
    44	asmlinkage void do_trap_zdiv(struct pt_regs *regs);
    45	asmlinkage void do_trap_buserr(struct pt_regs *regs);
    46	asmlinkage void do_trap_misaligned(struct pt_regs *regs);
    47	asmlinkage void do_trap_bkpt(struct pt_regs *regs);
    48	asmlinkage void do_trap_illinsn(struct pt_regs *regs);
    49	asmlinkage void do_trap_fpe(struct pt_regs *regs);
    50	asmlinkage void do_trap_priv(struct pt_regs *regs);
    51	asmlinkage void trap_c(struct pt_regs *regs);
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
