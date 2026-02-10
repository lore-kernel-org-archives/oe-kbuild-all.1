Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C091342C80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717399; cv=none; b=AWFKd2OHu7XE97Jlpc33pUXoDTcLWmsqtM43GF/WvC1C9DJTpxxydJGst0dyCLfIY0L8MtyOv0I+9dql82UwKxnzFgj4/buOq7OMpY7WmOkiMQwBYbwstszkbTSCUAzXCAgCAzBlWtcrll5csTotyFnJ89gDb7CuuJINrNqgmfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717399; c=relaxed/simple;
	bh=jv8ajjFmI0E5LDH95+1eYfte5/GCOxuSiJd9A9I5/jg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QNOY4S0iepPIrOI83a2xHbrZ21uP6W+mONoi5O2BhprivZOwEbT4PmCnBsV0Cm/++vGa7dgwWiFEyXmvx2xzOVm13rLz/jJGFz22Om0f0ntBPnRWsrLqXvHfVnHqGYTF0XW1tmhWIAMxqdi1pC5/GXrtgi5LlL4EHQ8O7KrOHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VytGLADo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VytGLADo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770717397; x=1802253397;
  h=date:from:to:cc:subject:message-id;
  bh=jv8ajjFmI0E5LDH95+1eYfte5/GCOxuSiJd9A9I5/jg=;
  b=VytGLADop1mlA1lFG8zeCrVVr1jPJRGeAc+QoDgizv4bhImah3KwWy+E
   h4BJ0ilkaBkszlboL+YsQKsfz/ZkVljb8XspDtWVOgfy/aHg7NWtIcfsj
   wPvynpqFm4vY3vB+CFmn2KODh14QZCjzctYPwfVz4OJwu1X71xjEeSR0A
   IPSyE6X/vw+QKWJCgGXbRPooiM1eWy+oNf3DYAwL9xF9eiN8MkVL4UX1r
   ZU7SLmaMXOdtfsW6vNkx8NulwGpGMX7AKDP7KnUAuu8qSrPN5jZL6DWqc
   HkFRN42A9KbDjgJdbQvNSD0IaEcrS5YDMTPvENqw2jMFsawUCo69zeKw6
   Q==;
X-CSE-ConnectionGUID: 81M2VmCjSoOEjvSIy7/jtw==
X-CSE-MsgGUID: 1EBjmHpQTG6Poq45Mq55lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74444404"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="74444404"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:56:36 -0800
X-CSE-ConnectionGUID: /2pAG4heQmiNxq8RLeG4VQ==
X-CSE-MsgGUID: FDxfFglNQ8Syy+mfKdozEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211198741"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2026 01:56:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpkTw-00000000osu-0sC4;
	Tue, 10 Feb 2026 09:56:32 +0000
Date: Tue, 10 Feb 2026 17:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 5/12]
 kernel/bpf/syscall.c:2966:15: error: call to undeclared function
 'is_tracing_multi'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602101750.Nu4qd8va-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   95bf1a3ff57efabf9b7c50b8a0d3583a6714f5d8
commit: 78ade758b40de069008f7e78273f116e712d3c19 [5/12] bpf: Add multi tracing attach types
config: riscv-randconfig-r131-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101750.Nu4qd8va-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101750.Nu4qd8va-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101750.Nu4qd8va-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1545:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
   static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
                                                     ^
   include/linux/bpf.h:1551:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
   static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
                                                       ^
>> kernel/bpf/syscall.c:2966:15: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           multi_func = is_tracing_multi(attr->expected_attach_type);
                        ^
   kernel/bpf/syscall.c:3536:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
           WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
                                                   ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   include/linux/bpf.h:1551:69: note: passing argument to parameter 'link' here
   static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
                                                                       ^
   kernel/bpf/syscall.c:3770:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
           err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
                                          ^~~~~~~~~~~~~~~~
   include/linux/bpf.h:1545:67: note: passing argument to parameter 'link' here
   static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
                                                                     ^
   9 warnings and 3 errors generated.
--
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   include/linux/bpf.h:1545:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
   static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
                                                     ^
   include/linux/bpf.h:1551:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
   static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
                                                       ^
>> kernel/bpf/verifier.c:25313:13: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           } else if (is_tracing_multi(prog->expected_attach_type))
                      ^
   9 warnings and 1 error generated.


