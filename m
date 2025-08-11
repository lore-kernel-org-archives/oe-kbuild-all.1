Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875A91EDA0B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 16:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931050; cv=none; b=PPkrpAvhNqI8QPHj+3MFuqPgflXD2t+ohSB59QW5dPQw/qWeUeJ8e+jKufZFsgQQZog6hKdjsjuU1O171NGZbbcZLndfECPAVue1sZpsZAf/ItOIFTgwWlOv4u0uNqYz0XpeBFi8zEl8VLZE6nG/B59Pea+z9AmSpM2WtByJIiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931050; c=relaxed/simple;
	bh=tBx8x8HHj6C+/sVAKSHFlr6GAf91orrhKEoA3reTUN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=naDlEMp9hTfI1ZD2NpkcZQCpSX0nx+/A/TpmKWkffuHIeRxgns0IZmdrTkXD2AMPRWQqq1+gZl1F+4IqWiYXbA262LvNkjTNrNVA5HLJuHH9YgtGxR6oU1K+7jsavtOAkYjvbf8bcf1SJeEUWrXH/s+/OPo3DNKzyWDxMO6yVvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrKtfJIN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrKtfJIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754931049; x=1786467049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBx8x8HHj6C+/sVAKSHFlr6GAf91orrhKEoA3reTUN0=;
  b=lrKtfJINJYJd1+No6AkblHZpw1eagzGectJKAvjSodd3qPQSB3VuxKOi
   1YEk9YkISX8BC/NeD1psv1yqiZhmaCAK9tYHIuE+7S3pNf+lt26dYzLVw
   QbASqnlHVxLNFBoFpDlJkqOkOPTWm6PoecT++gc3fjEJOFF4EK49h8oEH
   ATCx5kF3dGOYHisuqpswbHZ6qbBY9lrR9KGP+JhRCSpSX8hT8u5yz9GMV
   1MPSKPwcKgi17hdR62xobFkGfKCDZCSqtuB30vZbrvMYKyCLbBgNW7mDq
   oniKpMjBxqnJLn46dUoCG/i20H+p2SDqHBshg9BNwE7ksAy+Vb+dLHcPY
   w==;
X-CSE-ConnectionGUID: CmzOb6PITmuDmIYohX2joA==
X-CSE-MsgGUID: QKq1Ur5GSZKWEF6gWoQCxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68645894"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68645894"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 09:50:48 -0700
X-CSE-ConnectionGUID: v15Bb9ACTqqkS5yLEFsuvQ==
X-CSE-MsgGUID: oMR2P4y6TvOhMTI7rUSxBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166319813"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Aug 2025 09:50:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulVjH-00063I-0g;
	Mon, 11 Aug 2025 16:50:39 +0000
Date: Tue, 12 Aug 2025 00:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_apei_v1 37/55]
 arch/riscv/kernel/process.c:239:33: error: 'struct thread_struct' has no
 member named 'ptrace_bps'
Message-ID: <202508120012.FPjjnE3u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_apei_v1
head:   eaca137f211dcb260f7eb52d983ddad7f27277f3
commit: a54622884fd10596bc5494e332437afa09369d2a [37/55] riscv: ptrace: Add hw breakpoint support
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20250812/202508120012.FPjjnE3u-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120012.FPjjnE3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120012.FPjjnE3u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/kernel/process.c: In function 'copy_thread':
>> arch/riscv/kernel/process.c:239:33: error: 'struct thread_struct' has no member named 'ptrace_bps'
     239 |                 memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
         |                                 ^
   arch/riscv/kernel/process.c:239:65: error: 'struct thread_struct' has no member named 'ptrace_bps'
     239 |                 memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
         |                                                                 ^
--
   arch/riscv/kernel/ptrace.c: In function 'arch_ptrace':
>> arch/riscv/kernel/ptrace.c:443:31: warning: unused variable 'datap' [-Wunused-variable]
     443 |         unsigned long __user *datap = (unsigned long __user *) data;
         |                               ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HAVE_MIXED_BREAKPOINTS_REGS
   Depends on [n]: HAVE_HW_BREAKPOINT [=n]
   Selected by [y]:
   - RISCV [=y]


vim +239 arch/riscv/kernel/process.c

   225	
   226	int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
   227	{
   228		unsigned long clone_flags = args->flags;
   229		unsigned long usp = args->stack;
   230		unsigned long tls = args->tls;
   231		struct pt_regs *childregs = task_pt_regs(p);
   232	
   233		/* Ensure all threads in this mm have the same pointer masking mode. */
   234		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM) && p->mm && (clone_flags & CLONE_VM))
   235			set_bit(MM_CONTEXT_LOCK_PMLEN, &p->mm->context.flags);
   236	
   237		memset(&p->thread.s, 0, sizeof(p->thread.s));
   238		if (IS_ENABLED(CONFIG_HAVE_HW_BREAKPOINT))
 > 239			memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
   240	
   241		/* p->thread holds context to be restored by __switch_to() */
   242		if (unlikely(args->fn)) {
   243			/* Kernel thread */
   244			memset(childregs, 0, sizeof(struct pt_regs));
   245			/* Supervisor/Machine, irqs on: */
   246			childregs->status = SR_PP | SR_PIE;
   247	
   248			p->thread.s[0] = (unsigned long)args->fn;
   249			p->thread.s[1] = (unsigned long)args->fn_arg;
   250			p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
   251		} else {
   252			*childregs = *(current_pt_regs());
   253			/* Turn off status.VS */
   254			riscv_v_vstate_off(childregs);
   255			if (usp) /* User fork */
   256				childregs->sp = usp;
   257			if (clone_flags & CLONE_SETTLS)
   258				childregs->tp = tls;
   259			childregs->a0 = 0; /* Return value of fork() */
   260			p->thread.ra = (unsigned long)ret_from_fork_user_asm;
   261		}
   262		p->thread.riscv_v_flags = 0;
   263		if (has_vector() || has_xtheadvector())
   264			riscv_v_thread_alloc(p);
   265		p->thread.sp = (unsigned long)childregs; /* kernel sp */
   266		return 0;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
