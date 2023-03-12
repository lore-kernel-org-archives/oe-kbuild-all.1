Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B6B139E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 04:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678593672; x=1710129672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1wo8r3UDwwaQJ21V1otaKF0NR1KMtSplAB1DnYUfAk=;
  b=S0Hw6Y3z4uCq+Vyu5Q6Q2gUiriJX/gVD/Hi3whJg+EY5aEpGFomRf8oz
   2jJ2oxKFikYDHtrbijx1V3f8eGb+PG6jN4B36r880vTI0Be3JS7V/dMSK
   lzYisy8TWUggTws9y+vDGx9HI/GpyKc1SuYpR45sy8PUIa/6qjyAyZpeT
   /6Gp79eurfItvsjm8D6LyB3pQid9MHyFB814vX9ZwJDJyXE3QxJ4pXwSE
   4wypXjWhTQ96VErhh5pAF6hEvEWxTcpknZuSOJ1U3JaCqP0SWX6foU4za
   IAtQfCgiJJREtpq3XI7YYIIeHAb20D/dUT4DymrSjYv1T3FunnjfvAHHh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="364616924"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="364616924"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 20:01:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="710725373"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="710725373"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Mar 2023 20:01:10 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbCtS-0004yD-0L;
	Sun, 12 Mar 2023 04:01:10 +0000
Date: Sun, 12 Mar 2023 12:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_4 1/10] do_mounts.c:(.text+0x456): multiple
 definition of `bpf_uprobe_multi_link_attach'; m68k-linux-ld: DWARF error:
 could not find abbrev number 35
Message-ID: <202303121159.ZFX7Vhvm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_4
head:   9d1680460291ce10458ce0adcd4859944fd7ada9
commit: aefd3dc75e104d9b49c8fe971eea78fabd70809e [1/10] bpf: Add multi uprobe link
config: m68k-buildonly-randconfig-r001-20230312 (https://download.01.org/0day-ci/archive/20230312/202303121159.ZFX7Vhvm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=aefd3dc75e104d9b49c8fe971eea78fabd70809e
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_4
        git checkout aefd3dc75e104d9b49c8fe971eea78fabd70809e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121159.ZFX7Vhvm-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 4
   init/do_mounts.o: in function `bpf_uprobe_multi_link_attach':
>> do_mounts.c:(.text+0x456): multiple definition of `bpf_uprobe_multi_link_attach'; m68k-linux-ld: DWARF error: could not find abbrev number 35
   init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 54
   init/do_mounts_initrd.o: in function `bpf_uprobe_multi_link_attach':
   do_mounts_initrd.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 8441
   init/initramfs.o: in function `bpf_uprobe_multi_link_attach':
   initramfs.c:(.text+0x66): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 27
   arch/m68k/kernel/process.o: in function `bpf_uprobe_multi_link_attach':
   process.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 106
   arch/m68k/kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   signal.c:(.text+0x424): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 12384
   arch/m68k/kernel/sys_m68k.o: in function `bpf_uprobe_multi_link_attach':
   sys_m68k.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 13724
   kernel/fork.o: in function `bpf_uprobe_multi_link_attach':
   fork.c:(.text+0xae0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 10674
   kernel/exec_domain.o: in function `bpf_uprobe_multi_link_attach':
   exec_domain.c:(.text+0x1a): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 117
   kernel/cpu.o: in function `bpf_uprobe_multi_link_attach':
   cpu.c:(.text+0x608): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 237118
   kernel/exit.o: in function `bpf_uprobe_multi_link_attach':
   exit.c:(.text+0x76e): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 27
   kernel/sysctl.o: in function `bpf_uprobe_multi_link_attach':
   sysctl.c:(.text+0x196a): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 10457
   kernel/capability.o: in function `bpf_uprobe_multi_link_attach':
   capability.c:(.text+0x5d4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 125
   kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   ptrace.c:(.text+0x320): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 83
   kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   signal.c:(.text+0xb98): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 123
   kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   sys.c:(.text+0x135a): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 118
   kernel/umh.o: in function `bpf_uprobe_multi_link_attach':
   umh.c:(.text+0x816): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 99
   kernel/pid.o: in function `bpf_uprobe_multi_link_attach':
   pid.c:(.text+0x44c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 77
   kernel/nsproxy.o: in function `bpf_uprobe_multi_link_attach':
   nsproxy.c:(.text+0x1c0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 62
   kernel/reboot.o: in function `bpf_uprobe_multi_link_attach':
   reboot.c:(.text+0x852): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 70
   kernel/kmod.o: in function `bpf_uprobe_multi_link_attach':
   kmod.c:(.text+0x35c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 3
   kernel/groups.o: in function `bpf_uprobe_multi_link_attach':
   groups.c:(.text+0x24a): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 2350674976
   kernel/sched/core.o: in function `bpf_uprobe_multi_link_attach':
   core.c:(.text+0x7f4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 92
   kernel/sched/fair.o: in function `bpf_uprobe_multi_link_attach':
   fair.c:(.text+0x1330): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 61
   kernel/sched/build_policy.o: in function `bpf_uprobe_multi_link_attach':
   build_policy.c:(.text+0x378c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 9923
   kernel/sched/build_utility.o: in function `bpf_uprobe_multi_link_attach':
   build_utility.c:(.text+0x3496): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 101
   kernel/power/qos.o: in function `bpf_uprobe_multi_link_attach':
   qos.c:(.text+0x150): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: kernel/power/main.o: in function `bpf_uprobe_multi_link_attach':
   main.c:(.text+0x6a): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 16915520
   kernel/printk/printk.o: in function `bpf_uprobe_multi_link_attach':
   printk.c:(.text+0x2854): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 65
   kernel/module/main.o: in function `bpf_uprobe_multi_link_attach':
   main.c:(.text+0xd52): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 53
   kernel/kcmp.o: in function `bpf_uprobe_multi_link_attach':
   kcmp.c:(.text+0x40c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 1550
   kernel/time/time.o: in function `bpf_uprobe_multi_link_attach':
   time.c:(.text+0x914): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 89
   kernel/time/timer.o: in function `bpf_uprobe_multi_link_attach':
   timer.c:(.text+0x1164): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 21
   kernel/time/hrtimer.o: in function `bpf_uprobe_multi_link_attach':
   hrtimer.c:(.text+0xe52): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 42
   kernel/time/posix-timers.o: in function `bpf_uprobe_multi_link_attach':
   posix-timers.c:(.text+0xed4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1c2): first defined here
   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 75

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