vim +/is_tracing_multi +2966 kernel/bpf/syscall.c

  2889	
  2890	static int bpf_prog_load(union bpf_attr *attr, bpfptr_t uattr, u32 uattr_size)
  2891	{
  2892		enum bpf_prog_type type = attr->prog_type;
  2893		struct bpf_prog *prog, *dst_prog = NULL;
  2894		struct btf *attach_btf = NULL;
  2895		struct bpf_token *token = NULL;
  2896		bool bpf_cap;
  2897		int err;
  2898		char license[128];
  2899		bool multi_func;
  2900	
  2901		if (CHECK_ATTR(BPF_PROG_LOAD))
  2902			return -EINVAL;
  2903	
  2904		if (attr->prog_flags & ~(BPF_F_STRICT_ALIGNMENT |
  2905					 BPF_F_ANY_ALIGNMENT |
  2906					 BPF_F_TEST_STATE_FREQ |
  2907					 BPF_F_SLEEPABLE |
  2908					 BPF_F_TEST_RND_HI32 |
  2909					 BPF_F_XDP_HAS_FRAGS |
  2910					 BPF_F_XDP_DEV_BOUND_ONLY |
  2911					 BPF_F_TEST_REG_INVARIANTS |
  2912					 BPF_F_TOKEN_FD))
  2913			return -EINVAL;
  2914	
  2915		bpf_prog_load_fixup_attach_type(attr);
  2916	
  2917		if (attr->prog_flags & BPF_F_TOKEN_FD) {
  2918			token = bpf_token_get_from_fd(attr->prog_token_fd);
  2919			if (IS_ERR(token))
  2920				return PTR_ERR(token);
  2921			/* if current token doesn't grant prog loading permissions,
  2922			 * then we can't use this token, so ignore it and rely on
  2923			 * system-wide capabilities checks
  2924			 */
  2925			if (!bpf_token_allow_cmd(token, BPF_PROG_LOAD) ||
  2926			    !bpf_token_allow_prog_type(token, attr->prog_type,
  2927						       attr->expected_attach_type)) {
  2928				bpf_token_put(token);
  2929				token = NULL;
  2930			}
  2931		}
  2932	
  2933		bpf_cap = bpf_token_capable(token, CAP_BPF);
  2934		err = -EPERM;
  2935	
  2936		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
  2937		    (attr->prog_flags & BPF_F_ANY_ALIGNMENT) &&
  2938		    !bpf_cap)
  2939			goto put_token;
  2940	
  2941		/* Intent here is for unprivileged_bpf_disabled to block BPF program
  2942		 * creation for unprivileged users; other actions depend
  2943		 * on fd availability and access to bpffs, so are dependent on
  2944		 * object creation success. Even with unprivileged BPF disabled,
  2945		 * capability checks are still carried out for these
  2946		 * and other operations.
  2947		 */
  2948		if (sysctl_unprivileged_bpf_disabled && !bpf_cap)
  2949			goto put_token;
  2950	
  2951		if (attr->insn_cnt == 0 ||
  2952		    attr->insn_cnt > (bpf_cap ? BPF_COMPLEXITY_LIMIT_INSNS : BPF_MAXINSNS)) {
  2953			err = -E2BIG;
  2954			goto put_token;
  2955		}
  2956		if (type != BPF_PROG_TYPE_SOCKET_FILTER &&
  2957		    type != BPF_PROG_TYPE_CGROUP_SKB &&
  2958		    !bpf_cap)
  2959			goto put_token;
  2960	
  2961		if (is_net_admin_prog_type(type) && !bpf_token_capable(token, CAP_NET_ADMIN))
  2962			goto put_token;
  2963		if (is_perfmon_prog_type(type) && !bpf_token_capable(token, CAP_PERFMON))
  2964			goto put_token;
  2965	
