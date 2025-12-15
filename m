Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD230C347
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765830507; cv=none; b=SiNN+cnHa7+io0W+alWPJhw+MB4xcsKQnsSNU93OJoyGldUNmIvHG6JMnUlOnzTTT61yd0nRztrPUTwJemGaBrjFUgu8WgcjuG0UKG/OxDZQfpjjMWEoaX2N2emZlXi8l48aJmUcVbKh1ZkRR+8lsWIdf9nlb4+QsEDKnRjflHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765830507; c=relaxed/simple;
	bh=PICd5QGN1ZwPD9AFzhqgQ3hSUeAqcFLWLHAtmij4II8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nfp+VURw4um1iNyhfk4UhZkBCPNW/Iz0BC/g1J77GIMJlRYuHxN+NgRr/0BR9HiesXDaVHUwEE/FO/p9hB+XgoJTrmfbhOqZlrsIbTz1QuhS3S8rkucP+74RJL57Cs+pjYC0d5/zb4MosHNvn+paTK3TZR4pFEEITkFmyUZnDi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNKFpBWR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNKFpBWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765830505; x=1797366505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PICd5QGN1ZwPD9AFzhqgQ3hSUeAqcFLWLHAtmij4II8=;
  b=QNKFpBWRA7G1fET3CDxFpMIRUsRpYY4/DsYmwo82HlVNMtriOlh2Vx7E
   MejAxebBIlO5tdEHQWdQJB/ukgbWXMudc2o29TAgtDFopwXl3m4swXRAi
   q0inHNS2ZTtI4P+Kox6JD2EltB0IfJBjSiPvX0hV+mkSq2J8hauFY5IZh
   9AkNosgPQs/6Bf4A8Zmv+z4jGuVwb7kWxfk641HPcSBrjIJt2hd9sbm7z
   6ULgdeQ45qMaD/v9kiedCMfolz/vpfB2hWcfCHM7dtQv/cN4t6ADC6Rnn
   gkCYKHeJHy18FVhTtOkzZ3RxFueYfGRAF4O80HpyCKh959C5+md8XskSx
   A==;
X-CSE-ConnectionGUID: 9knP0K8hSI+UOq9SLAt4aQ==
X-CSE-MsgGUID: rBrnqK8dS5agTqrDM0QE+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67707541"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67707541"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 12:28:24 -0800
X-CSE-ConnectionGUID: oFOVXM/7SDO6vFlHtuuj2g==
X-CSE-MsgGUID: O6SktobwSWWnc8+fYtmgzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197444695"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Dec 2025 12:28:16 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVFAr-000000000jF-3NSa;
	Mon, 15 Dec 2025 20:28:08 +0000
Date: Tue, 16 Dec 2025 04:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
	wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
	sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
	akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
	ankur.a.arora@oracle.com, segher@kernel.crashing.org,
	tglx@linutronix.de, thomas.weissschuh@linutronix.de,
	peterz@infradead.org, menglong8.dong@gmail.com,
	bigeasy@linutronix.de, namcao@linutronix.de, mingo@kernel.org,
	atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <202512160453.iO9WNjrm-lkp@intel.com>
References: <20251214130245.43664-9-mkchauras@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214130245.43664-9-mkchauras@linux.ibm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.19-rc1 next-20251215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya/powerpc-rename-arch_irq_disabled_regs/20251214-210813
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251214130245.43664-9-mkchauras%40linux.ibm.com
patch subject: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
config: powerpc-randconfig-001-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160453.iO9WNjrm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160453.iO9WNjrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160453.iO9WNjrm-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: init/main.o: in function `do_trace_event_raw_event_initcall_level':
   include/trace/events/initcall.h:10: undefined reference to `memcpy'
   powerpc-linux-ld: init/main.o: in function `repair_env_string':
   init/main.c:512: undefined reference to `memmove'
   powerpc-linux-ld: init/do_mounts.o: in function `do_mount_root':
   init/do_mounts.c:162: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `start_thread':
   arch/powerpc/kernel/process.c:1919: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `__set_breakpoint':
   arch/powerpc/kernel/process.c:880: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `arch_dup_task_struct':
   arch/powerpc/kernel/process.c:1724: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `copy_thread':
   arch/powerpc/kernel/process.c:1801: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/process.c:1812: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/signal.o: in function `do_signal':
   arch/powerpc/kernel/signal.c:247: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/time.o: in function `register_decrementer_clockevent':
>> arch/powerpc/kernel/time.c:834: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/time.o: in function `platform_device_register_resndata':
>> include/linux/platform_device.h:158: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/prom.o: in function `move_device_tree':
>> arch/powerpc/kernel/prom.c:134: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/setup-common.o: in function `probe_machine':
>> arch/powerpc/kernel/setup-common.c:646: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `user_regset_copyin':
>> include/linux/regset.h:276: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_write':
   include/linux/regset.h:42: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `gpr_get':
