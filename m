Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8204C92
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217045; cv=none; b=LRu/2Ofj+42f0LAZisdHCPnKM82Knv9+RozDWg6ZUWGYHSMUtVT4yi/KGAbyR9gfFvuDSbbs0wEqkNrh89YNZZ8cDlqy1xWbqGETfZ8pesMIANQqTv8sltIAE0CDS2A6Ky8HC3BdyB3ymQA7y5BHskt2lAzVs9cQYoONuY9vkKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217045; c=relaxed/simple;
	bh=2Cbnb0G1528bMoYNi+Pmq+xsHAWiPVVKuxu6xMi+bYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6qXOiqcOQpNA62mGg+IhsGEqxYFqiUBF+R3LRWPIv9G6oSGdbqQGtzepseg1B14UCYu5WEmsnB+xM7ndLEXhzHRPMEaW3pMUGd9zA1gWLQeN7QLNqoZIDXxdg6YJ5tHQHAG/gNGcL9p86+2L/905AUlDLflN4KPovz88WEn/vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7vIrep9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7vIrep9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753217044; x=1784753044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Cbnb0G1528bMoYNi+Pmq+xsHAWiPVVKuxu6xMi+bYQ=;
  b=l7vIrep9d/tinDMzQKHDEiMHfEmHZGaCCEpPdIWhVGN6s1UuwE6FsgWL
   pZC430uRdWK5XOjwhggJ8UpFYHVkW/FUcItH0qkLKj0zvb4ft94n8gJjm
   F/E0WuflBYHCiRLg/sn1sR/JY3p4YLxbEki2sC7rRHWjOulDA4afqr+8v
   Tz6NeVurAAtM1JQARwzqo9DeW6mDAci1k689Oo9U18sGkVf97PRp8gB1Y
   Z7RN4X+J4GHloCn3FqsLK0x3QCNWMDZISJ/pPZSHoCm7CSm6SG7II8tM/
   n+Puee33b8M6Xh2rC+KibWCsV/hzlaq9hQUc/NLHDG1kZgA0807DD/FwR
   A==;
X-CSE-ConnectionGUID: K9wiNQOBSmmKbB5wy/HPnw==
X-CSE-MsgGUID: LHekklG3TWOQhnqg8h1yAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54701445"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="54701445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 13:44:03 -0700
X-CSE-ConnectionGUID: ioeFpwrBReKm+FPuM1wa2Q==
X-CSE-MsgGUID: pgCPa2FERJ21jAo4gNMiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="163782299"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 22 Jul 2025 13:44:02 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueJqB-0001YL-18;
	Tue, 22 Jul 2025 20:43:59 +0000
Date: Tue, 22 Jul 2025 22:43:08 +0200
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Kirsher <jeff.kirsher@gmail.com>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [jkirsher-net-queue:master 4/4] arch/x86/net/bpf_jit_comp.c:3771:6:
 warning: no previous prototype for 'bpf_jit_supports_private_stack'