> 2966		multi_func = is_tracing_multi(attr->expected_attach_type);
  2967	
  2968		/* attach_prog_fd/attach_btf_obj_fd can specify fd of either bpf_prog
  2969		 * or btf, we need to check which one it is
  2970		 */
  2971		if (attr->attach_prog_fd) {
  2972			dst_prog = bpf_prog_get(attr->attach_prog_fd);
  2973			if (IS_ERR(dst_prog)) {
  2974				dst_prog = NULL;
  2975				attach_btf = btf_get_by_fd(attr->attach_btf_obj_fd);
  2976				if (IS_ERR(attach_btf)) {
  2977					err = -EINVAL;
  2978					goto put_token;
  2979				}
  2980				if (!btf_is_kernel(attach_btf)) {
  2981					/* attaching through specifying bpf_prog's BTF
  2982					 * objects directly might be supported eventually
  2983					 */
  2984					btf_put(attach_btf);
  2985					err = -ENOTSUPP;
  2986					goto put_token;
  2987				}
  2988			}
  2989		} else if (attr->attach_btf_id || multi_func) {
  2990			/* fall back to vmlinux BTF, if BTF type ID is specified */
  2991			attach_btf = bpf_get_btf_vmlinux();
  2992			if (IS_ERR(attach_btf)) {
  2993				err = PTR_ERR(attach_btf);
  2994				goto put_token;
  2995			}
  2996			if (!attach_btf) {
  2997				err = -EINVAL;
  2998				goto put_token;
  2999			}
  3000			btf_get(attach_btf);
  3001		}
  3002	
  3003		if (bpf_prog_load_check_attach(type, attr->expected_attach_type,
  3004					       attach_btf, attr->attach_btf_id,
  3005					       dst_prog, multi_func)) {
  3006			if (dst_prog)
  3007				bpf_prog_put(dst_prog);
  3008			if (attach_btf)
  3009				btf_put(attach_btf);
  3010			err = -EINVAL;
  3011			goto put_token;
  3012		}
  3013	
  3014		/* plain bpf_prog allocation */
  3015		prog = bpf_prog_alloc(bpf_prog_size(attr->insn_cnt), GFP_USER);
  3016		if (!prog) {
  3017			if (dst_prog)
  3018				bpf_prog_put(dst_prog);
  3019			if (attach_btf)
  3020				btf_put(attach_btf);
  3021			err = -EINVAL;
  3022			goto put_token;
  3023		}
  3024	
  3025		prog->expected_attach_type = attr->expected_attach_type;
  3026		prog->sleepable = !!(attr->prog_flags & BPF_F_SLEEPABLE);
  3027		prog->aux->attach_btf = attach_btf;
  3028		prog->aux->attach_btf_id = multi_func ? bpf_multi_func_btf_id[0] : attr->attach_btf_id;
  3029		prog->aux->dst_prog = dst_prog;
  3030		prog->aux->dev_bound = !!attr->prog_ifindex;
  3031		prog->aux->xdp_has_frags = attr->prog_flags & BPF_F_XDP_HAS_FRAGS;
  3032	
  3033		/* move token into prog->aux, reuse taken refcnt */
  3034		prog->aux->token = token;
  3035		token = NULL;
  3036	
  3037		prog->aux->user = get_current_user();
  3038		prog->len = attr->insn_cnt;
  3039	
  3040		err = -EFAULT;
  3041		if (copy_from_bpfptr(prog->insns,
  3042				     make_bpfptr(attr->insns, uattr.is_kernel),
  3043				     bpf_prog_insn_size(prog)) != 0)
  3044			goto free_prog;
  3045		/* copy eBPF program license from user space */
  3046		if (strncpy_from_bpfptr(license,
  3047					make_bpfptr(attr->license, uattr.is_kernel),
  3048					sizeof(license) - 1) < 0)
  3049			goto free_prog;
  3050		license[sizeof(license) - 1] = 0;
  3051	
  3052		/* eBPF programs must be GPL compatible to use GPL-ed functions */
  3053		prog->gpl_compatible = license_is_gpl_compatible(license) ? 1 : 0;
  3054	
  3055		if (attr->signature) {
  3056			err = bpf_prog_verify_signature(prog, attr, uattr.is_kernel);
  3057			if (err)
  3058				goto free_prog;
  3059		}
  3060	
  3061		prog->orig_prog = NULL;
  3062		prog->jited = 0;
  3063	
  3064		atomic64_set(&prog->aux->refcnt, 1);
  3065	
  3066		if (bpf_prog_is_dev_bound(prog->aux)) {
  3067			err = bpf_prog_dev_bound_init(prog, attr);
  3068			if (err)
  3069				goto free_prog;
  3070		}
  3071	
  3072		if (type == BPF_PROG_TYPE_EXT && dst_prog &&
  3073		    bpf_prog_is_dev_bound(dst_prog->aux)) {
  3074			err = bpf_prog_dev_bound_inherit(prog, dst_prog);
  3075			if (err)
  3076				goto free_prog;
  3077		}
  3078	
  3079		/*
  3080		 * Bookkeeping for managing the program attachment chain.
  3081		 *
  3082		 * It might be tempting to set attach_tracing_prog flag at the attachment
  3083		 * time, but this will not prevent from loading bunch of tracing prog
  3084		 * first, then attach them one to another.
  3085		 *
  3086		 * The flag attach_tracing_prog is set for the whole program lifecycle, and
  3087		 * doesn't have to be cleared in bpf_tracing_link_release, since tracing
  3088		 * programs cannot change attachment target.
  3089		 */
  3090		if (type == BPF_PROG_TYPE_TRACING && dst_prog &&
  3091		    dst_prog->type == BPF_PROG_TYPE_TRACING) {
  3092			prog->aux->attach_tracing_prog = true;
  3093		}
  3094	
  3095		/* find program type: socket_filter vs tracing_filter */
  3096		err = find_prog_type(type, prog);
  3097		if (err < 0)
  3098			goto free_prog;
  3099	
  3100		prog->aux->load_time = ktime_get_boottime_ns();
  3101		err = bpf_obj_name_cpy(prog->aux->name, attr->prog_name,
  3102				       sizeof(attr->prog_name));
  3103		if (err < 0)
  3104			goto free_prog;
  3105	
  3106		err = security_bpf_prog_load(prog, attr, token, uattr.is_kernel);
  3107		if (err)
  3108			goto free_prog_sec;
  3109	
  3110		/* run eBPF verifier */
  3111		err = bpf_check(&prog, attr, uattr, uattr_size);
  3112		if (err < 0)
  3113			goto free_used_maps;
  3114	
  3115		prog = bpf_prog_select_runtime(prog, &err);
  3116		if (err < 0)
  3117			goto free_used_maps;
  3118	
  3119		err = bpf_prog_mark_insn_arrays_ready(prog);
  3120		if (err < 0)
  3121			goto free_used_maps;
  3122	
  3123		err = bpf_prog_alloc_id(prog);
  3124		if (err)
  3125			goto free_used_maps;
  3126	
  3127		/* Upon success of bpf_prog_alloc_id(), the BPF prog is
  3128		 * effectively publicly exposed. However, retrieving via
  3129		 * bpf_prog_get_fd_by_id() will take another reference,
  3130		 * therefore it cannot be gone underneath us.
  3131		 *
  3132		 * Only for the time /after/ successful bpf_prog_new_fd()
  3133		 * and before returning to userspace, we might just hold
  3134		 * one reference and any parallel close on that fd could
  3135		 * rip everything out. Hence, below notifications must
  3136		 * happen before bpf_prog_new_fd().
  3137		 *
  3138		 * Also, any failure handling from this point onwards must
  3139		 * be using bpf_prog_put() given the program is exposed.
  3140		 */
  3141		bpf_prog_kallsyms_add(prog);
  3142		perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
  3143		bpf_audit_prog(prog, BPF_AUDIT_LOAD);
  3144	
  3145		err = bpf_prog_new_fd(prog);
  3146		if (err < 0)
  3147			bpf_prog_put(prog);
  3148		return err;
  3149	
  3150	free_used_maps:
  3151		/* In case we have subprogs, we need to wait for a grace
  3152		 * period before we can tear down JIT memory since symbols
  3153		 * are already exposed under kallsyms.
  3154		 */
  3155		__bpf_prog_put_noref(prog, prog->aux->real_func_cnt);
  3156		return err;
  3157	
  3158	free_prog_sec:
  3159		security_bpf_prog_free(prog);
  3160	free_prog:
  3161		free_uid(prog->aux->user);
  3162		if (prog->aux->attach_btf)
  3163			btf_put(prog->aux->attach_btf);
  3164		bpf_prog_free(prog);
  3165	put_token:
  3166		bpf_token_put(token);
  3167		return err;
  3168	}
  3169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