>> arch/powerpc/kernel/ptrace/ptrace-view.c:230: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_zero':
>> include/linux/regset.h:30: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `gpr32_get_common':
   arch/powerpc/kernel/ptrace/ptrace-view.c:707: undefined reference to `memcpy'
>> powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.c:708: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.c:710: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_zero':
>> include/linux/regset.h:30: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-novsx.o: in function `membuf_write':
   include/linux/regset.h:42: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/optprobes.o: in function `can_optimize':
>> arch/powerpc/kernel/optprobes.c:71: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_map_magic_page':
>> arch/powerpc/kernel/kvm.c:407: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_patch_ins_mtmsrd':
>> arch/powerpc/kernel/kvm.c:178: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_patch_ins_mtmsr':
   arch/powerpc/kernel/kvm.c:231: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `epapr_hypercall0_1':
>> arch/powerpc/include/asm/epapr_hcalls.h:511: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/mem.o: in function `execmem_arch_setup':
>> arch/powerpc/mm/mem.c:423: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_15':
>> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_14':
>> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_13':
>> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/init-common.o:arch/powerpc/mm/init-common.c:81: more undefined references to `memset' follow
   powerpc-linux-ld: arch/powerpc/lib/pmem.o: in function `memcpy_flushcache':
>> arch/powerpc/lib/pmem.c:84: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/sysdev/fsl_mpic_err.o: in function `mpic_setup_error_int':
>> arch/powerpc/sysdev/fsl_mpic_err.c:70: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/platforms/8xx/pic.o: in function `irq_domain_create_linear':
>> include/linux/irqdomain.h:405: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/platforms/8xx/cpm1.o: in function `cpm1_clk_setup':
   arch/powerpc/platforms/8xx/cpm1.c:251: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/platforms/8xx/cpm1-ic.o: in function `irq_domain_create_linear':
   include/linux/irqdomain.h:405: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `do_trace_event_raw_event_task_newtask':
   include/trace/events/task.h:9: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `do_trace_event_raw_event_task_rename':
   include/trace/events/task.h:34: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `copy_struct_from_user':
   include/linux/uaccess.h:396: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `copy_clone_args_from_user':
   kernel/fork.c:2800: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `mm_init':
   kernel/fork.c:1044: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `bitmap_zero':
   include/linux/bitmap.h:238: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `pgd_alloc':
   arch/powerpc/include/asm/nohash/pgalloc.h:26: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `__kmem_cache_create':
   include/linux/slab.h:379: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `arch_dup_task_struct':
   kernel/fork.c:854: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `mm_alloc':
   kernel/fork.c:1120: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `replace_mm_exe_file':
   kernel/fork.c:1238: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `copy_process':
   kernel/fork.c:2030: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `posix_cputimers_init':
   include/linux/posix-timers.h:103: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `copy_sighand':
   kernel/fork.c:1618: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `copy_signal':
   kernel/fork.c:1687: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `dup_mm':
   kernel/fork.c:1483: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `create_io_thread':
   kernel/fork.c:2549: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `kernel_thread':
   kernel/fork.c:2661: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `user_mode_thread':
   kernel/fork.c:2678: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `sys_fork':
   kernel/fork.c:2692: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `sys_vfork':
   kernel/fork.c:2707: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o:kernel/fork.c:2740: more undefined references to `memset' follow
   powerpc-linux-ld: kernel/softirq.o: in function `do_trace_event_raw_event_irq_handler_entry':
   include/trace/events/irq.h:53: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/resource.o: in function `find_next_iomem_res':
   kernel/resource.c:372: undefined reference to `memset'
   powerpc-linux-ld: kernel/resource.o: in function `__request_region_locked':
   kernel/resource.c:1261: undefined reference to `memset'
   powerpc-linux-ld: kernel/resource.o: in function `reserve_setup':
   kernel/resource.c:1757: undefined reference to `memset'
   powerpc-linux-ld: kernel/resource.c:1760: undefined reference to `memset'
   powerpc-linux-ld: kernel/sysctl.o: in function `proc_put_long':
   kernel/sysctl.c:339: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sysctl.o: in function `_proc_do_string':
   kernel/sysctl.c:127: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sysctl.o: in function `proc_get_long':
   kernel/sysctl.c:284: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sysctl.o: in function `bitmap_copy':
   include/linux/bitmap.h:259: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sysctl.o: in function `proc_do_static_key':
   kernel/sysctl.c:1433: undefined reference to `memset'
   powerpc-linux-ld: kernel/capability.o: in function `__do_sys_capset':
   kernel/capability.c:218: undefined reference to `memset'
   powerpc-linux-ld: kernel/ptrace.o: in function `syscall_set_arguments':
   arch/powerpc/include/asm/syscall.h:127: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/ptrace.o: in function `ptrace_get_syscall_info':
   kernel/ptrace.c:998: undefined reference to `memset'
   powerpc-linux-ld: kernel/ptrace.o: in function `copy_siginfo':
   include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/user.o: in function `ratelimit_state_init':
   include/linux/ratelimit.h:12: undefined reference to `memset'
   powerpc-linux-ld: kernel/user.o: in function `__kmem_cache_create':
   include/linux/slab.h:379: undefined reference to `memset'
   powerpc-linux-ld: kernel/signal.o: in function `do_trace_event_raw_event_signal_generate':
   include/trace/events/signal.h:50: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/signal.o: in function `clear_siginfo':
   include/linux/signal.h:23: undefined reference to `memset'
   powerpc-linux-ld: kernel/signal.o: in function `copy_siginfo':
   include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/signal.o: in function `do_sigaltstack':
   kernel/signal.c:4396: undefined reference to `memset'
   powerpc-linux-ld: kernel/signal.o: in function `copy_siginfo':
   include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/signal.o: in function `signals_init':
   kernel/signal.c:5011: undefined reference to `memset'
   powerpc-linux-ld: kernel/sys.o: in function `override_release':
   kernel/sys.c:1331: undefined reference to `memset'
   powerpc-linux-ld: kernel/sys.o: in function `__do_sys_newuname':
   kernel/sys.c:1356: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sys.o: in function `__do_sys_uname':
   kernel/sys.c:1380: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sys.o: in function `prctl_set_auxv':


