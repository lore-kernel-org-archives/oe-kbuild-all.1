Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580392;
	b=lCvvdvVA/f+qWe+Kf+JX0HpA1q1jnuQxXOBHDSJYnH0CJxUDk2Rn6vjgJ+6aF453/gwV
	 Xss73O5RtvgBTDs1N+6tcmeqFGp5gRm+Oc7vAwXf8EfBk7EWIh8VOb67jifGyEMgfdLOE
	 +leQlHH01R762cc2cArTyxGkFoJEsD/QOnWKLfyFlm7XjOkpzqQ9PaN+pJxoeedNm5Uw4
	 DrNljLFjRDnySSGkloE+sD4Ry1DVCifsnbJ3f0K7cCbi7zRGNBEJy/YEMTDXaI1b1NVYK
	 c8N4U/Q3bvetu+b/jJaRkH98dSVB1Nb4d4rTXDSzi5liG/arn0pOEGEpiA2nWH0W02g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580392;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=atidoe4QwLbNpG3LFlUDb7ZfNHafHYhssWz83LjQ6vU=;
	b=0tk4rh/jnSEvfbjSVUVco0xpGSiQsA2mcVUp8bqqBBc7BUoCxEBNjc9egH/4aGY3cyZm
	 +VaUNRSH1ypE5DtmZkZEIuh7rnKePaT+d/4D9pFu1X3ClAyskbyBeibhHvx/NTR0ORMwa
	 LGAuiRAPGI/XvO3lpG+/MqCtzVpFQIYhT/nFv/Qkf0Gv1WDOYLhmnRSoCc5HPGOajVtbC
	 9HxzROghqnjp4xu+VcTh/sHzXPGovlFmBMa94Tb+w8h/48iAHBucZ6yjcqHO7YyA508S/
	 BrBbvX4Si5d4qmbJmdprbwDnhNDL88IwJmEgR3KK1rPbppeecM80trgO8SNS3R/jcvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e+lxnOvY;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3391A606A326
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 04:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3391A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e+lxnOvY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795580392; x=1827116392;
  h=date:from:to:cc:subject:message-id;
  bh=9UJOjdnGLpLmdy588+RfItunsGfrpyvKLqX1QJnmPDE=;
  b=e+lxnOvYlXcWvaF6R1HkljqN6+hQjACcwi2NVsEGZI1+13lqtrYIXbb2
   8Sh6LyI5d7WQjNBMVHDwEKMS4EORaH/9zOSExZOYY5BHN0QeYhP05IsmZ
   2KyeUvp295vim59d2pMFEFkS9cmBEvCdhzfpx8qMoNT6BXt2/v4/vSA2p
   KbJCDOvkT25ikLdsc7M1pgRHGywpm9O4gp3PJMdwACMuAjre4gkZ6M8OB
   xbe+UE3HGAgOg2uTn2B9GY0SS2ep1fyXcI4uhkvBq7ya47q2LWPO4Jv6n
   c45Djyu/z+o7Ar18y1ng3oi+PGMz31lIzS2ZVXzjDyASdAnJH0qzI2kM9
   w==;
X-CSE-ConnectionGUID: nX/yVNlNQEKiHlAGTRbYGg==
X-CSE-MsgGUID: VEmpFjawSU2vG/AVZz8ykQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4483516"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4483516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 20:19:51 -0800
X-CSE-ConnectionGUID: k6m/9k4RSR6BkCnSIJP9gw==
X-CSE-MsgGUID: th1/CecMT9KFJPhiH52lBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11542950"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 24 Nov 2026 20:19:50 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW4Tx-0000000001z-2iWr;
	Wed, 25 Nov 2026 04:19:45 +0000
Date: Wed, 25 Nov 2026 05:19:26 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 30/30]
 arch/arm64/kvm/hyp/nvhe/ftrace.c:91:15: warning: no previous prototype for
 '__hyp_ftrace_trace'
