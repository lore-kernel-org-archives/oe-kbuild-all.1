Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E0015A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 02:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681870345; x=1713406345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gHipgmX6kvrmZpSKq3DiLxWvmcrmox2AT7DDuPrqb40=;
  b=MkqyDJ8r52o11UwnikBxayFrT5wbaND19Ra+IvxhjlNne+ONfgV1vVXL
   5ouQ/Ds4/Nvf8SB+aLxhlMzA6/LfcmMLkvJ9AxxUS8foe2F8lcOIx0LNx
   w9ShCGrRBr3qcvpsUN/YbbnVmJUvVd7pOM1C3SH6IMp1fdf9n6E3qdrcZ
   uRUjURA02J7JRm2MbfuXEl4X2Pfbmsm+y3RdljPBTdZU9syV2plRSOv7u
   xWVqccwU/OGtG0EX4eONCEcNkIVsWI9TnZFW5fh5z00ixL0o3k4v9JcQ6
   LNe0jUBGh1JjObYV/rd0RsTlUKmACtkROOQdXfruwIlJGcACmDqFVgtC6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="348086399"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="348086399"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 19:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="668772869"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="668772869"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Apr 2023 19:12:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poxJ0-000eMt-21;
	Wed, 19 Apr 2023 02:12:22 +0000
Date: Wed, 19 Apr 2023 10:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/17] include/linux/trace_events.h:799:5:
 warning: no previous prototype for 'bpf_uprobe_multi_link_attach'
Message-ID: <202304191054.l7Dz2nQf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   663cc4c067c5af744475e3a7573e3cd5b4647ef3
commit: fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95 [1/17] bpf: Add multi uprobe link
config: m68k-buildonly-randconfig-r006-20230418 (https://download.01.org/0day-ci/archive/20230419/202304191054.l7Dz2nQf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash arch/m68k/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191054.l7Dz2nQf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from arch/m68k/kernel/process.c:33:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
     799 | int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/m68k/kernel/process.c:115:16: warning: no previous prototype for 'm68k_clone' [-Wmissing-prototypes]
     115 | asmlinkage int m68k_clone(struct pt_regs *regs)
         |                ^~~~~~~~~~
   arch/m68k/kernel/process.c:136:16: warning: no previous prototype for 'm68k_clone3' [-Wmissing-prototypes]
     136 | asmlinkage int m68k_clone3(struct pt_regs *regs)
         |                ^~~~~~~~~~~
--
   In file included from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from arch/m68k/kernel/signal.c:35:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
     799 | int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/m68k/kernel/signal.c:756:18: warning: no previous prototype for 'do_sigreturn' [-Wmissing-prototypes]
     756 | asmlinkage void *do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
         |                  ^~~~~~~~~~~~
   arch/m68k/kernel/signal.c:783:18: warning: no previous prototype for 'do_rt_sigreturn' [-Wmissing-prototypes]
     783 | asmlinkage void *do_rt_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
         |                  ^~~~~~~~~~~~~~~
   arch/m68k/kernel/signal.c:1106:6: warning: no previous prototype for 'do_notify_resume' [-Wmissing-prototypes]
    1106 | void do_notify_resume(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~
--
   In file included from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from arch/m68k/kernel/sys_m68k.c:20:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
     799 | int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/m68k/kernel/sys_m68k.c:40:17: warning: no previous prototype for 'sys_mmap2' [-Wmissing-prototypes]
      40 | asmlinkage long sys_mmap2(unsigned long addr, unsigned long len,
         |                 ^~~~~~~~~
   arch/m68k/kernel/sys_m68k.c:378:1: warning: no previous prototype for 'sys_cacheflush' [-Wmissing-prototypes]
     378 | sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
         | ^~~~~~~~~~~~~~
   arch/m68k/kernel/sys_m68k.c:463:1: warning: no previous prototype for 'sys_atomic_cmpxchg_32' [-Wmissing-prototypes]
     463 | sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/m68k/kernel/sys_m68k.c:562:16: warning: no previous prototype for 'sys_getpagesize' [-Wmissing-prototypes]
     562 | asmlinkage int sys_getpagesize(void)
         |                ^~~~~~~~~~~~~~~
   arch/m68k/kernel/sys_m68k.c:567:26: warning: no previous prototype for 'sys_get_thread_area' [-Wmissing-prototypes]
     567 | asmlinkage unsigned long sys_get_thread_area(void)
         |                          ^~~~~~~~~~~~~~~~~~~
   arch/m68k/kernel/sys_m68k.c:572:16: warning: no previous prototype for 'sys_set_thread_area' [-Wmissing-prototypes]
     572 | asmlinkage int sys_set_thread_area(unsigned long tp)
         |                ^~~~~~~~~~~~~~~~~~~
   arch/m68k/kernel/sys_m68k.c:578:16: warning: no previous prototype for 'sys_atomic_barrier' [-Wmissing-prototypes]
     578 | asmlinkage int sys_atomic_barrier(void)
         |                ^~~~~~~~~~~~~~~~~~


vim +/bpf_uprobe_multi_link_attach +799 include/linux/trace_events.h

   766	
   767	static inline int
   768	perf_event_query_prog_array(struct perf_event *event, void __user *info)
   769	{
   770		return -EOPNOTSUPP;
   771	}
   772	static inline int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   773	{
   774		return -EOPNOTSUPP;
   775	}
   776	static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   777	{
   778		return -EOPNOTSUPP;
   779	}
   780	static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name)
   781	{
   782		return NULL;
   783	}
   784	static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
   785	{
   786	}
   787	static inline int bpf_get_perf_event_info(const struct perf_event *event,
   788						  u32 *prog_id, u32 *fd_type,
   789						  const char **buf, u64 *probe_offset,
   790						  u64 *probe_addr)
   791	{
   792		return -EOPNOTSUPP;
   793	}
   794	static inline int
   795	bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   796	{
   797		return -EOPNOTSUPP;
   798	}
 > 799	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   800	{
   801		return -EOPNOTSUPP;
   802	}
   803	#endif
   804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
