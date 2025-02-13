Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295361E2847
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739440515; cv=none; b=nsc4gP2XL9y52zfy2f2cn0trgYYQmfehJDFam17j0Zv+E+a3X7z3TzfLDQ+Ob8uoLh2mps5JLPs6N/IyEH5EZ7KpDUsUlm4PojK58yiZggdoElVkaWEnG4PORZ3vcS+A0EKF/O47RuTmztaL86+sJBek0hiqrwPWs78MwC1TU4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739440515; c=relaxed/simple;
	bh=JhEOWOFHULA6zNUPoMuchY3+CfBm5zZJ/VLh7cAaGGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEgPb1uzUNhdj0IeToBmr6pVHwZyMqtQTtUS0Dv7CbikH617gCPhWilZ8FvDH+xd8xKKQ8+brg9fM5MKYn9aFiUsoPlPqdaRuV17CYlQRRLSOaZXeILnEryAuT3ctctem9yc0FudigzapaTqr0bty2yhL86t1xhXFcesA4lKIbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjrQZ/Oj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjrQZ/Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739440513; x=1770976513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JhEOWOFHULA6zNUPoMuchY3+CfBm5zZJ/VLh7cAaGGU=;
  b=MjrQZ/OjDbTWPn7P2MqPT+G8liXVNuBPcAnh+hmuV9vxoeO0qFmkjDd4
   aHDVy8wkFLGuNR+GIYqGm2ZTsxgkbR/hACCqvRBwEa7jO3ccY5qvUNfxE
   T7jVBVSAx+9HtbzgL+ABGAIAAYXf3CGj2LVQKdCpFe5ozRDq6YhH2jTHZ
   amGRqDQqAmQSqRkFoC1TXnNAe5qXVJxNFO0Fo6S8r9uTgwl2BlojPcSM1
   WDLEwFGnJcDMeMyyHsmqQ9MOQvowDA+CrHHvNUSKVC4iqjVQKfOVTDaJH
   8wHNks9JOm1IHVP9TAuPcVQ3c8Jr3Kiyd0uqQRJL5RpUv8qSAIf9TryPS
   Q==;
X-CSE-ConnectionGUID: jqYQhVdSRIiQ7cf0IoMFVA==
X-CSE-MsgGUID: BcDMXb1FR9O7xxiwD81vFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40166484"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40166484"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 01:55:13 -0800
X-CSE-ConnectionGUID: jp9RVbgIQ8WnKqGbuiWDgw==
X-CSE-MsgGUID: T71H3jPlTx6HUHpCdVuodw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113586345"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2025 01:55:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiVw5-0016sj-0p;
	Thu, 13 Feb 2025 09:55:09 +0000
Date: Thu, 13 Feb 2025 17:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/ftrace.c:91:15: warning: no previous prototype for
 function '__hyp_ftrace_trace'
