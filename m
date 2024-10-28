Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AC64C83
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730096238; cv=none; b=Cm1xMvVM2UlXkoU5lUuWsVW6gOW8SUahdniWKAgW5TOxA6mZdsRB89j3ijBIWAhhd/vSEGoFFvTTdHwVSguOfLRg1w+TXcQkIyOQQjuUQCCphT20yMRcbVW1fqPQpNFksRl2oQ3mElU78PivQGjzvpIaacCcVSOZ86jHQLbs5YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730096238; c=relaxed/simple;
	bh=oKywTvo10iJAaF9uBov18Cwp5Xc27wNcw1IBZW/aODc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r96ibKTelgRm4T1+x+nPS/jHGjsgQqGvVhA7ebnyNGK1leb3kuFXDd8XuW5IR3+JJR3FKV99AO9RwBc8eeT/afQWODKPak5c1yLrLRI83oERK4ViwMUF8nCqSZAA+YyAfdrr+bqn2NKjj2cYortBssfnTsJ/xx492ZSRpRZkbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvhHrCMQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvhHrCMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730096236; x=1761632236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKywTvo10iJAaF9uBov18Cwp5Xc27wNcw1IBZW/aODc=;
  b=mvhHrCMQw/7kxhvt/WvxOiU2U3XPtdjDPPZ1arOupy1Me1KS1cV0lWSi
   5Cu/32racCiuMfIXJwQz6emd/1e1Nt1o7s5BNvHGHsE8GA14kuqNgXt0+
   +DkMo6udpHhaan1yG5gUwJO+ck4Vai7PFL8VBxcM1eemNEL4kJvzmQsft
   hGYDlyss3XvWdV19xuOPZKF0kltF3bqIu6Cj8nCyPSQ9EpP7Q9i3duduG
   hEHZb6yjHqm793zdYz6fkjCSYPQp3jzOw8aO7MdhIDhK7s79jhmCfxmr4
   FfXOzmoOQOAN3OAjs9wO9QZvo8n7zG4MdqA3XkFFj+HMpm83rphwAwmW6
   A==;
X-CSE-ConnectionGUID: Wj+ERuRgQly5lDX8sH+0UA==
X-CSE-MsgGUID: w7l8EB3QS2+5BiSEWlUWdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29642548"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29642548"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 23:17:15 -0700
X-CSE-ConnectionGUID: yqJX53/hTASjwQ050CzY/w==
X-CSE-MsgGUID: BvJcEcXJTNexRGS1I+PkLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86098080"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Oct 2024 23:17:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5J3u-000bKi-27;
	Mon, 28 Oct 2024 06:17:10 +0000
Date: Mon, 28 Oct 2024 14:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [linux-next:master 4819/7183]
 arch/riscv/kernel/traps.c:187:undefined reference to
 `handle_misaligned_load'
Message-ID: <202410281427.ETHk3U7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
commit: d1703dc7bc8ec7adb91f5ceaf1556ff1ed212858 [4819/7183] RISC-V: Detect unaligned vector accesses supported
config: riscv-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241028/202410281427.ETHk3U7B-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281427.ETHk3U7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281427.ETHk3U7B-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: arch/riscv/kernel/traps.o: in function `do_trap_insn_illegal':
>> arch/riscv/kernel/traps.c:187:(.noinstr.text+0x35c): undefined reference to `handle_misaligned_load'
>> riscv32-linux-ld: arch/riscv/kernel/traps.c:191:(.noinstr.text+0x380): undefined reference to `handle_misaligned_load'
   riscv32-linux-ld: arch/riscv/kernel/traps.o: in function `do_trap_load_fault':
>> arch/riscv/kernel/traps.c:198:(.noinstr.text+0x41c): undefined reference to `handle_misaligned_store'
>> riscv32-linux-ld: arch/riscv/kernel/traps.c:198:(.noinstr.text+0x440): undefined reference to `handle_misaligned_store'


vim +187 arch/riscv/kernel/traps.c

76d2a0493a17d4 Palmer Dabbelt 2017-07-10  162  
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  163  DO_ERROR_INFO(do_trap_unknown,
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  164  	SIGILL, ILL_ILLTRP, "unknown exception");
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  165  DO_ERROR_INFO(do_trap_insn_misaligned,
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  166  	SIGBUS, BUS_ADRALN, "instruction address misaligned");
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  167  DO_ERROR_INFO(do_trap_insn_fault,
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  168  	SIGSEGV, SEGV_ACCERR, "instruction access fault");
cd054837243b5f Andy Chiu      2023-06-05  169  
cd054837243b5f Andy Chiu      2023-06-05  170  asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
cd054837243b5f Andy Chiu      2023-06-05  171  {
26c38cd802c947 Andy Chiu      2023-06-25  172  	bool handled;
26c38cd802c947 Andy Chiu      2023-06-25  173  
cd054837243b5f Andy Chiu      2023-06-05  174  	if (user_mode(regs)) {
cd054837243b5f Andy Chiu      2023-06-05  175  		irqentry_enter_from_user_mode(regs);
cd054837243b5f Andy Chiu      2023-06-05  176  
cd054837243b5f Andy Chiu      2023-06-05  177  		local_irq_enable();
cd054837243b5f Andy Chiu      2023-06-05  178  
26c38cd802c947 Andy Chiu      2023-06-25  179  		handled = riscv_v_first_use_handler(regs);
26c38cd802c947 Andy Chiu      2023-06-25  180  
26c38cd802c947 Andy Chiu      2023-06-25  181  		local_irq_disable();
26c38cd802c947 Andy Chiu      2023-06-25  182  
26c38cd802c947 Andy Chiu      2023-06-25  183  		if (!handled)
cd054837243b5f Andy Chiu      2023-06-05  184  			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
cd054837243b5f Andy Chiu      2023-06-05  185  				      "Oops - illegal instruction");
cd054837243b5f Andy Chiu      2023-06-05  186  
cd054837243b5f Andy Chiu      2023-06-05 @187  		irqentry_exit_to_user_mode(regs);
cd054837243b5f Andy Chiu      2023-06-05  188  	} else {
cd054837243b5f Andy Chiu      2023-06-05  189  		irqentry_state_t state = irqentry_nmi_enter(regs);
cd054837243b5f Andy Chiu      2023-06-05  190  
cd054837243b5f Andy Chiu      2023-06-05 @191  		do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
cd054837243b5f Andy Chiu      2023-06-05  192  			      "Oops - illegal instruction");
cd054837243b5f Andy Chiu      2023-06-05  193  
cd054837243b5f Andy Chiu      2023-06-05  194  		irqentry_nmi_exit(regs, state);
cd054837243b5f Andy Chiu      2023-06-05  195  	}
cd054837243b5f Andy Chiu      2023-06-05  196  }
cd054837243b5f Andy Chiu      2023-06-05  197  
76d2a0493a17d4 Palmer Dabbelt 2017-07-10 @198  DO_ERROR_INFO(do_trap_load_fault,
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  199  	SIGSEGV, SEGV_ACCERR, "load access fault");
956d705dd279f7 Damien Le Moal 2020-03-16  200  

:::::: The code at line 187 was first introduced by commit
:::::: cd054837243b5f36ff395c21135ff153871180f1 riscv: Allocate user's vector context in the first-use trap

:::::: TO: Andy Chiu <andy.chiu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
