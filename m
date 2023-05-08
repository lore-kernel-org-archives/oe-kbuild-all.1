Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDCADDA9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683588227; x=1715124227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMJCzOGwEfZ2g13HCPcwMJzIo5nsgs/3BXtw6CDa3No=;
  b=a5jktF4mEvsB1ItimRCgg/4jYEFyoFLu+UXHW37cBmDEQ6cvfSuEx4ZG
   teQNIr1pWWqBvqUU52z1Uq2GV8o0pWxsLB2f45rF9deF6sJWl2S2UEhTj
   JFiCMgAminbDkoXhAAvp7lZvs1NlskxmQz7xNLAe1pSGMD7iPe4keLAZe
   y2BZ1XrGDOlxZUPByPELRX+UT0IqfOFDSCh/U5WQmp1VqQEMipWwClwCJ
   GTQy5G8DKsE4TKfc3bFvNCieAfQJ8Sx+pSeSvIpJGDImj90Ga5L5JIVn7
   BsT85l/TcsjELL9E/FcSjQnwCG4YwQX+Ywm3aCH2U2WgZGgJaZ6Y0fjuE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377869721"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="377869721"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 16:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="842877616"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="842877616"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 May 2023 16:23:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwACn-0001Sf-0J;
	Mon, 08 May 2023 23:23:45 +0000
Date: Tue, 9 May 2023 07:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/clock 8/9] include/linux/sched/clock.h:21:
 multiple definition of `sched_clock_noinstr';
 init/main.o:include/linux/sched/clock.h:21: first defined here
Message-ID: <202305090746.WrqlTE9K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/clock
head:   6c433ce701d4bb3d07a4102cbb8bf00c217be05d
commit: 4ff68e88fd2272a5a1b1e62b017fa964b03242af [8/9] sched/clock: Provide local_clock_noinstr()
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230509/202305090746.WrqlTE9K-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4ff68e88fd2272a5a1b1e62b017fa964b03242af
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/clock
        git checkout 4ff68e88fd2272a5a1b1e62b017fa964b03242af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090746.WrqlTE9K-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/sysctl.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/extable.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/sched/core.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/sched/fair.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/sched/build_policy.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/sched/build_utility.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/locking/rwsem.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/printk/printk.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/irqdesc.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/handle.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/manage.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/spurious.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/resend.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/chip.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/dummychip.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/devres.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/autoprobe.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/irq/proc.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/time/timekeeping.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/time/tick-sched.o: in function `sched_clock_noinstr':
>> include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/kallsyms.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: kernel/bpf/core.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: fs/select.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/socket.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/sock.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/skbuff.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/datagram.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/secure_seq.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/flow_dissector.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/sysctl_net_core.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/dev.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/rtnetlink.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/filter.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/sock_diag.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/sock_reuseport.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/xdp.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/gro.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/selftests.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/core/ptp_classifier.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/netlink/af_netlink.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/route.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/ip_forward.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/inet_hashtables.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/inet_connection_sock.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_input.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_output.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_timer.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_ipv4.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_minisocks.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_cong.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_metrics.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_fastopen.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_rate.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_recovery.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_ulp.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_offload.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/tcp_plb.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/datagram.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/udp.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/arp.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/icmp.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/af_inet.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/fib_frontend.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/fib_semantics.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/fib_trie.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/metrics.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/sysctl_net_ipv4.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/proc.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here
   nios2-linux-ld: net/ipv4/inet_diag.o: in function `sched_clock_noinstr':
   include/linux/sched/clock.h:21: multiple definition of `sched_clock_noinstr'; init/main.o:include/linux/sched/clock.h:21: first defined here


vim +21 include/linux/sched/clock.h

    16	
    17	#if defined(CONFIG_ARCH_WANTS_NO_INSTR) || defined(CONFIG_GENERIC_SCHED_CLOCK)
    18	extern u64 sched_clock_noinstr(void);
    19	#else
    20	__always_inline u64 sched_clock_noinstr(void)
  > 21	{
    22		return sched_clock();
    23	}
    24	#endif
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