Message-ID: <202502131733.tQOsVGUZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   33e939b20d8d2c6859960baa6b8bdfe83d5fd36d
commit: 600ba9bc4d4627300236fa1ff4ad133ee9d51149 [1/1] ANDROID: KVM: arm64: Add func/func_ret pKVM hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250213/202502131733.tQOsVGUZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131733.tQOsVGUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131733.tQOsVGUZ-lkp@intel.com/

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
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:191:13: warning: no previous prototype for function '__get_phys' [-Wmissing-prototypes]
     191 | phys_addr_t __get_phys(unsigned long addr)
         |             ^
   arch/arm64/kvm/hyp/nvhe/ftrace.c:191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     191 | phys_addr_t __get_phys(unsigned long addr)
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
e5a5778f97569e Vincent Donnefort 2024-10-01  147  static int __get_enable_ins(unsigned long ip, u32 *insn, void *tramp)
e5a5778f97569e Vincent Donnefort 2024-10-01  148  {
e5a5778f97569e Vincent Donnefort 2024-10-01  149  	u32 imm, mask;
e5a5778f97569e Vincent Donnefort 2024-10-01  150  	long delta;
e5a5778f97569e Vincent Donnefort 2024-10-01  151  
e5a5778f97569e Vincent Donnefort 2024-10-01  152  	delta = (long)tramp - (long)ip;
e5a5778f97569e Vincent Donnefort 2024-10-01  153  
e5a5778f97569e Vincent Donnefort 2024-10-01  154  	if (delta > SZ_128M || delta <= -SZ_128M)
e5a5778f97569e Vincent Donnefort 2024-10-01  155  		return -ERANGE;
e5a5778f97569e Vincent Donnefort 2024-10-01  156  
e5a5778f97569e Vincent Donnefort 2024-10-01  157  	mask = BIT(26) - 1;
e5a5778f97569e Vincent Donnefort 2024-10-01  158  	imm = (delta >> 2) & mask;
e5a5778f97569e Vincent Donnefort 2024-10-01  159  
e5a5778f97569e Vincent Donnefort 2024-10-01  160  	*insn = aarch64_insn_get_bl_value() & ~(mask);
e5a5778f97569e Vincent Donnefort 2024-10-01  161  	*insn |= imm;
e5a5778f97569e Vincent Donnefort 2024-10-01  162  	*insn = cpu_to_le32(*insn);
e5a5778f97569e Vincent Donnefort 2024-10-01  163  
e5a5778f97569e Vincent Donnefort 2024-10-01  164  	return 0;
e5a5778f97569e Vincent Donnefort 2024-10-01  165  }
e5a5778f97569e Vincent Donnefort 2024-10-01  166  
e5a5778f97569e Vincent Donnefort 2024-10-01  167  #define funcs_pg_enabled(func)	((func) & 0x1)
e5a5778f97569e Vincent Donnefort 2024-10-01  168  #define funcs_pg_func(func)	((func) & ~BIT(0))
e5a5778f97569e Vincent Donnefort 2024-10-01  169  #define funcs_pg_is_end(func)						      \
e5a5778f97569e Vincent Donnefort 2024-10-01  170  ({									      \
e5a5778f97569e Vincent Donnefort 2024-10-01  171  	(!(*(func)) ||							      \
e5a5778f97569e Vincent Donnefort 2024-10-01  172  	 ((PAGE_ALIGN((unsigned long)(func) + 1) - (unsigned long)(func)) <= 8)); \
e5a5778f97569e Vincent Donnefort 2024-10-01  173  })
e5a5778f97569e Vincent Donnefort 2024-10-01  174  
e5a5778f97569e Vincent Donnefort 2024-10-01  175  /*
e5a5778f97569e Vincent Donnefort 2024-10-01  176   * During init the kernel can notify a function needs to be enabled. This is
e5a5778f97569e Vincent Donnefort 2024-10-01  177   * relying on the same encoding as the func_pg.
e5a5778f97569e Vincent Donnefort 2024-10-01  178   */
e5a5778f97569e Vincent Donnefort 2024-10-01  179  #define get_func(func)		funcs_pg_func(func)
e5a5778f97569e Vincent Donnefort 2024-10-01  180  
e5a5778f97569e Vincent Donnefort 2024-10-01  181  static int __get_enable_disable_ins_early(unsigned long *func, unsigned long ip,
e5a5778f97569e Vincent Donnefort 2024-10-01  182  					  u32 *insn, void *tramp)
e5a5778f97569e Vincent Donnefort 2024-10-01  183  {
e5a5778f97569e Vincent Donnefort 2024-10-01  184  	if (funcs_pg_enabled(*func))
e5a5778f97569e Vincent Donnefort 2024-10-01  185  		return __get_enable_ins(ip, insn, tramp);
e5a5778f97569e Vincent Donnefort 2024-10-01  186  
e5a5778f97569e Vincent Donnefort 2024-10-01  187  	/* Nothing else to do */
e5a5778f97569e Vincent Donnefort 2024-10-01  188  	return 1;
e5a5778f97569e Vincent Donnefort 2024-10-01  189  }
e5a5778f97569e Vincent Donnefort 2024-10-01  190  
e5a5778f97569e Vincent Donnefort 2024-10-01 @191  phys_addr_t __get_phys(unsigned long addr)
e5a5778f97569e Vincent Donnefort 2024-10-01  192  {
e5a5778f97569e Vincent Donnefort 2024-10-01  193  	if (addr >= (unsigned long)__hyp_text_start)
e5a5778f97569e Vincent Donnefort 2024-10-01  194  		return __hyp_pa(addr);
e5a5778f97569e Vincent Donnefort 2024-10-01  195  
e5a5778f97569e Vincent Donnefort 2024-10-01  196  	return __pkvm_private_range_pa((void *)addr);
e5a5778f97569e Vincent Donnefort 2024-10-01  197  }
e5a5778f97569e Vincent Donnefort 2024-10-01  198  

:::::: The code at line 91 was first introduced by commit
:::::: e5a5778f97569eaad67f9b89f20e19eb2adf76c9 ANDROID: KVM: arm64: Add Ftrace patching for pKVM hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
