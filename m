Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB313CA9C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731135521; cv=none; b=XCTuTXg7dEy97BrzjPiSBeDro9LBbeRCu9dxJpRoAzYDIu1hxWjyv78PhoaikobIdMXqdh0EWXVz/3FLKgPAWk154XjnbN+OCjmDyldalb0PWAs2Se1eLfPy3LRStxx/m61ylwMWFlpoJkBY5SKfyN/fam0hi6yDjTENb/t9raY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731135521; c=relaxed/simple;
	bh=X4+cqlz4j/F9uPReuxqitTSQNjg4Zv3v7YHCnn1Z/AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMAfUPA9Kl8AKQsYWnE9C3/VjgkjI8k5BLksgD4WLPElhEsXuhS4AQ2AvucMJD75uLqqeDW1FJM0iuiycf9N22vu22b6C/mvJa0vYpvmJ9bc78dFu34vuYFFXsF+Gz+6Jxj70xCek6yB1QBc7E2NvoWStbGXWRAGsT9VbCd6LS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huLG9fPu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huLG9fPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731135519; x=1762671519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X4+cqlz4j/F9uPReuxqitTSQNjg4Zv3v7YHCnn1Z/AM=;
  b=huLG9fPut+eyQtbR7bSyURabs+JLRmByoxjgUSCc+ejbI/Hq+3O4O8j7
   lxGuYcQEyMeZVP5gh9CS2RcWbmzveow2sDEl4+UY4qI29JBJXof3HVwv6
   aAsBnMa7+PMS5UB4Z05fJzhQS/Kkm87hBjbOdva2UQwS98HO2jLE2zLBP
   HYau9JsKToyvEpr7PeUBRHn8Wc6bu/eOnXHQKEpIFGw1j3jHa+0IJ4nFB
   9uWDT6e0uDHV98N7oxEl6IoXdjhgNIE8e/GVttzpaWBR75mLnSFgBcJUX
   EBg/Rz0lCw90ole+a2kWRLaA1oG5M99cJx2NynlIx9IigQkzqLb7Pm42w
   g==;
X-CSE-ConnectionGUID: n0qTSITdQna2/MokUAB5bA==
X-CSE-MsgGUID: mOY95GtqQ16+hCq4Y1QIkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42404422"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="42404422"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 22:58:38 -0800
X-CSE-ConnectionGUID: zAw/viHOS4C1F8+ot57akQ==
X-CSE-MsgGUID: F3B4Dt1VRH+MKnj1xIJQTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="85856311"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Nov 2024 22:58:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9fQY-000s9i-1K;
	Sat, 09 Nov 2024 06:58:34 +0000
Date: Sat, 9 Nov 2024 14:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 04/11] bpf: allow specifying inlinable kfuncs in
 modules
Message-ID: <202411091442.dj7dBCWE-lkp@intel.com>
References: <20241107175040.1659341-5-eddyz87@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107175040.1659341-5-eddyz87@gmail.com>

Hi Eduard,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-use-branch-predictions-in-opt_hard_wire_dead_code_branches/20241108-015243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241107175040.1659341-5-eddyz87%40gmail.com
patch subject: [RFC bpf-next 04/11] bpf: allow specifying inlinable kfuncs in modules
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241109/202411091442.dj7dBCWE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091442.dj7dBCWE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091442.dj7dBCWE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/bpf.h:28,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from init/main.c:21:
>> include/linux/btf.h:674:13: warning: no previous prototype for 'btf_get_module_btf' [-Wmissing-prototypes]
     674 | struct btf *btf_get_module_btf(const struct module *module)
         |             ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/bpf.h:28,
                    from include/linux/security.h:35,
                    from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:102,
                    from include/net/addrconf.h:65,
                    from lib/vsprintf.c:41:
>> include/linux/btf.h:674:13: warning: no previous prototype for 'btf_get_module_btf' [-Wmissing-prototypes]
     674 | struct btf *btf_get_module_btf(const struct module *module)
         |             ^~~~~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/linux/bpf.h:28,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/time/hrtimer.c:30:
>> include/linux/btf.h:674:13: warning: no previous prototype for 'btf_get_module_btf' [-Wmissing-prototypes]
     674 | struct btf *btf_get_module_btf(const struct module *module)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
