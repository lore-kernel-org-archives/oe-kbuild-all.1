Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7216FDF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 15:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679672008; x=1711208008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xZ3gDAf96b7+decaSkyJwaDOlRobIgsOEYrBMJpSfME=;
  b=VThs/Xjx3y2RqixsAGJrtV/q+qTpCpNFD+5SNduKJwaGNliOiqisiR4e
   I7s/k4i0s1U930ZE8P/1AOJhILqOSEeynCkB4W2hCf20HQvyYfVMivHuo
   tTqK1x7eLOFOa0JDrUIBuG10fBr6VNgdoep41j0Sm5Twylo39MD7jL88O
   t0ZV3STYIMaO62NMIjuvHY4BlfphSIZVEzNVENflbVLF8ZQVioNFbLEWi
   UPzh61WiKNI3IkCrr3jOKlI93u+mUjSswDeuZqqVCAd15MA9xdzds7FLa
   Hpl9jz93HBvKcW4rCWqKXRmcv36I9XyE1sZrLwREjhA9SfJT62lFtg13H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="367541020"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="367541020"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 08:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="856897694"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="856897694"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Mar 2023 08:33:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfjPs-000FQS-0w;
	Fri, 24 Mar 2023 15:33:20 +0000
Date: Fri, 24 Mar 2023 23:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/12] do_mounts.c:(.text+0x1b): multiple
 definition of `bpf_uprobe_multi_link_attach';
 init/main.o:main.c:(.text+0x32): first defined here
Message-ID: <202303242323.EFs8MFjr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   15b74bd6fc8b0e3e7f0ed0dae0505d371fe8ddcd
commit: 21f85abbdf8ad8b7665ef27d411ffee672dd34ae [1/12] bpf: Add multi uprobe link
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230324/202303242323.EFs8MFjr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=21f85abbdf8ad8b7665ef27d411ffee672dd34ae
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout 21f85abbdf8ad8b7665ef27d411ffee672dd34ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242323.EFs8MFjr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: init/do_mounts.o: in function `bpf_uprobe_multi_link_attach':
>> do_mounts.c:(.text+0x1b): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: init/noinitramfs.o: in function `bpf_uprobe_multi_link_attach':
   noinitramfs.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/entry/syscall_32.o: in function `bpf_uprobe_multi_link_attach':
   syscall_32.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/entry/common.o: in function `bpf_uprobe_multi_link_attach':
   common.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/entry/vdso/extable.o: in function `bpf_uprobe_multi_link_attach':
   extable.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/process_32.o: in function `bpf_uprobe_multi_link_attach':
   process_32.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   signal.c:(.text+0x38): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/signal_32.o: in function `bpf_uprobe_multi_link_attach':
   signal_32.c:(.text+0xf2): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/traps.o: in function `bpf_uprobe_multi_link_attach':
   traps.c:(.text+0x2ce): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/idt.o: in function `bpf_uprobe_multi_link_attach':
   idt.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/irq.o: in function `bpf_uprobe_multi_link_attach':
   irq.c:(.text+0x4f): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/ioport.o: in function `bpf_uprobe_multi_link_attach':
   ioport.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/nmi.o: in function `bpf_uprobe_multi_link_attach':
   nmi.c:(.text+0x74): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/irqinit.o: in function `bpf_uprobe_multi_link_attach':
   irqinit.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/irq_work.o: in function `bpf_uprobe_multi_link_attach':
   irq_work.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/sys_ia32.o: in function `bpf_uprobe_multi_link_attach':
   sys_ia32.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/process.o: in function `bpf_uprobe_multi_link_attach':
   process.c:(.text+0xdb): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/fpu/core.o: in function `bpf_uprobe_multi_link_attach':
   core.c:(.text+0x85): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   ptrace.c:(.text+0x5db): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/tls.o: in function `bpf_uprobe_multi_link_attach':
   tls.c:(.text+0x26f): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/cpu/common.o: in function `bpf_uprobe_multi_link_attach':
   common.c:(.text+0x1ff): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/cpu/intel.o: in function `bpf_uprobe_multi_link_attach':
   intel.c:(.text+0xa7c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/doublefault_32.o: in function `bpf_uprobe_multi_link_attach':
   doublefault_32.c:(.text+0x4c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/mm/fault.o: in function `bpf_uprobe_multi_link_attach':
   fault.c:(.text+0x8ce): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/mm/extable.o: in function `bpf_uprobe_multi_link_attach':
   extable.c:(.text+0xc7): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/fork.o: in function `bpf_uprobe_multi_link_attach':
   fork.c:(.text+0x5bb): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/exec_domain.o: in function `bpf_uprobe_multi_link_attach':
   exec_domain.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/cpu.o: in function `bpf_uprobe_multi_link_attach':
   cpu.c:(.text+0x161): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/exit.o: in function `bpf_uprobe_multi_link_attach':
   exit.c:(.text+0x4b9): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/sysctl.o: in function `bpf_uprobe_multi_link_attach':
   sysctl.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/capability.o: in function `bpf_uprobe_multi_link_attach':
   capability.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   ptrace.c:(.text+0x2c3): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   signal.c:(.text+0x532): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   sys.c:(.text+0xb56): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/umh.o: in function `bpf_uprobe_multi_link_attach':
   umh.c:(.text+0x240): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/pid.o: in function `bpf_uprobe_multi_link_attach':
   pid.c:(.text+0x67): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/nsproxy.o: in function `bpf_uprobe_multi_link_attach':
   nsproxy.c:(.text+0x15e): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/reboot.o: in function `bpf_uprobe_multi_link_attach':
   reboot.c:(.text+0xc2): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/sched/core.o: in function `bpf_uprobe_multi_link_attach':
   core.c:(.text+0x308): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/sched/fair.o: in function `bpf_uprobe_multi_link_attach':
   fair.c:(.text+0x910): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/sched/build_policy.o: in function `bpf_uprobe_multi_link_attach':
   build_policy.c:(.text+0xfb1): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/sched/build_utility.o: in function `bpf_uprobe_multi_link_attach':
   build_utility.c:(.text+0x28f): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/power/qos.o: in function `bpf_uprobe_multi_link_attach':
   qos.c:(.text+0x7a): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/printk/printk.o: in function `bpf_uprobe_multi_link_attach':
   printk.c:(.text+0x22f): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/entry/common.o: in function `bpf_uprobe_multi_link_attach':
   common.c:(.text+0xcb): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/time/time.o: in function `bpf_uprobe_multi_link_attach':
   time.c:(.text+0x9b): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/time/timer.o: in function `bpf_uprobe_multi_link_attach':
   timer.c:(.text+0x610): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/time/hrtimer.o: in function `bpf_uprobe_multi_link_attach':
   hrtimer.c:(.text+0x522): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/time/posix-stubs.o: in function `bpf_uprobe_multi_link_attach':
   posix-stubs.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/time/tick-common.o: in function `bpf_uprobe_multi_link_attach':
   tick-common.c:(.text+0x93): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/events/core.o: in function `bpf_uprobe_multi_link_attach':
   core.c:(.text+0x405b): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x32): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
