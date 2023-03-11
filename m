Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6527F7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 04:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678507245; x=1710043245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjdEiJkZXsWyH/rqVEWgDi9cW9FlBOVzKv7U5HbnVak=;
  b=KHEGayfH7ipJ1RYaEjYWUBa01SJ48Mnknh/N3iq4286YBirPjPkAolfC
   DG3gVt0yiS8cStc1tZZsdtGYHyZWYhpxUHxs7AHpMNDyK5lt9Ho9VEnTB
   +bvRWxkhb9GQ8jAOnRDHJZlc5UL81h+qCXUzLNdnZmP4KHu8HbOy887iZ
   UGMrHUyi45v7qu11+aQRtVY3SqNUPmQz4oIwxv1K/PVYSAMr/vllQu1Lq
   gxZ4b9j5aOf2Q0Q/uwUc5Apl/bTRylcgG+/gqgYeyfsWGc9LRlt3Yy22i
   tz8eEcd6wv6zQ2rl8GpGcri0uRM4uyXSB9WHBA/2zLv1o9VwpbatxrGBY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423141696"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="423141696"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 20:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="628053092"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="628053092"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 20:00:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paqPP-0004K1-1W;
	Sat, 11 Mar 2023 04:00:39 +0000
Date: Sat, 11 Mar 2023 12:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_3 5/11] (.text+0x1a8): multiple definition
 of `bpf_uprobe_multi_link_attach'; microblaze-linux-ld: DWARF error: could
 not find abbrev number 3896
Message-ID: <202303111104.3I6HYgwF-lkp@intel.com>
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
config: microblaze-randconfig-r004-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111104.3I6HYgwF-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=d7c8fc41fafecf762d8e6fd76a8363d24051f8af
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_3
        git checkout d7c8fc41fafecf762d8e6fd76a8363d24051f8af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111104.3I6HYgwF-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 982297937
   init/do_mounts.o: in function `bpf_uprobe_multi_link_attach':
>> (.text+0x1a8): multiple definition of `bpf_uprobe_multi_link_attach'; microblaze-linux-ld: DWARF error: could not find abbrev number 3896
   init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 86
   init/do_mounts_initrd.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 62
   init/initramfs.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 15698
   arch/microblaze/kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0xef4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 54
   arch/microblaze/kernel/sys_microblaze.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 5658
   kernel/fork.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1b78): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 108
   kernel/exec_domain.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 34
   kernel/cpu.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1290): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 104
   kernel/exit.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x200c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 751
   kernel/softirq.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0xb54): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 7548
   kernel/sysctl.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 17
   kernel/capability.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0xc0c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 68
   kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x8cc): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 2075280295
   kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2468): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 122
   kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2d78): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 65
   kernel/umh.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x610): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 50
   kernel/workqueue.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x537c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 2913622
   kernel/pid.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 15941
   kernel/nsproxy.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x740): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 26
   kernel/reboot.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2e8): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 50
   kernel/groups.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x30): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 15377
   kernel/sched/core.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x8b0c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 29
   kernel/sched/fair.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2328): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 113502061
   kernel/sched/build_policy.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0xac0c): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 123
   kernel/sched/build_utility.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x3da4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 113
   kernel/locking/mutex.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2288): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 13
   kernel/power/qos.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x74): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 21
   kernel/printk/printk.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2534): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 20010
   kernel/rcu/update.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x2020): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 1049313
   kernel/kcmp.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x11e0): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 17
   kernel/time/time.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x640): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 1582
   kernel/time/timer.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x3f50): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 3
   kernel/time/hrtimer.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x1364): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here
   microblaze-linux-ld: microblaze-linux-ld: DWARF error: could not find abbrev number 78
   kernel/time/alarmtimer.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x15f4): multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:(.text+0x950): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
