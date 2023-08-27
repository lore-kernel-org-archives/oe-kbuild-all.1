Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3BD4430
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693134490; x=1724670490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RZGBpGUi5a+25O1xZajinrRcHbh9khMEQIu3cg7L1TU=;
  b=IvebJz7J9Ebmt9bbWP2wMVCMcL0bl7BwXsgHZDlLaYII/lPRSnr7L+b3
   mvhmxgTeAYqJTzd0A+ErTQ8x7jgDmkbRdba0RXbpHVoOWKXhASNHsKutI
   nfp3GT5pI2aWgn+Il+wmKuMtpBSwIZjPdUsV9KNQQT4FrWcY+Mfumg2+c
   0JA6RuHZYhBhJPro4IloGaq5uGRzeAD+AOZDsapySpxg9Gk04lkaJxjHa
   fC+qzR3zJpWXB0VHu8cHzqH9GSf1WRZWtFm6qTDdQwFZzVZSBkPhgH2Xd
   YhpBgplXugMQiM6HjzViW7/O9r6HqzMpOoXK+9bPqo/EoQslQWl/D4IbH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="359927827"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="359927827"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 04:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="731531153"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="731531153"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Aug 2023 04:08:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaDcl-0005in-0f;
	Sun, 27 Aug 2023 11:08:07 +0000