--
   or1k-linux-ld: init/do_mounts.o: in function `btf_get_module_btf':
>> do_mounts.c:(.text+0x8): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: init/noinitramfs.o: in function `btf_get_module_btf':
   noinitramfs.c:(.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o: in function `btf_get_module_btf':
   sys_call_table.c:(.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: arch/openrisc/mm/fault.o: in function `btf_get_module_btf':
   fault.c:(.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/fork.o: in function `btf_get_module_btf':
   fork.c:(.text+0x1198): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/exec_domain.o: in function `btf_get_module_btf':
   exec_domain.c:(.text+0x28): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/cpu.o: in function `btf_get_module_btf':
   cpu.c:(.text+0x880): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/exit.o: in function `btf_get_module_btf':
   exit.c:(.text+0x99c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/resource.o: in function `btf_get_module_btf':
   resource.c:(.text+0x14c8): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/sysctl.o: in function `btf_get_module_btf':
   sysctl.c:(.text+0x241c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/capability.o: in function `btf_get_module_btf':
   capability.c:(.text+0x87c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/ptrace.o: in function `btf_get_module_btf':
   ptrace.c:(.text+0x5c0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/signal.o: in function `btf_get_module_btf':
   signal.c:(.text+0x1f04): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/sys.o: in function `btf_get_module_btf':
   sys.c:(.text+0x1548): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/umh.o: in function `btf_get_module_btf':
   umh.c:(.text+0x9ac): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/pid.o: in function `btf_get_module_btf':
   pid.c:(.text+0x558): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/extable.o: in function `btf_get_module_btf':
   extable.c:(.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/params.o: in function `btf_get_module_btf':
   params.c:(.text+0xcec): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/nsproxy.o: in function `btf_get_module_btf':
   nsproxy.c:(.text+0x224): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/cred.o: in function `btf_get_module_btf':
   cred.c:(.text+0xa70): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/reboot.o: in function `btf_get_module_btf':
   reboot.c:(.text+0x1064): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/ksyms_common.o: in function `btf_get_module_btf':
   ksyms_common.c:(.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/groups.o: in function `btf_get_module_btf':
   groups.c:(.text+0x354): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/sched/core.o: in function `btf_get_module_btf':
   core.c:(.text+0x604): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/sched/fair.o: in function `btf_get_module_btf':
   fair.c:(.text+0x2af0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/sched/build_policy.o: in function `btf_get_module_btf':
   build_policy.c:(.text+0x3f48): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/sched/build_utility.o: in function `btf_get_module_btf':
   build_utility.c:(.text+0x1598): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/power/qos.o: in function `btf_get_module_btf':
   qos.c:(.text+0x174): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/printk/printk.o: in function `btf_get_module_btf':
   printk.c:(.text+0x26a4): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/time/time.o: in function `btf_get_module_btf':
   time.c:(.text+0x1714): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/time/timer.o: in function `btf_get_module_btf':
   timer.c:(.text+0x183c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/time/hrtimer.o: in function `btf_get_module_btf':
   hrtimer.c:(.text+0x1850): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/time/posix-timers.o: in function `btf_get_module_btf':
   posix-timers.c:(.text+0x1230): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/time/posix-clock.o: in function `btf_get_module_btf':
   posix-clock.c:(.text+0x854): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/time/itimer.o: in function `btf_get_module_btf':
   itimer.c:(.text+0x76c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/time/tick-common.o: in function `btf_get_module_btf':
   tick-common.c:(.text+0xec): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/futex/syscalls.o: in function `btf_get_module_btf':
   syscalls.c:(.text+0x154): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/uid16.o: in function `btf_get_module_btf':
   uid16.c:(.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: kernel/kallsyms.o: in function `btf_get_module_btf':
   kallsyms.c:(.text+0xb08): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/filemap.o: in function `btf_get_module_btf':
   filemap.c:(.text+0x4574): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/oom_kill.o: in function `btf_get_module_btf':
   oom_kill.c:(.text+0xd8c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/fadvise.o: in function `btf_get_module_btf':
   fadvise.c:(.text+0x38c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/page-writeback.o: in function `btf_get_module_btf':
   page-writeback.c:(.text+0x29dc): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/readahead.o: in function `btf_get_module_btf':
   readahead.c:(.text+0x918): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/truncate.o: in function `btf_get_module_btf':
   truncate.c:(.text+0xc10): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/vmscan.o: in function `btf_get_module_btf':
   vmscan.c:(.text+0x2c0c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/shmem.o: in function `btf_get_module_btf':
   shmem.c:(.text+0x34b0): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/util.o: in function `btf_get_module_btf':
   util.c:(.text+0x145c): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/workingset.o: in function `btf_get_module_btf':
   workingset.c:(.text+0x380): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/debug.o: in function `btf_get_module_btf':
   debug.c:(.text+0x450): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here
   or1k-linux-ld: mm/gup.o: in function `btf_get_module_btf':
   gup.c:(.text+0x1288): multiple definition of `btf_get_module_btf'; init/main.o:main.c:(.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
