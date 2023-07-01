Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F10417CB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jul 2023 02:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688178234; x=1719714234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wkDltbDCqWFKFzNVqRP5Jt8HkyEEBZJENAcelMRo14=;
  b=EF4rSKJ5bdA8uidyfm3qZt63sD7/fZNY8ZEYasIc6lvONYH0pHbgJFYU
   8zQvT5e/HGeQkbj+t1b/mzmusSIzgjJ06QSql5Xl7urSbcT6wR7uACRdT
   m98CqI4JuSzroqXvCPdhi+B/LEgzH7CZEATe6sMw3QM4f4X1Eh5admxuq
   61yB4BJZd6TqBDqFBS4w/DPe196Nbv3ORMdZit89fW5NpaeEse8N33uES
   ZzmoyqkwWbzPJqmxljWvwFVfyiUJsuqIZERddAQYLApT9eeLh+hG+xtPP
   3alU1Tf77Z9JQz6SLAjQcR1mP5K356qucMuAOVL4XePLm0Vzj/wcqDuWQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="360014406"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="360014406"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 19:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="711980949"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="711980949"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 19:23:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFQH8-000FZP-2S;
	Sat, 01 Jul 2023 02:23:50 +0000
Date: Sat, 1 Jul 2023 10:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/set_pmu_counter 2/3]
 include/linux/perf_event.h:1764:15: error: return type defaults to 'int'
Message-ID: <202307011051.Xw6nUfBi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/set_pmu_counter
head:   d9bd0175d1b17f120bac7fe0ccdc6ad9fe5207b4
commit: b21829c0bfbbd3c9c9f53cc931f3536a45ba726f [2/3] perf: KVM: x86/pmu:
config: um-defconfig (https://download.01.org/0day-ci/archive/20230701/202307011051.Xw6nUfBi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011051.Xw6nUfBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011051.Xw6nUfBi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/trace_events.h:10,
                    from kernel/module/main.c:14:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from kernel/time/hrtimer.c:30:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1648:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1648 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/bpf/core.c:32:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:1638:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
    1638 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2075:6: warning: no previous prototype for 'bpf_patch_call_args' [-Wmissing-prototypes]
    2075 | void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
         |      ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from init/main.c:21:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   init/main.c:778:20: warning: no previous prototype for 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
     778 | void __init __weak arch_post_acpi_subsys_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   init/main.c:790:20: warning: no previous prototype for 'mem_encrypt_init' [-Wmissing-prototypes]
     790 | void __init __weak mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~
   init/main.c:792:20: warning: no previous prototype for 'poking_init' [-Wmissing-prototypes]
     792 | void __init __weak poking_init(void) { }
         |                    ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from arch/x86/um/syscalls_64.c:10:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   arch/x86/um/syscalls_64.c:84:6: warning: no previous prototype for 'arch_switch_to' [-Wmissing-prototypes]
      84 | void arch_switch_to(struct task_struct *to)
         |      ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from kernel/fork.c:55:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:164:13: warning: no previous prototype for 'arch_release_task_struct' [-Wmissing-prototypes]
     164 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:991:20: warning: no previous prototype for 'arch_task_cache_init' [-Wmissing-prototypes]
     991 | void __init __weak arch_task_cache_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:1086:12: warning: no previous prototype for 'arch_dup_task_struct' [-Wmissing-prototypes]
    1086 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from kernel/exit.c:42:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   kernel/exit.c:1917:32: warning: no previous prototype for 'abort' [-Wmissing-prototypes]
    1917 | __weak __function_aligned void abort(void)
         |                                ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from fs/pipe.c:24:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:759:15: warning: no previous prototype for 'account_pipe_buffers' [-Wmissing-prototypes]
     759 | unsigned long account_pipe_buffers(struct user_struct *user,
         |               ^~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:765:6: warning: no previous prototype for 'too_many_pipe_buffers_soft' [-Wmissing-prototypes]
     765 | bool too_many_pipe_buffers_soft(unsigned long user_bufs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:772:6: warning: no previous prototype for 'too_many_pipe_buffers_hard' [-Wmissing-prototypes]
     772 | bool too_many_pipe_buffers_hard(unsigned long user_bufs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:779:6: warning: no previous prototype for 'pipe_is_unprivileged_user' [-Wmissing-prototypes]
     779 | bool pipe_is_unprivileged_user(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:1258:5: warning: no previous prototype for 'pipe_resize_ring' [-Wmissing-prototypes]
    1258 | int pipe_resize_ring(struct pipe_inode_info *pipe, unsigned int nr_slots)
         |     ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from fs/d_path.c:2:
>> include/linux/perf_event.h:1764:15: error: return type defaults to 'int' [-Werror=implicit-int]
    1764 | static inline perf_event_set_count(struct perf_event *event, u64 count) { }
         |               ^~~~~~~~~~~~~~~~~~~~
   fs/d_path.c:317:7: warning: no previous prototype for 'simple_dname' [-Wmissing-prototypes]
     317 | char *simple_dname(struct dentry *dentry, char *buffer, int buflen)
         |       ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/int +1764 include/linux/perf_event.h

  1735	
  1736	typedef int (perf_ksymbol_get_name_f)(char *name, int name_len, void *data);
  1737	static inline void perf_event_ksymbol(u16 ksym_type, u64 addr, u32 len,
  1738					      bool unregister, const char *sym)	{ }
  1739	static inline void perf_event_bpf_event(struct bpf_prog *prog,
  1740						enum perf_bpf_event_type type,
  1741						u16 flags)			{ }
  1742	static inline void perf_event_exec(void)				{ }
  1743	static inline void perf_event_comm(struct task_struct *tsk, bool exec)	{ }
  1744	static inline void perf_event_namespaces(struct task_struct *tsk)	{ }
  1745	static inline void perf_event_fork(struct task_struct *tsk)		{ }
  1746	static inline void perf_event_text_poke(const void *addr,
  1747						const void *old_bytes,
  1748						size_t old_len,
  1749						const void *new_bytes,
  1750						size_t new_len)			{ }
  1751	static inline void perf_event_init(void)				{ }
  1752	static inline int  perf_swevent_get_recursion_context(void)		{ return -1; }
  1753	static inline void perf_swevent_put_recursion_context(int rctx)		{ }
  1754	static inline u64 perf_swevent_set_period(struct perf_event *event)	{ return 0; }
  1755	static inline void perf_event_enable(struct perf_event *event)		{ }
  1756	static inline void perf_event_disable(struct perf_event *event)		{ }
  1757	static inline int __perf_event_disable(void *info)			{ return -1; }
  1758	static inline void perf_event_task_tick(void)				{ }
  1759	static inline int perf_event_release_kernel(struct perf_event *event)	{ return 0; }
  1760	static inline int perf_event_period(struct perf_event *event, u64 value)
  1761	{
  1762		return -EINVAL;
  1763	}
> 1764	static inline perf_event_set_count(struct perf_event *event, u64 count) { }
  1765	static inline u64 perf_event_pause(struct perf_event *event, bool reset)
  1766	{
  1767		return 0;
  1768	}
  1769	#endif
  1770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
