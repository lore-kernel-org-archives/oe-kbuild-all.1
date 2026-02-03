Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D939E6D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126559; cv=none; b=BAKlJ75QO/kWTFRfMLK3DY2UVcp8O60lmgDWJ2PhEKzwYst3LkyjAgRbBY5v2M76gT69Re+ZOjGP+2UVmoC4Sw1t+okXaFV1qDtj+1AhMhx3Fsq5If2FY96TaOMR0OoZxgO4pxvljW7xi+gG2qOCe1/6XxWsahMfDr7Y4vmg+SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126559; c=relaxed/simple;
	bh=z3y/LqgJF+jrBFsCH3KuBM2eUNZyeDXMvXSlk8L9AVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hu1KX78gbBKsFEsusG7SVXCyYQg2M3H2wGXOmZjUqUsHrMnDCNEGMXWcOHSrlj7sk+echgVEiTa6DauNyNdxcQM/EbbSmTKwuiR6eWlunBi46ZY3oNMw+C/GY6K8QAZJMNSehTUqe/LRIz7suH1jPRJ51aOlxC+0X53CMsycIjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms7IAgDv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms7IAgDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770126556; x=1801662556;
  h=date:from:to:cc:subject:message-id;
  bh=z3y/LqgJF+jrBFsCH3KuBM2eUNZyeDXMvXSlk8L9AVA=;
  b=ms7IAgDvYurEzgbpHW0E42pCJTEsXdt0zKpqeiZsSetBNG84mZcpVawb
   /dU9VzdPTmdgSFJnKLDgOS6Vf7dzh9OBlP5BklrsvO6slnTZ6ZmPBuRaI
   ooBYaAse5kHVx1IjkOTAoXaDIRAgKM+YpzzImWffr7QJRYQoa7Zqn2JRX
   PikfNcziSgZ5EaYfzybaoICjO6Er5+KAI5JGNBHKDV1Boj9nKcJ5PKy/Q
   QTLBqMOJvNmKDHR3YrWkeUlStmzxSRwjrwNITVBkh5hCegf+Q4G5YnVuU
   yD3V37uvElvmhTugsaeSB0b4ICitfq/2jvtaXOovclpzbizxlw8Tx1WvV
   w==;
X-CSE-ConnectionGUID: ge/MNUNLTvmBBCDmMoomeQ==
X-CSE-MsgGUID: eDrGCA5kTFeiD9OLhObeqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71203105"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="71203105"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 05:49:15 -0800
X-CSE-ConnectionGUID: 650kBZHvQbWOEcGt4btn/g==
X-CSE-MsgGUID: m2zo7Mw1RfKbn27apxeIIg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2026 05:49:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnGmE-00000000ghu-1stU;
	Tue, 03 Feb 2026 13:49:10 +0000
Date: Tue, 03 Feb 2026 21:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 4/12]
 arch/powerpc/net/bpf_jit_comp.c:578:20: error: dereferencing pointer to
 incomplete type 'struct bpf_tramp_links'
