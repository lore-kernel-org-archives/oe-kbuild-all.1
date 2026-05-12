Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F063F54CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565315; cv=none; b=SGjjGxBhkCQ8zOtc4/VpHdF80J5SyHBZGuWTwLUtpksOJ/St8NEROUxHzxJPZs7b6WzRBJ/OBeAvxWo122a+WhnqHkL6S+jsvSkeAq5ZkKU6nhEV4chl+7Nh2D7jaKztgzeVyr+3y4/dLBa6noiR3aFr5LVu0NoNpQd01N2vM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565315; c=relaxed/simple;
	bh=1nzVd1K6nO3x0CjxI2Ow2wm9lwLRDjskg8lFiQfmHs4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JUrAda97d9u0cwsqOb05VwNlOd4LGKMN33As37uY5sog4HBaYiHXunU/9TqgKJzR9shLUgAh/hssHB+sPp/POMX/fT2oNCb20Z+6Fx4mjICT25G9oDdK2QG8rANoKUZm2LU7Gre72ruWtAc8A6pZP4/GB3w8IaIDVRoZSDgJ1gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUsE1VW6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUsE1VW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778565308; x=1810101308;
  h=date:from:to:cc:subject:message-id;
  bh=1nzVd1K6nO3x0CjxI2Ow2wm9lwLRDjskg8lFiQfmHs4=;
  b=SUsE1VW6gDQ48yev+X6UX+L0xXxiXWkkahNW23wMBBWPGMo4KSEOY0gv
   GB/n2PuuwdQfkG2op19P+zll9iBHkHYOxGJdVkEiPmcPFS/ZjG+pNVvx1
   ntN/uvEGhea1M7irpfZCaTPef/M2B66xUIkc+eYky5emD8bQAACQF2pt6
   YeipDd/H1B+4p2mYbPUruT8e8IJ1oVpNc/esWa7G8SJQUC+pfa+hr8FWA
   5yNOsjj4vjUjAYYJ7nQ4XIfpv7d1i3iyUQyHFZ3QQ8CWbYdp1+8kW6IjS
   lpVhy2BJxgvJDYtmjxRaTU/pQE/Qn9Sx2nwcpNvPIh/JHeBvtSGEnKTQp
   g==;
X-CSE-ConnectionGUID: 8dvawkdMTwW1GDnXVtDXGg==
X-CSE-MsgGUID: WdvbJCCzQkekLBfgxzZ8Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="102130324"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="102130324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 22:54:49 -0700
X-CSE-ConnectionGUID: 6OPZMvihQTGWfTfELwmbxg==
X-CSE-MsgGUID: R20neBb4SKi6rrF0rMlgzw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 May 2026 22:54:48 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMg4r-000000001fR-0bEC;
	Tue, 12 May 2026 05:54:45 +0000
Date: Tue, 12 May 2026 13:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 5/5]
 arch/arm64/kvm/hyp/nvhe/ftrace.c:91:15: warning: no previous prototype for
 '__hyp_ftrace_trace'
Message-ID: <202605121348.fvvzYM9B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   e37a614452efbec3e09613b2559e3a2a167ed6ba
commit: 600ba9bc4d4627300236fa1ff4ad133ee9d51149 [5/5] ANDROID: KVM: arm64: Add func/func_ret pKVM hyp events
config: arm64-randconfig-001-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121348.fvvzYM9B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121348.fvvzYM9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121348.fvvzYM9B-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/ftrace.c:91:15: warning: no previous prototype for '__hyp_ftrace_trace' [-Wmissing-prototypes]
      91 | unsigned long __hyp_ftrace_trace(unsigned long ip, unsigned long parent,
         |               ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:109:15: warning: no previous prototype for '__hyp_ftrace_ret_trace' [-Wmissing-prototypes]
     109 | unsigned long __hyp_ftrace_ret_trace(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:191:13: warning: no previous prototype for '__get_phys' [-Wmissing-prototypes]
     191 | phys_addr_t __get_phys(unsigned long addr)
         |             ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=y])
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]