vim +18 include/linux/signal.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  14  
ae7795bc6187a15 Eric W. Biederman 2018-09-25  15  static inline void copy_siginfo(kernel_siginfo_t *to,
ae7795bc6187a15 Eric W. Biederman 2018-09-25  16  				const kernel_siginfo_t *from)
ca9eb49aa9562ea James Hogan       2016-02-08  17  {
ca9eb49aa9562ea James Hogan       2016-02-08 @18  	memcpy(to, from, sizeof(*to));
ca9eb49aa9562ea James Hogan       2016-02-08  19  }
ca9eb49aa9562ea James Hogan       2016-02-08  20  
ae7795bc6187a15 Eric W. Biederman 2018-09-25  21  static inline void clear_siginfo(kernel_siginfo_t *info)
8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  22  {
8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24 @23  	memset(info, 0, sizeof(*info));
8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  24  }
8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  25  
4ce5f9c9e754691 Eric W. Biederman 2018-09-25  26  #define SI_EXPANSION_SIZE (sizeof(struct siginfo) - sizeof(struct kernel_siginfo))
4ce5f9c9e754691 Eric W. Biederman 2018-09-25  27  
fa4751f454e6b51 Eric W. Biederman 2020-05-05  28  static inline void copy_siginfo_to_external(siginfo_t *to,
fa4751f454e6b51 Eric W. Biederman 2020-05-05  29  					    const kernel_siginfo_t *from)
fa4751f454e6b51 Eric W. Biederman 2020-05-05  30  {
fa4751f454e6b51 Eric W. Biederman 2020-05-05 @31  	memcpy(to, from, sizeof(*from));
fa4751f454e6b51 Eric W. Biederman 2020-05-05 @32  	memset(((char *)to) + sizeof(struct kernel_siginfo), 0,
fa4751f454e6b51 Eric W. Biederman 2020-05-05  33  		SI_EXPANSION_SIZE);
fa4751f454e6b51 Eric W. Biederman 2020-05-05  34  }
fa4751f454e6b51 Eric W. Biederman 2020-05-05  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