Message-ID: <20261125044556.kq3VQDgD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vincent,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ff6be2559af23135abf743199d61a2d1ea23a957
commit: 58ca789e21bb4fc0af3eaeacd88252a5564a816b [30/30] ANDROID: KVM: arm64: PROTECTED_NVHE_FTRACE to PKVM_FTRACE
config: arm64-randconfig-r2311-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125044556.kq3VQDgD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125044556.kq3VQDgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125044556.kq3VQDgD-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/ftrace.c:91:15: warning: no previous prototype for '__hyp_ftrace_trace' [-Wmissing-prototypes]
    unsigned long __hyp_ftrace_trace(unsigned long ip, unsigned long parent,
                  ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:109:15: warning: no previous prototype for '__hyp_ftrace_ret_trace' [-Wmissing-prototypes]
    unsigned long __hyp_ftrace_ret_trace(void)
                  ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:252:13: warning: no previous prototype for '__get_phys' [-Wmissing-prototypes]
    phys_addr_t __get_phys(unsigned long addr)
                ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/__hyp_ftrace_trace +91 arch/arm64/kvm/hyp/nvhe/ftrace.c

e5a5778f97569e Vincent Donnefort 2024-10-01   90  
e5a5778f97569e Vincent Donnefort 2024-10-01  @91  unsigned long __hyp_ftrace_trace(unsigned long ip, unsigned long parent,
e5a5778f97569e Vincent Donnefort 2024-10-01   92  				 unsigned long offset_idx)
e5a5778f97569e Vincent Donnefort 2024-10-01   93  {
e5a5778f97569e Vincent Donnefort 2024-10-01   94  	unsigned long func = __kern_addr(offset_idx, ip);
e5a5778f97569e Vincent Donnefort 2024-10-01   95  	unsigned long parent_offset_idx;
e5a5778f97569e Vincent Donnefort 2024-10-01   96  
e5a5778f97569e Vincent Donnefort 2024-10-01   97  	/* When modules are called from core */
e5a5778f97569e Vincent Donnefort 2024-10-01   98  	parent_offset_idx = parent > (unsigned long)__hyp_text_start ? 0 : offset_idx;
e5a5778f97569e Vincent Donnefort 2024-10-01   99  
600ba9bc4d4627 Vincent Donnefort 2024-10-01  100  	trace_func(func, __kern_addr(parent_offset_idx, parent));
600ba9bc4d4627 Vincent Donnefort 2024-10-01  101  
e5a5778f97569e Vincent Donnefort 2024-10-01  102  	/* Only install the trampoline if we can revert to the original parent */
e5a5778f97569e Vincent Donnefort 2024-10-01  103  	if (hyp_ftrace_func_push(func, parent))
e5a5778f97569e Vincent Donnefort 2024-10-01  104  		return (unsigned long)__hyp_ftrace_ret_tramp;
e5a5778f97569e Vincent Donnefort 2024-10-01  105  
e5a5778f97569e Vincent Donnefort 2024-10-01  106  	return parent;
e5a5778f97569e Vincent Donnefort 2024-10-01  107  }
e5a5778f97569e Vincent Donnefort 2024-10-01  108  
e5a5778f97569e Vincent Donnefort 2024-10-01 @109  unsigned long __hyp_ftrace_ret_trace(void)
e5a5778f97569e Vincent Donnefort 2024-10-01  110  {
e5a5778f97569e Vincent Donnefort 2024-10-01  111  	struct hyp_ftrace_stack_frame *frame = hyp_ftrace_func_pop();
e5a5778f97569e Vincent Donnefort 2024-10-01  112  
e5a5778f97569e Vincent Donnefort 2024-10-01  113  	BUG_ON(!frame);
600ba9bc4d4627 Vincent Donnefort 2024-10-01  114  	trace_func_ret(frame->func);
e5a5778f97569e Vincent Donnefort 2024-10-01  115  
e5a5778f97569e Vincent Donnefort 2024-10-01  116  	return frame->ret;
e5a5778f97569e Vincent Donnefort 2024-10-01  117  }
e5a5778f97569e Vincent Donnefort 2024-10-01  118  
e5a5778f97569e Vincent Donnefort 2024-10-01  119  void hyp_ftrace_ret_flush(void)
e5a5778f97569e Vincent Donnefort 2024-10-01  120  {
e5a5778f97569e Vincent Donnefort 2024-10-01  121  	struct hyp_ftrace_stack_frame *frame = hyp_ftrace_func_pop();
e5a5778f97569e Vincent Donnefort 2024-10-01  122  
600ba9bc4d4627 Vincent Donnefort 2024-10-01  123  	while (frame) {
600ba9bc4d4627 Vincent Donnefort 2024-10-01  124  		trace_func_ret(frame->func);
e5a5778f97569e Vincent Donnefort 2024-10-01  125  		frame = hyp_ftrace_func_pop();
e5a5778f97569e Vincent Donnefort 2024-10-01  126  	}
600ba9bc4d4627 Vincent Donnefort 2024-10-01  127  }
e5a5778f97569e Vincent Donnefort 2024-10-01  128  
e5a5778f97569e Vincent Donnefort 2024-10-01  129  static int __get_offset_idx_ins(unsigned long *func, unsigned long ip, u32 *insn,
e5a5778f97569e Vincent Donnefort 2024-10-01  130  				void *args)
e5a5778f97569e Vincent Donnefort 2024-10-01  131  {
e5a5778f97569e Vincent Donnefort 2024-10-01  132  	unsigned long idx = (unsigned long)args;
e5a5778f97569e Vincent Donnefort 2024-10-01  133  	u32 imm, mask = (BIT(16) - 1) << 5;
e5a5778f97569e Vincent Donnefort 2024-10-01  134  
e5a5778f97569e Vincent Donnefort 2024-10-01  135  	imm = (idx << 5) & mask;
e5a5778f97569e Vincent Donnefort 2024-10-01  136  
e5a5778f97569e Vincent Donnefort 2024-10-01  137  	*insn = aarch64_insn_get_movz_value();
e5a5778f97569e Vincent Donnefort 2024-10-01  138  	*insn |= BIT(31);			/* 64-bits variant */
e5a5778f97569e Vincent Donnefort 2024-10-01  139  	*insn |= 10;				/* x10 */
e5a5778f97569e Vincent Donnefort 2024-10-01  140  	*insn &= ~mask;
e5a5778f97569e Vincent Donnefort 2024-10-01  141  	*insn |= imm;
e5a5778f97569e Vincent Donnefort 2024-10-01  142  	*insn = cpu_to_le32(*insn);
e5a5778f97569e Vincent Donnefort 2024-10-01  143  
e5a5778f97569e Vincent Donnefort 2024-10-01  144  	return 0;
e5a5778f97569e Vincent Donnefort 2024-10-01  145  }
e5a5778f97569e Vincent Donnefort 2024-10-01  146  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  147  static int __get_disable_ins(unsigned long *func, unsigned long ip, u32 *insn,
e630ddc2c3e915 Vincent Donnefort 2024-10-01  148  			     void *args)
e630ddc2c3e915 Vincent Donnefort 2024-10-01  149  {
e630ddc2c3e915 Vincent Donnefort 2024-10-01  150  	static u32 nop;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  151  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  152  	if (!nop)
e630ddc2c3e915 Vincent Donnefort 2024-10-01  153  		nop = aarch64_insn_gen_nop();
e630ddc2c3e915 Vincent Donnefort 2024-10-01  154  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  155  	*insn = cpu_to_le32(nop);
e630ddc2c3e915 Vincent Donnefort 2024-10-01  156  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  157  	return 0;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  158  }
e630ddc2c3e915 Vincent Donnefort 2024-10-01  159  
e5a5778f97569e Vincent Donnefort 2024-10-01  160  static int __get_enable_ins(unsigned long ip, u32 *insn, void *tramp)
e5a5778f97569e Vincent Donnefort 2024-10-01  161  {
e5a5778f97569e Vincent Donnefort 2024-10-01  162  	u32 imm, mask;
e5a5778f97569e Vincent Donnefort 2024-10-01  163  	long delta;
e5a5778f97569e Vincent Donnefort 2024-10-01  164  
e5a5778f97569e Vincent Donnefort 2024-10-01  165  	delta = (long)tramp - (long)ip;
e5a5778f97569e Vincent Donnefort 2024-10-01  166  
e5a5778f97569e Vincent Donnefort 2024-10-01  167  	if (delta > SZ_128M || delta <= -SZ_128M)
e5a5778f97569e Vincent Donnefort 2024-10-01  168  		return -ERANGE;
e5a5778f97569e Vincent Donnefort 2024-10-01  169  
e5a5778f97569e Vincent Donnefort 2024-10-01  170  	mask = BIT(26) - 1;
e5a5778f97569e Vincent Donnefort 2024-10-01  171  	imm = (delta >> 2) & mask;
e5a5778f97569e Vincent Donnefort 2024-10-01  172  
e5a5778f97569e Vincent Donnefort 2024-10-01  173  	*insn = aarch64_insn_get_bl_value() & ~(mask);
e5a5778f97569e Vincent Donnefort 2024-10-01  174  	*insn |= imm;
e5a5778f97569e Vincent Donnefort 2024-10-01  175  	*insn = cpu_to_le32(*insn);
e5a5778f97569e Vincent Donnefort 2024-10-01  176  
e5a5778f97569e Vincent Donnefort 2024-10-01  177  	return 0;
e5a5778f97569e Vincent Donnefort 2024-10-01  178  }
e5a5778f97569e Vincent Donnefort 2024-10-01  179  
e5a5778f97569e Vincent Donnefort 2024-10-01  180  #define funcs_pg_enabled(func)	((func) & 0x1)
e5a5778f97569e Vincent Donnefort 2024-10-01  181  #define funcs_pg_func(func)	((func) & ~BIT(0))
e5a5778f97569e Vincent Donnefort 2024-10-01  182  #define funcs_pg_is_end(func)						      \
e5a5778f97569e Vincent Donnefort 2024-10-01  183  ({									      \
e5a5778f97569e Vincent Donnefort 2024-10-01  184  	(!(*(func)) ||							      \
e5a5778f97569e Vincent Donnefort 2024-10-01  185  	 ((PAGE_ALIGN((unsigned long)(func) + 1) - (unsigned long)(func)) <= 8)); \
e5a5778f97569e Vincent Donnefort 2024-10-01  186  })
e5a5778f97569e Vincent Donnefort 2024-10-01  187  
e5a5778f97569e Vincent Donnefort 2024-10-01  188  /*
e5a5778f97569e Vincent Donnefort 2024-10-01  189   * During init the kernel can notify a function needs to be enabled. This is
e5a5778f97569e Vincent Donnefort 2024-10-01  190   * relying on the same encoding as the func_pg.
e5a5778f97569e Vincent Donnefort 2024-10-01  191   */
e5a5778f97569e Vincent Donnefort 2024-10-01  192  #define get_func(func)		funcs_pg_func(func)
e5a5778f97569e Vincent Donnefort 2024-10-01  193  
e5a5778f97569e Vincent Donnefort 2024-10-01  194  static int __get_enable_disable_ins_early(unsigned long *func, unsigned long ip,
e5a5778f97569e Vincent Donnefort 2024-10-01  195  					  u32 *insn, void *tramp)
e5a5778f97569e Vincent Donnefort 2024-10-01  196  {
e5a5778f97569e Vincent Donnefort 2024-10-01  197  	if (funcs_pg_enabled(*func))
e5a5778f97569e Vincent Donnefort 2024-10-01  198  		return __get_enable_ins(ip, insn, tramp);
e5a5778f97569e Vincent Donnefort 2024-10-01  199  
e5a5778f97569e Vincent Donnefort 2024-10-01  200  	/* Nothing else to do */
e5a5778f97569e Vincent Donnefort 2024-10-01  201  	return 1;
e5a5778f97569e Vincent Donnefort 2024-10-01  202  }
e5a5778f97569e Vincent Donnefort 2024-10-01  203  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  204  struct __ftrace_sync_patch_args {
e630ddc2c3e915 Vincent Donnefort 2024-10-01  205  	void		*tramp;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  206  	unsigned long	offset_idx;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  207  	unsigned long	*funcs_pg;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  208  };
e630ddc2c3e915 Vincent Donnefort 2024-10-01  209  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  210  static int
e630ddc2c3e915 Vincent Donnefort 2024-10-01  211  __get_enable_disable_ins_from_funcs_pg(unsigned long *func, unsigned long ip,
e630ddc2c3e915 Vincent Donnefort 2024-10-01  212  				       u32 *insn, void *__args)
e630ddc2c3e915 Vincent Donnefort 2024-10-01  213  {
e630ddc2c3e915 Vincent Donnefort 2024-10-01  214  	struct __ftrace_sync_patch_args *args = __args;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  215  	unsigned long kern_addr;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  216  	static u32 nop;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  217  	u32 cur_insn;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  218  	bool enable;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  219  	int ret = 0;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  220  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  221  	if (funcs_pg_is_end(args->funcs_pg))
e630ddc2c3e915 Vincent Donnefort 2024-10-01  222  		return -EAGAIN;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  223  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  224  	kern_addr = __kern_addr(args->offset_idx, *func);
e630ddc2c3e915 Vincent Donnefort 2024-10-01  225  	if (get_func(kern_addr) != funcs_pg_func(*args->funcs_pg)) {
e630ddc2c3e915 Vincent Donnefort 2024-10-01  226  		ret = -EINVAL;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  227  		goto end;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  228  	}
e630ddc2c3e915 Vincent Donnefort 2024-10-01  229  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  230  	if (!nop)
e630ddc2c3e915 Vincent Donnefort 2024-10-01  231  		nop = aarch64_insn_gen_nop();
e630ddc2c3e915 Vincent Donnefort 2024-10-01  232  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  233  	enable = funcs_pg_enabled(*args->funcs_pg);
e630ddc2c3e915 Vincent Donnefort 2024-10-01  234  	cur_insn = *(u32 *)ip;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  235  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  236  	/* Are we modifying anything? */
e630ddc2c3e915 Vincent Donnefort 2024-10-01  237  	if ((cur_insn == nop) != enable) {
e630ddc2c3e915 Vincent Donnefort 2024-10-01  238  		ret = -EBUSY;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  239  		goto end;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  240  	}
e630ddc2c3e915 Vincent Donnefort 2024-10-01  241  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  242  	if (funcs_pg_enabled(*args->funcs_pg))
e630ddc2c3e915 Vincent Donnefort 2024-10-01  243  		ret = __get_enable_ins(ip, insn, args->tramp);
e630ddc2c3e915 Vincent Donnefort 2024-10-01  244  	else
e630ddc2c3e915 Vincent Donnefort 2024-10-01  245  		*insn = cpu_to_le32(nop);
e630ddc2c3e915 Vincent Donnefort 2024-10-01  246  
e630ddc2c3e915 Vincent Donnefort 2024-10-01  247  end:
e630ddc2c3e915 Vincent Donnefort 2024-10-01  248  	args->funcs_pg++;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  249  	return ret;
e630ddc2c3e915 Vincent Donnefort 2024-10-01  250  }
e630ddc2c3e915 Vincent Donnefort 2024-10-01  251  
e5a5778f97569e Vincent Donnefort 2024-10-01 @252  phys_addr_t __get_phys(unsigned long addr)
e5a5778f97569e Vincent Donnefort 2024-10-01  253  {
e5a5778f97569e Vincent Donnefort 2024-10-01  254  	if (addr >= (unsigned long)__hyp_text_start)
e5a5778f97569e Vincent Donnefort 2024-10-01  255  		return __hyp_pa(addr);
e5a5778f97569e Vincent Donnefort 2024-10-01  256  
e5a5778f97569e Vincent Donnefort 2024-10-01  257  	return __pkvm_private_range_pa((void *)addr);
e5a5778f97569e Vincent Donnefort 2024-10-01  258  }
e5a5778f97569e Vincent Donnefort 2024-10-01  259  

:::::: The code at line 91 was first introduced by commit
:::::: e5a5778f97569eaad67f9b89f20e19eb2adf76c9 ANDROID: KVM: arm64: Add Ftrace patching for pKVM hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