Message-ID: <202507222250.yxlDkXg9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   db494b13c593e578fed58a6e41f4c9df619180d8
commit: db494b13c593e578fed58a6e41f4c9df619180d8 [4/4] bpf: Add support for certain atomics in bpf_arena to x86 JIT
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250722/202507222250.yxlDkXg9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507222250.yxlDkXg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222250.yxlDkXg9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/net/bpf_jit_comp.c: In function 'do_jit':
   arch/x86/net/bpf_jit_comp.c:2232:39: error: implicit declaration of function 'emit_atomic_ld_st'; did you mean 'emit_atomic_index'? [-Werror=implicit-function-declaration]
    2232 |                                 err = emit_atomic_ld_st(&prog, insn->imm, dst_reg, src_reg,
         |                                       ^~~~~~~~~~~~~~~~~
         |                                       emit_atomic_index
   arch/x86/net/bpf_jit_comp.c: At top level:
>> arch/x86/net/bpf_jit_comp.c:3771:6: warning: no previous prototype for 'bpf_jit_supports_private_stack' [-Wmissing-prototypes]
    3771 | bool bpf_jit_supports_private_stack(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/net/bpf_jit_comp.c:3865:5: warning: no previous prototype for 'bpf_arch_uaddress_limit' [-Wmissing-prototypes]
    3865 | u64 bpf_arch_uaddress_limit(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/net/bpf_jit_comp.c:3870:6: warning: no previous prototype for 'bpf_jit_supports_timed_may_goto' [-Wmissing-prototypes]
    3870 | bool bpf_jit_supports_timed_may_goto(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bpf_jit_supports_private_stack +3771 arch/x86/net/bpf_jit_comp.c

fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3770  
7d1cd70d4b16ff Yonghong Song           2024-11-12 @3771  bool bpf_jit_supports_private_stack(void)
7d1cd70d4b16ff Yonghong Song           2024-11-12  3772  {
7d1cd70d4b16ff Yonghong Song           2024-11-12  3773  	return true;
7d1cd70d4b16ff Yonghong Song           2024-11-12  3774  }
7d1cd70d4b16ff Yonghong Song           2024-11-12  3775  
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3776  void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie)
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3777  {
5bfdb4fbf348f9 Kumar Kartikeya Dwivedi 2023-09-18  3778  #if defined(CONFIG_UNWINDER_ORC)
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3779  	struct unwind_state state;
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3780  	unsigned long addr;
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3781  
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3782  	for (unwind_start(&state, current, NULL, NULL); !unwind_done(&state);
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3783  	     unwind_next_frame(&state)) {
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3784  		addr = unwind_get_return_address(&state);
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3785  		if (!addr || !consume_fn(cookie, (u64)addr, (u64)state.sp, (u64)state.bp))
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3786  			break;
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3787  	}
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3788  	return;
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3789  #endif
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3790  	WARN(1, "verification of programs using bpf_throw should have failed\n");
fd5d27b7018837 Kumar Kartikeya Dwivedi 2023-09-13  3791  }
4b7de801606e50 Jiri Olsa               2023-12-06  3792  
4b7de801606e50 Jiri Olsa               2023-12-06  3793  void bpf_arch_poke_desc_update(struct bpf_jit_poke_descriptor *poke,
4b7de801606e50 Jiri Olsa               2023-12-06  3794  			       struct bpf_prog *new, struct bpf_prog *old)
4b7de801606e50 Jiri Olsa               2023-12-06  3795  {
4b7de801606e50 Jiri Olsa               2023-12-06  3796  	u8 *old_addr, *new_addr, *old_bypass_addr;
4b7de801606e50 Jiri Olsa               2023-12-06  3797  	int ret;
4b7de801606e50 Jiri Olsa               2023-12-06  3798  
4b7de801606e50 Jiri Olsa               2023-12-06  3799  	old_bypass_addr = old ? NULL : poke->bypass_addr;
4b7de801606e50 Jiri Olsa               2023-12-06  3800  	old_addr = old ? (u8 *)old->bpf_func + poke->adj_off : NULL;
4b7de801606e50 Jiri Olsa               2023-12-06  3801  	new_addr = new ? (u8 *)new->bpf_func + poke->adj_off : NULL;
4b7de801606e50 Jiri Olsa               2023-12-06  3802  
4b7de801606e50 Jiri Olsa               2023-12-06  3803  	/*
4b7de801606e50 Jiri Olsa               2023-12-06  3804  	 * On program loading or teardown, the program's kallsym entry
4b7de801606e50 Jiri Olsa               2023-12-06  3805  	 * might not be in place, so we use __bpf_arch_text_poke to skip
4b7de801606e50 Jiri Olsa               2023-12-06  3806  	 * the kallsyms check.
4b7de801606e50 Jiri Olsa               2023-12-06  3807  	 */
4b7de801606e50 Jiri Olsa               2023-12-06  3808  	if (new) {
4b7de801606e50 Jiri Olsa               2023-12-06  3809  		ret = __bpf_arch_text_poke(poke->tailcall_target,
4b7de801606e50 Jiri Olsa               2023-12-06  3810  					   BPF_MOD_JUMP,
4b7de801606e50 Jiri Olsa               2023-12-06  3811  					   old_addr, new_addr);
4b7de801606e50 Jiri Olsa               2023-12-06  3812  		BUG_ON(ret < 0);
4b7de801606e50 Jiri Olsa               2023-12-06  3813  		if (!old) {
4b7de801606e50 Jiri Olsa               2023-12-06  3814  			ret = __bpf_arch_text_poke(poke->tailcall_bypass,
4b7de801606e50 Jiri Olsa               2023-12-06  3815  						   BPF_MOD_JUMP,
4b7de801606e50 Jiri Olsa               2023-12-06  3816  						   poke->bypass_addr,
4b7de801606e50 Jiri Olsa               2023-12-06  3817  						   NULL);
4b7de801606e50 Jiri Olsa               2023-12-06  3818  			BUG_ON(ret < 0);
4b7de801606e50 Jiri Olsa               2023-12-06  3819  		}
4b7de801606e50 Jiri Olsa               2023-12-06  3820  	} else {
4b7de801606e50 Jiri Olsa               2023-12-06  3821  		ret = __bpf_arch_text_poke(poke->tailcall_bypass,
4b7de801606e50 Jiri Olsa               2023-12-06  3822  					   BPF_MOD_JUMP,
4b7de801606e50 Jiri Olsa               2023-12-06  3823  					   old_bypass_addr,
4b7de801606e50 Jiri Olsa               2023-12-06  3824  					   poke->bypass_addr);
4b7de801606e50 Jiri Olsa               2023-12-06  3825  		BUG_ON(ret < 0);
4b7de801606e50 Jiri Olsa               2023-12-06  3826  		/* let other CPUs finish the execution of program
4b7de801606e50 Jiri Olsa               2023-12-06  3827  		 * so that it will not possible to expose them
4b7de801606e50 Jiri Olsa               2023-12-06  3828  		 * to invalid nop, stack unwind, nop state
4b7de801606e50 Jiri Olsa               2023-12-06  3829  		 */
4b7de801606e50 Jiri Olsa               2023-12-06  3830  		if (!ret)
4b7de801606e50 Jiri Olsa               2023-12-06  3831  			synchronize_rcu();
4b7de801606e50 Jiri Olsa               2023-12-06  3832  		ret = __bpf_arch_text_poke(poke->tailcall_target,
4b7de801606e50 Jiri Olsa               2023-12-06  3833  					   BPF_MOD_JUMP,
4b7de801606e50 Jiri Olsa               2023-12-06  3834  					   old_addr, NULL);
4b7de801606e50 Jiri Olsa               2023-12-06  3835  		BUG_ON(ret < 0);
4b7de801606e50 Jiri Olsa               2023-12-06  3836  	}
4b7de801606e50 Jiri Olsa               2023-12-06  3837  }
7c05e7f3e74e7e Hou Tao                 2024-01-05  3838  
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  3839  bool bpf_jit_supports_arena(void)
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  3840  {
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  3841  	return true;
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  3842  }
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  3843  
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3844  bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3845  {
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3846  	if (!in_arena)
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3847  		return true;
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3848  	switch (insn->code) {
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3849  	case BPF_STX | BPF_ATOMIC | BPF_W:
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3850  	case BPF_STX | BPF_ATOMIC | BPF_DW:
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3851  		if (insn->imm == (BPF_AND | BPF_FETCH) ||
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3852  		    insn->imm == (BPF_OR | BPF_FETCH) ||
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3853  		    insn->imm == (BPF_XOR | BPF_FETCH))
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3854  			return false;
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3855  	}
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3856  	return true;
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3857  }
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  3858  
7c05e7f3e74e7e Hou Tao                 2024-01-05  3859  bool bpf_jit_supports_ptr_xchg(void)
7c05e7f3e74e7e Hou Tao                 2024-01-05  3860  {
7c05e7f3e74e7e Hou Tao                 2024-01-05  3861  	return true;
7c05e7f3e74e7e Hou Tao                 2024-01-05  3862  }
66e13b615a0ce7 Puranjay Mohan          2024-04-24  3863  
66e13b615a0ce7 Puranjay Mohan          2024-04-24  3864  /* x86-64 JIT emits its own code to filter user addresses so return 0 here */
66e13b615a0ce7 Puranjay Mohan          2024-04-24 @3865  u64 bpf_arch_uaddress_limit(void)
66e13b615a0ce7 Puranjay Mohan          2024-04-24  3866  {
66e13b615a0ce7 Puranjay Mohan          2024-04-24  3867  	return 0;
66e13b615a0ce7 Puranjay Mohan          2024-04-24  3868  }
2fb761823eadf2 Kumar Kartikeya Dwivedi 2025-03-03  3869  
2fb761823eadf2 Kumar Kartikeya Dwivedi 2025-03-03 @3870  bool bpf_jit_supports_timed_may_goto(void)

:::::: The code at line 3771 was first introduced by commit
:::::: 7d1cd70d4b16ff0216a5f6c2ae7d0fa9fa978c07 bpf, x86: Support private stack in jit

:::::: TO: Yonghong Song <yonghong.song@linux.dev>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
