Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C2615C14F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 00:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774916109; cv=none; b=MD8C6pPQo5zZpKKEA+fOPDuy73UrFS3KeiV+tWJKikfqpzgbBjMVTaDuGxI4wP6wlo6eZjd0S9QJJS3y14Ld3TdsZw7cJFrG0FAm+yXCqR/n3w5mdEfZAZfqKevmFVp+XgJSZ/YyvfFxi+qh44IVcT7qFQL54hItKYccdcy6DtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774916109; c=relaxed/simple;
	bh=wSn/Q/1jVf6JkIIjLhvFLj8agMXBogspnOAdO3D1m34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LKBPUNve3ylhVb/voS/skBZgc1hSblP08nLSPpz2BGicb07+hB76xk6L+p6ZesA654RqB4v34SInZ6U9Owx31QgHwYhXV/q8z8ylwnK2XgD8Fcg8ehCKHQo2+k5spUcQp11QbK4aqn23EQodrRM6zgLJ9ukPnpgdlpSjJP6RF5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Svwjdo0j; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Svwjdo0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774916107; x=1806452107;
  h=date:from:to:cc:subject:message-id;
  bh=wSn/Q/1jVf6JkIIjLhvFLj8agMXBogspnOAdO3D1m34=;
  b=Svwjdo0jzlBlj3OJpJAfpLHIPeAtSY2k9EY0ESpwNYOBpRcBI2vk2unx
   hrP8o30vYZzcRPb3oh+wiRusOPVDXQneuhHOvm1B+dPzireP7aYGgDMCG
   8yret/k7aG/XKhtaP+vkwrw8pOSOGw4DuW+wFdHe825j7fy4FdsCrHZex
   /EnsTbQmJdxTCoehrOKjNCXqOJn43jQoNlaOiyY3p3BbwxkNWxQE7c3T9
   NiwG0UE4KmntCDeRPiPAaNLCbbH+Rr/oRSva+B0PM8yIUkqtB8fMkBsfO
   H36v0NZDWyTaQ3a0tojQA8nm/kcOM4c6msTNLAasv3GbXAjvbxsJhFeZA
   w==;
X-CSE-ConnectionGUID: ouO/P47vSUWRtXm6bWX8pQ==
X-CSE-MsgGUID: R1lOYv8ORN+gGu1Hs7laAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75093214"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75093214"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 17:15:06 -0700
X-CSE-ConnectionGUID: CB/KcjcCRMeyPwO53dkqaQ==
X-CSE-MsgGUID: 8uOSPoBgSuCzSrLUM/RF4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="231128410"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Mar 2026 17:15:04 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ml4-000000001uD-01KN;
	Tue, 31 Mar 2026 00:15:02 +0000
Date: Tue, 31 Mar 2026 08:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 5/5]
 arch/arm64/kvm/hyp/nvhe/ftrace.c:91:15: warning: no previous prototype for
 function '__hyp_ftrace_trace'
Message-ID: <202603310856.viEE3ulZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 58ca789e21bb4fc0af3eaeacd88252a5564a816b [5/5] ANDROID: KVM: arm64: PROTECTED_NVHE_FTRACE to PKVM_FTRACE
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603310856.viEE3ulZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310856.viEE3ulZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310856.viEE3ulZ-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/ftrace.c:91:15: warning: no previous prototype for function '__hyp_ftrace_trace' [-Wmissing-prototypes]
      91 | unsigned long __hyp_ftrace_trace(unsigned long ip, unsigned long parent,
         |               ^
   arch/arm64/kvm/hyp/nvhe/ftrace.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | unsigned long __hyp_ftrace_trace(unsigned long ip, unsigned long parent,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:109:15: warning: no previous prototype for function '__hyp_ftrace_ret_trace' [-Wmissing-prototypes]
     109 | unsigned long __hyp_ftrace_ret_trace(void)
         |               ^
   arch/arm64/kvm/hyp/nvhe/ftrace.c:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     109 | unsigned long __hyp_ftrace_ret_trace(void)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:252:13: warning: no previous prototype for function '__get_phys' [-Wmissing-prototypes]
     252 | phys_addr_t __get_phys(unsigned long addr)
         |             ^
   arch/arm64/kvm/hyp/nvhe/ftrace.c:252:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     252 | phys_addr_t __get_phys(unsigned long addr)
         | ^
         | static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


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
