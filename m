Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398463B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 11:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693134550; x=1724670550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DaitM8GlIKFP0fVF8qT9vyCxeJen+yOmio2UGdkk9lo=;
  b=Y/zGOtA8mKWRhz9GpI33+X0sWEnlltFTopsgyqr1WWUdHm++bdZo6AS3
   i4SP83c0gaP5RpKLoPFo2dHhZJzDX3+IFxJ3KdtHS7DM0fDun5IiMKvnI
   St7qLN18onhWDL7Mc0y/PVpynP4Zhbfq4ITj+9OpeMxycppBrqb/Wzkbb
   lNDzMcGgWT99RrH1+0UrUtD3Zko0kTLqEsA5GKDW1TSMaW4GhZ+rUIsBS
   UAhw1xxUFxiP1pcK6Kom+oFxmVwAGyWY2lUy/hitfe8jm21dVZAaUeaSC
   FXWT63xsCkOrX0NM28SsMSSdGyFu1irlgy7EUEz2tgund7POBlwuAfHUZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="372336887"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="372336887"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 04:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="803403762"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="803403762"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Aug 2023 04:09:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaDdj-0005it-0s;
	Sun, 27 Aug 2023 11:09:07 +0000
Date: Sun, 27 Aug 2023 19:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 21/29] version.c:(.text+0x0): multiple definition of
 `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
Message-ID: <202308271944.LX2qC9SB-lkp@intel.com>
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
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20230827/202308271944.LX2qC9SB-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271944.LX2qC9SB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271944.LX2qC9SB-lkp@intel.com/

Note: the norov/aass HEAD ad585573c81bc132c3f64aae4eef20d68484abfb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arc-elf-ld: init/version.o: in function `bitmap_remap':
>> version.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: init/do_mounts.o: in function `bitmap_remap':
   do_mounts.c:(.text+0x4): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: init/noinitramfs.o: in function `bitmap_remap':
   noinitramfs.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: init/calibrate.o: in function `bitmap_remap':
   calibrate.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: init/init_task.o: in function `bitmap_remap':
   init_task.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/arcksyms.o: in function `bitmap_remap':
   arcksyms.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/setup.o: in function `bitmap_remap':
   setup.c:(.text+0x898): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/irq.o: in function `bitmap_remap':
   irq.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/reset.o: in function `bitmap_remap':
   reset.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/ptrace.o: in function `bitmap_remap':
   ptrace.c:(.text+0x1114): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/process.o: in function `bitmap_remap':
   process.c:(.text+0xcc): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/devtree.o: in function `bitmap_remap':
   devtree.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/signal.o: in function `bitmap_remap':
   signal.c:(.text+0x53c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/traps.o: in function `bitmap_remap':
   traps.c:(.text+0x60): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/sys.o: in function `bitmap_remap':
   sys.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/troubleshoot.o: in function `bitmap_remap':
   troubleshoot.c:(.text+0x21c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/stacktrace.o: in function `bitmap_remap':
   stacktrace.c:(.text+0xbc): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/disasm.o: in function `bitmap_remap':
   disasm.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/kernel/intc-arcv2.o: in function `bitmap_remap':
   intc-arcv2.c:(.text+0x88): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/mm/extable.o: in function `bitmap_remap':
   extable.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/mm/ioremap.o: in function `bitmap_remap':
   ioremap.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/mm/dma.o: in function `bitmap_remap':
   dma.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/mm/fault.o: in function `bitmap_remap':
   fault.c:(.text+0x30): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/mm/init.o: in function `bitmap_remap':
   init.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/mm/tlb.o: in function `bitmap_remap':
   tlb.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/mm/cache.o: in function `bitmap_remap':
   cache.c:(.text+0xc): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: arch/arc/mm/mmap.o: in function `bitmap_remap':
   mmap.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/fork.o: in function `bitmap_remap':
   fork.c:(.text+0x80c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/exec_domain.o: in function `bitmap_remap':
   exec_domain.c:(.text+0x14): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/panic.o: in function `bitmap_remap':
   panic.c:(.text+0xc0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/cpu.o: in function `bitmap_remap':
   cpu.c:(.text+0x1d4): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/exit.o: in function `bitmap_remap':
   exit.c:(.text+0x680): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/softirq.o: in function `bitmap_remap':
   softirq.c:(.text+0x14c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/resource.o: in function `bitmap_remap':
   resource.c:(.text+0x48c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/sysctl.o: in function `bitmap_remap':
   sysctl.c:(.text+0xeac): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/capability.o: in function `bitmap_remap':
   capability.c:(.text+0x4fc): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/ptrace.o: in function `bitmap_remap':
   ptrace.c:(.text+0x60c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/user.o: in function `bitmap_remap':
   user.c:(.text+0x8c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/signal.o: in function `bitmap_remap':
   signal.c:(.text+0xb9c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/sys.o: in function `bitmap_remap':
   sys.c:(.text+0x1088): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/umh.o: in function `bitmap_remap':
   umh.c:(.text+0x28c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/workqueue.o: in function `bitmap_remap':
   workqueue.c:(.text+0x32c8): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/pid.o: in function `bitmap_remap':
   pid.c:(.text+0xa4): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/task_work.o: in function `bitmap_remap':
   task_work.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/extable.o: in function `bitmap_remap':
   extable.c:(.text+0x0): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/params.o: in function `bitmap_remap':
   params.c:(.text+0x710): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/kthread.o: in function `bitmap_remap':
   kthread.c:(.text+0x604): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/nsproxy.o: in function `bitmap_remap':
   nsproxy.c:(.text+0x17c): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/notifier.o: in function `bitmap_remap':
   notifier.c:(.text+0x70): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/ksysfs.o: in function `bitmap_remap':
   ksysfs.c:(.text+0x78): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here
   arc-elf-ld: kernel/cred.o: in function `bitmap_remap':
   cred.c:(.text+0x74): multiple definition of `bitmap_remap'; init/main.o:main.c:(.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
