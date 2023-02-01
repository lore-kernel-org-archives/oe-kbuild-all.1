Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9062C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675233912; x=1706769912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+OS5O6nYBYQIqiEZfy/4ocVG0jMOVilODA8WjkuTcY=;
  b=VD4u50DJ40iopCymDW79AXOdP9x6lGNxckXbzWBk0wyip7j1CsNYSSGa
   SLWh24w8rTjb3uAwdkHsSLsu2iLkSj2npbCSbb0bDlS70o40hqou3htB6
   97OD1lFFXLyzXTIRptbYtTvZL+jmpCC2TlGD/hE2Dy/SzsM+uo+aOpa5m
   Z5VkmmUyV5kNUp/kt27skPGrQYV/VXrKyA2uIgJK9M+HfOJVzS38hBsUE
   eNhHnlnATIxPspv6TzXyMBE98PA1KXGi83CiE1ni4b6VcAqHJQSU2MpN3
   HE8OkDsmZjYcje14+0LWaZA8Ar5dxIJRq2Dswp52EO2Nw2cfEUGIc85Ru
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308406393"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="308406393"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 22:45:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="838666653"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="838666653"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2023 22:45:10 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN6rm-0005Ao-0T;
	Wed, 01 Feb 2023 06:45:10 +0000
Date: Wed, 1 Feb 2023 14:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 371/371]
 include/linux/perf_event.h:1579:13: warning: conflicting types for
 'perf_event_guest_enter_exit'; have 'void(bool)' {aka 'void(_Bool)'}