vim +/__hyp_ftrace_trace +91 arch/arm64/kvm/hyp/nvhe/ftrace.c

e5a5778f97569ea Vincent Donnefort 2024-10-01   90  
e5a5778f97569ea Vincent Donnefort 2024-10-01  @91  unsigned long __hyp_ftrace_trace(unsigned long ip, unsigned long parent,
e5a5778f97569ea Vincent Donnefort 2024-10-01   92  				 unsigned long offset_idx)
e5a5778f97569ea Vincent Donnefort 2024-10-01   93  {
e5a5778f97569ea Vincent Donnefort 2024-10-01   94  	unsigned long func = __kern_addr(offset_idx, ip);
e5a5778f97569ea Vincent Donnefort 2024-10-01   95  	unsigned long parent_offset_idx;
e5a5778f97569ea Vincent Donnefort 2024-10-01   96  
e5a5778f97569ea Vincent Donnefort 2024-10-01   97  	/* When modules are called from core */
e5a5778f97569ea Vincent Donnefort 2024-10-01   98  	parent_offset_idx = parent > (unsigned long)__hyp_text_start ? 0 : offset_idx;
e5a5778f97569ea Vincent Donnefort 2024-10-01   99  
600ba9bc4d46273 Vincent Donnefort 2024-10-01  100  	trace_func(func, __kern_addr(parent_offset_idx, parent));
600ba9bc4d46273 Vincent Donnefort 2024-10-01  101  
e5a5778f97569ea Vincent Donnefort 2024-10-01  102  	/* Only install the trampoline if we can revert to the original parent */
e5a5778f97569ea Vincent Donnefort 2024-10-01  103  	if (hyp_ftrace_func_push(func, parent))
e5a5778f97569ea Vincent Donnefort 2024-10-01  104  		return (unsigned long)__hyp_ftrace_ret_tramp;
e5a5778f97569ea Vincent Donnefort 2024-10-01  105  
e5a5778f97569ea Vincent Donnefort 2024-10-01  106  	return parent;
e5a5778f97569ea Vincent Donnefort 2024-10-01  107  }
e5a5778f97569ea Vincent Donnefort 2024-10-01  108  
e5a5778f97569ea Vincent Donnefort 2024-10-01 @109  unsigned long __hyp_ftrace_ret_trace(void)
e5a5778f97569ea Vincent Donnefort 2024-10-01  110  {
e5a5778f97569ea Vincent Donnefort 2024-10-01  111  	struct hyp_ftrace_stack_frame *frame = hyp_ftrace_func_pop();
e5a5778f97569ea Vincent Donnefort 2024-10-01  112  
e5a5778f97569ea Vincent Donnefort 2024-10-01  113  	BUG_ON(!frame);
600ba9bc4d46273 Vincent Donnefort 2024-10-01  114  	trace_func_ret(frame->func);
e5a5778f97569ea Vincent Donnefort 2024-10-01  115  
e5a5778f97569ea Vincent Donnefort 2024-10-01  116  	return frame->ret;
e5a5778f97569ea Vincent Donnefort 2024-10-01  117  }
e5a5778f97569ea Vincent Donnefort 2024-10-01  118  
e5a5778f97569ea Vincent Donnefort 2024-10-01  119  void hyp_ftrace_ret_flush(void)
e5a5778f97569ea Vincent Donnefort 2024-10-01  120  {
e5a5778f97569ea Vincent Donnefort 2024-10-01  121  	struct hyp_ftrace_stack_frame *frame = hyp_ftrace_func_pop();
e5a5778f97569ea Vincent Donnefort 2024-10-01  122  
600ba9bc4d46273 Vincent Donnefort 2024-10-01  123  	while (frame) {
600ba9bc4d46273 Vincent Donnefort 2024-10-01  124  		trace_func_ret(frame->func);
e5a5778f97569ea Vincent Donnefort 2024-10-01  125  		frame = hyp_ftrace_func_pop();
e5a5778f97569ea Vincent Donnefort 2024-10-01  126  	}
600ba9bc4d46273 Vincent Donnefort 2024-10-01  127  }
e5a5778f97569ea Vincent Donnefort 2024-10-01  128  
e5a5778f97569ea Vincent Donnefort 2024-10-01  129  static int __get_offset_idx_ins(unsigned long *func, unsigned long ip, u32 *insn,
e5a5778f97569ea Vincent Donnefort 2024-10-01  130  				void *args)
e5a5778f97569ea Vincent Donnefort 2024-10-01  131  {
e5a5778f97569ea Vincent Donnefort 2024-10-01  132  	unsigned long idx = (unsigned long)args;
e5a5778f97569ea Vincent Donnefort 2024-10-01  133  	u32 imm, mask = (BIT(16) - 1) << 5;
e5a5778f97569ea Vincent Donnefort 2024-10-01  134  
e5a5778f97569ea Vincent Donnefort 2024-10-01  135  	imm = (idx << 5) & mask;
e5a5778f97569ea Vincent Donnefort 2024-10-01  136  
e5a5778f97569ea Vincent Donnefort 2024-10-01  137  	*insn = aarch64_insn_get_movz_value();
e5a5778f97569ea Vincent Donnefort 2024-10-01  138  	*insn |= BIT(31);			/* 64-bits variant */
e5a5778f97569ea Vincent Donnefort 2024-10-01  139  	*insn |= 10;				/* x10 */
e5a5778f97569ea Vincent Donnefort 2024-10-01  140  	*insn &= ~mask;
e5a5778f97569ea Vincent Donnefort 2024-10-01  141  	*insn |= imm;
e5a5778f97569ea Vincent Donnefort 2024-10-01  142  	*insn = cpu_to_le32(*insn);
e5a5778f97569ea Vincent Donnefort 2024-10-01  143  
e5a5778f97569ea Vincent Donnefort 2024-10-01  144  	return 0;
e5a5778f97569ea Vincent Donnefort 2024-10-01  145  }
e5a5778f97569ea Vincent Donnefort 2024-10-01  146  
e5a5778f97569ea Vincent Donnefort 2024-10-01  147  static int __get_enable_ins(unsigned long ip, u32 *insn, void *tramp)
e5a5778f97569ea Vincent Donnefort 2024-10-01  148  {
e5a5778f97569ea Vincent Donnefort 2024-10-01  149  	u32 imm, mask;
e5a5778f97569ea Vincent Donnefort 2024-10-01  150  	long delta;
e5a5778f97569ea Vincent Donnefort 2024-10-01  151  
e5a5778f97569ea Vincent Donnefort 2024-10-01  152  	delta = (long)tramp - (long)ip;
e5a5778f97569ea Vincent Donnefort 2024-10-01  153  
e5a5778f97569ea Vincent Donnefort 2024-10-01  154  	if (delta > SZ_128M || delta <= -SZ_128M)
e5a5778f97569ea Vincent Donnefort 2024-10-01  155  		return -ERANGE;
e5a5778f97569ea Vincent Donnefort 2024-10-01  156  
e5a5778f97569ea Vincent Donnefort 2024-10-01  157  	mask = BIT(26) - 1;
e5a5778f97569ea Vincent Donnefort 2024-10-01  158  	imm = (delta >> 2) & mask;
e5a5778f97569ea Vincent Donnefort 2024-10-01  159  
e5a5778f97569ea Vincent Donnefort 2024-10-01  160  	*insn = aarch64_insn_get_bl_value() & ~(mask);
e5a5778f97569ea Vincent Donnefort 2024-10-01  161  	*insn |= imm;
e5a5778f97569ea Vincent Donnefort 2024-10-01  162  	*insn = cpu_to_le32(*insn);
e5a5778f97569ea Vincent Donnefort 2024-10-01  163  
e5a5778f97569ea Vincent Donnefort 2024-10-01  164  	return 0;
e5a5778f97569ea Vincent Donnefort 2024-10-01  165  }
e5a5778f97569ea Vincent Donnefort 2024-10-01  166  
e5a5778f97569ea Vincent Donnefort 2024-10-01  167  #define funcs_pg_enabled(func)	((func) & 0x1)
e5a5778f97569ea Vincent Donnefort 2024-10-01  168  #define funcs_pg_func(func)	((func) & ~BIT(0))
e5a5778f97569ea Vincent Donnefort 2024-10-01  169  #define funcs_pg_is_end(func)						      \
e5a5778f97569ea Vincent Donnefort 2024-10-01  170  ({									      \
e5a5778f97569ea Vincent Donnefort 2024-10-01  171  	(!(*(func)) ||							      \
e5a5778f97569ea Vincent Donnefort 2024-10-01  172  	 ((PAGE_ALIGN((unsigned long)(func) + 1) - (unsigned long)(func)) <= 8)); \
e5a5778f97569ea Vincent Donnefort 2024-10-01  173  })
e5a5778f97569ea Vincent Donnefort 2024-10-01  174  
e5a5778f97569ea Vincent Donnefort 2024-10-01  175  /*
e5a5778f97569ea Vincent Donnefort 2024-10-01  176   * During init the kernel can notify a function needs to be enabled. This is
e5a5778f97569ea Vincent Donnefort 2024-10-01  177   * relying on the same encoding as the func_pg.
e5a5778f97569ea Vincent Donnefort 2024-10-01  178   */
e5a5778f97569ea Vincent Donnefort 2024-10-01  179  #define get_func(func)		funcs_pg_func(func)
e5a5778f97569ea Vincent Donnefort 2024-10-01  180  
e5a5778f97569ea Vincent Donnefort 2024-10-01  181  static int __get_enable_disable_ins_early(unsigned long *func, unsigned long ip,
e5a5778f97569ea Vincent Donnefort 2024-10-01  182  					  u32 *insn, void *tramp)
e5a5778f97569ea Vincent Donnefort 2024-10-01  183  {
e5a5778f97569ea Vincent Donnefort 2024-10-01  184  	if (funcs_pg_enabled(*func))
e5a5778f97569ea Vincent Donnefort 2024-10-01  185  		return __get_enable_ins(ip, insn, tramp);
e5a5778f97569ea Vincent Donnefort 2024-10-01  186  
e5a5778f97569ea Vincent Donnefort 2024-10-01  187  	/* Nothing else to do */
e5a5778f97569ea Vincent Donnefort 2024-10-01  188  	return 1;
e5a5778f97569ea Vincent Donnefort 2024-10-01  189  }
e5a5778f97569ea Vincent Donnefort 2024-10-01  190  
e5a5778f97569ea Vincent Donnefort 2024-10-01 @191  phys_addr_t __get_phys(unsigned long addr)
e5a5778f97569ea Vincent Donnefort 2024-10-01  192  {
e5a5778f97569ea Vincent Donnefort 2024-10-01  193  	if (addr >= (unsigned long)__hyp_text_start)
e5a5778f97569ea Vincent Donnefort 2024-10-01  194  		return __hyp_pa(addr);
e5a5778f97569ea Vincent Donnefort 2024-10-01  195  
e5a5778f97569ea Vincent Donnefort 2024-10-01  196  	return __pkvm_private_range_pa((void *)addr);
e5a5778f97569ea Vincent Donnefort 2024-10-01  197  }
e5a5778f97569ea Vincent Donnefort 2024-10-01  198  

:::::: The code at line 91 was first introduced by commit
:::::: e5a5778f97569eaad67f9b89f20e19eb2adf76c9 ANDROID: KVM: arm64: Add Ftrace patching for pKVM hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
