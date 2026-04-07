Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264537474B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533827; cv=none; b=HbgmuBJsrxk5KoTIUA2Sg2iyNxgL9Kemg2Z8YbYGpi3kuUeQ5BlCqy6LmLACTvCL9QihpRpErwlvMmbMU5NyYBKE69YKXq5mtV9sFT8o9UCn7BH75Oh0N0DKnuwJdIkYD5B047/1Q/lgMy+/mpupatmw3pzARJ6tQtTFbUkBaaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533827; c=relaxed/simple;
	bh=SNK6g+N3ofJrylbvGeljeD9ToXeSoKx+yD/wCBbL9kM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lTOHqpQ5czcp+o8OeG8nbryCJm7TCEezSfHWw/FRfMr4iXYB7DDcohOkqwrsg196CQqxJz2SBgj/a14cOn8a590ylUMlqe0uM+KbvgvYeyUM2Qpakn9uV6z+AgbPYADyDna/1aa8hwalmx8TcbSz0MT3ccZ9VSI2iS0/DqdFtSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzXjxQrE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzXjxQrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533826; x=1807069826;
  h=date:from:to:cc:subject:message-id;
  bh=SNK6g+N3ofJrylbvGeljeD9ToXeSoKx+yD/wCBbL9kM=;
  b=KzXjxQrEWdw8Qox2nkvg4rQT5mdcnBnYkV9lD/5dhNUfJL/PYKA6PmM8
   EqHk1euSkzBQ+2o0uwk9lixiLAYP/QskucA46r1GFjRzxAE1Rb8hmK0fI
   czP3J1tIojvREXa3F+StRorw4C2lxe3yAUDPO3ZzAiFknxNwfwWndS11G
   BAfYmJMM7cx/HWiazGnFD64x7yLGp+bfC+senR8nXUXlDUZKRrvk6ZPdr
   jOxisCj2IUthdmCtDvF7ycFuF4NlM/WThp/JWjAL08NtEHR6c7lPBhHjE
   c5Jc/sAf0ILxhEqYS7zeqRFvEQqa9rq3SUJ2sKtBTWf4UpudWlKPV+JAj
   w==;
X-CSE-ConnectionGUID: 8yJva0OWSJGZa9ZDPSzn3w==
X-CSE-MsgGUID: ySFIOz6ORrOzzzj8sJzZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87113622"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87113622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:50:22 -0700
X-CSE-ConnectionGUID: T8dIvJ0tTqS8lRZ5Zqs94A==
X-CSE-MsgGUID: PvysiiPVRU+4RKbIMQ1CAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223258480"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 20:50:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xSE-0000000001z-1t2m;
	Tue, 07 Apr 2026 03:50:18 +0000
Date: Tue, 07 Apr 2026 11:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Dubey <adubey@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:next-test 41/45]
 arch/powerpc/net/bpf_jit_comp32.c:153:7: error: implicit declaration of
 function 'PPC_RAW_LI32'; did you mean 'PPC_RAW_LI'?
