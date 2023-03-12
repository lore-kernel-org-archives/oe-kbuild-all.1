Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB01877
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678606638; x=1710142638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGWtWTIe3ngQqjon6petE7na8ggWKGvbF8i5/e0sPr4=;
  b=ZP1t1a9zIbKO9lLqPpwboTWD5Xj+qOqt/hfsk2/jdR1OhHc2G1m9XVdK
   qaasNCc8DUM+czKuaZqKun7FFQkqwFFtxL2vQfz9djdhkBXorK+48aQVp
   VOIRcdEs86h07dXu1jW0HEVUX7mU25S+GyQ0Y2tjsKMiHFHA+WrNWBYir
   Xa5JPZ7+Ya/UEsAkYW9SLl2+KZ/1dbqWkoJTivhVcdq1NN4xjmiR640eo
   FhtGJIXvIyfvC85TvVVHe3jGv2gB0WEKCBE0bRNQzcR3AAQLqCav7E8iT
   /nHgHi0X50HakaVZgUjWqU/vOwtKkwwgFve3JueWehugKWPrKtP2nGuFM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="325324962"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="325324962"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 23:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="802085383"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="802085383"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Mar 2023 23:37:16 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbGGZ-00056r-2Q;
	Sun, 12 Mar 2023 07:37:15 +0000
Date: Sun, 12 Mar 2023 15:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_4 1/10] do_mounts.c:(.text+0xc8): multiple
 definition of `bpf_uprobe_multi_link_attach';
 init/main.o:main.c:(.text+0x6c4): first defined here
Message-ID: <202303121532.fqZDpXB8-lkp@intel.com>
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
config: openrisc-randconfig-r032-20230312 (https://download.01.org/0day-ci/archive/20230312/202303121532.fqZDpXB8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=aefd3dc75e104d9b49c8fe971eea78fabd70809e
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_4
        git checkout aefd3dc75e104d9b49c8fe971eea78fabd70809e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121532.fqZDpXB8-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: init/do_mounts.o: in function `bpf_uprobe_multi_link_attach':
>> do_mounts.c:(.text+0xc8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: init/do_mounts_initrd.o: in function `bpf_uprobe_multi_link_attach':
   do_mounts_initrd.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: init/initramfs.o: in function `bpf_uprobe_multi_link_attach':
   initramfs.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o: in function `bpf_uprobe_multi_link_attach':
   sys_call_table.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/fork.o: in function `bpf_uprobe_multi_link_attach':
   fork.c:(.text+0x18c8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/exec_domain.o: in function `bpf_uprobe_multi_link_attach':
   exec_domain.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/cpu.o: in function `bpf_uprobe_multi_link_attach':
   cpu.c:(.text+0x122c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/exit.o: in function `bpf_uprobe_multi_link_attach':
   exit.c:(.text+0x14cc): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/softirq.o: in function `bpf_uprobe_multi_link_attach':
   softirq.c:(.text+0xb14): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/sysctl.o: in function `bpf_uprobe_multi_link_attach':
   sysctl.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/capability.o: in function `bpf_uprobe_multi_link_attach':
   capability.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   ptrace.c:(.text+0x814): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   signal.c:(.text+0x19e0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   sys.c:(.text+0x1f74): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/umh.o: in function `bpf_uprobe_multi_link_attach':
   umh.c:(.text+0x4c0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/workqueue.o: in function `bpf_uprobe_multi_link_attach':
   workqueue.c:(.text+0x57b8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/pid.o: in function `bpf_uprobe_multi_link_attach':
   pid.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/nsproxy.o: in function `bpf_uprobe_multi_link_attach':
   nsproxy.c:(.text+0x424): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/reboot.o: in function `bpf_uprobe_multi_link_attach':
   reboot.c:(.text+0x2c0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/sched/core.o: in function `bpf_uprobe_multi_link_attach':
   core.c:(.text+0x4aec): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/sched/fair.o: in function `bpf_uprobe_multi_link_attach':
   fair.c:(.text+0x3748): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/sched/build_policy.o: in function `bpf_uprobe_multi_link_attach':
   build_policy.c:(.text+0x70f4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/sched/build_utility.o: in function `bpf_uprobe_multi_link_attach':
   build_utility.c:(.text+0x1678): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/locking/mutex.o: in function `bpf_uprobe_multi_link_attach':
   mutex.c:(.text+0x1b64): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/power/qos.o: in function `bpf_uprobe_multi_link_attach':
   qos.c:(.text+0xd0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/printk/printk.o: in function `bpf_uprobe_multi_link_attach':
   printk.c:(.text+0xad8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/rcu/update.o: in function `bpf_uprobe_multi_link_attach':
   update.c:(.text+0x930): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/kcmp.o: in function `bpf_uprobe_multi_link_attach':
   kcmp.c:(.text+0x734): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/time/time.o: in function `bpf_uprobe_multi_link_attach':
   time.c:(.text+0x4b8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/time/timer.o: in function `bpf_uprobe_multi_link_attach':
   timer.c:(.text+0x341c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/time/hrtimer.o: in function `bpf_uprobe_multi_link_attach':
   hrtimer.c:(.text+0x16dc): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/time/alarmtimer.o: in function `bpf_uprobe_multi_link_attach':
   alarmtimer.c:(.text+0x15bc): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/time/posix-timers.o: in function `bpf_uprobe_multi_link_attach':
   posix-timers.c:(.text+0x22f8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/time/posix-clock.o: in function `bpf_uprobe_multi_link_attach':
   posix-clock.c:(.text+0x6d0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/time/itimer.o: in function `bpf_uprobe_multi_link_attach':
   itimer.c:(.text+0xd18): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/time/tick-common.o: in function `bpf_uprobe_multi_link_attach':
   tick-common.c:(.text+0x1c8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/futex/syscalls.o: in function `bpf_uprobe_multi_link_attach':
   syscalls.c:(.text+0x284): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/cgroup/cgroup.o: in function `bpf_uprobe_multi_link_attach':
   cgroup.c:(.text+0x71b8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/ring_buffer.o: in function `bpf_uprobe_multi_link_attach':
   ring_buffer.c:(.text+0x4d60): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace.o: in function `bpf_uprobe_multi_link_attach':
   trace.c:(.text+0x5f04): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_output.o: in function `bpf_uprobe_multi_link_attach':
   trace_output.c:(.text+0x1fe8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_stat.o: in function `bpf_uprobe_multi_link_attach':
   trace_stat.c:(.text+0x534): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_printk.o: in function `bpf_uprobe_multi_link_attach':
   trace_printk.c:(.text+0x2f8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/pid_list.o: in function `bpf_uprobe_multi_link_attach':
   pid_list.c:(.text+0x628): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/synth_event_gen_test.o: in function `bpf_uprobe_multi_link_attach':
   synth_event_gen_test.c:(.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_sched_switch.o: in function `bpf_uprobe_multi_link_attach':
   trace_sched_switch.c:(.text+0x228): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_preemptirq.o: in function `bpf_uprobe_multi_link_attach':
   trace_preemptirq.c:(.text+0x6e0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_hwlat.o: in function `bpf_uprobe_multi_link_attach':
   trace_hwlat.c:(.text+0x1504): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_osnoise.o: in function `bpf_uprobe_multi_link_attach':
   trace_osnoise.c:(.text+0x4a98): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_nop.o: in function `bpf_uprobe_multi_link_attach':
   trace_nop.c:(.text+0x78): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here
   or1k-linux-ld: kernel/trace/trace_branch.o: in function `bpf_uprobe_multi_link_attach':
   trace_branch.c:(.text+0x404): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:main.c:(.text+0x6c4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
