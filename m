Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7B23A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 05:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678771098; x=1710307098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vox9Mv77m2khEuUaKszARld2blyI1/O70cPNAswv8CY=;
  b=ZirTZFeIBonxrFWcnrv5tu7jEt1tzYvhKucGpE6NG80BLGzlZaRB9nod
   eLPvmq7+cN/fykjzJapUiNF3Y7GsKNnFk1YdFelRslnj5fLc3s9apOwOQ
   4LeeWwKcR+6QKHSZJRbHnRNbwdxDDtUc1rfbY6VTDzkDvivnbgTKd2V/l
   6q/jl3HOfN7mmW6hAw0kNqjzRXqbr+PxeQtB7RYqZcqhhLMy4y+KD921V
   +BTyjcY0yqyvEqfSgG6QG7c3ClOJWAVOYAiC1IsySX07/jO1/bOd9p4rS
   zpI8T2zWtM/0sI7lRl6YemOMjdn8djwH12qkk9q/XimbT+ny/kqlXLwHg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423601839"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="423601839"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 22:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="656208829"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="656208829"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Mar 2023 22:18:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbx39-0006Yy-29;
	Tue, 14 Mar 2023 05:18:15 +0000
Date: Tue, 14 Mar 2023 13:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_6 1/12] (.text+0x11c): multiple definition
 of `bpf_uprobe_multi_link_attach'; csky-linux-ld: DWARF error: could not
 find abbrev number 123
Message-ID: <202303141310.fFk2Rcen-lkp@intel.com>
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
config: csky-randconfig-r002-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141310.fFk2Rcen-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=8dd01ea9b045f53b6b8625fde50a896de89e075d
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_6
        git checkout 8dd01ea9b045f53b6b8625fde50a896de89e075d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141310.fFk2Rcen-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 981994155
   init/do_mounts.o: in function `bpf_uprobe_multi_link_attach':
>> (.text+0x11c): multiple definition of `bpf_uprobe_multi_link_attach'; csky-linux-ld: DWARF error: could not find abbrev number 123
   init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 20
   init/do_mounts_initrd.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 1317637
   init/initramfs.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x3c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 56
   arch/csky/kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x4fc): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 8287
   arch/csky/kernel/syscall.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 93921127
   arch/csky/kernel/syscall_table.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 21
   arch/csky/kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x92c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 254125701
   arch/csky/mm/syscache.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 61
   kernel/fork.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2010): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 16
   kernel/exec_domain.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 44
   kernel/cpu.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1120): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 109
   kernel/exit.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x17d0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 87
   kernel/softirq.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0xb64): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 105
   kernel/sysctl.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 79
   kernel/capability.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x724): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 39
   kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0xc5c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 32
   kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1d70): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 3792
   kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2240): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 28
   kernel/umh.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x608): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 41
   kernel/workqueue.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x3c3c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 14744
   kernel/pid.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2b0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 488827
   kernel/nsproxy.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x674): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 39
   kernel/reboot.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x330): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 98
   kernel/groups.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x80): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 156424237
   kernel/sched/core.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x5b7c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 10742
   kernel/sched/fair.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1c28): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 90
   kernel/sched/build_policy.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x3818): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 11018
   kernel/sched/build_utility.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x14f4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 162009245
   kernel/locking/mutex.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1bb4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 100
   kernel/power/qos.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1c8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 168752136
   kernel/printk/printk.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x840): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 1728582
   kernel/rcu/update.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1b18): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 83
   kernel/rcu/tree.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x64c8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here
   csky-linux-ld: csky-linux-ld: DWARF error: could not find abbrev number 13910
   kernel/kcmp.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x564): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x85c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