Message-ID: <202604040212.jIxEd2DW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux next-test
head:   e1f7a0e196e293c223a882788c6d1a884d06d6d8
commit: 92258b5bf1ec10204c23a793793a65dc92d17014 [41/45] powerpc32/bpf: Add fsession support
config: powerpc-randconfig-001-20260404 (https://download.01.org/0day-ci/archive/20260404/202604040212.jIxEd2DW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040212.jIxEd2DW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040212.jIxEd2DW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/net/bpf_jit_comp32.c:19:
   arch/powerpc/net/bpf_jit_comp32.c: In function 'store_func_meta':
>> arch/powerpc/net/bpf_jit_comp32.c:153:7: error: implicit declaration of function 'PPC_RAW_LI32'; did you mean 'PPC_RAW_LI'? [-Werror=implicit-function-declaration]
     EMIT(PPC_RAW_LI32(bpf_to_ppc(TMP_REG), (u32)func_meta));
          ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:30:27: note: in definition of macro 'PLANT_INSTR'
     do { if (d) { (d)[idx] = instr; } idx++; } while (0)
                              ^~~~~
   arch/powerpc/net/bpf_jit_comp32.c:153:2: note: in expansion of macro 'EMIT'
     EMIT(PPC_RAW_LI32(bpf_to_ppc(TMP_REG), (u32)func_meta));
     ^~~~
   cc1: some warnings being treated as errors


vim +153 arch/powerpc/net/bpf_jit_comp32.c

    18	
  > 19	#include "bpf_jit.h"
    20	
    21	/*
    22	 * Stack layout:
    23	 *
    24	 *		[	prev sp		] <-------------
    25	 *		[   nv gpr save area	] 16 * 4	|
    26	 * fp (r31) -->	[   ebpf stack space	] upto 512	|
    27	 *		[     frame header	] 16		|
    28	 * sp (r1) --->	[    stack pointer	] --------------
    29	 */
    30	
    31	/* for gpr non volatile registers r17 to r31 (14) + tail call */
    32	#define BPF_PPC_STACK_SAVE	(15 * 4 + 4)
    33	/* stack frame, ensure this is quadword aligned */
    34	#define BPF_PPC_STACKFRAME(ctx)	(STACK_FRAME_MIN_SIZE + BPF_PPC_STACK_SAVE + (ctx)->stack_size)
    35	
    36	#define PPC_EX32(r, i)		EMIT(PPC_RAW_LI((r), (i) < 0 ? -1 : 0))
    37	
    38	/* PPC NVR range -- update this if we ever use NVRs below r17 */
    39	#define BPF_PPC_NVR_MIN		_R17
    40	#define BPF_PPC_TC		_R16
    41	
    42	/* BPF register usage */
    43	#define TMP_REG			(MAX_BPF_JIT_REG + 0)
    44	
    45	/* BPF to ppc register mappings */
    46	void bpf_jit_init_reg_mapping(struct codegen_context *ctx)
    47	{
    48		/* function return value */
    49		ctx->b2p[BPF_REG_0] = _R12;
    50		/* function arguments */
    51		ctx->b2p[BPF_REG_1] = _R4;
    52		ctx->b2p[BPF_REG_2] = _R6;
    53		ctx->b2p[BPF_REG_3] = _R8;
    54		ctx->b2p[BPF_REG_4] = _R10;
    55		ctx->b2p[BPF_REG_5] = _R22;
    56		/* non volatile registers */
    57		ctx->b2p[BPF_REG_6] = _R24;
    58		ctx->b2p[BPF_REG_7] = _R26;
    59		ctx->b2p[BPF_REG_8] = _R28;
    60		ctx->b2p[BPF_REG_9] = _R30;
    61		/* frame pointer aka BPF_REG_10 */
    62		ctx->b2p[BPF_REG_FP] = _R18;
    63		/* eBPF jit internal registers */
    64		ctx->b2p[BPF_REG_AX] = _R20;
    65		ctx->b2p[TMP_REG] = _R31;		/* 32 bits */
    66	}
    67	
    68	static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
    69	{
    70		if ((reg >= BPF_PPC_NVR_MIN && reg < 32) || reg == BPF_PPC_TC)
    71			return BPF_PPC_STACKFRAME(ctx) - 4 * (32 - reg);
    72	
    73		WARN(true, "BPF JIT is asking about unknown registers, will crash the stack");
    74		/* Use the hole we have left for alignment */
    75		return BPF_PPC_STACKFRAME(ctx) - 4;
    76	}
    77	
    78	#define SEEN_VREG_MASK		0x1ff80000 /* Volatile registers r3-r12 */
    79	#define SEEN_NVREG_FULL_MASK	0x0003ffff /* Non volatile registers r14-r31 */
    80	#define SEEN_NVREG_TEMP_MASK	0x00001e01 /* BPF_REG_5, BPF_REG_AX, TMP_REG */
    81	
    82	static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
    83	{
    84		/*
    85		 * We only need a stack frame if:
    86		 * - we call other functions (kernel helpers), or
    87		 * - we use non volatile registers, or
    88		 * - we use tail call counter
    89		 * - the bpf program uses its stack area
    90		 * The latter condition is deduced from the usage of BPF_REG_FP
    91		 */
    92		return ctx->seen & (SEEN_FUNC | SEEN_TAILCALL | SEEN_NVREG_FULL_MASK) ||
    93		       bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP));
    94	}
    95	
    96	void bpf_jit_realloc_regs(struct codegen_context *ctx)
    97	{
    98		unsigned int nvreg_mask;
    99	
   100		if (ctx->seen & SEEN_FUNC)
   101			nvreg_mask = SEEN_NVREG_TEMP_MASK;
   102		else
   103			nvreg_mask = SEEN_NVREG_FULL_MASK;
   104	
   105		while (ctx->seen & nvreg_mask &&
   106		      (ctx->seen & SEEN_VREG_MASK) != SEEN_VREG_MASK) {
   107			int old = 32 - fls(ctx->seen & (nvreg_mask & 0xaaaaaaab));
   108			int new = 32 - fls(~ctx->seen & (SEEN_VREG_MASK & 0xaaaaaaaa));
   109			int i;
   110	
   111			for (i = BPF_REG_0; i <= TMP_REG; i++) {
   112				if (ctx->b2p[i] != old)
   113					continue;
   114				ctx->b2p[i] = new;
   115				bpf_set_seen_register(ctx, new);
   116				bpf_clear_seen_register(ctx, old);
   117				if (i != TMP_REG) {
   118					bpf_set_seen_register(ctx, new - 1);
   119					bpf_clear_seen_register(ctx, old - 1);
   120				}
   121				break;
   122			}
   123		}
   124	}
   125	
   126	void prepare_for_fsession_fentry(u32 *image, struct codegen_context *ctx, int cookie_cnt,
   127							int cookie_off, int retval_off)
   128	{
   129		/*
   130		 * Set session cookies value
   131		 * Clear cookies field on stack
   132		 * Ensure retval to be cleared on fentry
   133		 */
   134		EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG), 0));
   135	
   136		for (int i = 0; i < cookie_cnt; i++) {
   137			EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, cookie_off + 4 * i));
   138			EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, cookie_off + 4 * i + 4));
   139		}
   140	
   141		EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, retval_off));
   142		EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, retval_off + 4));
   143	}
   144	
   145	void store_func_meta(u32 *image, struct codegen_context *ctx,
   146						u64 func_meta, int func_meta_off)
   147	{
   148		/*
   149		 * Store func_meta to stack: [R1 + func_meta_off] = func_meta
   150		 * func_meta := argument count in first byte + cookie value
   151		 */
   152		/* Store lower word */
 > 153		EMIT(PPC_RAW_LI32(bpf_to_ppc(TMP_REG), (u32)func_meta));
   154		EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, func_meta_off));
   155	
   156		/* Store upper word */
   157		EMIT(PPC_RAW_LI32(bpf_to_ppc(TMP_REG), (u32)(func_meta >> 32)));
   158		EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, func_meta_off + 4));
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
