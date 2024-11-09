Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7993B192
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731136122; cv=none; b=N12Y1q8H7zWgMt/ikNHuNPTNiMo5oaVTw5K2OMZGf4xJ5vdJgOEVgSqjD0OHzS0cg+6Lxfnt6Qfq6hgJxg0t23XnombgwRL3UuNEOWHY/m9Ov9HXoOa/xfhUjCsL3U5LXCYEkn991kXh8d6b6R9s+DCJaQjxBwxU10HhF1YY3dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731136122; c=relaxed/simple;
	bh=4Ny4ilUL2cmSkfEzyEpF7n/w7um2Sjc3wyvQx1X9xQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNldSBpY6CEmC5mUt/FvspR4Q3WfKI1NdZIdFgAMSZg5HHrwi0mkMhfy/7e8TAdIFn3vGX7CoAYNtZ9Oq9tz+op3IAdL3dyBq5Nm6/+dmwZseF2AdNh+0CbyoffNs7a7C+y1tg05NQFZltFYp2OWXgbIuzBiWcMteATjo8ouM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWvUawI8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWvUawI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731136120; x=1762672120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Ny4ilUL2cmSkfEzyEpF7n/w7um2Sjc3wyvQx1X9xQw=;
  b=WWvUawI8lySvr3CqLdkNTf4ogMgJ5BtSzRoUWUXbm6alDqS0g3jPIOd8
   yXxcPm6NfORJASU4mPf8O+9h2O9pwy+OWG2eMdjLmP/fktpHLBCrzuYeH
   /k9lNr0rNpEke8zoX4xXe+dUZ+sR00oII0jmGQlmi0LSeTCyV+XmBBTBk
   3O0rrBM1AEbOk/LbtXi/+D9yPzfoRT7z0tdYUIDG5NbA+LwWbJwjdIYQA
   yrNoyFSlnxWRIqzcc2r/OogNwECXTKj9k7/iwfFIncXbpmiCTUL16DoWx
   PMdpG0kZ55k8eNihZqYs1RUaMNhLfly7KBh6J6iiNh+9ZsoRnWKuiSDfW
   w==;
X-CSE-ConnectionGUID: HAZ46YclQ7WJdiLNqb/gbw==
X-CSE-MsgGUID: nMe0Wyo5Sc+Vi239mlWQDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48474602"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48474602"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 23:08:39 -0800
X-CSE-ConnectionGUID: LZ+nsh2bR+Og+GD8CwqIHw==
X-CSE-MsgGUID: To+OLUytQimFARkE9Dttcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="90459859"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 23:08:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9faF-000sB9-0Q;
	Sat, 09 Nov 2024 07:08:35 +0000
Date: Sat, 9 Nov 2024 15:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 04/11] bpf: allow specifying inlinable kfuncs in
 modules
Message-ID: <202411091430.XOhxSHUH-lkp@intel.com>
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
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241109/202411091430.XOhxSHUH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091430.XOhxSHUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091430.XOhxSHUH-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: init/do_mounts.o: in function `btf_get_module_btf':
>> (.text+0x1c): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: init/noinitramfs.o: in function `btf_get_module_btf':
   (.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/mm/fault.o: in function `btf_get_module_btf':
   (.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/cache.o: in function `btf_get_module_btf':
   (.text+0x418): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/sys_parisc.o: in function `btf_get_module_btf':
   (.text+0x374): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/ptrace.o: in function `btf_get_module_btf':
   (.text+0x404): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: arch/parisc/kernel/parisc_ksyms.o: in function `btf_get_module_btf':
   (.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/fork.o: in function `btf_get_module_btf':
   (.text+0xf18): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/exec_domain.o: in function `btf_get_module_btf':
   (.text+0x28): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/cpu.o: in function `btf_get_module_btf':
   (.text+0x720): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/exit.o: in function `btf_get_module_btf':
   (.text+0x804): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/resource.o: in function `btf_get_module_btf':
   (.text+0x10a4): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sysctl.o: in function `btf_get_module_btf':
   (.text+0x2010): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/capability.o: in function `btf_get_module_btf':
   (.text+0x604): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/ptrace.o: in function `btf_get_module_btf':
   (.text+0x4d4): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/signal.o: in function `btf_get_module_btf':
   (.text+0x19dc): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sys.o: in function `btf_get_module_btf':
   (.text+0x11c4): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/umh.o: in function `btf_get_module_btf':
   (.text+0x8e4): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/pid.o: in function `btf_get_module_btf':
   (.text+0x49c): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/extable.o: in function `btf_get_module_btf':
   (.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/params.o: in function `btf_get_module_btf':
   (.text+0xcf0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/nsproxy.o: in function `btf_get_module_btf':
   (.text+0x200): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/cred.o: in function `btf_get_module_btf':
   (.text+0x7e0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/reboot.o: in function `btf_get_module_btf':
   (.text+0xfb8): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/ksyms_common.o: in function `btf_get_module_btf':
   (.text+0x0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/groups.o: in function `btf_get_module_btf':
   (.text+0x2cc): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sched/core.o: in function `btf_get_module_btf':
   (.text+0x544): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sched/fair.o: in function `btf_get_module_btf':
   (.text+0x1de8): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sched/build_policy.o: in function `btf_get_module_btf':
   (.text+0x2ff0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/sched/build_utility.o: in function `btf_get_module_btf':
   (.text+0xf00): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/power/qos.o: in function `btf_get_module_btf':
   (.text+0x184): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/printk/printk.o: in function `btf_get_module_btf':
   (.text+0x2228): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/time/time.o: in function `btf_get_module_btf':
   (.text+0x1f38): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/time/timer.o: in function `btf_get_module_btf':
   (.text+0x1170): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/time/hrtimer.o: in function `btf_get_module_btf':
   (.text+0x1154): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/time/posix-timers.o: in function `btf_get_module_btf':
   (.text+0x13d4): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/time/posix-clock.o: in function `btf_get_module_btf':
   (.text+0x7fc): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/time/itimer.o: in function `btf_get_module_btf':
   (.text+0x7b0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/time/tick-common.o: in function `btf_get_module_btf':
   (.text+0x178): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/futex/syscalls.o: in function `btf_get_module_btf':
   (.text+0x18c): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: kernel/kallsyms.o: in function `btf_get_module_btf':
   (.text+0x980): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/filemap.o: in function `btf_get_module_btf':
   (.text+0x38f0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/oom_kill.o: in function `btf_get_module_btf':
   (.text+0xb48): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/fadvise.o: in function `btf_get_module_btf':
   (.text+0x2f8): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/page-writeback.o: in function `btf_get_module_btf':
   (.text+0x21b8): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/readahead.o: in function `btf_get_module_btf':
   (.text+0x734): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/truncate.o: in function `btf_get_module_btf':
   (.text+0x9b4): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/vmscan.o: in function `btf_get_module_btf':
   (.text+0x2424): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/shmem.o: in function `btf_get_module_btf':
   (.text+0x2cc8): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/util.o: in function `btf_get_module_btf':
   (.text+0x101c): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here
   hppa-linux-ld: mm/workingset.o: in function `btf_get_module_btf':
   (.text+0x2e0): multiple definition of `btf_get_module_btf'; init/main.o:(.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
