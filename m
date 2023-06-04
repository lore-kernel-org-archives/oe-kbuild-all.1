Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486EE23A5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685889769; x=1717425769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d2e49zLlpAFKAUuP5g2QcKrtwsVhDb6nhdQOGs42wS0=;
  b=N2jk0PH7nPfajyaxpbh1KVvS97HMTITZcl1437JcRjWH0zyhOKGIfERq
   MfyJvqzJ7p7N5hmlom2bnIRkuxyBjtV/JH8fohvNz4DNMPezk00lNS2Ct
   iqoFfOh5SFlT/zAlFgdkwyFKgh/lUFZ8YTNQxpczMz+dLLHTq9WFrHMVl
   X+eUgwSz42067NOLuVjN21YCfBohwmmiHjM2mqFOud2K/lX1Mssfd36QQ
   Qc0I45K8vz9Sug6T/NkPQbVFca3qgU6aamWXmY3DojI/2wwtU7wQmI+MI
   w+kL0ZQnOzC29hI404gPKuVw2e6MsKjYQCOy6TcFJdvT1R0/ZBKmX0Djn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="442565966"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="442565966"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 07:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="798137159"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="798137159"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jun 2023 07:42:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5owR-0002tt-0X;
	Sun, 04 Jun 2023 14:42:47 +0000
Date: Sun, 4 Jun 2023 22:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 1/4] arch/arm64/kernel/process.c:378:34:
 error: 'struct thread_struct' has no member named 'actlr'
Message-ID: <202306042239.Sld8vnzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   38015ad2af19088e66e0c81f7efd5a8b51814026
commit: 1d9d900b53057adf79ba22257f2bd551bf5dfed7 [1/4] arm64: Introduce scaffolding to add ACTLR_EL1 to thread state
config: arm64-randconfig-r006-20230604 (https://download.01.org/0day-ci/archive/20230604/202306042239.Sld8vnzI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/1d9d900b53057adf79ba22257f2bd551bf5dfed7
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout 1d9d900b53057adf79ba22257f2bd551bf5dfed7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306042239.Sld8vnzI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/process.c: In function 'copy_thread':
>> arch/arm64/kernel/process.c:378:34: error: 'struct thread_struct' has no member named 'actlr'
     378 |                         p->thread.actlr = read_sysreg(actlr_el1);
         |                                  ^
   arch/arm64/kernel/process.c: In function 'actlr_thread_switch':
   arch/arm64/kernel/process.c:531:24: error: 'struct thread_struct' has no member named 'actlr'
     531 |         current->thread.actlr = read_sysreg(actlr_el1);
         |                        ^
   In file included from arch/arm64/include/asm/cputype.h:193,
                    from arch/arm64/include/asm/cache.h:42,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/compat.h:10,
                    from arch/arm64/kernel/process.c:9:
   arch/arm64/kernel/process.c:532:34: error: 'struct thread_struct' has no member named 'actlr'
     532 |         write_sysreg(next->thread.actlr, actlr_el1);
         |                                  ^
   arch/arm64/include/asm/sysreg.h:832:27: note: in definition of macro 'write_sysreg'
     832 |         u64 __val = (u64)(v);                                   \
         |                           ^


vim +378 arch/arm64/kernel/process.c

   344	
   345	int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
   346	{
   347		unsigned long clone_flags = args->flags;
   348		unsigned long stack_start = args->stack;
   349		unsigned long tls = args->tls;
   350		struct pt_regs *childregs = task_pt_regs(p);
   351	
   352		memset(&p->thread.cpu_context, 0, sizeof(struct cpu_context));
   353	
   354		/*
   355		 * In case p was allocated the same task_struct pointer as some
   356		 * other recently-exited task, make sure p is disassociated from
   357		 * any cpu that may have run that now-exited task recently.
   358		 * Otherwise we could erroneously skip reloading the FPSIMD
   359		 * registers for p.
   360		 */
   361		fpsimd_flush_task_state(p);
   362	
   363		ptrauth_thread_init_kernel(p);
   364	
   365		if (likely(!args->fn)) {
   366			*childregs = *current_pt_regs();
   367			childregs->regs[0] = 0;
   368	
   369			/*
   370			 * Read the current TLS pointer from tpidr_el0 as it may be
   371			 * out-of-sync with the saved value.
   372			 */
   373			*task_user_tls(p) = read_sysreg(tpidr_el0);
   374			if (system_supports_tpidr2())
   375				p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
   376	
   377			if (system_has_actlr_state())
 > 378				p->thread.actlr = read_sysreg(actlr_el1);
   379	
   380			if (stack_start) {
   381				if (is_compat_thread(task_thread_info(p)))
   382					childregs->compat_sp = stack_start;
   383				else
   384					childregs->sp = stack_start;
   385			}
   386	
   387			/*
   388			 * If a TLS pointer was passed to clone, use it for the new
   389			 * thread.  We also reset TPIDR2 if it's in use.
   390			 */
   391			if (clone_flags & CLONE_SETTLS) {
   392				p->thread.uw.tp_value = tls;
   393				p->thread.tpidr2_el0 = 0;
   394			}
   395		} else {
   396			/*
   397			 * A kthread has no context to ERET to, so ensure any buggy
   398			 * ERET is treated as an illegal exception return.
   399			 *
   400			 * When a user task is created from a kthread, childregs will
   401			 * be initialized by start_thread() or start_compat_thread().
   402			 */
   403			memset(childregs, 0, sizeof(struct pt_regs));
   404			childregs->pstate = PSR_MODE_EL1h | PSR_IL_BIT;
   405	
   406			p->thread.cpu_context.x19 = (unsigned long)args->fn;
   407			p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
   408		}
   409		p->thread.cpu_context.pc = (unsigned long)ret_from_fork;
   410		p->thread.cpu_context.sp = (unsigned long)childregs;
   411		/*
   412		 * For the benefit of the unwinder, set up childregs->stackframe
   413		 * as the final frame for the new task.
   414		 */
   415		p->thread.cpu_context.fp = (unsigned long)childregs->stackframe;
   416	
   417		ptrace_hw_copy_thread(p);
   418	
   419		return 0;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
