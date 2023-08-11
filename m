Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B532F4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 22:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691794756; x=1723330756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXJxh3GDfbg9ul6ZMOGvVrOKIAycjeJup+lcm/oD8hE=;
  b=P29xNJWg2z0kRUcvX36ufJUk9Zqhd/R0J6hEeVkwZJotJ1xgiN3VfD6n
   Zb82bny3tcUEjU9dZ4kf61NZzAY/UAWMdWUHq3Gg7IENofoCUIhS6vabN
   Gy8oGVf8QG+lSFssl8gqCxm+X9H7llMmf26qoH9bVBGLrF71/zI+F3Yko
   fI/nFPpAhF5S/6EaOfzp0AxqC6V5C0hKtXcnEqLkhBhCN7deRjJJFDn6h
   CN5sFnv8bJcEpjxuAuwYK3jzI3bq16MMtQB8u7y6aYCjzbvLzLyucsoHf
   oVy+IWxs3CDp8utx/Jqyz/wwdayfzzJ5MUeqdpb+G/Y47CuOHWD7cNcNw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374546694"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="374546694"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 15:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726407282"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="726407282"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Aug 2023 15:58:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUb5p-00085g-1m;
	Fri, 11 Aug 2023 22:58:53 +0000
Date: Sat, 12 Aug 2023 06:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [frederic-dynticks:timers/idle 4/10]
 arch/loongarch/kernel/genex.S:22: Error: no match insn: move
	$r12,((0x1)<<2)
Message-ID: <202308120605.WlEctyI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/idle
head:   b66dd12bb29cca558b9323f2b270a7dae8f56c48
commit: 7baad59caefc0707cb1336d7df30b5879a1e6d38 [4/10] loongson: Fix idle VS timer enqueue
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230812/202308120605.WlEctyI8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120605.WlEctyI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120605.WlEctyI8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/genex.S: Assembler messages:
>> arch/loongarch/kernel/genex.S:22: Error: no match insn: move	$r12,((0x1)<<2)


vim +22 arch/loongarch/kernel/genex.S

    18	
    19		.align	5
    20	SYM_FUNC_START(__arch_cpu_idle)
    21		/* start of idle interrupt region */
  > 22		move	t0, CSR_CRMD_IE
    23		csrxchg	t0, t0, LOONGARCH_CSR_CRMD
    24		/*
    25		 * If an interrupt lands here; between enabling interrupts above and
    26		 * going idle on the next instruction, we must *NOT* go idle since the
    27		 * interrupt could have set TIF_NEED_RESCHED or caused an timer to need
    28		 * reprogramming. Fall through -- see handle_vint() below -- and have
    29		 * the idle loop take care of things.
    30		 */
    31		idle	0
    32		nop
    33		/* end of idle interrupt region */
    34	SYM_INNER_LABEL(__arch_cpu_idle_exit, SYM_L_LOCAL)
    35		jr	ra
    36	SYM_FUNC_END(__arch_cpu_idle)
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