Message-ID: <202302011406.9VI6UPT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   236af3da84d067f3af446ccf2211937cd9ddc42f
commit: 236af3da84d067f3af446ccf2211937cd9ddc42f [371/371] perf, KVM: introduce software event on enter/exit to/from guest
config: riscv-randconfig-r032-20230129 (https://download.01.org/0day-ci/archive/20230201/202302011406.9VI6UPT0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/236af3da84d067f3af446ccf2211937cd9ddc42f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 236af3da84d067f3af446ccf2211937cd9ddc42f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kvm/../../../virt/kvm/eventfd.c:12:
   include/linux/kvm_host.h: In function 'guest_context_enter_irqoff':
   include/linux/kvm_host.h:429:9: error: implicit declaration of function 'perf_event_guest_enter_exit' [-Werror=implicit-function-declaration]
     429 |         perf_event_guest_enter_exit(true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7:
   include/linux/kvm_host.h: In function 'mmu_invalidate_retry_gfn':
   include/linux/kvm_host.h:1987:69: error: 'INVALID_GPA' undeclared (first use in this function); did you mean 'INVALID_GID'?
    1987 |                 if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
         |                                                                     ^~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   include/linux/kvm_host.h:1987:69: note: each undeclared identifier is reported only once for each function it appears in
    1987 |                 if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
         |                                                                     ^~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from arch/riscv/kvm/../../../virt/kvm/eventfd.c:16:
   include/linux/perf_event.h: At top level:
>> include/linux/perf_event.h:1579:13: warning: conflicting types for 'perf_event_guest_enter_exit'; have 'void(bool)' {aka 'void(_Bool)'}
    1579 | extern void perf_event_guest_enter_exit(bool enter);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:429:9: note: previous implicit declaration of 'perf_event_guest_enter_exit' with type 'void(bool)' {aka 'void(_Bool)'}
     429 |         perf_event_guest_enter_exit(true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1579 include/linux/perf_event.h

  1547	
  1548	extern int perf_output_begin(struct perf_output_handle *handle,
  1549				     struct perf_sample_data *data,
  1550				     struct perf_event *event, unsigned int size);
  1551	extern int perf_output_begin_forward(struct perf_output_handle *handle,
  1552					     struct perf_sample_data *data,
  1553					     struct perf_event *event,
  1554					     unsigned int size);
  1555	extern int perf_output_begin_backward(struct perf_output_handle *handle,
  1556					      struct perf_sample_data *data,
  1557					      struct perf_event *event,
  1558					      unsigned int size);
  1559	
  1560	extern void perf_output_end(struct perf_output_handle *handle);
  1561	extern unsigned int perf_output_copy(struct perf_output_handle *handle,
  1562				     const void *buf, unsigned int len);
  1563	extern unsigned int perf_output_skip(struct perf_output_handle *handle,
  1564					     unsigned int len);
  1565	extern long perf_output_copy_aux(struct perf_output_handle *aux_handle,
  1566					 struct perf_output_handle *handle,
  1567					 unsigned long from, unsigned long to);
  1568	extern int perf_swevent_get_recursion_context(void);
  1569	extern void perf_swevent_put_recursion_context(int rctx);
  1570	extern u64 perf_swevent_set_period(struct perf_event *event);
  1571	extern void perf_event_enable(struct perf_event *event);
  1572	extern void perf_event_disable(struct perf_event *event);
  1573	extern void perf_event_disable_local(struct perf_event *event);
  1574	extern void perf_event_disable_inatomic(struct perf_event *event);
  1575	extern void perf_event_task_tick(void);
  1576	extern int perf_event_account_interrupt(struct perf_event *event);
  1577	extern int perf_event_period(struct perf_event *event, u64 value);
  1578	extern u64 perf_event_pause(struct perf_event *event, bool reset);
> 1579	extern void perf_event_guest_enter_exit(bool enter);
  1580	#else /* !CONFIG_PERF_EVENTS: */
  1581	static inline void *
  1582	perf_aux_output_begin(struct perf_output_handle *handle,
  1583			      struct perf_event *event)				{ return NULL; }
  1584	static inline void
  1585	perf_aux_output_end(struct perf_output_handle *handle, unsigned long size)
  1586										{ }
  1587	static inline int
  1588	perf_aux_output_skip(struct perf_output_handle *handle,
  1589			     unsigned long size)				{ return -EINVAL; }
  1590	static inline void *
  1591	perf_get_aux(struct perf_output_handle *handle)				{ return NULL; }
  1592	static inline void
  1593	perf_event_task_migrate(struct task_struct *task)			{ }
  1594	static inline void
  1595	perf_event_task_sched_in(struct task_struct *prev,
  1596				 struct task_struct *task)			{ }
  1597	static inline void
  1598	perf_event_task_sched_out(struct task_struct *prev,
  1599				  struct task_struct *next)			{ }
  1600	static inline int perf_event_init_task(struct task_struct *child,
  1601					       u64 clone_flags)			{ return 0; }
  1602	static inline void perf_event_exit_task(struct task_struct *child)	{ }
  1603	static inline void perf_event_free_task(struct task_struct *task)	{ }
  1604	static inline void perf_event_delayed_put(struct task_struct *task)	{ }
  1605	static inline struct file *perf_event_get(unsigned int fd)	{ return ERR_PTR(-EINVAL); }
  1606	static inline const struct perf_event *perf_get_event(struct file *file)
  1607	{
  1608		return ERR_PTR(-EINVAL);
  1609	}
  1610	static inline const struct perf_event_attr *perf_event_attrs(struct perf_event *event)
  1611	{
  1612		return ERR_PTR(-EINVAL);
  1613	}
  1614	static inline int perf_event_read_local(struct perf_event *event, u64 *value,
  1615						u64 *enabled, u64 *running)
  1616	{
  1617		return -EINVAL;
  1618	}
  1619	static inline void perf_event_print_debug(void)				{ }
  1620	static inline int perf_event_task_disable(void)				{ return -EINVAL; }
  1621	static inline int perf_event_task_enable(void)				{ return -EINVAL; }
  1622	static inline int perf_event_refresh(struct perf_event *event, int refresh)
  1623	{
  1624		return -EINVAL;
  1625	}
  1626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
