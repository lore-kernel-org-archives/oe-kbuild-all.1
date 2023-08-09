Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB611D2F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 21:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691616888; x=1723152888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bM0uwOiJclhEgKUht1xNJ59BEFuN3drCgUdCfp1144=;
  b=BP+0bIbKtPbOYvgafWyb9r7qxpKDqi76xl22/IERS0vSoz/nQQuvc4Ew
   uEGow7nFxgWaeAE/t2KHAx8FR4FAgOR54l2zm5GK4ynule868c+EFFcWw
   KWSmutyRSRLT/iAzxAzmZzZX5bMgJza9fLucSH2o7Wyj/tABzH0ENPLtW
   9/W4953refefAq7lvAaYAlL3w8qT3zVdZaWB1tfTS1d91rC+alJPqFwa4
   Kim8YysJJvg1WIqALZ+ljVuTIXEBpqzPg/8oNC5gy0LCGpjxdJH+iOPVy
   5QfyhrxPUhlgEi9SYEs6YFxYpkdgxcWdsDN2ziiSi4gL0c7C+eSmcDtdL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374019095"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="374019095"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 14:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761541816"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="761541816"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Aug 2023 14:34:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTqpJ-0006QG-0F;
	Wed, 09 Aug 2023 21:34:45 +0000
Date: Thu, 10 Aug 2023 05:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/srso 1/17]
 arch/x86/include/asm/text-patching.h:115: undefined reference to
 `x86_return_thunk'
Message-ID: <202308100546.HhHeGhuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/srso
head:   c11a8b2bc1bb3ad76d8d28b283552768d665208c
commit: 89b2003054a4eb3c95af9791c5ef64e0ba02ee76 [1/17] x86/alternative: Unconditional custom return thunk
config: i386-randconfig-i004-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100546.HhHeGhuN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100546.HhHeGhuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100546.HhHeGhuN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/static_call.o: in function `__text_gen_insn':
>> arch/x86/include/asm/text-patching.h:115: undefined reference to `x86_return_thunk'
   ld: arch/x86/kernel/static_call.o: in function `__static_call_transform':
>> arch/x86/kernel/static_call.c:94: undefined reference to `x86_return_thunk'


vim +115 arch/x86/include/asm/text-patching.h

67c1d4a28064f9 Peter Zijlstra 2019-10-09  100  
67c1d4a28064f9 Peter Zijlstra 2019-10-09  101  static __always_inline
ba27d1a80871eb Peter Zijlstra 2022-03-08  102  void __text_gen_insn(void *buf, u8 opcode, const void *addr, const void *dest, int size)
67c1d4a28064f9 Peter Zijlstra 2019-10-09  103  {
ba27d1a80871eb Peter Zijlstra 2022-03-08  104  	union text_poke_insn *insn = buf;
ba27d1a80871eb Peter Zijlstra 2022-03-08  105  
ba27d1a80871eb Peter Zijlstra 2022-03-08  106  	BUG_ON(size < text_opcode_size(opcode));
67c1d4a28064f9 Peter Zijlstra 2019-10-09  107  
bbf92368b0b1fe Peter Zijlstra 2022-03-08  108  	/*
bbf92368b0b1fe Peter Zijlstra 2022-03-08  109  	 * Hide the addresses to avoid the compiler folding in constants when
bbf92368b0b1fe Peter Zijlstra 2022-03-08  110  	 * referencing code, these can mess up annotations like
bbf92368b0b1fe Peter Zijlstra 2022-03-08  111  	 * ANNOTATE_NOENDBR.
bbf92368b0b1fe Peter Zijlstra 2022-03-08  112  	 */
ba27d1a80871eb Peter Zijlstra 2022-03-08  113  	OPTIMIZER_HIDE_VAR(insn);
bbf92368b0b1fe Peter Zijlstra 2022-03-08  114  	OPTIMIZER_HIDE_VAR(addr);
bbf92368b0b1fe Peter Zijlstra 2022-03-08 @115  	OPTIMIZER_HIDE_VAR(dest);
67c1d4a28064f9 Peter Zijlstra 2019-10-09  116  
ba27d1a80871eb Peter Zijlstra 2022-03-08  117  	insn->opcode = opcode;
67c1d4a28064f9 Peter Zijlstra 2019-10-09  118  
67c1d4a28064f9 Peter Zijlstra 2019-10-09  119  	if (size > 1) {
ba27d1a80871eb Peter Zijlstra 2022-03-08  120  		insn->disp = (long)dest - (long)(addr + size);
67c1d4a28064f9 Peter Zijlstra 2019-10-09  121  		if (size == 2) {
67c1d4a28064f9 Peter Zijlstra 2019-10-09  122  			/*
bbf92368b0b1fe Peter Zijlstra 2022-03-08  123  			 * Ensure that for JMP8 the displacement
67c1d4a28064f9 Peter Zijlstra 2019-10-09  124  			 * actually fits the signed byte.
67c1d4a28064f9 Peter Zijlstra 2019-10-09  125  			 */
ba27d1a80871eb Peter Zijlstra 2022-03-08  126  			BUG_ON((insn->disp >> 31) != (insn->disp >> 7));
ba27d1a80871eb Peter Zijlstra 2022-03-08  127  		}
67c1d4a28064f9 Peter Zijlstra 2019-10-09  128  	}
67c1d4a28064f9 Peter Zijlstra 2019-10-09  129  }
67c1d4a28064f9 Peter Zijlstra 2019-10-09  130  

:::::: The code at line 115 was first introduced by commit
:::::: bbf92368b0b1fe472d489e62d3340d7897e9c697 x86/text-patching: Make text_gen_insn() play nice with ANNOTATE_NOENDBR

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