Message-ID: <202602032108.GcEKFdcy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   ae091d7daa68f465679351da2b52a948a8beab4b
commit: fbc4b2885f6603a8e333d6ff91ee4bd76e87f9c9 [4/12] bpf: Add struct bpf_tramp_node object
config: powerpc-randconfig-r072-20260203 (https://download.01.org/0day-ci/archive/20260203/202602032108.GcEKFdcy-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032108.GcEKFdcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032108.GcEKFdcy-lkp@intel.com/

All errors (new ones prefixed by >>):

      PPC_LI32(_R3, l->cookie >> 32);
      ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:18: error: 'struct bpf_tramp_link' has no member named 'cookie'
      PPC_LI32(_R4, l->cookie);
                     ^~
   arch/powerpc/net/bpf_jit.h:64:24: note: in definition of macro 'PPC_LI32'
      if ((int)(uintptr_t)(i) >= -32768 &&         \
                           ^
   arch/powerpc/net/bpf_jit_comp.c:500:18: error: 'struct bpf_tramp_link' has no member named 'cookie'
      PPC_LI32(_R4, l->cookie);
                     ^~
   arch/powerpc/net/bpf_jit.h:65:22: note: in definition of macro 'PPC_LI32'
        (int)(uintptr_t)(i) < 32768)        \
                         ^
   arch/powerpc/net/bpf_jit_comp.c:500:18: error: 'struct bpf_tramp_link' has no member named 'cookie'
      PPC_LI32(_R4, l->cookie);
                     ^~
   arch/powerpc/net/bpf_jit.h:29:27: note: in definition of macro 'PLANT_INSTR'
     do { if (d) { (d)[idx] = instr; } idx++; } while (0)
                              ^~~~~
   arch/powerpc/net/bpf_jit.h:66:4: note: in expansion of macro 'EMIT'
       EMIT(PPC_RAW_LI(d, i));          \
       ^~~~
   arch/powerpc/include/asm/ppc-opcode.h:501:76: note: in expansion of macro 'IMM_L'
    #define PPC_RAW_ADDI(d, a, i)  (0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
                                                                               ^~~~~
   arch/powerpc/include/asm/ppc-opcode.h:502:27: note: in expansion of macro 'PPC_RAW_ADDI'
    #define PPC_RAW_LI(r, i)  PPC_RAW_ADDI(r, 0, i)
                              ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:66:9: note: in expansion of macro 'PPC_RAW_LI'
       EMIT(PPC_RAW_LI(d, i));          \
            ^~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:3: note: in expansion of macro 'PPC_LI32'
      PPC_LI32(_R4, l->cookie);
      ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:18: error: 'struct bpf_tramp_link' has no member named 'cookie'
      PPC_LI32(_R4, l->cookie);
                     ^~
   arch/powerpc/net/bpf_jit.h:29:27: note: in definition of macro 'PLANT_INSTR'
     do { if (d) { (d)[idx] = instr; } idx++; } while (0)
                              ^~~~~
   arch/powerpc/net/bpf_jit.h:68:4: note: in expansion of macro 'EMIT'
       EMIT(PPC_RAW_LIS(d, IMM_H(i)));         \
       ^~~~
   arch/powerpc/include/asm/ppc-opcode.h:503:77: note: in expansion of macro 'IMM_L'
    #define PPC_RAW_ADDIS(d, a, i)  (0x3c000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
                                                                                ^~~~~
   arch/powerpc/include/asm/ppc-opcode.h:506:28: note: in expansion of macro 'PPC_RAW_ADDIS'
    #define PPC_RAW_LIS(r, i)  PPC_RAW_ADDIS(r, 0, i)
                               ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:68:9: note: in expansion of macro 'PPC_RAW_LIS'
       EMIT(PPC_RAW_LIS(d, IMM_H(i)));         \
            ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:68:24: note: in expansion of macro 'IMM_H'
       EMIT(PPC_RAW_LIS(d, IMM_H(i)));         \
                           ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:3: note: in expansion of macro 'PPC_LI32'
      PPC_LI32(_R4, l->cookie);
      ^~~~~~~~
   In file included from arch/powerpc/include/asm/barrier.h:11,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from include/linux/moduleloader.h:6,
                    from arch/powerpc/net/bpf_jit_comp.c:10:
   arch/powerpc/net/bpf_jit_comp.c:500:18: error: 'struct bpf_tramp_link' has no member named 'cookie'
      PPC_LI32(_R4, l->cookie);
                     ^~
   arch/powerpc/include/asm/ppc-opcode.h:113:45: note: in definition of macro 'IMM_L'
    #define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
                                                ^
   arch/powerpc/net/bpf_jit_comp.c:500:3: note: in expansion of macro 'PPC_LI32'
      PPC_LI32(_R4, l->cookie);
      ^~~~~~~~
   In file included from arch/powerpc/net/bpf_jit_comp.c:23:
   arch/powerpc/net/bpf_jit_comp.c:500:18: error: 'struct bpf_tramp_link' has no member named 'cookie'
      PPC_LI32(_R4, l->cookie);
                     ^~
   arch/powerpc/net/bpf_jit.h:29:27: note: in definition of macro 'PLANT_INSTR'
     do { if (d) { (d)[idx] = instr; } idx++; } while (0)
                              ^~~~~
   arch/powerpc/net/bpf_jit.h:70:5: note: in expansion of macro 'EMIT'
        EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));       \
        ^~~~
   arch/powerpc/include/asm/ppc-opcode.h:552:75: note: in expansion of macro 'IMM_L'
    #define PPC_RAW_ORI(d, a, i)  (0x60000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
                                                                              ^~~~~
   arch/powerpc/net/bpf_jit.h:70:10: note: in expansion of macro 'PPC_RAW_ORI'
        EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));       \
             ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:70:28: note: in expansion of macro 'IMM_L'
        EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));       \
                               ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:3: note: in expansion of macro 'PPC_LI32'
      PPC_LI32(_R4, l->cookie);
      ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: At top level:
   arch/powerpc/net/bpf_jit_comp.c:567:17: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
             struct bpf_tramp_links *tl, int regs_off, int retval_off,
                    ^~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: In function 'invoke_bpf_mod_ret':
