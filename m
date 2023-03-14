Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74123A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 05:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678771766; x=1710307766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CaR4OlxBUd2jkf//MHgog5qtngRBarc1nMxJ5Cp9dh8=;
  b=PcVBjKJInpnyhhhWkU7xcT/QVjGXo+blDcahSNcoT9ycGqk9pzBuZmSR
   YmCXrnkfqOp/V+cTgmA0PmG77dsOhfWIZEeACWb+4cuwO/V+I9B4UFqms
   vOLg7OeWhcK6wodmjH+adx5LaGbSh+z+EMXyqfCnajtn2vcQOhRxAXxbr
   FdF7JitPO6cLhen25U7C0UbEykMWuQhj50/OhLn7/PscqbSFw2Ka5IOgR
   XsMkwhfzhe58k2/L0N3OOesYqF8g/f1rEMWRnliYm5Aa2ioCcHH7lcadf
   G9MHcWBqs/94+hQF1QSjZdgopfucNk9nbvhv/3FFtWN3g2NAbFS8W9hsc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317721641"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="317721641"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 22:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789201871"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="789201871"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2023 22:29:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbxDn-0006ZM-35;
	Tue, 14 Mar 2023 05:29:15 +0000
Date: Tue, 14 Mar 2023 13:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_6 1/12] do_mounts.c:(.text+0x4d0): multiple
 definition of `bpf_uprobe_multi_link_attach'; nios2-linux-ld: DWARF error:
 could not find abbrev number 115
Message-ID: <202303141310.5eDP37o3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_6
head:   3f2899fc03dd194fc538daca944ed9560d265fb3
commit: 8dd01ea9b045f53b6b8625fde50a896de89e075d [1/12] bpf: Add multi uprobe link
config: nios2-buildonly-randconfig-r003-20230312 (https://download.01.org/0day-ci/archive/20230314/202303141310.5eDP37o3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=8dd01ea9b045f53b6b8625fde50a896de89e075d
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_6
        git checkout 8dd01ea9b045f53b6b8625fde50a896de89e075d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141310.5eDP37o3-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 45
   init/do_mounts.o: in function `bpf_uprobe_multi_link_attach':
>> do_mounts.c:(.text+0x4d0): multiple definition of `bpf_uprobe_multi_link_attach'; nios2-linux-ld: DWARF error: could not find abbrev number 115
   init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 10137
   init/do_mounts_initrd.o: in function `bpf_uprobe_multi_link_attach':
   do_mounts_initrd.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 1281
   init/initramfs.o: in function `bpf_uprobe_multi_link_attach':
   initramfs.c:(.text+0xb8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 138035030
   arch/nios2/kernel/sys_nios2.o: in function `bpf_uprobe_multi_link_attach':
   sys_nios2.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 91228
   arch/nios2/kernel/syscall_table.o: in function `bpf_uprobe_multi_link_attach':
   syscall_table.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 26
   kernel/fork.o: in function `bpf_uprobe_multi_link_attach':
   fork.c:(.text+0xd80): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 1531421
   kernel/exec_domain.o: in function `bpf_uprobe_multi_link_attach':
   exec_domain.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 960641327
   kernel/cpu.o: in function `bpf_uprobe_multi_link_attach':
   cpu.c:(.text+0x7c8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 6309
   kernel/exit.o: in function `bpf_uprobe_multi_link_attach':
   exit.c:(.text+0xaac): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 122110742
   kernel/sysctl.o: in function `bpf_uprobe_multi_link_attach':
   sysctl.c:(.text+0x60): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 15289
   kernel/capability.o: in function `bpf_uprobe_multi_link_attach':
   capability.c:(.text+0x708): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 54
   kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   ptrace.c:(.text+0x6c8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 12155
   kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   signal.c:(.text+0x11c8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 76
   kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   sys.c:(.text+0x14d0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 118
   kernel/umh.o: in function `bpf_uprobe_multi_link_attach':
   umh.c:(.text+0x9b8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 9950
   kernel/pid.o: in function `bpf_uprobe_multi_link_attach':
   pid.c:(.text+0x4e8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 56
   kernel/nsproxy.o: in function `bpf_uprobe_multi_link_attach':
   nsproxy.c:(.text+0x3f4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 33
   kernel/reboot.o: in function `bpf_uprobe_multi_link_attach':
   reboot.c:(.text+0x9ec): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 103
   kernel/kmod.o: in function `bpf_uprobe_multi_link_attach':
   kmod.c:(.text+0x450): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 117
   kernel/groups.o: in function `bpf_uprobe_multi_link_attach':
   groups.c:(.text+0x268): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 10
   kernel/sched/core.o: in function `bpf_uprobe_multi_link_attach':
   core.c:(.text+0x16cc): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 6745
   kernel/sched/fair.o: in function `bpf_uprobe_multi_link_attach':
   fair.c:(.text+0x19b0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 13484
   kernel/sched/build_policy.o: in function `bpf_uprobe_multi_link_attach':
   build_policy.c:(.text+0x2f0c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 79890666
   kernel/sched/build_utility.o: in function `bpf_uprobe_multi_link_attach':
   build_utility.c:(.text+0x1a38): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 1748109740
   kernel/power/qos.o: in function `bpf_uprobe_multi_link_attach':
   qos.c:(.text+0x2b4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 8968
   kernel/power/process.o: in function `bpf_uprobe_multi_link_attach':
   process.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 1176136209
   kernel/printk/printk.o: in function `bpf_uprobe_multi_link_attach':
   printk.c:(.text+0x3010): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 59
   kernel/module/main.o: in function `bpf_uprobe_multi_link_attach':
   main.c:(.text+0x1188): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 115
   kernel/kcmp.o: in function `bpf_uprobe_multi_link_attach':
   kcmp.c:(.text+0x3c4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 11591
   kernel/freezer.o: in function `bpf_uprobe_multi_link_attach':
   freezer.c:(.text+0x400): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 15844
   kernel/time/time.o: in function `bpf_uprobe_multi_link_attach':
   time.c:(.text+0xb64): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 111829043
   kernel/time/timer.o: in function `bpf_uprobe_multi_link_attach':
   timer.c:(.text+0x1490): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 4073677985
   kernel/time/hrtimer.o: in function `bpf_uprobe_multi_link_attach':
   hrtimer.c:(.text+0x14d4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 128530858
   kernel/time/posix-timers.o: in function `bpf_uprobe_multi_link_attach':
   posix-timers.c:(.text+0x1548): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x1b4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