Date: Sun, 27 Aug 2023 19:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 21/29] __pi_string.c:(.init.pi.text+0x30): multiple
 definition of `__pi_bitmap_remap';
 arch/riscv/kernel/pi/cmdline_early.pi.o:__pi_cmdline_early.c:(.init.pi.text+0x0):
 first defined here
Message-ID: <202308271945.o2UjNUzt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux aass
head:   ad585573c81bc132c3f64aae4eef20d68484abfb
commit: 7fb65ed43cfb3add68a884fd6722a6a1ad0f3ed8 [21/29] bitmap: add small_cont_nbits() optimization for bitmap_remap()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230827/202308271945.o2UjNUzt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271945.o2UjNUzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271945.o2UjNUzt-lkp@intel.com/

Note: the norov/aass HEAD ad585573c81bc132c3f64aae4eef20d68484abfb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   riscv64-linux-ld: init/version.o: in function `bitmap_remap':
   version.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: init/do_mounts.o: in function `bitmap_remap':
   do_mounts.c:(.text+0x8): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: init/noinitramfs.o: in function `bitmap_remap':
   noinitramfs.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: init/calibrate.o: in function `bitmap_remap':
   calibrate.c:(.text+0x1f8): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: init/init_task.o: in function `bitmap_remap':
   init_task.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/soc.o: in function `bitmap_remap':
   soc.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/alternative.o: in function `bitmap_remap':
   alternative.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `bitmap_remap':
   cpu.c:(.text+0x2e4): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `bitmap_remap':
   cpufeature.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `bitmap_remap':
   irq.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/process.o: in function `bitmap_remap':
   process.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/ptrace.o: in function `bitmap_remap':
   ptrace.c:(.text+0x8e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/reset.o: in function `bitmap_remap':
   reset.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `bitmap_remap':
   setup.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/signal.o: in function `bitmap_remap':
   signal.c:(.text+0x27e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/syscall_table.o: in function `bitmap_remap':
   syscall_table.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_riscv.o: in function `bitmap_remap':
   sys_riscv.c:(.text+0x2ce): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `bitmap_remap':
   time.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps.o: in function `bitmap_remap':
   traps.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/riscv_ksyms.o: in function `bitmap_remap':
   riscv_ksyms.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/stacktrace.o: in function `bitmap_remap':
   stacktrace.c:(.text+0x7e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cacheinfo.o: in function `bitmap_remap':
   cacheinfo.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/patch.o: in function `bitmap_remap':
   patch.c:(.text+0x2d2): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/vdso.o: in function `bitmap_remap':
   vdso.c:(.text+0x7c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/perf_regs.o: in function `bitmap_remap':
   perf_regs.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sbi.o: in function `bitmap_remap':
   sbi.c:(.text+0x292): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/efi.o: in function `bitmap_remap':
   efi.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/kernel/pi/string.pi.o: in function `__pi_bitmap_remap':
>> __pi_string.c:(.init.pi.text+0x30): multiple definition of `__pi_bitmap_remap'; arch/riscv/kernel/pi/cmdline_early.pi.o:__pi_cmdline_early.c:(.init.pi.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/mm/init.o: in function `bitmap_remap':
   init.c:(.text+0xc4): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/mm/extable.o: in function `bitmap_remap':
   extable.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/mm/fault.o: in function `bitmap_remap':
   fault.c:(.text+0x78): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/mm/pageattr.o: in function `bitmap_remap':
   pageattr.c:(.text+0x6a): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/mm/cacheflush.o: in function `bitmap_remap':
   cacheflush.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/mm/context.o: in function `bitmap_remap':
   context.c:(.text+0x168): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/mm/pgtable.o: in function `bitmap_remap':
   pgtable.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/mm/pmem.o: in function `bitmap_remap':
   pmem.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/fork.o: in function `bitmap_remap':
   fork.c:(.text+0xa6e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/exec_domain.o: in function `bitmap_remap':
   exec_domain.c:(.text+0x1c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/panic.o: in function `bitmap_remap':
   panic.c:(.text+0xc8): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/cpu.o: in function `bitmap_remap':
   cpu.c:(.text+0x136): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/exit.o: in function `bitmap_remap':
   exit.c:(.text+0x592): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/softirq.o: in function `bitmap_remap':
   softirq.c:(.text+0x12c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/resource.o: in function `bitmap_remap':
   resource.c:(.text+0x3e2): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/sysctl.o: in function `bitmap_remap':
   sysctl.c:(.text+0xe6e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/capability.o: in function `bitmap_remap':
   capability.c:(.text+0x3ca): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/ptrace.o: in function `bitmap_remap':
   ptrace.c:(.text+0x3a0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/user.o: in function `bitmap_remap':
   user.c:(.text+0x62): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/signal.o: in function `bitmap_remap':
   signal.c:(.text+0x636): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/sys.o: in function `bitmap_remap':
   sys.c:(.text+0xff0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/umh.o: in function `bitmap_remap':
   umh.c:(.text+0x2e4): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/workqueue.o: in function `bitmap_remap':
   workqueue.c:(.text+0x2cac): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/pid.o: in function `bitmap_remap':
   pid.c:(.text+0x76): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/task_work.o: in function `bitmap_remap':
   task_work.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/extable.o: in function `bitmap_remap':
   extable.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/params.o: in function `bitmap_remap':
   params.c:(.text+0x76c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/kthread.o: in function `bitmap_remap':
   kthread.c:(.text+0x440): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/nsproxy.o: in function `bitmap_remap':
   nsproxy.c:(.text+0x17c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/notifier.o: in function `bitmap_remap':
   notifier.c:(.text+0x4e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/ksysfs.o: in function `bitmap_remap':
   ksysfs.c:(.text+0xb4): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/cred.o: in function `bitmap_remap':
   cred.c:(.text+0x80): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/reboot.o: in function `bitmap_remap':
   reboot.c:(.text+0x180): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/async.o: in function `bitmap_remap':
   async.c:(.text+0x132): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/smpboot.o: in function `bitmap_remap':
   smpboot.c:(.text+0x226): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/ucount.o: in function `bitmap_remap':
   ucount.c:(.text+0x5e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/regset.o: in function `bitmap_remap':
   regset.c:(.text+0xd4): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/ksyms_common.o: in function `bitmap_remap':
   ksyms_common.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/groups.o: in function `bitmap_remap':
   groups.c:(.text+0x10): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/sched/core.o: in function `bitmap_remap':
   core.c:(.text+0xbc0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/sched/fair.o: in function `bitmap_remap':
   fair.c:(.text+0xcb6): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/sched/build_policy.o: in function `bitmap_remap':
   build_policy.c:(.text+0x1756): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/sched/build_utility.o: in function `bitmap_remap':
   build_utility.c:(.text+0x23c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/locking/mutex.o: in function `bitmap_remap':
   mutex.c:(.text+0x6c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/locking/semaphore.o: in function `bitmap_remap':
   semaphore.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/locking/rwsem.o: in function `bitmap_remap':
   rwsem.c:(.text+0x1d0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/locking/percpu-rwsem.o: in function `bitmap_remap':
   percpu-rwsem.c:(.text+0x1c0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/locking/rtmutex_api.o: in function `bitmap_remap':
   rtmutex_api.c:(.text+0xd8): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/power/qos.o: in function `bitmap_remap':
   qos.c:(.text+0x4e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: kernel/printk/printk.o: in function `bitmap_remap':
   printk.c:(.text+0xb58): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
--
   ff-core.c:(.text+0x18c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/input/touchscreen.o: in function `bitmap_remap':
   touchscreen.c:(.text+0x36): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/efi.o: in function `bitmap_remap':
   efi.c:(.text+0x16c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/vars.o: in function `bitmap_remap':
   vars.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/reboot.o: in function `bitmap_remap':
   reboot.c:(.text+0x1e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/memattr.o: in function `bitmap_remap':
   memattr.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/tpm.o: in function `bitmap_remap':
   tpm.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/memmap.o: in function `bitmap_remap':
   memmap.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/fdtparams.o: in function `bitmap_remap':
   fdtparams.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/esrt.o: in function `bitmap_remap':
   esrt.c:(.text+0x1da): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/runtime-wrappers.o: in function `bitmap_remap':
   runtime-wrappers.c:(.text+0xf5e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/efi-init.o: in function `bitmap_remap':
   efi-init.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/firmware/efi/riscv-runtime.o: in function `bitmap_remap':
   riscv-runtime.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/clocksource/timer-of.o: in function `bitmap_remap':
   timer-of.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/clocksource/timer-probe.o: in function `bitmap_remap':
   timer-probe.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/clocksource/timer-riscv.o: in function `bitmap_remap':
   timer-riscv.c:(.text+0x114): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/base.o: in function `bitmap_remap':
   base.c:(.text+0x274): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/cpu.o: in function `bitmap_remap':
   cpu.c:(.text+0x3a): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/device.o: in function `bitmap_remap':
   device.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/module.o: in function `bitmap_remap':
   module.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/platform.o: in function `bitmap_remap':
   platform.c:(.text+0x260): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/property.o: in function `bitmap_remap':
   property.c:(.text+0x13f6): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/kobj.o: in function `bitmap_remap':
   kobj.c:(.text+0xe0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/fdt.o: in function `bitmap_remap':
   fdt.c:(.text+0x6b8): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/fdt_address.o: in function `bitmap_remap':
   fdt_address.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/address.o: in function `bitmap_remap':
   address.c:(.text+0x870): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/irq.o: in function `bitmap_remap':
   irq.c:(.text+0x64): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: drivers/of/of_reserved_mem.o: in function `bitmap_remap':
   of_reserved_mem.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/argv_split.o: in function `bitmap_remap':
   argv_split.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/bug.o: in function `bitmap_remap':
   bug.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/dec_and_lock.o: in function `bitmap_remap':
   dec_and_lock.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/dump_stack.o: in function `bitmap_remap':
   dump_stack.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/extable.o: in function `bitmap_remap':
   extable.c:(.text+0x72): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/flex_proportions.o: in function `bitmap_remap':
   flex_proportions.c:(.text+0x7c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/idr.o: in function `bitmap_remap':
   idr.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/irq_regs.o: in function `bitmap_remap':
   irq_regs.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/is_single_threaded.o: in function `bitmap_remap':
   is_single_threaded.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/klist.o: in function `bitmap_remap':
   klist.c:(.text+0x118): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/kobject.o: in function `bitmap_remap':
   kobject.c:(.text+0x3c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/kobject_uevent.o: in function `bitmap_remap':
   kobject_uevent.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/logic_pio.o: in function `bitmap_remap':
   logic_pio.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/maple_tree.o: in function `bitmap_remap':
   maple_tree.c:(.text+0x8d2e): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/radix-tree.o: in function `bitmap_remap':
   radix-tree.c:(.text+0x722): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/ratelimit.o: in function `bitmap_remap':
   ratelimit.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/rbtree.o: in function `bitmap_remap':
   rbtree.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/string.o: in function `bitmap_remap':
   string.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/timerqueue.o: in function `bitmap_remap':
   timerqueue.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/vsprintf.o: in function `bitmap_remap':
   vsprintf.c:(.text+0x3ac2): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: lib/xarray.o: in function `bitmap_remap':
   xarray.c:(.text+0x656): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: arch/riscv/lib/delay.o: in function `bitmap_remap':
   delay.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/efi-stub.stub.o: in function `__efistub_bitmap_remap':
>> __efistub_efi-stub.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/fdt.stub.o: in function `__efistub_bitmap_remap':
   __efistub_fdt.c:(.init.text+0x414): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/gop.stub.o: in function `__efistub_bitmap_remap':
   __efistub_gop.c:(.init.text+0xa30): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/intrinsics.stub.o: in function `__efistub_bitmap_remap':
   __efistub_intrinsics.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/mem.stub.o: in function `__efistub_bitmap_remap':
   __efistub_mem.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/printk.stub.o: in function `__efistub_bitmap_remap':
   __efistub_printk.c:(.init.text+0x2a): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/random.stub.o: in function `__efistub_bitmap_remap':
   __efistub_random.c:(.init.text+0x1c): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/riscv-stub.stub.o: in function `__efistub_bitmap_remap':
   __efistub_riscv-stub.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/riscv.stub.o: in function `__efistub_bitmap_remap':
   __efistub_riscv.c:(.init.text+0x138): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/systable.stub.o: in function `__efistub_bitmap_remap':
   __efistub_systable.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/tpm.stub.o: in function `__efistub_bitmap_remap':
   __efistub_tpm.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/efi-stub-helper.stub.o: in function `__efistub_bitmap_remap':
   __efistub_efi-stub-helper.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/pci.stub.o: in function `__efistub_bitmap_remap':
   __efistub_pci.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here
   riscv64-linux-ld: ./drivers/firmware/efi/libstub/relocate.stub.o: in function `__efistub_bitmap_remap':
   __efistub_relocate.c:(.init.text+0x0): multiple definition of `__efistub_bitmap_remap'; ./drivers/firmware/efi/libstub/efi-stub-entry.stub.o:__efistub_efi-stub-entry.c:(.init.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
