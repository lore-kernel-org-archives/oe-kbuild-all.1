Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036197B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 04:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678509702; x=1710045702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGIfsOvi6rhZzn24loMfNzMni7uqjpMcX3DTg3GG7ho=;
  b=Sp1oEL4qxpg2quuI25X5BeZIGXtqIjkPhKRlwADX230GkYY6fASG3RZf
   Wo9hmIMW7t6vCaz955YxkLNTHDnxKQqag6jSSz5T2VSGm+o3h/O/6GnIu
   Lh+25ojQjajEv3btf+ym+BcpKDN6ipO8wqXzBZ2LLADKWh72GvxraMRHd
   7plWLlGqI7eENlX36+NBckOuL7QmVDqdfQT5nuqISu0SIrdrscKmIWM0Z
   RWMdqN9Od/2NuWYblllemV7JEUhE09XWkONcaGvpoarxCKZ9DI//T0CHJ
   a5bwXHlAiiaBGe8NmwrfNyPclR4mzMfik1s3jrIShzXSRtnpRGf+wjDFK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="316522265"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="316522265"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 20:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="680435842"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="680435842"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Mar 2023 20:41:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1par35-0004Kf-2p;
	Sat, 11 Mar 2023 04:41:39 +0000
Date: Sat, 11 Mar 2023 12:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_3 5/11] do_mounts.c:(.text+0x400): multiple
 definition of `bpf_uprobe_multi_link_attach'; arc-elf-ld: DWARF error: could
 not find abbrev number 48
Message-ID: <202303111248.gEbOdF3S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_3
head:   e4e32b8d0e93fb058e99e0bb197f155b3b71cf26
commit: d7c8fc41fafecf762d8e6fd76a8363d24051f8af [5/11] bpf: Add multi uprobe link
config: arc-randconfig-r006-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111248.gEbOdF3S-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=d7c8fc41fafecf762d8e6fd76a8363d24051f8af
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_3
        git checkout d7c8fc41fafecf762d8e6fd76a8363d24051f8af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111248.gEbOdF3S-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 1870179
   init/do_mounts.o: in function `bpf_uprobe_multi_link_attach':
>> do_mounts.c:(.text+0x400): multiple definition of `bpf_uprobe_multi_link_attach'; arc-elf-ld: DWARF error: could not find abbrev number 48
   init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 73
   init/noinitramfs.o: in function `bpf_uprobe_multi_link_attach':
   noinitramfs.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 72
   arch/arc/kernel/process.o: in function `bpf_uprobe_multi_link_attach':
   process.c:(.text+0x80): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 69
   arch/arc/kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   signal.c:(.text+0x5c0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 40
   arch/arc/kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   sys.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 113460261
   arch/arc/mm/cache.o: in function `bpf_uprobe_multi_link_attach':
   cache.c:(.text+0x280): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 14365
   kernel/fork.o: in function `bpf_uprobe_multi_link_attach':
   fork.c:(.text+0xf40): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 8499
   kernel/exec_domain.o: in function `bpf_uprobe_multi_link_attach':
   exec_domain.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 70
   kernel/cpu.o: in function `bpf_uprobe_multi_link_attach':
   cpu.c:(.text+0x5c0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 20
   kernel/exit.o: in function `bpf_uprobe_multi_link_attach':
   exit.c:(.text+0xac0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 12774
   kernel/sysctl.o: in function `bpf_uprobe_multi_link_attach':
   sysctl.c:(.text+0x300): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 107
   kernel/capability.o: in function `bpf_uprobe_multi_link_attach':
   capability.c:(.text+0xc0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 52
   kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   ptrace.c:(.text+0x640): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 176528215
   kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   signal.c:(.text+0xc80): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 21208928
   kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   sys.c:(.text+0x1280): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 153328858
   kernel/umh.o: in function `bpf_uprobe_multi_link_attach':
   umh.c:(.text+0x840): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 4329
   kernel/pid.o: in function `bpf_uprobe_multi_link_attach':
   pid.c:(.text+0x640): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 74
   kernel/nsproxy.o: in function `bpf_uprobe_multi_link_attach':
   nsproxy.c:(.text+0x200): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 2560
   kernel/reboot.o: in function `bpf_uprobe_multi_link_attach':
   reboot.c:(.text+0xac0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: kernel/kmod.o: in function `bpf_uprobe_multi_link_attach':
   kmod.c:(.text+0x380): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 78
   kernel/sched/core.o: in function `bpf_uprobe_multi_link_attach':
   core.c:(.text+0x1bc0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 72
   kernel/sched/fair.o: in function `bpf_uprobe_multi_link_attach':
   fair.c:(.text+0x1080): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 92
   kernel/sched/build_policy.o: in function `bpf_uprobe_multi_link_attach':
   build_policy.c:(.text+0x3880): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 85
   kernel/sched/build_utility.o: in function `bpf_uprobe_multi_link_attach':
   build_utility.c:(.text+0x34c0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 3956139004
   kernel/power/qos.o: in function `bpf_uprobe_multi_link_attach':
   qos.c:(.text+0x80): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 93
   kernel/power/main.o: in function `bpf_uprobe_multi_link_attach':
   main.c:(.text+0xc0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 90
   kernel/printk/printk.o: in function `bpf_uprobe_multi_link_attach':
   printk.c:(.text+0x2f40): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 5
   kernel/module/main.o: in function `bpf_uprobe_multi_link_attach':
   main.c:(.text+0xf80): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 1999490
   kernel/kcmp.o: in function `bpf_uprobe_multi_link_attach':
   kcmp.c:(.text+0x400): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 2613
   kernel/time/time.o: in function `bpf_uprobe_multi_link_attach':
   time.c:(.text+0xd40): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 3207
   kernel/time/timer.o: in function `bpf_uprobe_multi_link_attach':
   timer.c:(.text+0x10c0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 21
   kernel/time/hrtimer.o: in function `bpf_uprobe_multi_link_attach':
   hrtimer.c:(.text+0x1040): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 75
   kernel/time/posix-timers.o: in function `bpf_uprobe_multi_link_attach':
   posix-timers.c:(.text+0x1380): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 13069
   kernel/time/posix-clock.o: in function `bpf_uprobe_multi_link_attach':
   posix-clock.c:(.text+0x600): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x280): first defined here
   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 4637

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
