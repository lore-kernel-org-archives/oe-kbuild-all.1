Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF32375
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 07:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695452752; x=1726988752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVBIWNqVuOqZ4UzlXp0APNAPw19DUULH0LM/zA/PzQ8=;
  b=AN3vCvRCwi7jRLiT5sndY96KAJeylKmZEypVf4FXDQkcaQpQf7S2egPQ
   AbNm1en6eJYrb+RbF7/tKL0Hkc/1EiXHxEbGnYmtliYJ/Ahek0NOhTyBl
   rsK12SjPNCoWEyUu377NYfBE134RGsfBLtJ3fvsEm4bvohhohxJGffNWT
   Mrbrz44ojH6K/BLnrw9lV5hFQyb85LWwsx5U5MC1gR1j8cahmB/+Xj+34
   DYqmmV5AmVwBRxRFukc85EectYXlkoOcpAUiukJab46uL3J/U/a33vcmE
   PKgWJp3mzUsmJXOhVwI9K1GKxe97+yH2+ZTI9En5uqu7ZDe5ANAVQ19wt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="366053225"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="366053225"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 00:05:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="751098934"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="751098934"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Sep 2023 00:05:50 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjwi4-0001yv-2P;
	Sat, 23 Sep 2023 07:05:48 +0000
Date: Sat, 23 Sep 2023 15:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 5/12]
 arch/riscv/kernel/mcount-dyn.S:102: Error: unrecognized opcode `restore_abi'
Message-ID: <202309231511.aDdp6346-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   e3d3f130d76aaae33dd6594a9c48a163d788e300
commit: 99dbe5be7eb34d5f1031201ae68ac544492967b9 [5/12] riscv: ftrace: Fix to pass correct ftrace_regs to ftrace_func_t functions
config: riscv-randconfig-001-20230923 (https://download.01.org/0day-ci/archive/20230923/202309231511.aDdp6346-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231511.aDdp6346-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231511.aDdp6346-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/mcount-dyn.S: Assembler messages:
>> arch/riscv/kernel/mcount-dyn.S:102: Error: unrecognized opcode `restore_abi'


vim +102 arch/riscv/kernel/mcount-dyn.S

bc1a4c3a842556 Alan Kao 2018-02-13   77  
c15ac4fd60d5ff Alan Kao 2018-02-13   78  ENTRY(ftrace_caller)
afc76b8b801121 Guo Ren  2020-12-17   79  	SAVE_ABI
bc1a4c3a842556 Alan Kao 2018-02-13   80  
6724a76cff85ee Guo Ren  2023-01-12   81  	addi	a0, t0, -FENTRY_RA_OFFSET
afc76b8b801121 Guo Ren  2020-12-17   82  	la	a1, function_trace_op
afc76b8b801121 Guo Ren  2020-12-17   83  	REG_L	a2, 0(a1)
6724a76cff85ee Guo Ren  2023-01-12   84  	mv	a1, ra
afc76b8b801121 Guo Ren  2020-12-17   85  	mv	a3, sp
bc1a4c3a842556 Alan Kao 2018-02-13   86  
c15ac4fd60d5ff Alan Kao 2018-02-13   87  ftrace_call:
c15ac4fd60d5ff Alan Kao 2018-02-13   88  	.global ftrace_call
c15ac4fd60d5ff Alan Kao 2018-02-13   89  	call	ftrace_stub
bc1a4c3a842556 Alan Kao 2018-02-13   90  
bc1a4c3a842556 Alan Kao 2018-02-13   91  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
6724a76cff85ee Guo Ren  2023-01-12   92  	addi	a0, sp, ABI_RA
6724a76cff85ee Guo Ren  2023-01-12   93  	REG_L	a1, ABI_T0(sp)
afc76b8b801121 Guo Ren  2020-12-17   94  	addi	a1, a1, -FENTRY_RA_OFFSET
afc76b8b801121 Guo Ren  2020-12-17   95  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
afc76b8b801121 Guo Ren  2020-12-17   96  	mv	a2, s0
bc1a4c3a842556 Alan Kao 2018-02-13   97  #endif
afc76b8b801121 Guo Ren  2020-12-17   98  ftrace_graph_call:
afc76b8b801121 Guo Ren  2020-12-17   99  	.global ftrace_graph_call
afc76b8b801121 Guo Ren  2020-12-17  100  	call	ftrace_stub
afc76b8b801121 Guo Ren  2020-12-17  101  #endif
afc76b8b801121 Guo Ren  2020-12-17 @102  	RESTORE_ABI
6724a76cff85ee Guo Ren  2023-01-12  103  	jr t0
c15ac4fd60d5ff Alan Kao 2018-02-13  104  ENDPROC(ftrace_caller)
aea4c671fb985e Alan Kao 2018-02-13  105  

:::::: The code at line 102 was first introduced by commit
:::::: afc76b8b80112189b6f11e67e19cf58301944814 riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