>> arch/powerpc/net/bpf_jit_comp.c:578:20: error: dereferencing pointer to incomplete type 'struct bpf_tramp_links'
     for (i = 0; i < tl->nr_links; i++) {
                       ^~
   arch/powerpc/net/bpf_jit_comp.c: At top level:
   arch/powerpc/net/bpf_jit_comp.c:678:14: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
          struct bpf_tramp_links *tlinks,
                 ^~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: In function '__arch_prepare_bpf_trampoline':
   arch/powerpc/net/bpf_jit_comp.c:683:44: error: invalid use of undefined type 'struct bpf_tramp_links'
     struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
                                               ^
   arch/powerpc/net/bpf_jit_comp.c:683:44: error: dereferencing pointer to incomplete type 'struct bpf_tramp_links'
   arch/powerpc/net/bpf_jit_comp.c:684:42: error: invalid use of undefined type 'struct bpf_tramp_links'
     struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
                                             ^
   arch/powerpc/net/bpf_jit_comp.c:685:41: error: invalid use of undefined type 'struct bpf_tramp_links'
     struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
                                            ^
   arch/powerpc/net/bpf_jit_comp.c:876:12: warning: assignment to 'u32 *' {aka 'unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
      branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
               ^
   arch/powerpc/net/bpf_jit_comp.c:880:48: error: passing argument 4 of 'invoke_bpf_mod_ret' from incompatible pointer type [-Werror=incompatible-pointer-types]
      if (invoke_bpf_mod_ret(image, ro_image, ctx, fmod_ret, regs_off, retval_off,
                                                   ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:567:34: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
             struct bpf_tramp_links *tl, int regs_off, int retval_off,
             ~~~~~~~~~~~~~~~~~~~~~~~~^~
   arch/powerpc/net/bpf_jit_comp.c: At top level:
   arch/powerpc/net/bpf_jit_comp.c:1002:16: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
            struct bpf_tramp_links *tlinks, void *func_addr)
                   ^~~~~~~~~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:1001:5: error: conflicting types for 'arch_bpf_trampoline_size'
    int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/security.h:35,
                    from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from arch/powerpc/net/bpf_jit_comp.c:13:
   include/linux/bpf.h:1271:5: note: previous declaration of 'arch_bpf_trampoline_size' was here
    int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: In function 'arch_bpf_trampoline_size':
   arch/powerpc/net/bpf_jit_comp.c:1007:71: error: passing argument 7 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Werror=incompatible-pointer-types]
     ret = __arch_prepare_bpf_trampoline(&im, NULL, NULL, NULL, m, flags, tlinks, func_addr);
                                                                          ^~~~~~
   arch/powerpc/net/bpf_jit_comp.c:678:31: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
          struct bpf_tramp_links *tlinks,
          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/powerpc/net/bpf_jit_comp.c: At top level:
   arch/powerpc/net/bpf_jit_comp.c:1013:12: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
        struct bpf_tramp_links *tlinks,
               ^~~~~~~~~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:1011:5: error: conflicting types for 'arch_prepare_bpf_trampoline'
    int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/security.h:35,
                    from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from arch/powerpc/net/bpf_jit_comp.c:13:
   include/linux/bpf.h:1264:5: note: previous declaration of 'arch_prepare_bpf_trampoline' was here
    int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: In function 'arch_prepare_bpf_trampoline':
   arch/powerpc/net/bpf_jit_comp.c:1029:17: error: passing argument 7 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Werror=incompatible-pointer-types]
             flags, tlinks, func_addr);
                    ^~~~~~
   arch/powerpc/net/bpf_jit_comp.c:678:31: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
          struct bpf_tramp_links *tlinks,
          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +578 arch/powerpc/net/bpf_jit_comp.c

d243b62b7bd3d5 Naveen N Rao 2024-10-30  565  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  566  static int invoke_bpf_mod_ret(u32 *image, u32 *ro_image, struct codegen_context *ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  567  			      struct bpf_tramp_links *tl, int regs_off, int retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  568  			      int run_ctx_off, u32 *branches)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  569  {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  570  	int i;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  571  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  572  	/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  573  	 * The first fmod_ret program will receive a garbage return value.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  574  	 * Set this to 0 to avoid confusing the program.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  575  	 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  576  	EMIT(PPC_RAW_LI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  577  	EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30 @578  	for (i = 0; i < tl->nr_links; i++) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  579  		if (invoke_bpf_prog(image, ro_image, ctx, tl->links[i], regs_off, retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  580  				    run_ctx_off, true))
d243b62b7bd3d5 Naveen N Rao 2024-10-30  581  			return -EINVAL;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  582  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  583  		/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  584  		 * mod_ret prog stored return value after prog ctx. Emit:
d243b62b7bd3d5 Naveen N Rao 2024-10-30  585  		 * if (*(u64 *)(ret_val) !=  0)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  586  		 *	goto do_fexit;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  587  		 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  588  		EMIT(PPC_RAW_LL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  589  		EMIT(PPC_RAW_CMPLI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  590  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  591  		/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  592  		 * Save the location of the branch and generate a nop, which is
d243b62b7bd3d5 Naveen N Rao 2024-10-30  593  		 * replaced with a conditional jump once do_fexit (i.e. the
d243b62b7bd3d5 Naveen N Rao 2024-10-30  594  		 * start of the fexit invocation) is finalized.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  595  		 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  596  		branches[i] = ctx->idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  597  		EMIT(PPC_RAW_NOP());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  598  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  599  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  600  	return 0;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  601  }
d243b62b7bd3d5 Naveen N Rao 2024-10-30  602  

:::::: The code at line 578 was first introduced by commit
:::::: d243b62b7bd3d5314382d3b54e4992226245e936 powerpc64/bpf: Add support for bpf trampolines

:::::: TO: Naveen N Rao <naveen@kernel.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
