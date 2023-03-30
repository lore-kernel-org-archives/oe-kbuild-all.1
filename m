Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3021105
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 01:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680138681; x=1711674681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdvwQYrC1gpgl4r3qqaFnN4mcvbS6UddcfrnR1C6Aag=;
  b=LnVbnyYp1zeA18wSABxyttbIx9/s9fC4f4kwE+2+GYrmG8QuOV7Udeip
   QTcNFIazxivirVe0mkv2U0Aout5V0o1mFU8t1reVGE9JK5o5kRPnHSrIh
   +Z4LzEiz2BBZ/FrDQMtf2A0pYsK4A0wYBBtHcHdt+chPp14GmccB8zvlC
   sSX8Th6DNraaQnXpm0Em+XVOTRDj8jeeit+/2vm3E9NTjVbnMeb0bWBSx
   sNo0eUrMFxvAoHXMBILj53eZIp/EXDe+mWr4ReVHx+gHlysnramwZJMZ5
   VgG0GWae1rJtdLhoGtQYmrIh9rSLye05t3ECnzm6J/H+3GiJmgGhwqKpN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342651551"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="342651551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 18:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717110370"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="717110370"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 18:11:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phgox-000K7k-0a;
	Thu, 30 Mar 2023 01:11:19 +0000
Date: Thu, 30 Mar 2023 09:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/17] include/linux/trace_events.h:800:
 multiple definition of `bpf_uprobe_multi_link_attach';
 init/main.o:include/linux/trace_events.h:800: first defined here
Message-ID: <202303300918.VhosgP09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   f81bdc54f7ac3f1c0c66810141f94cc1629d68e3
commit: 84757f34ed3e8132c54a96949e3939f27da7d0e5 [1/17] bpf: Add multi uprobe link
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230330/202303300918.VhosgP09-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=84757f34ed3e8132c54a96949e3939f27da7d0e5
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout 84757f34ed3e8132c54a96949e3939f27da7d0e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300918.VhosgP09-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: init/do_mounts.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: init/do_mounts_initrd.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: init/initramfs.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/entry/syscall_64.o: in function `bpf_uprobe_multi_link_attach':
   arch/x86/entry/syscall_64.c:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/entry/common.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/entry/vdso/extable.o: in function `bpf_uprobe_multi_link_attach':
   arch/x86/entry/vdso/extable.c:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/entry/vsyscall/vsyscall_64.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: virt/kvm/kvm_main.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: virt/kvm/eventfd.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kvm/x86.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kvm/mmu/mmu.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kvm/mmu/tdp_mmu.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kvm/vmx/vmx.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/process_64.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/signal_64.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/traps.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/idt.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/irq.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/ioport.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/nmi.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/irqinit.o: in function `bpf_uprobe_multi_link_attach':
>> include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/irq_work.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/sys_x86_64.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/process.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/fpu/core.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/cpu/common.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/cpu/intel.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/cpu/mce/core.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/cpu/mce/severity.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/cpu/mce/threshold.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/cpu/resctrl/pseudo_lock.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/cpu/mshyperv.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/apic/apic.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/apic/vector.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/ftrace.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/kvm.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/kernel/umip.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/mm/fault.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: arch/x86/mm/extable.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/fork.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/exec_domain.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/cpu.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/exit.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/softirq.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/sysctl.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/capability.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/ptrace.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/signal.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/sys.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/umh.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/workqueue.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/pid.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/nsproxy.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/reboot.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/kmod.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/groups.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/sched/core.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/sched/fair.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/sched/build_policy.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/sched/build_utility.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/locking/mutex.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/power/qos.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/power/main.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/power/process.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/power/suspend.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/printk/printk.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/irq/matrix.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/rcu/update.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/dma/swiotlb.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here
   ld: kernel/entry/common.o: in function `bpf_uprobe_multi_link_attach':
   include/linux/trace_events.h:800: multiple definition of `bpf_uprobe_multi_link_attach'; init/main.o:include/linux/trace_events.h:800: first defined here


vim +800 include/linux/trace_events.h

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
   799	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 > 800	{
   801		return -EOPNOTSUPP;
   802	}
   803	#endif
   804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
